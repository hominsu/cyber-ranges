##### Translate to: [简体中文](README_zh.md)

## Description

cyber-ranges is an open-source collection of pre-built cyber range docker environments.

## Usage

Check the document to install [Docker Desktop](https://docs.docker.com/desktop/) (or install [Docker Engine](https://docs.docker.com/engine/install/)) and [Docker Compose](https://docs.docker.com/compose/install/).

```bash
# download the tarball
❯ mkdir -p cyber-ranges && cd cyber-ranges
❯ curl -sL https://github.com/hominsu/cyber-ranges/tarball/main | \
tar -zx --strip-components=1

# or use git to clone project
❯ git clone --depth=1 https://github.com/hominsu/cyber-ranges.git
❯ cd cyber-ranges

# enter the directory of app/range
❯ cd app/sqli-labs

# run range
❯ docker compose up -d
```

There is a `README` document in each range directory, please read this file for app/range testing and usage.

After the test, delete the environment with the following command.

```bash
❯ docker compose down -v
```

