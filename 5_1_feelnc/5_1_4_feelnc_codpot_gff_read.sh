#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=FEELnc_cc_coding_potential
#SBATCH --time=90:00:00
#SBATCH --mem-per-cpu=12G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6

# activate the environment 
module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/feelnc/

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/5_1_feelnc/


# Coding_Potential_shuffle mode 
FEELnc_codpot.pl \
 -i /cluster/projects/nn8014k/magdalena/script_LncRNA/4_gffread/cc_transcripts.fa \
 -a /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_merged.gtf  \
 -o /cluster/work/users/magdalena/lncrna/5_1_feelnc/5_1_4_feelnc_codpot_gffread/feelnc_lncRNA_codpot_shuffle_gffread \
 -g /cluster/work/users/magdalena/lncrna/genome_index/ccar_genome_v1_262scaffolds_masked.fasta \
 --mode=shuffle

# the -p option is not available in the codpot module 