# CSE270
Data sets for Sports Analytics class

## Install (recommended)

From the repo, run the course installer (CRAN Imports + GitHub packages + SportsAnalytics270):

```r
source("scripts/install_CSE270.R")
```

Or from a terminal:

```bash
Rscript scripts/install_CSE270.R
```

Optional: set branch/ref before running:

```r
Sys.setenv(CSE270_REF = "feat/data-collection-2026")
source("scripts/install_CSE270.R")
```

## Install via remotes only

`StatsBombR` and `SBpitch` are listed under `Remotes` / `Imports`, so they are pulled automatically:

```r
install.packages("remotes")
remotes::install_github("HABET/CSE270", ref = "feat/data-collection-2026", dependencies = TRUE)
```

Reinstall GitHub course packages later with:

```r
SportsAnalytics270::install_github_course_packages()
```
