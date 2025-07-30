# 🔧 Rezolvarea Problemei "Missing script: dev"

## ❌ **Problema Identificată**

Eroarea `npm error Missing script: "dev"` apare când:
1. Script-ul "dev" nu este definit în `package.json`
2. `package.json` este corupt sau lipsește
3. Node modules sunt incomplete sau corupte
4. Cache-ul NPM este corupt

## ✅ **Soluții Complete**

### **🚀 Soluție Rapidă (Automată)**

#### **Pentru Windows:**
```batch
# Rulează script-ul de reparare automată
fix_dev_script.bat
```

#### **Pentru Linux/macOS:**
```bash
# Rulează script-ul de reparare automată
bash fix_dev_script.sh
```

### **🔧 Soluție Manuală (Pas cu Pas)**

#### **Pas 1: Verifică package.json**
```bash
# Verifică dacă package.json există și conține script-ul dev
cat package.json | grep -A 5 "scripts"
```

**Rezultat așteptat:**
```json
"scripts": {
  "dev": "vite",
  "build": "tsc && vite build",
  "preview": "vite preview"
}
```

#### **Pas 2: Curățare completă**
```bash
# Curăță cache-ul NPM
npm cache clean --force

# Șterge dependințele vechi
rm -rf node_modules package-lock.json

# Windows:
# rmdir /s /q node_modules
# del package-lock.json
```

#### **Pas 3: Reinstalează dependințele**
```bash
# Reinstalează toate dependințele
npm install

# Dacă apare eroare, încearcă:
npm install --force
```

#### **Pas 4: Testează aplicația**
```bash
# Testează că script-ul dev funcționează
npm run dev
```

## 📋 **Verificări de Diagnostic**

### **Script de Diagnostic Complet:**

#### **Windows:**
```batch
diagnose_dev_script.bat
```

#### **Linux/macOS:**
```bash
bash diagnose_dev_script.sh
```

### **Verificări Manuale:**

#### **1. Verifică versiunile:**
```bash
# Node.js (trebuie >=18.0.0)
node --version

# NPM (trebuie >=8.0.0)
npm --version
```

#### **2. Verifică structura proiectului:**
```bash
# Verifică fișierele esențiale
ls -la package.json
ls -la vite.config.ts
ls -la index.html
ls -la src/main.tsx
ls -la App.tsx
```

#### **3. Verifică dependințele:**
```bash
# Verifică că Vite este instalat
npm ls vite

# Verifică toate dependințele
npm ls --depth=0
```

## 🔍 **Probleme Comune și Soluții**

### **Problem 1: package.json corupt**
```json
{
  "name": "evidenta-cheltuieli",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "preview": "vite preview"
  }
}
```

### **Problem 2: Vite nu este instalat**
```bash
# Installează Vite specific
npm install vite@latest --save-dev

# Sau reinstalează toate dependințele
npm install
```

### **Problem 3: Port ocupat**
```bash
# Verifică ce rulează pe port 3000
netstat -an | grep :3000

# Sau schimbă port-ul în vite.config.ts
server: {
  port: 5173,
  open: true
}
```

### **Problem 4: Permisiuni (Linux/macOS)**
```bash
# Rulează cu sudo dacă ai probleme de permisiuni
sudo npm install

# Sau repară permisiunile NPM
sudo chown -R $(whoami) ~/.npm
```

## 🛠️ **Recrearea Completă a Proiectului**

### **Dacă nimic nu funcționează:**

#### **1. Backup datele importante:**
```bash
# Salvează backup-ul aplicației
cp backup_aplicatie_completa.json ~/backup_temp.json
```

#### **2. Reinstalează complet:**
```bash
# Șterge totul
rm -rf node_modules package-lock.json

# Reinstalează
npm install

# Testează
npm run dev
```

#### **3. Verifică configurația Vite:**
```typescript
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    port: 3000,
    open: true
  }
})
```

## 📊 **Monitoring și Debugging**

### **Verifică log-urile:**
```bash
# Rulează cu verbose pentru mai multe detalii
npm run dev --verbose

# Sau cu debug
DEBUG=vite:* npm run dev
```

### **Verifică procesele active:**
```bash
# Verifică ce procese Node.js rulează
ps aux | grep node

# Oprește procesele blokante
killall node
```

## 🚨 **Probleme Avansate**

### **Dacă folosești Windows și ai probleme cu PowerShell:**
```powershell
# Setează execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Sau folosește Command Prompt în loc de PowerShell
```

### **Dacă ai firewall/antivirus issues:**
```bash
# Temporar dezactivează antivirus-ul
# Sau adaugă excepții pentru:
# - node.exe
# - npm.exe
# - directorul proiectului
```

## ✅ **Checklist Final**

După rezolvarea problemei, verifică:

- [ ] `npm run dev` pornește fără erori
- [ ] Aplicația se deschide la `http://localhost:3000`
- [ ] Hot reload funcționează
- [ ] Nu apar erori în consolă
- [ ] Toate componenetele se încarcă corect

## 📞 **Suport Suplimentar**

### **Script-uri de Ajutor:**
- `fix_dev_script.bat/.sh` - Reparare automată
- `diagnose_dev_script.bat/.sh` - Diagnostic complet
- `test_app.bat/.sh` - Testare aplicație
- `check_deps.bat/.sh` - Verificare dependințe

### **Documentație:**
- `CORECTARE_IMPORT-URI_COMPLETE.md` - Probleme cu import-uri
- `DEPENDINTE_VERIFICARE.md` - Verificare dependințe
- `INSTALARE_COMPLETA.txt` - Instalare de la zero

---

## 🎉 **Rezultat Final**

După aplicarea acestor soluții, aplicația ar trebui să pornească cu:
```bash
npm run dev
```

Și să fie disponibilă la:
```
http://localhost:3000
```

**🚀 Aplicația ta este acum pregătită pentru dezvoltare!**