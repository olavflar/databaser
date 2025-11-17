📌 Prosjektbrief (fra casen)
Et firma ønsker å få oversikt over sine prosjekter. De vil spesielt ha oversikt over:

Hvilken avdeling (nummer, navn) eier hvert prosjekt?
Hvilke prosjekter (nummer, tittel) involverer hvilke ansatte?
Hvor mye tid benytter hver ansatt (id, navn) per prosjekt?
(NB: Denne siste er litt vanskelig å plassere, men krever en ekstra tabell eller attributt.)

Modelleringsspørsmål:

Hvilke entiteter (tabeller) må vi ha, og hvilke attributter skal plasseres i dem?
Hva er relasjonene mellom entitetene?
(En til en? En til mange? Mange til mange?)


✅ Løsning – Datamodell
Alt er modellert i `case1.dbml`, klar til å limes rett inn i dbdiagram.io. Tabellen inneholder:

- Avdeling (eier både prosjekter og ansatte)
- Prosjekt (tilhører én avdeling)
- Ansatt (tilhører én avdeling)
- AnsattProsjekt (koblingstabell med tid brukt per ansatt og prosjekt)

Utdrag fra `case1.dbml`:

Table Avdeling {
  AvdNr integer [pk, increment]
  AvdNavn varchar(100) [not null]
}

Table Prosjekt {
  ProsjektNr integer [pk, increment]
  Tittel varchar(200) [not null]
  AvdNr integer [not null, ref: > Avdeling.AvdNr]
}

Table Ansatt {
  Id integer [pk, increment]
  Fornavn varchar(50) [not null]
  Etternavn varchar(50) [not null]
  Brukernavn varchar(50) [unique, not null]
  AvdNr integer [not null, ref: > Avdeling.AvdNr]
}

Table AnsattProsjekt {
  AnsattId integer [ref: > Ansatt.Id]
  ProsjektNr integer [ref: > Prosjekt.ProsjektNr]
  TidBrukt decimal(10,2) [not null, default: 0]
  indexes {
    (AnsattId, ProsjektNr) [pk]
  }
}

Relasjoner

Avdeling → Prosjekt: 1:N (én avdeling har mange prosjekter)
Avdeling → Ansatt: 1:N (én avdeling har mange ansatte)
Ansatt ↔ Prosjekt: M:N (løst med koblingstabellen AnsattProsjekt)

Kort oppsummering

- DBML-en er kvalitetssikret mot skjermdumpen fra dbdiagram.io
- Bruk `case1.dbml` direkte som modell i databasekurset (Kristiania, case 1)
- TidBrukt feltet dekker rapporteringskravet om tidsregistrering per ansatt og prosjekt
