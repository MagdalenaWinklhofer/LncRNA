#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=CNCI_cc_lncRNA
#SBATCH --time=100:00:00
#SBATCH --mem=32G
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=10

# conda environment
module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/cnci/

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_CNCI/CNCI

# 1: CNCI.py: A classification tool for identify coding or non-coding transcripts (fasta files and gtf files)
python CNCI.py \
 -f /cluster/projects/nn8014k/magdalena/script_LncRNA/4_gffread/cc_transcripts.fa \
 -o /cluster/work/users/magdalena/lncrna/5_2_cnci/output \
 -p 20 \
 -m ve \
 
# -d /cluster/work/users/magdalena/lncrna/4_2_cnci/ccar_annotation.gtf
#-g /cluster/work/users/magdalena/lncrna/4_2_cnci/ccar_annotation.gtf \


# parameters: 
# -f or --file : input files
# -o or --out :  output file, results in xxx.index
# -p: parallel
# -m: model --> should be ve for vertebrate species
# g: gtf file
# -d or --directory : if you use the -g or --gtf this parameter must be assigned, assign the path of your reference genome. (e.g.  hg19.2bit)


ml purge 