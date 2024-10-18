# FEELnc 
The FEELnc pipeline was developed to annotate long non-coding RNAs (lncRNAs) based on reconstructed transcripts from RNA-seq data (either with or without a reference genome). The program consitst of 3 modules (see subsection below). 

For further information consult the manual: https://github.com/tderrien/FEELnc/blob/master/README.md

## Program set up 
The program is not available on the saga server as a module, hence installation has to be done by me in the project directory. Since the FEELnc program needs special packages a conda environment has to be created to load all those packages. Therefore, use the `conda create -p /cluster/projects/nn8014k/magdalena/conda_environments/feelnc -c bioconda feelnc` command to create the environment (this is done once). The environment is stored with other conda environments in the `/cluster/projects/nn8014k/magdalena/conda_environments/` directory. 

Since the program contains a special mode/wrapper (called `ushuffle`) to search for lncRNA, an additional package should be implemented (this is done once). Since the commands on the webpage are not working, please use the once provided here: 
- to clone the files available in the gitHub repository: `git clone https://github.com/agordon/fasta_ushuffle.git`
- to execude the installation: `cd fasta_ushuffle` followed my the `make` command 


## 1) FEELnc_filter.pl: Extract, filter candidate transcripts. (16.10.2024; slurm out: 12950638)
In this step of the pipeline, the transcripts are filtered. Unwanted transcripts and protein coding exons are filtered out. 

**Basic command**:  
`FEELnc_filter.pl -p 4 -i infile.gtf -a ref_annotation.GTF > candidate_lncRNA.gtf` 

input: 
- p: parallel (4 threads) 
- i: input (.gtf)
- a: annotation file (.gtf) 

**Outcome**:  
`feelnc_candidate_lncRNA_all.gtf` 

Information from previous run:   
The program tock 10.35 minutes to run. The memory of 16 GB of memory were used with a efficiency of 52%. I started the program with 1 tasks and 4 cpus-per-task (CPU efficiency: 76%). 

I also started the program with 12 CPU. The program was completed after 6 minutes. 


## 2) FEELnc_codpot.pl: Compute the coding potential of candidate transcripts. (17.10.2024: slurm out: 12567850)
In this step of the pipeline the coding potential of the transcripts is calculated. 

**Slurm file**:  
`4_1_3_feelnc_classifier.sh`

**Basic command**:  
`FEELnc_codpot.pl -i /candidate_lncRNA.gtf \
-a annotation.gtf \ 
-o codpot_shuffle \
-g genome.fasta \
--mode=shuffle

**NOTE**: 
- use generat annotation NOT the one from Stringtie! 
- use the output from the filtering step as input!
- use shuffle mode 

input: 
- i: input (.gtf)
- a: annotation file (.gtf) 
- o: output file 
- g: genome file (.fasta) 
- mode: shuffle or intergenetic

**Outcome**:  
multiple files in the `/cluster/work/users/magdalena/lncrna/5_1_feelnc/5_1_2_feelnc_codpot` directory. 

Use file `feelnc_candidate_lncRNA_all.gtf_RF.txt` for further analysis. 

Information from previous runs:  
This part of the program needs a long time to complete. The program usually runs multiple hours. The suffle mode took 7.5h to complete. 

































## 3) FEELnc_classifier.pl: Classify lncRNAs based on their genomic localization wrt others transcripts. (18.03.2024: slurm out:  10985678 )
During this step of the pipeline the transcripts are classified as coding and noncoding corresponding to the calculated coding potential (from the codpot module). 

**Slurm file**:  
`4_1_3_feelnc_classifier.sh`

**Basic command**:  

input: 
- i: input from the codpot directory
- a: annotation file (.gtf) 
- o: output file (is indicated by a `>`)


**Outcome**:  
Multiple files in the `/cluster/work/users/magdalena/lncrna/4_1_feelnc` directory. 

The classifier produces two files a log file and a feelnc_lncRNA.txt file 
The program took with one CPU and one task ..h to complete. 


# FINAL FILE: feelnc_lncRNA.txt


# NOTE: File 5_1_1 until 5_1_3 are for the classification of lncRNA and ONLY 5_1_4 are for the idnetification of lncRNA
