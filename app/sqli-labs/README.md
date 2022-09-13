##### Translate to: [简体中文](README_zh.md)

## Usage

startup the `sqli-labs` environment via `docker compose`.

```bash
cd app/sqli-labs
docker compose up -d
```

#### setup/reset database

- from your browser access the `sqli-labs`: [http://127.0.0.1/sqli-labs/](http://127.0.0.1/sqli-labs/)
- click on the link [Setup/reset Database for labs](http://127.0.0.1/sqli-labs/sql-connections/setup-db.php) to create database, create tables and populate data.
- enjoy the labs

After the test, delete the environment with the following command.

```bash
docker compose down -v
```

