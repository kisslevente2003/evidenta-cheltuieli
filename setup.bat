@echo off
echo ====================================
echo  EVIDENTA CHELTUIELI - SETUP SCRIPT
echo ====================================
echo.

:: Verifică dacă Node.js este instalat
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ EROARE: Node.js nu este instalat!
    echo.
    echo Te rugăm să instalezi Node.js de la: https://nodejs.org/
    echo Versiunea recomandată: 18.x sau mai nouă
    echo.
    pause
    exit /b 1
)

:: Verifică dacă npm este instalat
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ EROARE: npm nu este instalat!
    echo.
    echo npm vine împreună cu Node.js. Te rugăm să reinstalezi Node.js.
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js și npm sunt instalate
echo.

:: Afișează versiunile
echo 📋 Versiuni detectate:
node --version
npm --version
echo.

echo 📦 Instalez dependențele...
call npm install
if %errorlevel% neq 0 (
    echo ❌ EROARE la instalarea dependențelor!
    pause
    exit /b 1
)

echo.
echo ✅ SETUP COMPLET!
echo.
echo 🚀 Pentru a porni aplicația:
echo    npm run dev
echo.
echo 🌐 Aplicația va fi disponibilă la: http://localhost:3000
echo.
echo 💾 Datele se salvează automat în localStorage (browserul tău)
echo.
echo ====================================
echo.
pause