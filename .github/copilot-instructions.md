# AI Coding Instructions for Database Projects

## Project Overview
This repository contains database design and implementation exercises, primarily focused on MySQL 8.0 project management systems. The main deliverable is a complete database solution from DBML modeling to SQL implementation with reporting queries.

## Architecture & Structure

### Core Components
- **DBML Models**: Use `case1.dbml` as the canonical data model - it's the source of truth for table structures and relationships
- **MySQL Implementation**: Located in `prosjektstyring-db/` with structured schema files and queries
- **Three-Tier Schema Pattern**: Always follow the numbered schema approach:
  1. `01-create-database.sql` - Database creation with UTF-8 setup
  2. `02-create-tables.sql` - Table definitions with proper constraints
  3. `03-sample-data.sql` - Norwegian test data for realistic scenarios

### Data Model Patterns
The project uses a classic departmental hierarchy with many-to-many employee-project relationships:
```
Avdeling (1:N) → Prosjekt
Avdeling (1:N) → Ansatt  
Ansatt (M:N via AnsattProsjekt) → Prosjekt
```

Key conventions:
- Norwegian field names: `AvdNr`, `AvdNavn`, `ProsjektNr`, `TidBrukt`
- Composite primary keys for junction tables: `(AnsattId, ProsjektNr)`
- Always include `TidBrukt decimal(10,2)` for time tracking in junction tables

## Development Workflows

### Database Setup Sequence
```sql
-- Always run in this exact order:
mysql -u root -p
source schema/01-create-database.sql
source schema/02-create-tables.sql  
source schema/03-sample-data.sql
```

### Query Development
- Organize queries by business requirement in `queries/` directory
- Use descriptive filenames: `krav1-avdeling-per-prosjekt.sql`
- Include `bonus-rapporter.sql` for additional analytical queries

## Project-Specific Conventions

### MySQL Configuration Standards
- **Character Set**: Always use `utf8mb4` with `utf8mb4_unicode_ci` collation
- **Storage Engine**: Set `default_storage_engine = INNODB`
- **Primary Keys**: Enable `sql_require_primary_key = 1` for data integrity
- **Database Naming**: Use Norwegian terms consistently (`prosjektstyring`, not `project_management`)

### DBML Integration
- Keep `case1.dbml` synchronized with actual SQL schema
- Use DBML for initial design, then implement in `prosjektstyring-db/`
- Include meaningful table notes in DBML: `Note: 'Registrerer hvilke ansatte som jobber på prosjekter'`

### File Naming & Organization
- Schema files: Numbered prefixes for execution order
- Query files: `krav[N]-[description].sql` pattern for requirements
- Use Norwegian descriptions but English technical terms

## Testing & Validation
- Sample data should use realistic Norwegian names and scenarios
- Test all foreign key relationships with actual data
- Verify queries return meaningful results with the provided test dataset

## Common Patterns
When adding new features:
1. Update DBML model first in `case1.dbml`
2. Implement SQL changes in appropriate numbered schema file
3. Add corresponding test data with Norwegian examples
4. Create specific query files for new reporting requirements

## External Dependencies
- **MySQL 8.0**: Required for proper UTF-8 support and modern SQL features
- **dbdiagram.io**: For visualizing DBML models - paste `case1.dbml` directly