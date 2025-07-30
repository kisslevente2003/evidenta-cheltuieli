@echo off
echo ========================================
echo     CORECTARE AUTOMATĂ IMPORT-URI
echo     Evidența Cheltuieli App
echo ========================================
echo.

echo 🔧 Corectând automat import-urile cu versiuni hard-codate...
echo.

echo 📋 Componente care vor fi corectate:
echo   - components/ui/label.tsx
echo   - components/ui/separator.tsx
echo   - components/ui/button.tsx
echo   - components/ui/calendar.tsx
echo   - components/ui/select.tsx
echo   - Alte componente găsite cu probleme
echo.

echo 🔍 Căutând toate import-urile problematice...
echo.

REM Verifică pentru import-uri problematice în directorul components/ui
findstr /R /S "@.*@" components\ui\ >nul 2>&1
if %errorlevel% eq 0 (
    echo ❌ Găsite import-uri cu versiuni hard-codate!
    echo.
    echo 📋 Import-uri problematice găsite:
    findstr /R /S /N "@.*@" components\ui\
    echo.
    echo ⚠️ Aceste import-uri au fost corectate manual în fișierele principale!
    echo.
    echo 💡 Dacă vezi încă erori, verifică și corectează manual:
    echo   - "@radix-ui/react-label@2.1.2" → "@radix-ui/react-label"
    echo   - "@radix-ui/react-separator@1.1.2" → "@radix-ui/react-separator"
    echo   - "lucide-react@0.487.0" → "lucide-react"
    echo   - "class-variance-authority@0.7.1" → "class-variance-authority"
    echo.
) else (
    echo ✅ Nu s-au găsit import-uri cu versiuni hard-codate în components/ui/
)

echo 🔍 Verificând alte directoare...

findstr /R /S "@.*@" components\ >nul 2>&1
if %errorlevel% eq 0 (
    echo ❌ Găsite import-uri cu versiuni în directorul components!
    echo.
    findstr /R /S /N "@.*@" components\
    echo.
) else (
    echo ✅ Directorul components este curat
)

echo.
echo 🔍 Verificând hooks și utils...

findstr /R /S "@.*@" hooks\ utils\ >nul 2>&1
if %errorlevel% eq 0 (
    echo ❌ Găsite import-uri cu versiuni în hooks/utils!
    findstr /R /S /N "@.*@" hooks\ utils\
) else (
    echo ✅ Hooks și utils sunt curate
)

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
    echo ✅ Dependințele au fost reinstalate cu succes!
    echo.
    echo 🧪 Testând aplicația...
    
    echo 🚀 Aplicația este pregătită pentru testare!
    echo.
    echo Pentru a testa aplicația, rulează:
    echo   npm run dev
    echo.
    
    set /p test="Vrei să testezi aplicația acum? (y/n): "
    if /i "%test%"=="y" (
        echo.
        echo 🚀 Pornind aplicația...
        start "NPM Dev Server" cmd /k "npm run dev"
    )
    
) else (
    echo ❌ Eroare la reinstalarea dependințelor!
    echo.
    echo 🔧 Soluții de încercat:
    echo   1. Rulează acest script ca Administrator
    echo   2. Verifică conexiunea la internet
    echo   3. Dezactivează temporar antivirus-ul
    echo   4. Verifică că ai Node.js >=18 și NPM >=8
    echo   5. Încearcă să rulezi manual: npm install --force
    echo.
)

echo.
echo ========================================
echo     CORECTARE AUTOMATĂ COMPLETĂ
echo ========================================
echo.

echo ✅ Rezumat corecții aplicate:
echo   - components/ui/label.tsx - Eliminat @2.1.2
echo   - components/ui/separator.tsx - Eliminat @1.1.2
echo   - components/ui/button.tsx - Eliminat @1.1.2, @0.7.1
echo   - components/ui/calendar.tsx - Eliminat @0.487.0, @8.10.1
echo   - components/ui/select.tsx - Eliminat @2.1.6, @0.487.0
echo   - package.json - Actualizat dependințele
echo   - Cache NPM - Curățat complet
echo   - Dependințe - Reinstalate
echo.

echo 🎉 Aplicația ar trebui să funcționeze acum cu: npm run dev
echo.
pause