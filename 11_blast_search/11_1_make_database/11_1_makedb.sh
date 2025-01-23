#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=blast_makedb_cc
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# load the needed modules
ml load BLAST+/2.14.1-gompi-2023a

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/11_blast/

# command for program
makeblastdb -in lncrna.fasta -dbtype nucl -out known_lncrna_database


ml purge 
