# Claude Code Setup

Kör detta på vilken dator som helst för att få exakt samma Claude Code-setup.

## Krav — kontrollera innan du börjar

- [ ] [Node.js](https://nodejs.org) är installerat
- [ ] [Git](https://git-scm.com) är installerat
- [ ] PowerShell är öppnad **som administratör** (högerklicka → "Kör som administratör")

> Scriptet kontrollerar detta automatiskt och talar om vad som saknas.

## Snabbinstallation

**Steg 1** — Installera [Node.js](https://nodejs.org) och [Git](https://git-scm.com) om du inte redan har dem.

**Steg 2** — Klona detta repo:
```powershell
git clone https://github.com/DITT_ANVÄNDARNAMN/claude-setup.git
cd claude-setup
```

**Steg 3** — Kör setup-scriptet i PowerShell:
```powershell
.\setup.ps1
```

**Steg 4** — Öppna Claude Code (`claude` i terminalen) och kör:
```
/plugin marketplace add anthropics/skills
/plugin install example-skills@anthropic-agent-skills
/plugin install document-skills@anthropic-agent-skills
/reload-plugins
```

**Steg 5** — Logga in:
```
claude
```

---

## Vad som installeras

| Skill | Källa |
|---|---|
| superpowers | obra/superpowers |
| vibe-coding-prompt-template | KhazP/vibe-coding-prompt-template |
| claude-mem | thedotmack/claude-mem |
| example-skills | Anthropic plugin |
| document-skills | Anthropic plugin (PDF, Word, Excel, PowerPoint) |

---

## Uppdatera skills

För att uppdatera alla klonade skills, kör scriptet igen:
```powershell
.\setup.ps1
```
Det kör `git pull` automatiskt på alla redan installerade skills.
