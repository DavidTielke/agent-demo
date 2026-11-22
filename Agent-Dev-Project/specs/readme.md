# Specs – so werden die Agenten spezifiziert

Hier wird festgelegt, **was** ein Agent macht, **wie** er es macht und **wie am Ende validiert** wird.

Dieser Ordner ist das Projekt, in dem die Agenten spezifiziert werden. Die anderen Ordner (`.claude/agents/`, `harness/`, `src/`) sind die Projekte, in denen der KI-Agent die Agenten daraus baut. Getestet wird anschließend im `../Agent-Test-Project`.

## Aufbau

Ein Ordner pro Agent, Ordnername = Agentenname. Darin liegen Markdown-Dateien, die Verhalten, Verifikation und Projekt-Config des Agenten beschreiben:

```
specs/
├── readme.md
├── backend-developer-agent/
│   ├── verhalten.md
│   ├── verifikation.md
│   └── projekt-config.md
└── frontend-developer-agent/
    ├── verhalten.md
    ├── verifikation.md
    └── projekt-config.md
```

| Datei | Beantwortet | Wird umgesetzt in |
|---|---|---|
| `verhalten.md` | Was macht der Agent und wie arbeitet er? Nur projektneutrale Aussagen. | `.claude/agents/<agent>.md` |
| `verifikation.md` | Wie wird am Ende geprüft, ob der Agent richtig gearbeitet hat? | `src/<agent>/` (Quellcode der Tools), Build-Ergebnis in `harness/<agent>/` |
| `projekt-config.md` | Was muss der Agent über das konkrete Projekt wissen: Stack, Pfade, Regeln, Befehle? | `harness/<agent>/` |

Weitere Markdown-Dateien pro Agent sind möglich. Jede Datei nennt oben, in welchem Ordner sie umgesetzt wird.

## Umgang mit Änderungen

1. **Spec ändern** – Die Änderung wird zuerst in `specs/<agent>/` beschrieben.
2. **Artefakte nachziehen** – Aus der geänderten Spec werden die betroffenen Inhalte in `.claude/agents/`, `harness/` und/oder `src/` generiert bzw. angepasst. Welche Ordner betroffen sind, ergibt sich aus der Tabelle oben.
3. **Tools bauen** – Wurde `src/<agent>/` geändert, das Tool bauen und das Ergebnis nach `harness/<agent>/` legen.
4. **Deployen** – `../deploy-agents.ps1` kopiert Agentendateien und Projekt-Config ins Testprojekt.
5. **Testen** – Im `../Agent-Test-Project` setzt der Agent eine echte Aufgabe um.
6. **Nachschärfen** – Verhält sich der Agent nicht wie gewünscht, wird die Spec korrigiert und der Ablauf beginnt von vorn.

## Regeln

- Kein Artefakt wird direkt geändert, ohne dass die Spec dazu passt. Weichen Spec und Artefakt voneinander ab, gilt die Spec.
- `verhalten.md` bleibt projektneutral. Technologien, Pfade und Befehle eines konkreten Projekts gehören in `projekt-config.md`.
- Eine Regel, die sich automatisch prüfen lässt, wird in `verifikation.md` aufgenommen und als Tool umgesetzt, statt sie nur als Text in die Agentendatei zu schreiben.
