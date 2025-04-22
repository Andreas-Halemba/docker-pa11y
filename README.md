# Pa11y Dashboard Docker Container

**Automatisiertes Accessibility-Testing mit Pa11y Dashboard, MongoDB und Mongo Express – alles per Docker Compose.**

## Features

- Accessibility-Tests im Browser mit Pa11y Dashboard
- Persistente Speicherung der Ergebnisse in MongoDB
- Einfache Verwaltung der Datenbank mit Mongo Express
- Komplett vorkonfiguriert für lokale Entwicklung und Tests

## Voraussetzungen

- [Docker](https://www.docker.com/products/docker) und [Docker Compose](https://docs.docker.com/compose/) installiert

## Schnellstart

1. **Repository klonen:**
   ```sh
   git clone <dieses-repo>
   cd docker-pa11y
   ```
2. **Konfiguration prüfen:**
   - Passe ggf. die Datei `production.json` an. Die MongoDB-URL muss mit Authentifizierung übereinstimmen:
     ```json
     "mongodb": "mongodb://root:example@mongo:27017/admin"
     ```
   - Standard-Login für MongoDB: Benutzer `root`, Passwort `example` (siehe `docker-compose.yml`).
3. **Container starten:**
   ```sh
   docker compose up --build -d
   # oder mit Makefile:
   make up
   ```
4. **Dashboard im Browser öffnen:**
   - Pa11y Dashboard: [http://localhost:8000](http://localhost:8000)
   - Mongo Express (DB-Admin): [http://localhost:8081](http://localhost:8081)

## Mongo Express – Möglichkeiten

[Mongo Express](https://github.com/mongo-express/mongo-express) ist ein grafisches Web-Interface für MongoDB. Es bietet dir unter anderem folgende Möglichkeiten:

- **Datenbank-Inspektion:** Durchsuche alle Datenbanken, Collections und Dokumente.
- **CRUD-Operationen:** Erstelle, bearbeite und lösche Datenbanken, Collections und einzelne Dokumente direkt im Browser.
- **Abfragen:** Führe eigene MongoDB-Queries aus und filtere Daten.
- **Benutzerverwaltung:** (sofern aktiviert) Verwalte Benutzer und Berechtigungen.
- **Import/Export:** Importiere und exportiere Daten als JSON oder CSV.
- **Monitoring:** Sieh dir Statistiken und Statusinformationen zu deiner MongoDB-Instanz an.

**Zugriff:**

- Mongo Express erreichst du im Browser unter [http://localhost:8081](http://localhost:8081)
- Standardmäßig ist keine Authentifizierung für Mongo Express aktiviert (siehe `docker-compose.yml`).

## Makefile-Kommandos (Abkürzungen)

Das Makefile bietet praktische Kurzbefehle für die wichtigsten Aufgaben:

| Befehl         | Beschreibung                                       |
| -------------- | -------------------------------------------------- |
| `make up`      | Startet alle Container im Hintergrund              |
| `make down`    | Stoppt und entfernt alle Container                 |
| `make logs`    | Zeigt die Logs aller Services                      |
| `make rebuild` | Erzwingt Neu-Build und Neustart                    |
| `make clean`   | Entfernt Container, Images und Volumes (Vorsicht!) |

Beispiel:

```sh
make up      # Startet alles
make logs    # Zeigt Logs
make down    # Stoppt alles
```

## Hinweise & Troubleshooting

- **Chromium-Fehler (Puppeteer):**
  Das Dockerfile setzt einen Symlink, damit Pa11y/Puppeteer das installierte Chromium findet. Sollte es dennoch zu Problemen kommen, prüfe, ob `/usr/bin/chromium-browser` existiert.
- **MongoDB-Auth:**
  Die Verbindung zur Datenbank muss mit Benutzer/Passwort erfolgen. Siehe Beispiel oben.
- **Persistente Daten:**
  Die MongoDB-Daten werden im lokalen Ordner `./mongo-data` gespeichert.

## Nützliche Links

- [Pa11y Dashboard](https://github.com/pa11y/dashboard)
- [Pa11y Projekt](http://pa11y.org/)
- [Mongo Express](https://github.com/mongo-express/mongo-express)

---

**Viel Erfolg beim Barrierefrei-Testen!**
