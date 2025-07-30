#!/bin/bash

echo "========================================"
echo "     DIAGNOSTIC SCRIPT NPM DEV"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔍 Verificând configurația proiectului..."
echo

echo "📋 Verificând package.json..."
if [ -f "package.json" ]; then
    echo "✅ package.json există"
    echo
    echo "📝 Script-uri disponibile:"
    grep -A 5 '"scripts"' package.json
else
    echo "❌ package.json lipsește!"
    echo
    exit 1
fi

echo
echo "📋 Verificând vite.config.ts..."
if [ -f "vite.config.ts" ]; then
    echo "✅ vite.config.ts există"
else
    echo "❌ vite.config.ts lipsește!"
fi

echo
echo "📋 Verificând index.html..."
if [ -f "index.html" ]; then
    echo "✅ index.html există"
else
    echo "❌ index.html lipsește!"
fi

echo
echo "📋 Verificând structura src/..."
if [ -f "src/main.tsx" ]; then
    echo "✅ src/main.tsx există"
else
    echo "❌ src/main.tsx lipsește!"
fi

if [ -f "App.tsx" ]; then
    echo "✅ App.tsx există în root"
else
    echo "❌ App.tsx lipsește din root!"
fi

echo
echo "📋 Verificând dependențele..."
if [ -d "node_modules" ]; then
    echo "✅ node_modules există"
    
    if [ -d "node_modules/vite" ]; then
        echo "✅ Vite este instalat"
    else
        echo "❌ Vite nu este instalat!"
        echo "💡 Rulând npm install pentru a instala dependențele..."
        npm install
    fi
else
    echo "❌ node_modules lipsește!"
    echo "💡 Rulând npm install pentru a instala dependințele..."
    npm install
fi

echo
echo "🔍 Verificând versiunile..."
echo "📊 Node.js version:"
if command -v node >/dev/null 2>&1; then
    node --version
else
    echo "❌ Node.js nu este instalat"
fi

echo "📊 NPM version:"
if command -v npm >/dev/null 2>&1; then
    npm --version
else
    echo "❌ NPM nu este instalat"
fi

echo
echo "🔍 Testând script-ul dev..."
echo "💡 Încerc să verific npm run dev..."

# Verifică dacă există script-ul dev
if npm run 2>/dev/null | grep -q "dev"; then
    echo "✅ Script-ul 'dev' este definit în package.json"
    echo
    echo "🚀 Aplicația este pregătită!"
    echo "Pentru a o porni, rulează: npm run dev"
else
    echo
    echo "❌ Eroare detectată! Încercând soluții de remediere..."
    echo
    
    echo "🧹 Curățând cache-ul NPM..."
    npm cache clean --force
    
    echo "🗑️ Ștergând node_modules și package-lock.json..."
    rm -rf node_modules package-lock.json
    
    echo "📦 Reinstalând dependențele..."
    if npm install; then
        echo "✅ Dependințele au fost reinstalate cu succes!"
        echo
        echo "🚀 Aplicația este acum pregătită!"
        echo "Pentru a o porni, rulează: npm run dev"
        echo
    else
        echo "❌ Eroare la reinstalarea dependințelor!"
        echo
        echo "🔧 Soluții posibile:"
        echo "  1. Verifică că ai Node.js >=18.0.0 instalat"
        echo "  2. Verifică că ai NPM >=8.0.0 instalat"
        echo "  3. Verifică conexiunea la internet"
        echo "  4. Încearcă să rulezi cu sudo (dacă ai probleme de permisiuni)"
        echo
    fi
fi

echo
echo "========================================"
echo "     DIAGNOSTIC COMPLET"
echo "========================================"
echo

read -p "Apasă Enter pentru a continua..."