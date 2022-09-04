##### Translations: [English](README.md) | [简体中文](README_zh.md)

## 简介

[SQLI labs](https://github.com/Audi-1/sqli-labs) 预构建的docker环境

## 快速开始

### 克隆此仓库

```bash
git clone --depth=1 https://github.com/hominsu/sqli-labs.git
```

### 启动 sqli-labs

通过 `docker compose` 启动 `sqli-labs`（查阅文档以安装 [Docker Compose](https://docs.docker.com/compose/install/)）

```bash
cd sqli-labs
docker compose up -d
```

### 设置/重置数据库

- 从你的浏览器访问 `sqli-labs`: [http://127.0.0.1/sqli-labs/](http://127.0.0.1/sqli-labs/)
- 点击 [Setup/reset Database for labs](http://127.0.0.1/sqli-labs/sql-connections/setup-db.php) 以创建数据库，创建表和填充数据
- 开始实验

