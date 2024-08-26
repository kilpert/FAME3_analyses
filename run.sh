#!/usr/bin/env bash

## snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete #--rerun-trigger mtime
## snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete --configfile config/FAME3.config.yaml
snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete --configfile config/demo.config.yaml

