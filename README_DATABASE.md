# Ghid Baza de Date SQLite

## 📊 Despre SQLite

SQLite este o bază de date relațională ușoară, perfectă pentru aplicații locale. Nu necesită server separat și stochează toate datele într-un singur fișier.

## 🗃️ Structura Bazei de Date

### Tabelul `expenses`
Stochează toate cheltuielile cu următoarele câmpuri:

```sql
- id: String (CUID) - Identificator unic
- name: String - Numele cheltuielii
- type: String - Tipul: 'fixed', 'utility', 'income'
- month: String - Luna în format YYYY-MM
- completed: Boolean - Dacă este completată
- logo: String? - Codul logo-ului companiei
- unit: String? - Unitatea pentru utilități (kWh, m³)

-- Pentru cheltuieli fixe
- amount: Float? - Suma
- paymentDate: DateTime? - Data plății

-- Pentru utilități
- oldReading: Float? - Citirea veche
- oldReadingDate: DateTime? - Data citirii vechi
- newReading: Float? - Citirea nouă
- newReadingDate: DateTime? - Data citirii noi
- totalPrice: Float? - Prețul total
- consumption: Float? - Consumul calculat
- billingDays: Int? - Zilele de facturare

- createdAt: DateTime - Data creării
- updatedAt: DateTime - Data ultimei actualizări
```

### Tabelul `settings`
Stochează setările aplicației:

```sql
- id: String (CUID) - Identificator unic
- key: String - Cheia setării (unică)
- value: String - Valoarea setării
- createdAt: DateTime - Data creării
- updatedAt: DateTime - Data ultimei actualizări
```

## 🔧 Operațiuni cu Baza de Date

### Comenzi Prisma

```bash
# Generează clientul Prisma
npx prisma generate

# Sincronizează schema cu baza de date
npx prisma db push

# Populează cu date inițiale
npx prisma db seed

# Deschide interfața vizuală
npx prisma studio
```

### Backup și Restaurare

```bash
# Backup
cp prisma/database.db backup_$(date +%Y%m%d).db

# Restaurare
cp backup_YYYYMMDD.db prisma/database.db
```

## 📱 Utilizarea în Aplicație

### DatabaseService
Clasa principală pentru operațiunile cu baza de date:

```typescript
// Obține cheltuieli pentru o lună
const expenses = await DatabaseService.getExpensesForMonth('2025-01');

// Actualizează o cheltuială
await DatabaseService.updateExpense(id, updateData);

// Creează cheltuieli pentru un an nou
await DatabaseService.createExpensesForYear(2025);

// Obține statistici
const stats = await DatabaseService.getMonthStats('2025-01');
```

## 🔍 Interogări Comune

### Găsește toate cheltuielile incomplete dintr-o lună
```sql
SELECT * FROM expenses 
WHERE month = '2025-01' AND completed = false;
```

### Calculează totalul cheltuielilor pentru un an
```sql
SELECT type, SUM(amount) as total 
FROM expenses 
WHERE month LIKE '2025%' AND completed = true 
GROUP BY type;
```

### Găsește utilități cu consum mare
```sql
SELECT name, consumption, totalPrice 
FROM expenses 
WHERE type = 'utility' AND consumption > 100;
```

## 🛠️ Dezvoltare și Debug

### Prisma Studio
Interfață web pentru administrarea vizuală:
```bash
npx prisma studio
```
Disponibil la: http://localhost:5555

### Logs și Debugging
Pentru debugging, activează logging-ul Prisma:
```typescript
const prisma = new PrismaClient({
  log: ['query', 'info', 'warn', 'error'],
});
```

## 🚨 Rezolvarea Problemelor

### Eroare "Database does not exist"
```bash
npx prisma db push
```

### Eroare "Prisma Client not generated"
```bash
npx prisma generate
```

### Corupție bază de date
```bash
rm prisma/database.db
npx prisma db push
npx prisma db seed
```

### Migrări schema
Când modifici schema:
```bash
npx prisma db push
# sau pentru producție:
npx prisma migrate dev
```

## 📈 Performanță

### Indexuri Automate
SQLite creează automat indexuri pentru:
- Primary keys (id)
- Unique constraints (settings.key)

### Optimizări
Pentru interogări frecvente, consideră:
- Index pe `month` pentru căutări rapide
- Index compus pe `month + type`
- Limitarea rezultatelor cu `LIMIT`

## 🔒 Securitate

### Date Locale
- Toate datele sunt stocate local
- Nu se transmit pe internet
- Acces doar prin aplicația ta

### Backup Recomandat
- Backup zilnic automat
- Testează restaurarea periodic
- Păstrează backup-uri multiple

## 📚 Resurse Adiționale

- [Documentația Prisma](https://www.prisma.io/docs/)
- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [Prisma Studio Guide](https://www.prisma.io/docs/concepts/components/prisma-studio)