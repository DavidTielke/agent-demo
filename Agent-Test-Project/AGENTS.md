# Agent-Test-Project

Testprojekt, an dem die Agenten aus dem `Agent-Dev-Project` ausprobiert werden.

## Dev Harness

Diese Dateien IMMER lesen, bevor du im jeweiligen Bereich etwas machst:

- `harness/_requirements.md` – IMMER lesen, wenn du Anforderungen, Specs, Epics, Features, Stories oder Akzeptanzkriterien anlegst oder bearbeitest.
- `harness/_uiux.md` – IMMER lesen, wenn du irgendetwas mit der UI oder der UX machst. Das zugehörige Stylesheet ist `harness/dt-app.css`.

## Struktur

| Pfad | Inhalt |
|---|---|
| `specs/` | Fachliche Specs der Anwendung |
| `code/frontend/` | Frontend-Code |
| `code/backend/` | Backend-Code |
| `harness/_requirements.md` | Regeln für das Spec-Driven Development in diesem Projekt |
| `harness/_uiux.md` | UI/UX-Richtlinie, dazu die Stylesheets `harness/dt-app.css` und `harness/colors_and_type.css` |
| `harness/<agent>/` | Projekt-Config der Agenten |
| `.claude/agents/` | Agentendateien |

## Arbeitsweise

1. Es wird spec-getrieben gearbeitet. Die Regeln dazu stehen in `harness/_requirements.md` und gelten für jede Aufgabe.
2. Die Umsetzung wird an die Subagenten delegiert: Frontend-Aufgaben an den `frontend-developer-agent`, Backend-Aufgaben an den `backend-developer-agent`. Nenne dem Subagenten dabei die Dateien aus dem Dev Harness, die für die Aufgabe gelten.
3. `.claude/agents/` und `harness/<agent>/` werden nicht hier bearbeitet. Sie kommen per `../deploy-agents.ps1` aus dem `Agent-Dev-Project` und werden beim nächsten Deploy überschrieben. Änderungen an den Agenten gehören in die Specs im `Agent-Dev-Project`.
