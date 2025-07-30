#!/bin/bash

echo "========================================"
echo "     CORECTARE IMPORT-URI CU VERSIUNI"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "🔍 Căutând import-uri cu versiuni hard-codate..."
echo

# Verifică pentru import-uri problematice în directorul components
echo "Verificând components/ui/..."

if grep -r "@.*@" components/ui/ >/dev/null 2>&1; then
    echo "❌ Găsite import-uri cu versiuni hard-codate!"
    echo
    echo "📋 Import-uri problematice găsite:"
    grep -rn "@.*@" components/ui/
    echo
    echo "⚠️ Aceste import-uri trebuie corectate manual!"
    echo
    echo "💡 Exemple de corecții:"
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
echo "========================================"
echo "     VERIFICARE COMPLETĂ"
echo "========================================"
echo
echo "📝 Pentru a corecta import-urile:"
echo "  1. Deschide fișierele cu probleme"
echo "  2. Elimină versiunea din import (ex: @1.1.2)"
echo "  3. Păstrează doar numele pachetului"
echo "  4. Salvează fișierul"
echo
echo "🚀 După corecții, rulează: npm run dev"
echo

read -p "Apasă Enter pentru a continua..."