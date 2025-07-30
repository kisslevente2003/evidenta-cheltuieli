@echo off
echo ========================================
echo     REPARARE SCRIPT NPM DEV
echo     Evidența Cheltuieli App  
echo ========================================
echo.

echo 🔧 Reparând configurația pentru npm run dev...
echo.

echo Pasul 1: Curățare completă...
echo 🧹 Curățând cache-ul NPM...
npm cache clean --force

echo 🗑️ Ștergând node_modules și package-lock.json...
if exist node_modules rmdir /s /q node_modules
if exist package-lock.json del package-lock.json

echo.
echo Pasul 2: Verificând integritatea fișierelor...

REM Verifică package.json
if not exist package.json (
    echo ❌ package.json lipsește! Recreând...
    goto :create_package_json
)

REM Verifică dacă script-ul dev există în package.json
findstr "\"dev\":" package.json >nul
if %errorlevel% neq 0 (
    echo ❌ Script-ul 'dev' lipsește din package.json!
    goto :fix_package_json
)

echo ✅ package.json pare să fie corect

REM Verifică vite.config.ts
if not exist vite.config.ts (
    echo ❌ vite.config.ts lipsește! Recreând...
    goto :create_vite_config
)

echo ✅ vite.config.ts existe

REM Verifică index.html
if not exist index.html (
    echo ❌ index.html lipsește!
    echo Verifică dacă aplicația are toate fișierele necesare
    pause
    exit /b 1
)

echo ✅ index.html existe

REM Verifică src/main.tsx
if not exist src\main.tsx (
    echo ❌ src/main.tsx lipsește!
    echo Verifică dacă aplicația are toate fișierele necesare  
    pause
    exit /b 1
)

echo ✅ src/main.tsx existe

echo.
echo Pasul 3: Reinstalând dependențele...
echo 📦 Rulând npm install...

npm install

if %errorlevel% eq 0 (
    echo ✅ Dependințele au fost instalate cu succes!
    echo.
    echo Pasul 4: Testând aplicația...
    
    echo 🧪 Verificând că Vite funcționează...
    npx vite --version >nul 2>&1
    if %errorlevel% eq 0 (
        echo ✅ Vite este functional!
    ) else (
        echo ❌ Vite nu funcționează corect!
        echo Reinstalând Vite...
        npm install vite@latest --save-dev
    )
    
    echo.
    echo 🎉 REPARARE COMPLETĂ!
    echo.
    echo Pentru a porni aplicația, rulează acum:
    echo   npm run dev
    echo.
    echo Aplicația va fi disponibilă la:
    echo   http://localhost:3000
    echo.
    
    set /p start="Vrei să pornești aplicația acum? (y/n): "
    if /i "%start%"=="y" (
        echo.
        echo 🚀 Pornind aplicația...
        start "NPM Dev Server" cmd /k "npm run dev"
    )
    
) else (
    echo ❌ Eroare la instalarea dependințelor!
    echo.
    echo 🔧 Soluții de încercat:
    echo   1. Rulează acest script ca Administrator
    echo   2. Verifică conexiunea la internet
    echo   3. Dezactivează temporar antivirus-ul  
    echo   4. Verifică că ai Node.js >=18 și NPM >=8
    echo   5. Încearcă să rulezi manual: npm install --force
    echo.
)

goto :end

:create_package_json
echo Recreând package.json...
rem Aici ar trebui să recreezi package.json dacă lipsește
echo { > package.json
echo   "name": "evidenta-cheltuieli", >> package.json
echo   "version": "1.0.0", >> package.json
echo   "type": "module", >> package.json
echo   "scripts": { >> package.json
echo     "dev": "vite", >> package.json
echo     "build": "tsc && vite build", >> package.json
echo     "preview": "vite preview" >> package.json
echo   } >> package.json
echo } >> package.json
echo ✅ package.json recreat!
goto :continue

:fix_package_json
echo Reparând script-urile din package.json...
rem Aici ai putea să adaugi script-ul dev dacă lipsește
echo ⚠️ Te rugăm să adaugi manual script-ul dev în package.json
echo Adaugă: "dev": "vite" în secțiunea scripts
pause
goto :continue

:create_vite_config
echo Recreând vite.config.ts...
echo import { defineConfig } from 'vite' > vite.config.ts
echo import react from '@vitejs/plugin-react' >> vite.config.ts
echo. >> vite.config.ts
echo export default defineConfig({ >> vite.config.ts
echo   plugins: [react()], >> vite.config.ts
echo   server: { >> vite.config.ts
echo     port: 3000, >> vite.config.ts
echo     open: true >> vite.config.ts
echo   } >> vite.config.ts
echo }) >> vite.config.ts
echo ✅ vite.config.ts recreat!
goto :continue

:continue
echo Continuând cu instalarea...

:end
echo.
echo ========================================
echo     REPARARE COMPLETĂ  
echo ========================================
pause