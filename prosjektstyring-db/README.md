# 📊 Prosjektstyring DB

Repoet bygger en MySQL 8.0-database for prosjektstyring slik casen fra Kristiania beskriver. Alt er klart for import i en lokal MySQL-instans eller et sky-miljø, og alle skript bruker UTF-8 (utf8mb4) og InnoDB med eksplisitte primær-/fremmednøkler.

## 📦 Struktur
- `schema/01-create-database.sql` – oppretter databasen `prosjektstyring` med riktig charset, collate og InnoDB som standard.
- `schema/02-create-tables.sql` – definerer tabellene Avdeling, Prosjekt, Ansatt og AnsattProsjekt med PK/FK, indeks og ON DELETE/UPDATE-regler.
- `schema/03-sample-data.sql` – legger inn norske eksempeldata for avdelinger, prosjekter, ansatte og tidsbruk.
- `queries/` – ferdige rapportspørringer for kravene samt bonusrapporter.
- `diagrams/database-schema.dbml` – DBML-versjon av ER-diagrammet (klar for dbdiagram.io).
- `.gitignore` – utelukker midlertidige filer, eksporterte dumps, redigeringsmetadata m.m.

## 🚀 Kom i gang
1. Koble til MySQL 8.0-serveren din (`mysql -u root -p`).
2. Kjør filene i `schema/` i numerisk rekkefølge: `source schema/01-create-database.sql`, osv.
3. Kjør ønskede spørringer fra `queries/` for å verifisere kravene.

## 🧪 Testdata
Eksempeldataene i `schema/03-sample-data.sql` bruker norske navn, prosjekter og realistiske timer, slik at rapportene gir meningsfulle tall fra dag én.

## 📝 Videre arbeid
- Tilpass `SET SESSION`-instruksjoner i `01-create-database.sql` dersom miljøet ditt krever andre default-verdier.
- Utvid `queries/bonus-rapporter.sql` med flere analyser etter behov.
- Eksporter ER-diagrammet fra `diagrams/database-schema.dbml` til PNG/SVG for dokumentasjon.
