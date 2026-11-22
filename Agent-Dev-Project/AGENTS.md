# Agent-Dev-Project – Anweisungen für den KI-Agenten

In diesem Projekt **entwickelst du Subagenten** für die Softwareentwicklung (`frontend-developer-agent`, `backend-developer-agent`). Du schreibst hier keinen Anwendungscode, sondern die Agenten selbst, ihre Projekt-Config und ihre Verifikationstools.

## Zuerst lesen

- `README.md` – Ordnerstruktur und Zweck der Ordner
- `specs/readme.md` – wie aus den Specs die übrigen Artefakte entstehen

## Regeln

1. **Die Specs sind die Quelle der Wahrheit.** Jede Änderung an einem Agenten beginnt in `specs/<agent>/`. Erst danach werden `.claude/agents/`, `harness/` und `src/` daraus generiert oder angepasst. Ändere diese Artefakte nicht, ohne die Spec nachzuziehen.
2. **Agentendateien bleiben projektneutral.** In `.claude/agents/*.md` steht nur die allgemeine Arbeitsweise – keine Technologien, Pfade, Befehle oder Regeln eines konkreten Projekts. Alles Projektspezifische gehört nach `harness/<agent>/`.
3. **Prüfbare Regeln werden zu Tools.** Was sich automatisch prüfen lässt, wird als Verifikationstool in `src/<agent>/` umgesetzt (Analyser, Lint-Config, Skript) und nicht nur als Text in die Agentendatei geschrieben.
4. **Getestet wird im `../Agent-Test-Project`.** Nach Änderungen `../deploy-agents.ps1` ausführen; die Agenten werden dort an echten Aufgaben ausprobiert.
5. **Ordnername = Agentenname.** Der Name aus dem Frontmatter der Agentendatei ist auch der Ordnername in `specs/`, `harness/` und `src/`.
