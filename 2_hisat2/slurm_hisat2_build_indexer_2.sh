#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_Carassius
#SBATCH --time=05:00:00
#SBATCH --mem=170G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16


# load the needed modules
module purge 
module load HISAT2/2.2.1-gompi-2022a

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/program_HISAT2

# Build an index for your genome (is only done once) 
hisat2-build -p 16 --exon extracted_exons.exon --ss splice_sites.ss -f /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/genome_top100.fasta /cluster/projects/nn8014k/magdalena/program_HISAT2/crucian_carp_index

# to close everything 
ml purge 

