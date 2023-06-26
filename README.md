# welcome-robotframework
Simple examples to get started with Robot Framework

## Slides

You can download the slides from [here](https://docs.google.com/presentation/d/1zzEA4sFHxcTjomqOM9aE25OgnZ0Vq3Jl/edit?usp=sharing&ouid=103496806177522578842&rtpof=true&sd=true).

Make sure to open the slides in "PowerPoint" (you can open them in read-only) as they are not fully compatible with Google Slides.

You can also find the images of all slides in the `slides` folder.    
The videos are available as animated GIFs in the `slides/videos` folder.

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

- Open a `Terminal` in VS Code
- Run `robot tests` in Terminal

Optional: If you want to "see" the WebBrowser during execution, go to `Ports` tab in Terminal.  
Add Port `6080`, select the new entry and click on the small globe icon to open it in a new Browser Tab.
