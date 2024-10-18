# CNCI 
CNCI is a program used to classify protein-coding or non-coding transcripts, re-constructed from high-throughput sequencing data. The Coding-Non-Coding Index (CNCI) classifies transcripts by profiling adjoining nucleotide triplets to effectively distinguish protein-coding and non-coding sequences independent of known annotations.
For more information please consunsult the manual: https://github.com/www-bioinfo-org/CNCI

## Installation  
For the installation a conda environment was created (`cnci`) and activated. The git repository was cloned into the `.program_CNCI` directory. By following the instruction provided by the maual the installation was completed. 

## Before running the program 
Activate the conda environment `cnci`. 

## Running the program 
The program is quite old and needs python 2 running, hence I created a conda environment that only contains python in version 2. Activate the conda environment and navigate to the installed program. With that combination the program should start. 

Do not specify the annottaion. You can only use a genome file (fasta) OR an annotation file (gtf) as input but NOT BOTH. 