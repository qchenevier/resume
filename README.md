Inspired by https://github.com/chmduquesne/resume

To be used with the markdown preview enhanced plugin within atom.


## Dev stack

```mermaid
graph LR;

  subgraph "Automatic build"
  watch-- triggers every 0.5 seconds -->make;
  make-- build only if source change -->pandoc;
  make-- build only if source change -->weasyprint;
  end

  subgraph "Automatic reload"
  puer-- reloads browser if page changes -->web_browser;
  end
```

Build management is done with `make`, which calls:
- `pandoc` to translate markdown to html
- `weasyprint` to render html to pdf

Auto-build is done with `watch`.

Auto-reload (for html) is done with `puer`.

### Installation

#### Build tools

Install `pandoc`:
```
brew install pandoc
```

Create a python environment to install `weasyprint`:
```
conda env create -f environment.yml
```

#### Auto-build
Installation of `watch` is done with `brew` (OSX only):
```
brew install watch
```

#### Auto-reload
Installation of `puer` is done with `npm`
```
npm install -g puer
```

### Launch

#### Auto-build

Activate the environment which contains `weasyprint`:
```
conda activate weasyprint
```

Use `watch` to launch the build process every 0.5 second & rebuild the html file from the markdown:
```
watch -n 0.5 make
```

#### Auto-reload
Launch puer to launch a webserver which will autoreload the html page when it has changed:
```
puer
```

Then go to http://localhost:8000/resume.html to see the result.
