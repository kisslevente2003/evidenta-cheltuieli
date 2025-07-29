# Changelog - Evidența Cheltuielilor

## v2.0.0 - Bază de Date SQLite (27 Iulie 2025)

### 🎉 Funcționalități Noi
- **Bază de date SQLite locală** - înlocuiește localStorage pentru persistența datelor
- **Serviciu de bază de date** - gestionarea centralizată a operațiunilor cu baza de date
- **Setup automat** - scripturi pentru configurarea rapidă a aplicației
- **Interfață de încărcare** - feedback vizual în timpul conectării la baza de date
- **Gestionarea erorilor** - mesaje clare pentru problemele de baza de date

### 🔧 Îmbunătățiri Tehnice
- Migrare de la localStorage la SQLite cu Prisma ORM
- Optimizări de performanță pentru încărcarea datelor
- Validarea și conversia tipurilor de date
- Backup și restaurare simplificată prin fișiere

### 📊 Schema Bazei de Date
- Tabelul `expenses` cu toate câmpurile necesare
- Tabelul `settings` pentru configurările aplicației
- Indexare automată pentru căutări rapide
- Suport pentru toate tipurile de cheltuieli (fixe, utilități, venituri)

### 🛠️ Instrumente Dezvoltare
- Prisma Studio pentru administrarea vizuală a datelor
- Comenzi npm pentru gestionarea bazei de date
- Seeding automat cu date de test
- Scripturi de setup pentru Windows și Linux/Mac

### 📱 Funcționalități Existente Păstrate
- ✅ Gestionarea cheltuielilor pe categorii
- ✅ Calendar interactiv (2000-2050)
- ✅ Rapoarte cu grafice interactive
- ✅ Calculator pentru utilități
- ✅ Logo-uri pentru companii
- ✅ Interface responsive
- ✅ Comparații luna precedentă

---

## v1.0.0 - Versiunea Inițială

### 🎯 Funcționalități de Bază
- Gestionarea cheltuielilor lunare
- Calendar pentru navigarea prin ani și luni
- Modaluri pentru cheltuieli fixe și utilități
- Rapoarte cu grafice pie și comparative
- Logo-uri pentru toate serviciile
- Salvare în localStorage
- Interface responsive

### 📋 Categorii Implementate
- Rate și împrumuturi (CEC, BT, Casco)
- Utilități (Gaze, Curent, Apă, Asociație, Gunoi)
- Servicii (Vodafone, Digi)
- Streaming (Netflix, Prime Video, Sky Showtime, Spotify)
- Venituri (Indemnizație handicap, Pensie)

### 🎨 Design și UI
- Tailwind CSS v4 pentru styling
- Componente shadcn/ui
- Teme light/dark
- Iconuri Lucide React
- Layout responsive pentru mobile și desktop