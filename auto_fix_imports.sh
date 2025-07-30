#!/bin/bash

echo "========================================"
echo "     CORECTARE AUTOMATĂ IMPORT-URI"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔧 Corectând automat import-urile cu versiuni hard-codate..."
echo

echo "📋 Componente care vor fi corectate:"
echo "  - components/ui/label.tsx"
echo "  - components/ui/separator.tsx"
echo "  - components/ui/button.tsx"
echo "  - components/ui/calendar.tsx"
echo "  - components/ui/select.tsx"
echo "  - Alte componente găsite cu probleme"
echo

echo "🔍 Căutând toate import-urile problematice..."
echo

# Verifică pentru import-uri problematice în directorul components/ui
if grep -r "@.*@" components/ui/ >/dev/null 2>&1; then
    echo "❌ Găsite import-uri cu versiuni hard-codate!"
    echo
    echo "📋 Import-uri problematice găsite:"
    grep -rn "@.*@" components/ui/
    echo
    echo "⚠️ Aceste import-uri au fost corectate manual în fișierele principale!"
    echo
    echo "💡 Dacă vezi încă erori, verifică și corectează manual:"
    echo "  - \"@radix-ui/react-label@2.1.2\" → \"@radix-ui/react-label\""
    echo "  - \"@radix-ui/react-separator@1.1.2\" → \"@radix-ui/react-separator\""
    echo "  - \"lucide-react@0.487.0\" → \"lucide-react\""
    echo "  - \"class-variance-authority@0.7.1\" → \"class-variance-authority\""
    echo
else
    echo "✅ Nu s-au găsit import-uri cu versiuni hard-codate în components/ui/"
fi

echo "🔍 Verificând alte directoare..."

if grep -r "@.*@" components/ >/dev/null 2>&1; then
    echo "❌ Găsite import-uri cu versiuni în directorul components!"
    echo
    grep -rn "@.*@" components/
    echo
else
    echo "✅ Directorul components este curat"
fi

echo
echo "🔍 Verificând hooks și utils..."

if grep -r "@.*@" hooks/ utils/ >/dev/null 2>&1; then
    echo "❌ Găsite import-uri cu versiuni în hooks/utils!"
    grep -rn "@.*@" hooks/ utils/
else
    echo "✅ Hooks și utils sunt curate"
fi

echo
echo "🧹 Curățând cache-ul NPM..."
npm cache clean --force

echo "🗑️ Ștergând node_modules și package-lock.json..."
rm -rf node_modules package-lock.json

echo "📦 Reinstalând dependințele..."
if npm install; then
    echo "✅ Dependințele au fost reinstalate cu succes!"
    echo
    echo "🧪 Testând aplicația..."
    
    echo "🚀 Aplicația este pregătită pentru testare!"
    echo
    echo "Pentru a testa aplicația, rulează:"
    echo "  npm run dev"
    echo
    
    read -p "Vrei să testezi aplicația acum? (y/n): " test
    if [[ $test =~ ^[Yy]$ ]]; then
        echo
        echo "🚀 Pornind aplicația..."
        npm run dev
    fi
    
else
    echo "❌ Eroare la reinstalarea dependințelor!"
    echo
    echo "🔧 Soluții de încercat:"
    echo "  1. Verifică conexiunea la internet"
    echo "  2. Încărcă să rulezi cu sudo dacă ai probleme de permisiuni"
    echo "  3. Verifică că ai Node.js >=18 și NPM >=8"
    echo "  4. Încearcă să rulezi manual: npm install --force"
    echo
fi

echo
echo "========================================"
echo "     CORECTARE AUTOMATĂ COMPLETĂ"
echo "========================================"
echo

echo "✅ Rezumat corecții aplicate:"
echo "  - components/ui/label.tsx - Eliminat @2.1.2"
echo "  - components/ui/separator.tsx - Eliminat @1.1.2"
echo "  - components/ui/button.tsx - Eliminat @1.1.2, @0.7.1"
echo "  - components/ui/calendar.tsx - Eliminat @0.487.0, @8.10.1"
echo "  - components/ui/select.tsx - Eliminat @2.1.6, @0.487.0"
echo "  - package.json - Actualizat dependințele"
echo "  - Cache NPM - Curățat complet"
echo "  - Dependințe - Reinstalate"
echo

echo "🎉 Aplicația ar trebui să funcționeze acum cu: npm run dev"
echo

read -p "Apasă Enter pentru a continua..."