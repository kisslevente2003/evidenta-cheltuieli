@echo off
echo ========================================
echo     TEST RAPID APLICAȚIE
echo     Evidența Cheltuieli App
echo ========================================
echo.

echo 🔍 Verificând package.json...
if not exist package.json (
    echo ❌ package.json nu există!
    echo Asigură-te că ești în directorul corect al aplicației.
    pause
    exit /b 1
)

echo ✅ package.json găsit!
echo.

echo 🔍 Verificând componenta principală App.tsx...
if not exist App.tsx (
    echo ❌ App.tsx nu există!
    echo Aplicația este incompletă.
    pause
    exit /b 1
)

echo ✅ App.tsx găsit!
echo.

echo 🔍 Verificând directorul components...
if not exist components (
    echo ❌ Directorul components nu există!
    echo Aplicația este incompletă.
    pause
    exit /b 1
)

echo ✅ Directorul components găsit!
echo.

echo 🔍 Verificând node_modules...
if not exist node_modules (
    echo ⚠️ node_modules nu există! Rulând npm install...
    npm install
    if %errorlevel% neq 0 (
        echo ❌ Eroare la instalarea dependințelor!
        pause
        exit /b 1
    )
) else (
    echo ✅ node_modules găsit!
)

echo.
echo 🔍 Verificând script-ul npm run dev...
npm run dev --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️ Script-ul dev nu funcționează corect!
    echo 💡 Rulează fix_dev_script.bat pentru a repara problema
    pause
    exit /b 1
) else (
    echo ✅ Script-ul dev funcționează!
)

echo.
echo 🚀 Toate verificările au trecut cu succes!
echo.
echo 📋 Informații aplicație:
echo   - Nume: Evidența Cheltuieli
echo   - Versiune: 1.0.0
echo   - Framework: React + TypeScript + Vite
echo   - UI: Tailwind CSS v4 + shadcn/ui
echo   - Features: PWA, Backup/Restore, Cereri Carburant
echo.

echo 🎯 Pentru a porni aplicația:
echo   1. Deschide un terminal în acest director
echo   2. Rulează: npm run dev
echo   3. Accesează: http://localhost:5173
echo.

echo 🔧 Comenzi utile:
echo   npm run dev      - Pornește aplicația în mod dezvoltare
echo   npm run build    - Construiește aplicația pentru producție
echo   npm run preview  - Previzualizează build-ul de producție
echo.

set /p start="Vrei să pornești aplicația acum? (y/n): "
if /i "%start%"=="y" (
    echo.
    echo 🚀 Pornind aplicația...
    echo ⚠️ Nu închide această fereastră - aplicația va rula aici
    echo 📱 Aplicația va fi disponibilă la: http://localhost:5173
    echo.
    npm run dev
) else (
    echo.
    echo ✅ Aplicația este pregătită pentru utilizare!
    echo Pentru a o porni mai târziu, rulează: npm run dev
)

pause