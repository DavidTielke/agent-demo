# Agent-Dev-Project

Hier werden die Subagenten entwickelt. In diesem Projekt entsteht kein Anwendungscode, sondern die Agenten selbst: ihre Spezifikation, ihre Arbeitsweise, ihre Projekt-Config und die Tools, mit denen ihre Arbeit geprüft wird.

## Ordner

| Ordner | Zweck |
|---|---|
| [`specs/`](specs/) | Legt pro Agent fest, **was** er macht, **wie** er es macht und **wie am Ende validiert** wird. Quelle der Wahrheit für alle anderen Ordner. Der Umgang mit den Specs steht in [`specs/readme.md`](specs/readme.md). |
| [`.claude/agents/`](.claude/agents/) | Agentendateien für Claude. Sie beschreiben die allgemeine Arbeitsweise eines Agenten und sind **neutral zum Projekt**. Seine Projekt-Config holt sich der Agent aus seinem Unterordner in `harness/`. |
| [`harness/`](harness/) | Projektspezifische Config-Erweiterungen (Markdown, JSON ...), mit denen die Agenten für ein konkretes Projekt konfiguriert werden. Ein Unterordner pro Agent. |
| [`src/`](src/) | Quellcode und Skripte der Verifikationstools, die sicherstellen, dass die Arbeit der Agenten richtig umgesetzt wurde – z. B. Roslyn-Analyser oder Lint-Configs. Ein Unterordner pro Agent. |

Konvention: Ordnername = Agentenname, also z. B. `specs/backend-developer-agent/`, `harness/backend-developer-agent/` und `src/backend-developer-agent/` für den Agenten `backend-developer-agent`.

## Ablauf

Änderungen beginnen in `specs/`. Daraus werden `.claude/agents/`, `harness/` und `src/` generiert bzw. angepasst, anschließend mit `../deploy-agents.ps1` ins [`Agent-Test-Project`](../Agent-Test-Project/) übernommen und dort getestet. Die Schritte im Einzelnen: [`specs/readme.md`](specs/readme.md).
