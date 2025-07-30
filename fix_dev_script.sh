#!/bin/bash

echo "========================================"
echo "     REPARARE SCRIPT NPM DEV"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔧 Reparând configurația pentru npm run dev..."
echo

echo "Pasul 1: Curățare completă..."
echo "🧹 Curățând cache-ul NPM..."
npm cache clean --force

echo "🗑️ Ștergând node_modules și package-lock.json..."
rm -rf node_modules package-lock.json

echo
echo "Pasul 2: Verificând integritatea fișierelor..."

# Verifică package.json
if [ ! -f "package.json" ]; then
    echo "❌ package.json lipsește! Recreând..."
    create_package_json
fi

# Verifică dacă script-ul dev există în package.json
if ! grep -q '"dev":' package.json; then
    echo "❌ Script-ul 'dev' lipsește din package.json!"
    echo "⚠️ Te rugăm să adaugi manual: \"dev\": \"vite\" în secțiunea scripts"
else
    echo "✅ package.json pare să fie corect"
fi

# Verifică vite.config.ts
if [ ! -f "vite.config.ts" ]; then
    echo "❌ vite.config.ts lipsește! Recreând..."
    create_vite_config
else
    echo "✅ vite.config.ts existe"
fi

# Verifică index.html
if [ ! -f "index.html" ]; then
    echo "❌ index.html lipsește!"
    echo "Verifică dacă aplicația are toate fișierele necesare"
    exit 1
else
    echo "✅ index.html existe"
fi

# Verifică src/main.tsx
if [ ! -f "src/main.tsx" ]; then
    echo "❌ src/main.tsx lipsește!"
    echo "Verifică dacă aplicația are toate fișierele necesare"
    exit 1
else
    echo "✅ src/main.tsx existe"
fi

echo
echo "Pasul 3: Reinstalând dependențele..."
echo "📦 Rulând npm install..."

if npm install; then
    echo "✅ Dependințele au fost instalate cu succes!"
    echo
    echo "Pasul 4: Testând aplicația..."
    
    echo "🧪 Verificând că Vite funcționează..."
    if npx vite --version >/dev/null 2>&1; then
        echo "✅ Vite este functional!"
    else
        echo "❌ Vite nu funcționează corect!"
        echo "Reinstalând Vite..."
        npm install vite@latest --save-dev
    fi
    
    echo
    echo "🎉 REPARARE COMPLETĂ!"
    echo
    echo "Pentru a porni aplicația, rulează acum:"
    echo "  npm run dev"
    echo
    echo "Aplicația va fi disponibilă la:"
    echo "  http://localhost:3000"
    echo
    
    read -p "Vrei să pornești aplicația acum? (y/n): " start
    if [[ $start =~ ^[Yy]$ ]]; then
        echo
        echo "🚀 Pornind aplicația..."
        npm run dev
    fi
    
else
    echo "❌ Eroare la instalarea dependințelor!"
    echo
    echo "🔧 Soluții de încercat:"
    echo "  1. Verifică conexiunea la internet"
    echo "  2. Încarcă să rulezi cu sudo dacă ai probleme de permisiuni"
    echo "  3. Verifică că ai Node.js >=18 și NPM >=8"
    echo "  4. Încearcă să rulezi manual: npm install --force"
    echo
fi

# Funcții helper
create_package_json() {
    cat > package.json << 'EOF'
{
  "name": "evidenta-cheltuieli",
  "version": "1.0.0", 
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview"
  }
}
EOF
    echo "✅ package.json recreat!"
}

create_vite_config() {
    cat > vite.config.ts << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
    open: true
  }
})
EOF
    echo "✅ vite.config.ts recreat!"
}

echo
echo "========================================"
echo "     REPARARE COMPLETĂ"
echo "========================================"
echo

read -p "Apasă Enter pentru a continua..."