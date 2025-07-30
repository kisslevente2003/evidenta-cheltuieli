@echo off
echo ========================================
echo     DIAGNOSTIC SCRIPT NPM DEV
echo     Evidența Cheltuieli App
echo ========================================
echo.

echo 🔍 Verificând configurația proiectului...
echo.

echo 📋 Verificând package.json...
if exist package.json (
    echo ✅ package.json există
    echo.
    echo 📝 Script-uri disponibile:
    type package.json | findstr "scripts" -A 10
) else (
    echo ❌ package.json lipsește!
    echo.
    goto :end
)

echo.
echo 📋 Verificând vite.config.ts...
if exist vite.config.ts (
    echo ✅ vite.config.ts există
) else (
    echo ❌ vite.config.ts lipsește!
)

echo.
echo 📋 Verificând index.html...
if exist index.html (
    echo ✅ index.html există
) else (
    echo ❌ index.html lipsește!
)

echo.
echo 📋 Verificând structura src/...
if exist src\main.tsx (
    echo ✅ src/main.tsx există
) else (
    echo ❌ src/main.tsx lipsește!
)

if exist App.tsx (
    echo ✅ App.tsx există în root
) else (
    echo ❌ App.tsx lipsește din root!
)

echo.
echo 📋 Verificând dependințele...
if exist node_modules (
    echo ✅ node_modules există
    
    if exist node_modules\vite (
        echo ✅ Vite este instalat
    ) else (
        echo ❌ Vite nu este instalat!
        echo 💡 Rulând npm install pentru a instala dependințele...
        npm install
    )
) else (
    echo ❌ node_modules lipsește!
    echo 💡 Rulând npm install pentru a instala dependințele...
    npm install
)

echo.
echo 🔍 Verificând versiunile...
echo 📊 Node.js version:
node --version 2>nul || echo ❌ Node.js nu este instalat

echo 📊 NPM version:  
npm --version 2>nul || echo ❌ NPM nu este instalat

echo.
echo 🔍 Testând script-ul dev...
echo 💡 Încerc să rulez npm run dev...

npm run dev --version 2>nul
if %errorlevel% neq 0 (
    echo.
    echo ❌ Eroare detectată! Încercând soluții de remediere...
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
        echo 🚀 Încerc din nou să pornesc aplicația...
        timeout /t 3 >nul
        echo Pentru a porni aplicația, rulează acum: npm run dev
        echo.
    ) else (
        echo ❌ Eroare la reinstalarea dependințelor!
        echo.
        echo 🔧 Soluții posibile:
        echo   1. Verifică că ai Node.js ^>=18.0.0 instalat
        echo   2. Verifică că ai NPM ^>=8.0.0 instalat  
        echo   3. Rulează în Command Prompt ca Administrator
        echo   4. Verifică conexiunea la internet
        echo   5. Dezactivează temporar antivirus-ul
        echo.
    )
) else (
    echo ✅ Script-ul dev pare să funcționeze!
    echo Pentru a porni aplicația, rulează: npm run dev
)

:end
echo.
echo ========================================
echo     DIAGNOSTIC COMPLET
echo ========================================
pause