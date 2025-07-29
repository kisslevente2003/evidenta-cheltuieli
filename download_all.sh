#!/bin/bash

echo "========================================"
echo "     ORGANIZARE FIȘIERE DESCĂRCATE"
echo "     Evidența Cheltuieli App"
echo "========================================"
echo

echo "📁 Creez structura de directoare..."

# Directoare principale
mkdir -p components/{ui,FuelRequestApp,figma}
mkdir -p hooks
mkdir -p types
mkdir -p utils
mkdir -p styles
mkdir -p public
mkdir -p prisma

# Directoare pentru documentație
mkdir -p "Kit instalare Manager/Aplicația_Evidenta_Cheltuieli"
mkdir -p "Kit instalare Manager/Backup_si_Export"

# Directoare pentru surse alternative
mkdir -p src/{components/ui,lib}

echo "✅ Structura de directoare creată cu succes!"
echo

echo "📋 INSTRUCȚIUNI COPY-PASTE:"
echo

echo "🎯 FIȘIERE PRINCIPALE (ROOT):"
echo "   ┌─ App.tsx"
echo "   ├─ package.json"
echo "   ├─ vite.config.ts"
echo "   ├─ tsconfig.json"
echo "   ├─ tsconfig.app.json"
echo "   ├─ tsconfig.node.json"
echo "   ├─ index.html"
echo "   ├─ README.md"
echo "   └─ .gitignore (creează manual)"
echo

echo "📁 COMPONENTS/ (45+ fișiere):"
echo "   ┌─ AddGroupModal.tsx"
echo "   ├─ AddServiceModal.tsx"
echo "   ├─ BackupModal.tsx"
echo "   ├─ DarkModeToggle.tsx"
echo "   ├─ DashboardWidgets.tsx"
echo "   ├─ DatabaseOperationsModal.tsx"
echo "   ├─ ExpenseCard.tsx"
echo "   ├─ ExpirationAlerts.tsx"
echo "   ├─ FuelRequestApp.tsx"
echo "   ├─ LoadingScreen.tsx"
echo "   ├─ MonthExpenses.tsx"
echo "   ├─ QuickActions.tsx"
echo "   ├─ ReportsView.tsx"
echo "   ├─ StatusIndicators.tsx"
echo "   ├─ YearSelector.tsx"
echo "   ├─ YearMonthsView.tsx"
echo "   └─ ... (toate celelalte componente)"
echo

echo "📁 COMPONENTS/UI/ (35+ fișiere shadcn):"
echo "   ┌─ button.tsx"
echo "   ├─ card.tsx"
echo "   ├─ input.tsx"
echo "   ├─ dialog.tsx"
echo "   ├─ select.tsx"
echo "   ├─ calendar.tsx"
echo "   ├─ popover.tsx"
echo "   ├─ accordion.tsx"
echo "   └─ ... (toate componentele UI)"
echo

echo "📁 COMPONENTS/FUELREQUESTAPP/ (8 fișiere):"
echo "   ┌─ constants.ts"
echo "   ├─ helpers.ts"
echo "   ├─ types.ts"
echo "   ├─ formHandlers.ts"
echo "   ├─ draftManager.ts"
echo "   ├─ DocumentRenderer.tsx"
echo "   ├─ PersonalDataSection.tsx"
echo "   └─ PersonEditModal.tsx"
echo

echo "🔗 HOOKS/ (5 fișiere):"
echo "   ┌─ useAppState.ts"
echo "   ├─ useDatabase.ts"
echo "   ├─ usePWA.ts"
echo "   ├─ useBackup.ts"
echo "   └─ useFuelRequests.ts"
echo

echo "📊 TYPES/ (2 fișiere):"
echo "   ┌─ expense.ts"
echo "   └─ fuelRequest.ts"
echo

echo "⚙️ UTILS/ (1 fișier):"
echo "   └─ appUtils.ts"
echo

echo "🎨 STYLES/ (1 fișier):"
echo "   └─ globals.css"
echo

echo "📱 PUBLIC/ (2 fișiere):"
echo "   ┌─ manifest.json"
echo "   └─ sw.js"
echo

echo "🗄️ PRISMA/ (2 fișiere):"
echo "   ┌─ schema.prisma"
echo "   └─ seed.ts"
echo

echo "📚 KIT INSTALARE MANAGER/ (12+ fișiere):"
echo "   ┌─ README - CITEȘTE PRIMUL.md"
echo "   ├─ INSTRUCȚIUNI INSTALARE.md"
echo "   ├─ UTILIZARE APLICAȚIE.md"
echo "   ├─ DEPANARE PROBLEME.md"
echo "   ├─ INSTALARE_AUTOMATĂ.bat"
echo "   ├─ INSTALARE_AUTOMATĂ.sh"
echo "   └─ ... (toate ghidurile și script-urile)"
echo

echo "🚀 PAȘI URMĂTORI:"
echo
echo "1. ✏️  Copiază fiecare fișier din Figma Make în directorul corespunzător"
echo "2. 🔍 Verifică că toate fișierele au conținut (nu sunt goale)"
echo "3. 📝 Creează .gitignore cu conținutul furnizat anterior"
echo "4. 💾 Testează aplicația cu: npm install && npm run dev"
echo "5. 🌐 Upload pe GitHub folosind ghidurile create"
echo

echo "⚠️  ATENȚIE:"
echo "  - Păstrează exact NUMELE și EXTENSIILE fișierelor"
echo "  - Nu schimba STRUCTURA de directoare"
echo "  - Verifică că fiecare fișier .tsx/.ts/.json are conținut valid"
echo "  - Testează aplicația local înainte de upload pe GitHub"
echo

echo "📞 Pentru probleme:"
echo "  - Verifică că ai copiat tot conținutul fișierului (Ctrl+A, Ctrl+C)"
echo "  - Asigură-te că extensiile sunt corecte (.tsx, .ts, .json, .css)"
echo "  - Respectă exact structura de foldere de mai sus"
echo

echo "🎉 DIRECTOARELE SUNT PREGĂTITE PENTRU DOWNLOAD!"
echo

read -p "Apasă Enter pentru a continua..."