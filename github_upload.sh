#!/bin/bash

echo "========================================"
echo "     GITHUB UPLOAD AUTOMAT"
echo "     Evidenta Cheltuieli App"
echo "========================================"
echo

# Verifică dacă Git este instalat
if ! command -v git &> /dev/null; then
    echo "❌ Git nu este instalat!"
    echo "Instalează Git:"
    echo "  macOS: brew install git"
    echo "  Ubuntu/Debian: sudo apt install git"
    echo "  CentOS/RHEL: sudo yum install git"
    exit 1
fi

echo "✅ Git detectat!"
echo

# Cere informațiile necesare
read -p "Introdu numele repository-ului GitHub: " REPO_NAME
read -p "Introdu numele tău complet: " USER_NAME
read -p "Introdu email-ul tău GitHub: " USER_EMAIL

echo
echo "🔧 Configurez Git..."
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"

echo
echo "📁 Inițializez repository-ul local..."
git init

echo
echo "🔗 Adaug repository-ul remote..."
git remote add origin "https://github.com/kisslevente2003/$REPO_NAME.git"

echo
echo "📄 Creez .gitignore..."
cat > .gitignore << EOF
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Build outputs
dist/
build/
*.tsbuildinfo

# Environment files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Database
*.db
*.sqlite
.prisma/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs/
*.log
EOF

echo
echo "📝 Creez README.md..."
cat > README.md << EOF
# 🏠 Evidența Cheltuielilor

> Aplicație modernă PWA pentru gestionarea cheltuielilor lunare cu sistem de notificări și rapoarte avansate.

## ✨ Funcționalități

- 📊 **Dashboard interactiv** cu widget-uri și statistici
- 📱 **PWA support** - instalabilă ca aplicație nativă
- 🔔 **Notificări push** pentru expirări și alerte
- 📄 **Cereri carburant** cu generare automată PDF
- 💾 **Backup/Restore** complet pentru date
- 🌙 **Dark/Light mode** cu teme personalizabile
- 🎨 **Design 3D modern** cu animații fluide
- 📈 **Rapoarte avansate** cu grafice interactive

## 🚀 Instalare Rapidă

\`\`\`bash
# Clonează repository-ul
git clone https://github.com/kisslevente2003/$REPO_NAME.git

# Navighează în director
cd $REPO_NAME

# Instalează dependențele
npm install

# Pornește aplicația
npm run dev
\`\`\`

## 💻 Cerințe de Sistem

- Node.js 18+ 
- npm 8+
- Browser modern cu suport PWA

## 👨‍💻 Autor

**$USER_NAME** - [@kisslevente2003](https://github.com/kisslevente2003)
EOF

echo
echo "📦 Adaug toate fișierele..."
git add .

echo
echo "💾 Creez primul commit..."
git commit -m "Initial upload - Evidența Cheltuieli App

Aplicație completă pentru evidența cheltuielilor cu:
- PWA support cu notificări
- Cereri decontare carburant
- Sistem 3D modern
- Dashboard și rapoarte
- Backup/restore funcții

Dezvoltat de $USER_NAME"

echo
echo "🌿 Setez branch-ul main..."
git branch -M main

echo
echo "🚀 Upload pe GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo
    echo "========================================"
    echo "✅ UPLOAD REUȘIT!"
    echo "========================================"
    echo
    echo "🔗 Repository-ul tău este disponibil la:"
    echo "https://github.com/kisslevente2003/$REPO_NAME"
    echo
    echo "📱 Pentru GitHub Pages activează:"
    echo "Settings > Pages > Deploy from branch: main"
    echo
    echo "🏷️ Adaugă topics în Settings > General:"
    echo "react, typescript, pwa, expense-tracker, tailwindcss"
    echo
else
    echo
    echo "❌ Eroare la upload!"
    echo "Verifică:"
    echo "- Conexiunea la internet"
    echo "- Numele repository-ului"
    echo "- Autentificarea GitHub"
    echo
fi

echo "Apasă orice tastă pentru a continua..."
read -n 1