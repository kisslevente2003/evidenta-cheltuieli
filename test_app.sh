#!/bin/bash

echo "========================================"
echo "     TEST RAPID APLICAȚIE"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔍 Verificând package.json..."
if [ ! -f "package.json" ]; then
    echo "❌ package.json nu există!"
    echo "Asigură-te că ești în directorul corect al aplicației."
    exit 1
fi

echo "✅ package.json găsit!"
echo

echo "🔍 Verificând componenta principală App.tsx..."
if [ ! -f "App.tsx" ]; then
    echo "❌ App.tsx nu există!"
    echo "Aplicația este incompletă."
    exit 1
fi

echo "✅ App.tsx găsit!"
echo

echo "🔍 Verificând directorul components..."
if [ ! -d "components" ]; then
    echo "❌ Directorul components nu există!"
    echo "Aplicația este incompletă."
    exit 1
fi

echo "✅ Directorul components găsit!"
echo

echo "🔍 Verificând node_modules..."
if [ ! -d "node_modules" ]; then
    echo "⚠️ node_modules nu există! Rulând npm install..."
    if ! npm install; then
        echo "❌ Eroare la instalarea dependințelor!"
        exit 1
    fi
else
    echo "✅ node_modules găsit!"
fi

echo
echo "🔍 Verificând script-ul npm run dev..."
if npm run 2>/dev/null | grep -q "dev"; then
    echo "✅ Script-ul dev funcționează!"
else
    echo "⚠️ Script-ul dev nu funcționează corect!"
    echo "💡 Rulează bash fix_dev_script.sh pentru a repara problema"
    exit 1
fi

echo
echo "🚀 Toate verificările au trecut cu succes!"
echo
echo "📋 Informații aplicație:"
echo "  - Nume: Evidența Cheltuieli"
echo "  - Versiune: 1.0.0"
echo "  - Framework: React + TypeScript + Vite"
echo "  - UI: Tailwind CSS v4 + shadcn/ui"
echo "  - Features: PWA, Backup/Restore, Cereri Carburant"
echo

echo "🎯 Pentru a porni aplicația:"
echo "  1. Deschide un terminal în acest director"
echo "  2. Rulează: npm run dev"
echo "  3. Accesează: http://localhost:5173"
echo

echo "🔧 Comenzi utile:"
echo "  npm run dev      - Pornește aplicația în mod dezvoltare"
echo "  npm run build    - Construiește aplicația pentru producție"
echo "  npm run preview  - Previzualizează build-ul de producție"
echo

read -p "Vrei să pornești aplicația acum? (y/n): " start
if [[ $start =~ ^[Yy]$ ]]; then
    echo
    echo "🚀 Pornind aplicația..."
    echo "⚠️ Nu închide această fereastră - aplicația va rula aici"
    echo "📱 Aplicația va fi disponibilă la: http://localhost:5173"
    echo
    npm run dev
else
    echo
    echo "✅ Aplicația este pregătită pentru utilizare!"
    echo "Pentru a o porni mai târziu, rulează: npm run dev"
fi

echo
read -p "Apasă Enter pentru a continua..."