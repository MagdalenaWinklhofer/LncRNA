#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=blastn_cc
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --array=0-2

set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

# load the needed modules
ml load BLAST+/2.14.1-gompi-2023a

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/11_blast/

# command for program
blastn \
 -db known_lncrna_database \
 -query sub1000_0$SLURM_ARRAY_TASK_ID.fa \
 -out /cluster/work/users/magdalena/lncrna/11_blast/blastn.$SLURM_ARRAY_TASK_ID.tsv\
 -evalue 1e-5 -outfmt 6 -num_threads 4\


ml purge 
