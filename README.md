# minion analyses

This [Snakemake](https://github.com/snakemake/snakemake) workflow performs the anlysis of long read (Nanopore) repeat sequence data. It calculates statistics and generates plots (custom Python and R scripts) to characterize the nature of the repeat expansion in length and motif composition. Specific alleles (length and motif) can be defined manually for enhanced visualization. 


## How it works

This software is basically a Snakemake workflow that starts with fastq files and runs several known tools in order to analyze reads that cover repeat expansions. It was used in our publication to understand repeat expansions in human *MARCHF6*, but it can also be used on other regions of the genome. Long read technology (e.g. Nanopore) is particularly suited for this kind of analysis. 

In its core, this workflow – beside doing quality filtering (bbduk) and running some default QC tools – identifies reads with specific regions of interest by their upstream and downstream flanking sequences (also using bbduk). We refer to them as *repeat spanning reads*. They are the subject to further analyzes steps. The user can specifiy  repeat motifs which are visualized in several ways, i.e. the exact locations of the motifs are determined and visualized in graphs (custom scripts). The user can further specify alleles by indicating nucleotide sequences in a yaml file that have to be included or excluded.


## Install from Github

`git clone https://github.com/kilpert/fame3_analyses.git`


## Setup (Configuration)

The workflow needs **fastq.gz** files as input. 

The path to the folder holding the fastq.gz files has to be configured in the `config/config.yaml` file, e.g.:

`fastq_dir: path/to/fastq`


## Starting the workflow
The workflow can be started by running the `run.sh` on the shell 

### or

by executing the Snakemake command directly:

```
snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete
```

If you are using an additional config file, in additions to `config/config.yaml`, you can specify it on the command line, e.g.:

```
snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete --configfile config/FAME3.config.yaml
```


All required software packages will be installed via [conda](https://conda.io)/[mamba](https://github.com/mamba-org/mamba) on the first run.


## Demo

A demo dataset (`demo/input/demo.fastq.gz`, 10 reads only) is provided. It can be used for testing the workflow. The run time is about 15s.

Run the workflow on the demo data:

```
snakemake --cores --use-conda --conda-frontend mamba -p --rerun-incomplete --configfile config/demo.config.yaml
```

The demo output will be saved to the `demo/output` folder as specified in the `demo/demo.config.yaml`.

The exact demo output is already provided in the `demo/output.tar.gz` file. Unzip to restore the original output folder from the workflow (e.g. for comparison).


## System requirements
The workflow was tesed on:

 - Ubuntu 22.04.2 LTS
 - conda 23.3.1
 - mamba 1.4.2
 - biopython 1.81
 - Snakemake 7.32.4


## Publication

Kühnel et al. (2024). Repeat expansions with small TTTCA insertions in MARCHF6 cause Familial Adult Myoclonus without Epilepsy. *in prep.*
