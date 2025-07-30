@echo off
echo ========================================
echo     VERIFICARE DEPENDINȚE NPM
echo     Evidența Cheltuieli App
echo ========================================
echo.

echo 🔍 Verificând versiunile Node.js și NPM...
node --version 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js nu este instalat!
    echo Descarcă Node.js de la: https://nodejs.org/
    pause
    exit /b 1
)

npm --version 2>nul
if %errorlevel% neq 0 (
    echo ❌ NPM nu este disponibil!
    pause
    exit /b 1
)

echo ✅ Node.js și NPM detectate!
echo.

echo 🔍 Verificând dependințele actuale...
npm ls --depth=0 >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Probleme găsite cu dependințele!
    echo.
    echo 🧹 Curățând cache-ul NPM...
    npm cache clean --force
    
    echo 🗑️ Ștergând node_modules și package-lock.json...
    if exist node_modules (
        echo Ștergând node_modules...
        rmdir /s /q node_modules
    )
    if exist package-lock.json (
        echo Ștergând package-lock.json...
        del package-lock.json
    )
    
    echo 📦 Reinstalând dependințele...
    npm install
    
    if %errorlevel% eq 0 (
        echo ✅ Dependințele au fost instalate cu succes!
        echo.
        echo 🚀 Testând aplicația...
        echo Pentru a porni aplicația, rulează: npm run dev
        echo.
    ) else (
        echo ❌ Eroare la instalarea dependințelor!
        echo Verifică manual fișierul package.json
    )
) else (
    echo ✅ Toate dependințele sunt în regulă!
    echo.
    echo 🔍 Verificând pentru probleme potențiale...
    
    REM Verifică dacă există import-uri problematice
    findstr /R /S "@.*@" components\ >nul 2>&1
    if %errorlevel% eq 0 (
        echo ⚠️ Găsite import-uri cu versiuni hard-codate în components/
        echo Se recomandă verificarea manuală
    ) else (
        echo ✅ Nu s-au găsit import-uri problematice
    )
    
    echo.
    echo 🎯 Aplicația este pregătită pentru utilizare!
    echo Pentru a o porni, rulează: npm run dev
)

echo.
echo ========================================
echo     VERIFICARE COMPLETĂ
echo ========================================
pause