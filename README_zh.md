##### Translations: [English](README.md) | [简体中文](README_zh.md)

## Description

cyber-ranges 是一个开源靶场的 docker 镜像结合

## Usage

查看文档安装 [Docker Desktop](https://docs.docker.com/desktop/) (或者 [Docker Engine](https://docs.docker.com/engine/install/)) 和 [Docker Compose](https://docs.docker.com/compose/install/)

```bash
# 下载项目压缩包并解压
❯ mkdir -p cyber-ranges && cd cyber-ranges
❯ curl -sL https://github.com/hominsu/cyber-ranges/tarball/main | \
tar -zx --strip-components=1

# 或者使用 git 克隆本项目
❯ git clone --depth=1 https://github.com/hominsu/cyber-ranges.git
❯ cd cyber-ranges

# 进入某一个 app/靶场
❯ cd app/sqli-labs

# 运行靶场
❯ docker compose up -d
```

每个环境目录下都有相应的 `README.md`，请阅读该文件，进行漏洞/环境测试

测试完成后，删除整个环境

```bash
❯ docker compose down -v
```

