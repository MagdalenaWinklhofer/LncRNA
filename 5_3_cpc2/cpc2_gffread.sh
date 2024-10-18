#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=CPC2_Carassius_lncRNA_identification
#SBATCH --time=20:00:00
#SBATCH --mem=12G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

#module load Anaconda3/2022.10
#source ${EBROOTANACONDA3}/bin/activate
#conda activate /cluster/projects/nn8014k/magdalena/conda_environments/CPC2

# load modules on the saga server 
ml load Biopython/1.81-foss-2022b

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_CPC2/CPC2_standalone-1.0.1/bin/

# Prediction of lncRNA with CPC2 crucian carp 
 python CPC2.py \
 -i /cluster/projects/nn8014k/magdalena/LncRNA/4_gffread/all_transcript/cc_transcripts_all.fa \
 -o /cluster/work/users/magdalena/lncrna/5_3_cpc2/cpc2_cc_codpot_all.txt





