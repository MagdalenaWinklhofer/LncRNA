#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=FEELnc_Carassius_filter
#SBATCH --time=20:00:00
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# load modules

module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/feelnc/


# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/script_FEELnc/

# Filter
FEELnc_filter.pl \
 -p 4 --monoex=1 \
 -i /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_merged.gtf \
 -a /cluster/work/users/magdalena/lncrna/genome_index/ccar_annotation.gtf  \
 > /cluster/work/users/magdalena/lncrna/5_1_feelnc/feelnc_filter/feelnc_candidate_lncRNA.gtf

# keep monoexonic transcripts (sense and antisense) 

