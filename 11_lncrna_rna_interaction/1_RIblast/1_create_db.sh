#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=RIblast_cc_db
#SBATCH --time=10:00:00
#SBATCH --mem=60G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
# load modules


# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/RIblast/target/

# command for the program
./RIblast db -i /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/RIblast/cc_transcripts.fa -o database_cc.db

ml purge 