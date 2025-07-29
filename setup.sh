#!/bin/bash

# Culori pentru output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}====================================${NC}"
echo -e "${CYAN} EVIDENTA CHELTUIELI - SETUP SCRIPT${NC}"
echo -e "${CYAN}====================================${NC}"
echo ""

# Verifică dacă Node.js este instalat
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ EROARE: Node.js nu este instalat!${NC}"
    echo ""
    echo "Te rugăm să instalezi Node.js de la: https://nodejs.org/"
    echo "Versiunea recomandată: 18.x sau mai nouă"
    echo ""
    echo "Pe Ubuntu/Debian: sudo apt install nodejs npm"
    echo "Pe macOS: brew install node"
    echo "Pe CentOS/RHEL: sudo dnf install nodejs npm"
    echo ""
    exit 1
fi

# Verifică dacă npm este instalat
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ EROARE: npm nu este instalat!${NC}"
    echo ""
    echo "npm vine împreună cu Node.js. Te rugăm să reinstalezi Node.js."
    echo ""
    exit 1
fi

echo -e "${GREEN}✅ Node.js și npm sunt instalate${NC}"
echo ""

# Afișează versiunile
echo -e "${BLUE}📋 Versiuni detectate:${NC}"
echo "Node.js: $(node --version)"
echo "npm: $(npm --version)"
echo ""

# Verifică versiunea Node.js
NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo -e "${YELLOW}⚠️  AVERTISMENT: Versiunea Node.js este prea veche!${NC}"
    echo "Versiunea curentă: $(node --version)"
    echo "Versiunea recomandată: 18.x sau mai nouă"
    echo ""
    read -p "Continui oricum? (y/n): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo -e "${PURPLE}📦 Instalez dependențele...${NC}"
if ! npm install; then
    echo -e "${RED}❌ EROARE la instalarea dependențelor!${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}✅ SETUP COMPLET!${NC}"
echo ""
echo -e "${CYAN}🚀 Pentru a porni aplicația:${NC}"
echo "   npm run dev"
echo ""
echo -e "${CYAN}🌐 Aplicația va fi disponibilă la: http://localhost:3000${NC}"
echo ""
echo -e "${CYAN}💾 Datele se salvează automat în localStorage (browserul tău)${NC}"
echo ""
echo -e "${CYAN}====================================${NC}"
echo ""