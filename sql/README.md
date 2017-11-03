# Init SQL

The queries in this folder initialise the PostgreSQL database that Cachet uses.
This is to achieve a fully automated setup.
If preferred, these files don't have to be used, Cachet will initialise an empty
DB giving you a setup wizard and a fresh start.
(This can be done by removing the PostgreSQL volumes in the [`docker-compose.yml`])

#### The Queries

- `database.sql` - creates the database with the same permissions and settings that Cachet usually does.
- `schema.sql` - creates the schema and tables that Cachet expects. (provided you specify no `DB_PREFIX`)
- `data.sql` - inserts data that would require manual setup, like the admin account, components and general settings.

#### Customising
Assuming basic SQL knowledge, altering the `data.sql` to tailor Cachet to your liking isn't difficult.
The tables names are all related to Cachet's naming of each 'component'.
For example: adding a new metric is as simple as inserting a new line to the
`COPY metrics` statement with your desired values, like the following:
```sql
COPY metrics (id, name, suffix, description, default_value, calc_type, display_chart, created_at, updated_at, places, default_view, threshold, "order") FROM stdin;
1	Google Response Time	ms		205.000	1	t	2017-11-02 16:28:42	2017-11-02 16:28:42	0	0	15	0
2	Bing Response Time	ms		150.000	1	t	2017-11-02 16:28:42	2017-11-02 16:28:42	0	1	10	0
\.
SELECT pg_catalog.setval('metrics_id_seq', 2, true);
```

The API keys for each account can also be changed, but the one of values must
match what you specify in Cachet-Monitor's config: [`monitor.yml`]

[`docker-compose.yml`]: ../docker-compose.yml
[`monitor.yml`]: ../cachet-monitor/monitor.yml
