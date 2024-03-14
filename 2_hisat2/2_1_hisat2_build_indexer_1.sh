#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_Carassius
#SBATCH --time=00:10:00
#SBATCH --mem=1G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1


# load the needed modules
module purge 
module load HISAT2/2.2.1-gompi-2022a

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/genome_index/

# Before building the index, exons and splice sites have to be extracted
python /cluster/projects/nn8014k/magdalena/.program_HISAT2/hisat2_extract_splice_sites.py ccar_annotation.gtf >splice_sites.ss 
python /cluster/projects/nn8014k/magdalena/.program_HISAT2/hisat2_extract_exons.py ccar_annotation.gtf >extracted_exons.exon

# to close everything 
ml purge 



