# 💰 Evidența Cheltuielilor

> Aplicație web modernă pentru gestionarea bugetului personal cu rapoarte avansate și bază de date locală

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/kisslevente2003/evidenta-cheltuieli)
[![Node.js](https://img.shields.io/badge/node-%3E%3D18.0.0-green.svg)](https://nodejs.org/)
[![TypeScript](https://img.shields.io/badge/typescript-%5E5.2.2-blue.svg)](https://www.typescriptlang.org/)
[![React](https://img.shields.io/badge/react-18.2.0-blue.svg)](https://reactjs.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

## ✨ Caracteristici Principale

### 🎯 **Gestionare Completă a Cheltuielilor**
- **Rate și Împrumuturi**: CEC mașină, Banca Transilvania (1-6 rate), Casco (4 rate)
- **Utilități**: Gaze, Curent, Apă, Gunoi, Asociație cu citiri contoare
- **Servicii**: Vodafone, Digi și alte abonamente
- **Streaming**: Netflix, Prime Video, Sky Showtime, Spotify
- **Venituri**: Pensii, indemnizații și alte intrări

### 📊 **Rapoarte Avansate**
- **Dashboard KPI**: Total cheltuieli, venituri, bilanț, rata economii
- **Grafice Interactive**: Line charts, pie charts, bar charts, area charts
- **Analiză Temporală**: Comparații lunare, anuale, tendințe
- **Export Date**: CSV pentru Excel, rapoarte formatate
- **Insights Inteligente**: Recomandări de optimizare

### 💾 **Bază de Date Locală**
- **SQLite + Prisma**: Persistența datelor fără server extern
- **Backup Automat**: Datele sunt salvate local, sigur
- **Migrări**: Actualizări automate ale structurii

### 🎨 **Interface Modernă**
- **Design Responsive**: Funcționează pe desktop, tabletă, mobil
- **Dark/Light Mode**: Suport pentru preferințele utilizatorului  
- **Animații Fluide**: Tranziții plăcute cu Motion
- **Componente Premium**: Shadcn/UI + Radix UI

## 🚀 Instalare Rapidă

### Metodă Automată (Recomandată)

```bash
# 1. Clonează repository-ul
git clone https://github.com/kisslevente2003/evidenta-cheltuieli.git
cd evidenta-cheltuieli

# 2. Windows
setup.bat

# 2. Linux/macOS  
chmod +x setup.sh && ./setup.sh

# 3. Pornește aplicația
npm run dev
```

### Metodă Manuală

```bash
# 1. Instalează dependințele
npm install

# 2. Configurează baza de date
npm run db:generate
npm run db:push
npm run db:seed

# 3. Pornește aplicația
npm run dev
```

Aplicația va fi disponibilă la: **http://localhost:3000**

## 📋 Cerințe de Sistem

| Componenta | Versiune Minimă | Recomandată |
|-----------|------------------|-------------|
| **Node.js** | 18.0.0 | 20.x LTS |
| **npm** | 8.0.0 | 10.x |
| **RAM** | 4 GB | 8 GB |
| **Spațiu Disk** | 500 MB | 1 GB |
| **Browser** | Chrome 90+ | Chrome/Edge/Firefox Latest |

### Sisteme de Operare Suportate:
- ✅ Windows 10/11
- ✅ macOS 10.15+
- ✅ Linux (Ubuntu 18.04+, Debian 10+)

## 🛠️ Stack Tehnologic

### Frontend
- **⚡ Vite**: Build tool rapid și modern
- **⚛️ React 18**: UI library cu hooks și Suspense
- **🎨 TypeScript**: Type safety și IntelliSense
- **💅 Tailwind CSS**: Utility-first styling
- **🧩 Shadcn/UI**: Componente high-quality
- **📊 Recharts**: Grafice interactive
- **🎭 Motion**: Animații fluide

### Backend & Database
- **💾 SQLite**: Bază de date locală, fără server
- **🔄 Prisma**: ORM type-safe
- **📝 TypeScript**: Validare tipuri la compile-time

### Development
- **🔨 ESLint + Prettier**: Code quality
- **🧪 Vitest**: Unit testing (în curând)
- **🚀 GitHub Actions**: CI/CD (în curând)

## 📖 Documentație

### 📁 Structura Proiectului

```
evidenta-cheltuieli/
├── 📂 prisma/              # Baza de date
│   ├── schema.prisma       # Schema Prisma
│   ├── seed.ts             # Date inițiale
│   └── expenses.db         # SQLite database
├── 📂 components/          # Componente React
│   ├── ui/                 # Shadcn/UI components
│   ├── MonthExpenses.tsx   # Gestionare lună
│   ├── ReportsView.tsx     # Rapoarte
│   └── ...
├── 📂 src/
│   ├── lib/                # Utilities
│   │   └── database.ts     # Database manager
│   └── main.tsx            # Entry point
├── 📂 styles/
│   └── globals.css         # Tailwind + custom CSS
├── 📂 types/
│   └── expense.ts          # TypeScript definitions
├── package.json            # Dependencies
├── vite.config.ts          # Vite configuration
└── README.md               # Această documentație
```

### 🎛️ Comenzi Disponibile

```bash
# Dezvoltare
npm run dev              # Pornește dev server
npm run build            # Build pentru producție
npm run preview          # Preview build local

# Baza de date
npm run db:studio        # Prisma Studio (GUI)
npm run db:generate      # Generează client Prisma
npm run db:push          # Aplică schema în DB
npm run db:seed          # Populează cu date test

# Utilități
npm run start            # Setup complet + dev
npm install              # Reinstalează dependințele
```

## 💡 Ghid de Utilizare

### 1️⃣ **Selectarea Perioadei**
- **Pagina Principală**: Calendar cu ani 2000-2050
- **Vizualizare An**: Toate lunile dintr-un an
- **Vizualizare Lună**: Cheltuieli detaliate pe lună

### 2️⃣ **Adăugarea Cheltuielilor**

#### 🏦 Rate și Împrumuturi:
- **CEC Mașină**: Rată fixă lunară
- **Banca Transilvania**: 1, 4 sau 6 rate cu date și sume
- **Casco**: 4 rate (Rata I-IV) cu date și sume personalizabile

#### ⚡ Utilități:
- **Contoare** (Gaze, Curent, Apă): Citiri anterioare/curente + preț/unitate
- **Fixe** (Gunoi, Asociație): Sume fixe

#### 📱 Servicii & Streaming:
- Sume fixe lunare pentru abonamente

#### 💰 Venituri:
- Pensii, indemnizații, salarii

### 3️⃣ **Rapoarte și Analize**
- **Context-aware**: Rapoarte pentru lună, an sau perioada generală
- **KPI Dashboard**: Metrici cheie în timp real
- **Grafice Multiple**: Line, bar, pie, area charts
- **Export**: CSV pentru Excel
- **Insights**: Recomandări automate de optimizare

### 4️⃣ **Servicii Custom**
- **Adăugare**: Servicii noi în orice categorie
- **Ștergere**: Cu confirmare dublă pentru siguranță
- **Replicare**: Serviciile se adaugă automat în lunile viitoare

## 🔧 Configurare Avansată

### Environment Variables (.env)

```env
# Database
DATABASE_URL="file:./prisma/expenses.db"

# App Configuration
VITE_APP_NAME="Evidența Cheltuielilor"
VITE_APP_VERSION="1.0.0"

# Development
VITE_DEV_PORT=3000
VITE_DEV_HOST=localhost

# Features
VITE_ENABLE_PWA=false
VITE_ENABLE_ANALYTICS=false
```

### Customizare Categorii

Poți adăuga categorii noi în `types/expense.ts`:

```typescript
export type ExpenseCategory = 
  | 'rate' 
  | 'utilitati' 
  | 'servicii' 
  | 'streaming' 
  | 'venituri'
  | 'noua_categorie'  // Adaugă aici
```

## 🐛 Depanare Probleme

### ❌ Probleme Comune

<details>
<summary><strong>"command not found: node"</strong></summary>

**Cauza**: Node.js nu este instalat sau nu este în PATH.

**Soluție**:
```bash
# Verifică instalarea
node --version
npm --version

# Reinstalează Node.js de la nodejs.org
```
</details>

<details>
<summary><strong>"Permission denied" pe Linux/macOS</strong></summary>

**Cauza**: Permisiuni insuficiente.

**Soluție**:
```bash
# Opțiunea 1: folosește nvm (recomandat)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install node

# Opțiunea 2: schimbă ownership pentru npm
sudo chown -R $(whoami) ~/.npm
```
</details>

<details>
<summary><strong>Port 3000 ocupat</strong></summary>

**Soluție**:
```bash
# Folosește alt port
npm run dev -- --port 3001

# Sau oprește procesul pe port 3000
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Linux/macOS
lsof -ti:3000 | xargs kill -9
```
</details>

<details>
<summary><strong>Baza de date coruptă</strong></summary>

**Soluție**:
```bash
# Reset complet bază de date
npm run db:push --force-reset
npm run db:seed
```
</details>

## 📈 Roadmap Viitor

### 🔜 Versiunea 1.1 (Q2 2025)
- [ ] **PWA Support**: Instalare ca aplicație nativă
- [ ] **Dark Mode Toggle**: Switch manual pentru teme
- [ ] **Backup/Restore**: Export/import complete database
- [ ] **Multi-currency**: Suport pentru EUR, USD
- [ ] **Recurring Expenses**: Cheltuieli recurente automate

### 🔮 Versiunea 1.2 (Q3 2025)
- [ ] **Mobile App**: React Native pentru iOS/Android
- [ ] **Cloud Sync**: Sincronizare opțională în cloud
- [ ] **AI Insights**: Predicții și recomandări AI
- [ ] **Banking Integration**: Import automat din bănci
- [ ] **Team Sharing**: Buget familiar colaborativ

### 🚀 Versiunea 2.0 (Q4 2025)
- [ ] **Multi-tenant**: Suport pentru organizații
- [ ] **Advanced Analytics**: Machine learning pentru patterns
- [ ] **API REST**: Integrări cu alte aplicații
- [ ] **Plugin System**: Extensii dezvoltate de comunitate

## 🤝 Contribuții

Contribuțiile sunt binevenite! Pentru a contribui:

1. **Fork** repository-ul
2. **Creează** branch pentru feature: `git checkout -b feature/nume-feature`
3. **Commit** schimbările: `git commit -m 'Add some feature'`
4. **Push** pe branch: `git push origin feature/nume-feature`
5. **Deschide** Pull Request

### 📝 Guidelines pentru Contribuții

- **Code Style**: Folosește Prettier și ESLint
- **Commits**: Conventional commits format
- **Testing**: Adaugă teste pentru funcționalități noi
- **Documentation**: Actualizează README și comentariile

## 📄 Licență

Acest proiect este licențiat sub **MIT License**.

```
MIT License

Copyright (c) 2025 kisslevente2003

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software...
```

Vezi [LICENSE](LICENSE) pentru textul complet.

## 👨‍💻 Autor

**Levente Kiss** (kisslevente2003)
- GitHub: [@kisslevente2003](https://github.com/kisslevente2003)
- Repository: [evidenta-cheltuieli](https://github.com/kisslevente2003/evidenta-cheltuieli)

## 🙏 Mulțumiri

Mulțumiri speciale pentru:

- **Shadcn/UI** pentru componentele exceptionale
- **Prisma Team** pentru ORM-ul fantastic
- **Vercel** pentru Vite și ecosistemul React
- **Tailwind Labs** pentru framework-ul CSS
- **Recharts Team** pentru librăria de grafice

---

<div align="center">

**⭐ Dacă îți place proiectul, oferă-i un star pe GitHub! ⭐**

[📚 Documentație](README.md) · [🐛 Raportează Bug](https://github.com/kisslevente2003/evidenta-cheltuieli/issues) · [💡 Sugerează Feature](https://github.com/kisslevente2003/evidenta-cheltuieli/issues)

</div>