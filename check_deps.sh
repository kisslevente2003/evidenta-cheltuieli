#!/bin/bash

echo "========================================"
echo "     VERIFICARE DEPENDINȚE NPM"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔍 Verificând versiunile Node.js și NPM..."

# Verifică Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js nu este instalat!"
    echo "Instalează Node.js:"
    echo "  macOS: brew install node"
    echo "  Ubuntu/Debian: sudo apt install nodejs npm"
    echo "  CentOS/RHEL: sudo yum install nodejs npm"
    exit 1
fi

# Verifică NPM
if ! command -v npm &> /dev/null; then
    echo "❌ NPM nu este disponibil!"
    exit 1
fi

echo "✅ Node.js $(node --version) și NPM $(npm --version) detectate!"
echo

echo "🔍 Verificând dependințele actuale..."

# Verifică dependințele
if npm ls --depth=0 >/dev/null 2>&1; then
    echo "✅ Toate dependințele sunt în regulă!"
    echo
    
    echo "🔍 Verificând pentru probleme potențiale..."
    
    # Verifică import-uri problematice
    if grep -r "@.*@" components/ >/dev/null 2>&1; then
        echo "⚠️ Găsite import-uri cu versiuni hard-codate în components/"
        echo "Se recomandă verificarea manuală"
        echo
        echo "Import-uri problematice găsite:"
        grep -r "@.*@" components/ || true
    else
        echo "✅ Nu s-au găsit import-uri problematice"
    fi
    
    echo
    echo "🎯 Aplicația este pregătită pentru utilizare!"
    echo "Pentru a o porni, rulează: npm run dev"
    
else
    echo "❌ Probleme găsite cu dependințele!"
    echo
    
    echo "🧹 Curățând cache-ul NPM..."
    npm cache clean --force
    
    echo "🗑️ Ștergând node_modules și package-lock.json..."
    rm -rf node_modules package-lock.json
    
    echo "📦 Reinstalând dependințele..."
    if npm install; then
        echo "✅ Dependințele au fost instalate cu succes!"
        echo
        echo "🚀 Testând aplicația..."
        echo "Pentru a porni aplicația, rulează: npm run dev"
        echo
    else
        echo "❌ Eroare la instalarea dependințelor!"
        echo "Verifică manual fișierul package.json"
        exit 1
    fi
fi

echo
echo "========================================"
echo "     VERIFICARE COMPLETĂ"
echo "========================================"

read -p "Apasă Enter pentru a continua..."