#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Kopiert die Agenten und ihre Projekt-Config aus dem Agent-Dev-Project in ein Zielprojekt.

.DESCRIPTION
    Uebernommen werden:
      Agent-Dev-Project/.claude/agents/*.md  ->  <Ziel>/.claude/agents/
      Agent-Dev-Project/harness/<agent>/     ->  <Ziel>/harness/<agent>/

    Die Ordner <Ziel>/harness/<agent>/ werden dabei vollstaendig ersetzt.
    Andere Dateien im Ziel (z. B. harness/_requirements.md) bleiben unberuehrt.

.PARAMETER Target
    Zielprojekt. Standard: das Agent-Test-Project neben diesem Skript.

.EXAMPLE
    ./deploy-agents.ps1
#>
param(
    [string]$Target = (Join-Path $PSScriptRoot 'Agent-Test-Project')
)

$ErrorActionPreference = 'Stop'

$source = Join-Path $PSScriptRoot 'Agent-Dev-Project'
if (-not (Test-Path $Target -PathType Container)) {
    throw "Zielprojekt nicht gefunden: $Target"
}

# 1. Agentendateien
$agentsTarget = Join-Path $Target '.claude/agents'
New-Item -ItemType Directory -Force -Path $agentsTarget | Out-Null
Get-ChildItem (Join-Path $source '.claude/agents') -Filter '*.md' | ForEach-Object {
    Copy-Item $_.FullName -Destination $agentsTarget -Force
    Write-Host "Agent:   $($_.Name)"
}

# 2. Projekt-Config je Agent
$harnessTarget = Join-Path $Target 'harness'
New-Item -ItemType Directory -Force -Path $harnessTarget | Out-Null
Get-ChildItem (Join-Path $source 'harness') -Directory | ForEach-Object {
    $dest = Join-Path $harnessTarget $_.Name
    if (Test-Path $dest) {
        Remove-Item $dest -Recurse -Force
    }
    Copy-Item $_.FullName -Destination $dest -Recurse -Force
    Write-Host "Harness: $($_.Name)/"
}

Write-Host "Fertig -> $Target"
