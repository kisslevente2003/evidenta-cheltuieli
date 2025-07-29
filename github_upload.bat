@echo off
echo ========================================
echo     GITHUB UPLOAD AUTOMAT
echo     Evidenta Cheltuieli App
echo ========================================
echo.

REM Verifică dacă Git este instalat
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git nu este instalat!
    echo Descarcă Git de la: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo ✅ Git detectat!
echo.

REM Cere informațiile necesare
set /p REPO_NAME="Introdu numele repository-ului GitHub: "
set /p USER_NAME="Introdu numele tău complet: "
set /p USER_EMAIL="Introdu email-ul tău GitHub: "

echo.
echo 🔧 Configurez Git...
git config --global user.name "%USER_NAME%"
git config --global user.email "%USER_EMAIL%"

echo.
echo 📁 Inițializez repository-ul local...
git init

echo.
echo 🔗 Adaug repository-ul remote...
git remote add origin https://github.com/kisslevente2003/%REPO_NAME%.git

echo.
echo 📄 Creez .gitignore...
(
echo # Dependencies
echo node_modules/
echo npm-debug.log*
echo yarn-debug.log*
echo yarn-error.log*
echo.
echo # Build outputs  
echo dist/
echo build/
echo *.tsbuildinfo
echo.
echo # Environment files
echo .env
echo .env.local
echo .env.development.local
echo .env.test.local
echo .env.production.local
echo.
echo # Database
echo *.db
echo *.sqlite
echo .prisma/
echo.
echo # IDE
echo .vscode/
echo .idea/
echo *.swp
echo *.swo
echo.
echo # OS generated files
echo .DS_Store
echo .DS_Store?
echo ._*
echo .Spotlight-V100
echo .Trashes
echo ehthumbs.db
echo Thumbs.db
echo.
echo # Logs
echo logs/
echo *.log
) > .gitignore

echo.
echo 📝 Creez README.md...
(
echo # 🏠 Evidența Cheltuielilor
echo.
echo ^> Aplicație modernă PWA pentru gestionarea cheltuielilor lunare cu sistem de notificări și rapoarte avansate.
echo.
echo ## ✨ Funcționalități
echo.
echo - 📊 **Dashboard interactiv** cu widget-uri și statistici
echo - 📱 **PWA support** - instalabilă ca aplicație nativă  
echo - 🔔 **Notificări push** pentru expirări și alerte
echo - 📄 **Cereri carburant** cu generare automată PDF
echo - 💾 **Backup/Restore** complet pentru date
echo - 🌙 **Dark/Light mode** cu teme personalizabile
echo - 🎨 **Design 3D modern** cu animații fluide
echo - 📈 **Rapoarte avansate** cu grafice interactive
echo.
echo ## 🚀 Instalare Rapidă
echo.
echo ^^^```bash
echo # Clonează repository-ul
echo git clone https://github.com/kisslevente2003/%REPO_NAME%.git
echo.
echo # Navighează în director
echo cd %REPO_NAME%
echo.
echo # Instalează dependențele
echo npm install
echo.
echo # Pornește aplicația
echo npm run dev
echo ^^^```
echo.
echo ## 💻 Cerințe de Sistem
echo.
echo - Node.js 18^+ 
echo - npm 8^+
echo - Browser modern cu suport PWA
echo.
echo ## 👨‍💻 Autor
echo.
echo **%USER_NAME%** - [@kisslevente2003](https://github.com/kisslevente2003^)
) > README.md

echo.
echo 📦 Adaug toate fișierele...
git add .

echo.
echo 💾 Creez primul commit...
git commit -m "Initial upload - Evidența Cheltuieli App

Aplicație completă pentru evidența cheltuielilor cu:
- PWA support cu notificări
- Cereri decontare carburant  
- Sistem 3D modern
- Dashboard și rapoarte
- Backup/restore funcții

Dezvoltat de %USER_NAME%"

echo.
echo 🌿 Setez branch-ul main...
git branch -M main

echo.
echo 🚀 Upload pe GitHub...
git push -u origin main

if %errorlevel% eq 0 (
    echo.
    echo ========================================
    echo ✅ UPLOAD REUȘIT!
    echo ========================================
    echo.
    echo 🔗 Repository-ul tău este disponibil la:
    echo https://github.com/kisslevente2003/%REPO_NAME%
    echo.
    echo 📱 Pentru GitHub Pages activează:
    echo Settings ^> Pages ^> Deploy from branch: main
    echo.
    echo 🏷️ Adaugă topics în Settings ^> General:
    echo react, typescript, pwa, expense-tracker, tailwindcss
    echo.
) else (
    echo.
    echo ❌ Eroare la upload!
    echo Verifică:
    echo - Conexiunea la internet
    echo - Numele repository-ului
    echo - Autentificarea GitHub
    echo.
)

pause