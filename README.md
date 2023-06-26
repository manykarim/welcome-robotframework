# welcome-robotframework
Simple examples to get started with Robot Framework

## http://bit.ly/welcome-robotframework

<img src='bit.ly_welcome-robotframework.png' width='25%'>

## How to run examples

There are multiple options to run the examples.

### Run locally

#### Install via pip

```bash	
git clone https://github.com/manykarim/welcome-robotframework
cd welcome-robotframework
pip install -r requirements.txt
robot -d results/ tests/
```

#### Install via Poetry
    
```bash
git clone https://github.com/manykarim/welcome-robotframework
cd welcome-robotframework
poetry install
poetry run robot -d results/ tests/
```

### Run remotely (no need to install anything)

#### Run in Gitpod

- Open GitPod Link below
- Select to "Continue with GitHub"
- Select "free" GitPod plan (50 hours/month)
- Confirm creation of GitPod workspace and wait for it to be created
- Run `robot -d results/ tests/`

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/manykarim/welcome-robotframework)  
https://gitpod.io/#https://github.com/manykarim/welcome-robotframework

#### Run in GitHub Codespaces (experimental)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/manykarim/welcome-robotframework)
