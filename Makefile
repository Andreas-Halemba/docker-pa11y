# Baue das Docker-Image (nur für Einzelbetrieb, meist nicht nötig)
build:
	docker build -t robloach/pa11y-dashboard .

# Starte das Setup mit Docker Compose (empfohlen)
up:
	docker compose up --build -d

# Stoppe und entferne alle Container
down:
	docker compose down

# Zeige Logs aller Services
logs:
	docker compose logs -f

# Erzwinge Neu-Build und Neustart
rebuild:
	docker compose down
	docker compose up --build -d

# Entferne alle Container, Images und Volumes (VORSICHT!)
clean:
	docker compose down -v --rmi all --remove-orphans
