# pa11y-dashboard Docker Container
# https://github.com/pa11y/dashboard
FROM node:22-bullseye-slim

LABEL Rob Loach <robloach@gmail.com>

# Dependencies (multi-line for better readability)
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    wget \
    net-tools \
    git \
    chromium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Reason: Multi-line for better readability and maintainability
# Reason: Clean up apt cache to reduce image size

# Set environment variable to skip Puppeteer download (Chromium is installed system-wide)
ENV PUPPETEER_SKIP_DOWNLOAD true

# Set production environment (optional, can be overridden)
ENV NODE_ENV ${NODE_ENV:-production}

RUN ln -s /usr/bin/chromium /usr/bin/chromium-browser

# Add non-root user for security
RUN useradd -m appuser

# Retrieve the dashboard
RUN git clone https://github.com/pa11y/dashboard.git && cd dashboard && npm i

EXPOSE 4000
EXPOSE 3000

# Copy configuration
COPY production.json /dashboard/config/production.json

# Switch to non-root user
USER appuser

# Set working directory and start the web server
WORKDIR /dashboard
CMD node .
