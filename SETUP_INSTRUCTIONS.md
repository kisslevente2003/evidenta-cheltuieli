# Instrucțiuni Complete de Setup Local

## 📋 Pașii pentru instalare și rulare

### Pasul 1: Pregătirea sistemului
Asigură-te că ai instalat:
- **Node.js 18 sau mai nou**: [Descarcă de aici](https://nodejs.org/)
- **npm** (vine cu Node.js) sau **yarn**

### Pasul 2: Structura fișierelor
Creează un director pentru proiect și organizează fișierele astfel:

```
evidenta-cheltuieli/
├── package.json
├── vite.config.ts
├── tsconfig.json
├── tsconfig.app.json
├── tsconfig.node.json
├── index.html
├── README.md
├── .gitignore
└── src/
    ├── main.tsx
    ├── App.tsx
    ├── components/
    │   ├── CompanyLogo.tsx
    │   ├── ExpenseCard.tsx
    │   ├── FixedExpenseModal.tsx
    │   ├── MonthCard.tsx
    │   ├── MonthExpenses.tsx
    │   ├── ReportsView.tsx
    │   ├── UtilityExpenseModal.tsx
    │   ├── YearMonthsView.tsx
    │   ├── YearSelector.tsx
    │   ├── figma/
    │   │   └── ImageWithFallback.tsx
    │   └── ui/
    │       ├── (toate componentele shadcn)
    │       └── utils.ts
    ├── types/
    │   └── expense.ts
    └── styles/
        └── globals.css
```

### Pasul 3: Instalarea dependințelor
```bash
cd evidenta-cheltuieli
npm install
```

### Pasul 4: Rularea aplicației
```bash
npm run dev
```

### Pasul 5: Accesarea aplicației
Deschide browserul la: `http://localhost:5173`

## 🔧 Comenzi disponibile

- `npm run dev` - Pornește serverul de dezvoltare
- `npm run build` - Compilează pentru producție
- `npm run preview` - Previzualizează versiunea compilată
- `npm run lint` - Verifică codul pentru erori

## 📝 Note importante

1. **Persistența datelor**: Toate datele sunt salvate automat în localStorage
2. **Compatibilitate**: Aplicația funcționează în toate browserele moderne
3. **Responsive**: Optimizată pentru desktop și mobile
4. **Performance**: Datele sunt generate la cerere pentru a optimiza memoria

## 🚨 Rezolvarea problemelor comune

### Erori de instalare
```bash
# Șterge node_modules și reinstalează
rm -rf node_modules package-lock.json
npm install
```

### Port ocupat
Dacă portul 5173 este ocupat, Vite va alege automat alt port disponibil.

### Probleme cu TypeScript
Verifică că toate fișierele `.tsx` și `.ts` sunt în directorul `src/`.

## 📱 Utilizarea aplicației

1. **Navigare**: Selectează anul → luna → cheltuială
2. **Completare**: Introdu datele în modalurile respective
3. **Rapoarte**: Accesează din butonul "Vezi Rapoarte"
4. **Backup**: Datele sunt salvate automat în browser

## 🎯 Funcționalități cheie

- ✅ Gestionarea cheltuielilor pe categorii
- ✅ Calculator automat pentru utilități
- ✅ Rapoarte cu grafice interactive
- ✅ Comparații luna precedentă
- ✅ Export vizual al datelor
- ✅ Interface multilingvă (română)