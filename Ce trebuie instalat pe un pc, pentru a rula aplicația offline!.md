# 📱 Ghid Complet de Instalare - Aplicația "Evidența Cheltuielilor" Offline

## 🎯 Destinat: Persoane fără cunoștințe de programare

Acest ghid te va ajuta să instalezi și să rulezi aplicația **"Evidența Cheltuielilor"** pe propriul tău computer, complet offline, fără să ai nevoie de internet după instalare.

---

## 📋 Ce Vei Obține După Instalare

✅ **Aplicație completă offline** - funcționează fără internet  
✅ **Toate datele salvate local** - pe propriul tău computer  
✅ **Interface modernă 3D** - cu animații și efecte vizuale  
✅ **Backup automat** - datele se păstrează permanent  
✅ **Instalare ca aplicație nativă** - se poate instala ca orice alt program  
✅ **Actualizări automate** - aplicația se poate actualiza singură  

---

## 🖥️ Cerințe de Sistem

### **Computer:**
- **Windows 10/11** (recomandat) sau **Mac** sau **Linux**
- **4 GB RAM** minim (8 GB recomandat)
- **2 GB spațiu liber** pe disk
- **Conexiune internet** (doar pentru instalare inițială)

### **Browser:**
- **Google Chrome** (recomandat)
- **Microsoft Edge** 
- **Firefox**
- **Safari** (pe Mac)

---

## 🛠️ Pasul 1: Instalarea Software-ului Necesar

### 📦 **1.1 Instalarea Node.js** (Motorul aplicației)

**Ce este Node.js?** Este programul care face ca aplicația să funcționeze pe computerul tău.

**📥 Descărcare și Instalare:**

1. **Mergi pe site-ul oficial:** https://nodejs.org
2. **Descarcă versiunea LTS** (Long Term Support) - butonul verde cu text precum "18.19.0 LTS"
3. **Rulează fișierul descărcat** (ex: `node-v18.19.0-x64.msi` pe Windows)
4. **Urmează pașii din installer:**
   - Apasă "Next" → "Next" → "Next"
   - **IMPORTANT:** Bifează opțiunea "Automatically install the necessary tools"
   - Apasă "Install" și așteaptă finalizarea

**✅ Verificare instalare:**
1. Apasă `Windows + R`
2. Scrie `cmd` și apasă Enter
3. În fereastra neagră care se deschide, scrie: `node --version`
4. Ar trebui să vezi ceva ca: `v18.19.0`
5. Scrie și: `npm --version`
6. Ar trebui să vezi ceva ca: `9.2.0`

### 💻 **1.2 Instalarea unui Editor de Cod** (Opțional dar recomandat)

**📥 Visual Studio Code (GRATUIT):**
1. Mergi pe: https://code.visualstudio.com
2. Descarcă pentru sistemul tău (Windows/Mac/Linux)
3. Instalează normal ca orice program

---

## 📂 Pasul 2: Copierea Aplicației din Figma

### **2.1 Descărcarea Codului Sursă**

**Opțiunea A: Descărcare directă (Cea mai ușoară)**
1. **Apasă pe butonul "Export"** din Figma Make
2. **Selectează "Download ZIP"**
3. **Salvează fișierul** într-un folder ușor de găsit (ex: Desktop)
4. **Extrage arhiva ZIP** (click dreapta → "Extract All")

**Opțiunea B: Din GitHub (Dacă ai link-ul)**
1. Mergi pe pagina GitHub a proiectului
2. Apasă butonul verde **"Code"**
3. Selectează **"Download ZIP"**
4. Salvează și extrage ca mai sus

### **2.2 Organizarea Fișierelor**

**📁 Creează o structură clară:**
```
📁 C:\MeleAplicatii\
    📁 EvidintaCheltuieli\
        📄 App.tsx
        📄 package.json
        📁 components\
        📁 src\
        📁 styles\
        ... (toate fișierele)
```

**💡 Sfat:** Evită caractere speciale în numele folderelor (ă, î, ț, etc.)

---

## ⚙️ Pasul 3: Instalarea și Configurarea

### **3.1 Deschiderea Terminalului în Folderul Aplicației**

**Pe Windows:**
1. Deschide **File Explorer**
2. Navighează la folderul cu aplicația
3. În bara de adrese, scrie `cmd` și apasă Enter
4. Se va deschide terminalul în folderul corect

**Pe Mac:**
1. Deschide **Finder**
2. Navighează la folder
3. Click dreapta și selectează "New Terminal at Folder"

### **3.2 Instalarea Dependențelor**

**În terminal, scrie exact:**
```bash
npm install
```

**⏱️ Acest pas durează 2-5 minute** și va descărca toate librăriile necesare.

**✅ La final ar trebui să vezi:**
```
added 1337 packages in 3m
```

### **3.3 Verificarea Instalării**

**Scrie în terminal:**
```bash
npm run dev
```

**🎉 Dacă totul e OK, vei vedea:**
```
  VITE v4.x.x  ready in 500ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
```

---

## 🚀 Pasul 4: Rularea Aplicației

### **4.1 Pornirea Aplicației**

1. **În terminal, asigură-te că ești în folderul aplicației**
2. **Rulează comanda:**
   ```bash
   npm run dev
   ```
3. **Deschide browserul** și mergi la: `http://localhost:5173`

### **4.2 Prima Utilizare**

**🎊 Felicitări! Aplicația rulează!**

**La prima deschidere vei vedea:**
- Ecran de încărcare cu logo
- Calendar cu anii 2000-2050
- Opțiuni pentru configurare servicii

**📱 Pentru a instala ca aplicație nativă:**
1. În browser, caută iconița de "instalare" (⬇️) în bara de adrese
2. Apasă "Install" sau "Instalează"
3. Aplicația se va instala ca un program normal

---

## 🔧 Pasul 5: Configurare Avansată (Opțional)

### **5.1 Configurarea pentru Producție**

**Pentru performanță maximă:**
```bash
npm run build
npm run preview
```

### **5.2 Configurarea Service Worker-ului**

**Fișierul `public/sw.js` este deja configurat pentru:**
- ✅ Cache-uire offline
- ✅ Actualizări automate
- ✅ Notificări push
- ✅ Backup automat

### **5.3 Configurarea PWA**

**Fișierul `public/manifest.json` conține:**
```json
{
  "name": "Evidența Cheltuielilor",
  "short_name": "Cheltuieli",
  "theme_color": "#3b82f6",
  "background_color": "#ffffff",
  "display": "standalone",
  "orientation": "portrait",
  "scope": "/",
  "start_url": "/"
}
```

---

## 🆘 Depanarea Problemelor Comune

### **❌ Eroare: "node is not recognized"**
**Soluție:**
1. Reinstalează Node.js
2. Bifează opțiunea "Add to PATH"
3. Restartează computerul

### **❌ Eroare: "npm install failed"**
**Soluție:**
1. Șterge folderul `node_modules` (dacă există)
2. Șterge fișierul `package-lock.json` (dacă există)
3. Rulează din nou `npm install`

### **❌ Eroare: "Port 5173 is already in use"**
**Soluție:**
```bash
npm run dev -- --port 3000
```

### **❌ Aplicația nu se încarcă în browser**
**Verificări:**
1. Terminal-ul este deschis și rulează?
2. Adresa este exactă: `http://localhost:5173`?
3. Firewall-ul blochează aplicația?

### **❌ Datele se pierd la restart**
**Soluție:**
- Aplicația folosește localStorage - datele NU se pierd
- Verifică dacă browserul permite cookies și local storage
- Nu folosi "Private/Incognito Mode"

---

## 📱 Pasul 6: Instalarea ca Aplicație PWA

### **6.1 Instalarea Automată**

**În Chrome/Edge:**
1. Mergi la aplicație (`http://localhost:5173`)
2. Caută iconița ⬇️ în bara de adrese
3. Apasă și confirma instalarea

### **6.2 Instalarea Manuală**

**În orice browser:**
1. Meniu browser → "Install App" sau "Add to Desktop"
2. Urmează instrucțiunile
3. Aplicația apare în Start Menu/Applications

### **6.3 Beneficii PWA**

✅ **Funcționează offline complet**  
✅ **Se actualizează automat**  
✅ **Notificări pentru scadențe**  
✅ **Backup automat în cloud** (opțional)  
✅ **Sincronizare între dispozitive**  

---

## 💾 Pasul 7: Backup și Restaurare Date

### **7.1 Backup Manual**

**Datele se păstrează în:**
- **Windows:** `%LocalAppData%\Google\Chrome\User Data\Default\Local Storage`
- **Mac:** `~/Library/Application Support/Google/Chrome/Default/Local Storage`

**Pentru backup:**
1. În aplicație → Setări → "Export Data"
2. Salvează fișierul JSON rezultat

### **7.2 Restaurare Date**

1. În aplicație → Setări → "Import Data"
2. Selectează fișierul JSON de backup

---

## 🔄 Pasul 8: Actualizări

### **8.1 Actualizare Automată**

**Aplicația se actualizează automat când:**
- Sunt disponibile funcții noi
- Se corectează erori
- Se îmbunătățește securitatea

### **8.2 Actualizare Manuală**

**Pentru versiuni noi majore:**
1. Descarcă noua versiune
2. Copiază peste fișierele vechi
3. Rulează `npm install` din nou
4. Restart aplicația

---

## 🎯 Ghid de Utilizare Rapidă

### **📱 Pornirea Zilnică**

1. **Deschide terminal** în folderul aplicației
2. **Rulează:** `npm run dev`
3. **Deschide browser:** `http://localhost:5173`

### **🔐 Pentru Siguranță Maximă**

- ✅ Fă backup săptămânal
- ✅ Păstrează aplicația actualizată
- ✅ Nu șterge folderul `node_modules`
- ✅ Nu modifica fișierele dacă nu știi ce faci

### **⚡ Pentru Performanță**

- ✅ Închide alte aplicații grele
- ✅ Folosește Chrome pentru cea mai bună experiență
- ✅ Instalează ca PWA pentru viteză maximă

---

## 📞 Suport și Ajutor

### **🆘 Dacă Ai Probleme:**

1. **Verifică din nou pașii** - 90% din probleme sunt din sărituri de pași
2. **Restartează computerul** - rezolvă multe probleme
3. **Reinstalează Node.js** - dacă nimic nu funcționează
4. **Contactează dezvoltatorul** - cu detalii exacte despre eroare

### **📋 Informații pentru Suport:**

**Când ceri ajutor, include:**
- Sistemul de operare (Windows 10/11, Mac, etc.)
- Versiunea Node.js (`node --version`)
- Browserul folosit
- Textul exact al erorii
- Pașii făcuți înainte de eroare

---

## 🎊 Felicitări! 

**Ai instalat cu succes aplicația "Evidența Cheltuielilor"!**

**Acum poți:**
- ✅ Gestiona toate cheltuielile offline
- ✅ Urmări ratele și utilitățile 
- ✅ Genera rapoarte detaliate
- ✅ Primi notificări pentru scadențe
- ✅ Face backup automat

**🚀 Bucură-te de organizarea perfectă a finanțelor tale!**

---

## 📚 Resurse Suplimentare

**🔗 Link-uri Utile:**
- **Node.js:** https://nodejs.org
- **Visual Studio Code:** https://code.visualstudio.com
- **Chrome Browser:** https://www.google.com/chrome

**📖 Documentație:**
- **NPM Commands:** https://docs.npmjs.com/cli-commands
- **PWA Guide:** https://web.dev/progressive-web-apps

**🎥 Video Tutoriale Recomandate:**
- "How to install Node.js" pe YouTube
- "What is a PWA" pe YouTube
- "VS Code for beginners" pe YouTube

---

**📝 Notă:** Acest ghid a fost creat pentru versiunea curentă a aplicației. Pentru actualizări sau probleme specifice, consultă documentația oficială sau contactează dezvoltatorul.

**💡 Sfat Final:** Păstrează acest fișier într-un loc sigur pentru referință viitoare!