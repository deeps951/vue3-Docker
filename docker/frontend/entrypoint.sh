#!/usr/bin/env sh
set -e

if [ ! -f package.json ]; then
  echo "[entrypoint] No package.json found. Scaffolding a minimal Vue + Vite app..."
  mkdir -p /app/src
  cat > /app/package.json << 'JSON'
{
  "name": "vue-in-docker",
  "private": true,
  "version": "0.0.1",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview --host"
  },
  "dependencies": {
    "vue": "^3.5.0"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^5.1.0",
    "vite": "^5.3.0"
  }
}
JSON

  cat > /app/index.html << 'HTML'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vue in Docker</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
HTML

  cat > /app/vite.config.js << 'JS'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  server: {
    host: true,
    port: 5173
  }
})
JS

  cat > /app/src/main.js << 'JS'
import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
JS

  cat > /app/src/App.vue << 'VUE'
<script setup>
</script>

<template>
  <main style="font-family: system-ui, sans-serif; padding: 2rem;">
    <h1>👋 Hello from Vue in Docker</h1>
    <p>Everything you see here runs inside a container. Your files live on your drive.</p>
    <p>Try editing <code>src/App.vue</code> — hot reload will kick in.</p>
  </main>
</template>

<style scoped>
main { max-width: 60ch; }
</style>
VUE
fi

if [ -f package-lock.json ]; then
  npm ci
else
  npm install
fi

npm run dev -- --host 0.0.0.0 --port 5173
