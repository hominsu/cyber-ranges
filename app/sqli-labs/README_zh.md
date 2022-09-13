##### Translations: [English](README.md) | [简体中文](README_zh.md)

## 快速开始

通过 `docker compose` 启动 `sqli-labs`

```bash
cd app/sqli-labs
docker compose up -d
```

#### 设置/重置数据库

- 从你的浏览器访问 `sqli-labs`: [http://127.0.0.1/sqli-labs/](http://127.0.0.1/sqli-labs/)
- 点击 [Setup/reset Database for labs](http://127.0.0.1/sqli-labs/sql-connections/setup-db.php) 以创建数据库，创建表和填充数据
- 开始实验

完成测试后，使用以下命令删除环境

```bash
docker compose down -v
```
