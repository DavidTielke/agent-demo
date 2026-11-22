# backend-developer-agent – Verifikation

> Umgesetzt als Tools in `src/backend-developer-agent/`. Das Build-Ergebnis liegt in `harness/backend-developer-agent/analyser/`, die Befehle zum Ausführen stehen in `harness/backend-developer-agent/config.md`.

Hier wird festgelegt, wie am Ende geprüft wird, ob der Agent richtig gearbeitet hat. Jede Regel soll automatisch prüfbar sein.

## Analyser

| Analyser | Prüft | Quellcode |
|---|---|---|
| Code-Analyser | Regeln auf Code-Ebene: Namensgebung, verbotene APIs, Stil | `src/backend-developer-agent/code-analyser/` |
| Design-Analyser | Regeln zum Entwurf: Aufbau von Klassen, Abhängigkeiten zwischen Typen, vereinbarte Muster | `src/backend-developer-agent/design-analyser/` |
| Architektur-Analyser | Regeln zur Architektur: Schichten, Modulgrenzen, erlaubte Referenzen | `src/backend-developer-agent/architecture-analyser/` |

## Regeln

| Nr. | Regel | Analyser |
|---|---|---|
| C-01 | _TODO_ | Code |
| D-01 | _TODO_ | Design |
| A-01 | _TODO_ | Architektur |

## Weitere Verifikationsschritte

_TODO_ – z. B. Build ohne Warnungen, alle Tests grün
