##### Translate to: [简体中文](README_zh.md)

## Usage

startup the `pikachu` environment via `docker compose`.

```bash
cd app/pikachu
docker compose up -d
```

#### setup/reset database

- from your browser access the `pikachu`: [http://127.0.0.1/pikachu/](http://127.0.0.1/pikachu/)
- click on the link [提示:欢迎使用,pikachu还没有初始化，点击进行初始化安装!](http://127.0.0.1/pikachu/install.php) to create database, create tables and populate data.
- enjoy the labs

After the test, delete the environment with the following command.

```bash
docker compose down -v
```

