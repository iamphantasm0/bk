# CLAUDE.md - Configuration for Claude Coding Assistants

## Database Commands
- Connect to database: `psql -U postgres -d prices`
- Run SQL file: `psql -U postgres -d prices -f prices.sql`
- Create dump: `pg_dump -U postgres prices > prices.sql`
- Restore database: `psql -U postgres -d postgres -c "DROP DATABASE IF EXISTS prices; CREATE DATABASE prices;"`

## SQL Style Guidelines
- Use lowercase for SQL keywords (SELECT, INSERT, etc.)
- Use snake_case for table and column names
- Primary keys: Use 'id' as the name for integer primary keys
- Foreign keys: Use table_name_id as the naming convention
- Avoid reserved keywords as identifiers
- Use double quotes only when necessary for special characters
- Add meaningful constraints with descriptive names
- Document complex queries with comments

## Table/Column Naming
- Tables: Use plural nouns (users, stations, gasprices)
- Join tables: Combine table names (user_stations)
- Use UUID for entity IDs when appropriate
- Maintain consistent data types for similar fields across tables
- Use descriptive column names to improve self-documentation