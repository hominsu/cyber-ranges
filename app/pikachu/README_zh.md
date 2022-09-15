##### Translations: [English](README.md) | [简体中文](README_zh.md)

## 快速开始

通过 `docker compose` 启动 `pikachu`

```bash
cd app/pikachu
docker compose up -d
```

#### 设置/重置数据库

- 从你的浏览器访问 `pikachu`: [http://127.0.0.1/pikachu/](http://127.0.0.1/pikachu/)
- 点击 [提示:欢迎使用,pikachu还没有初始化，点击进行初始化安装!](http://127.0.0.1/pikachu/install.php) 以创建数据库，创建表和填充数据
- 开始实验

完成测试后，使用以下命令删除环境

```bash
docker compose down -v
```
