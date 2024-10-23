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
cd /cluster/work/users/magdalena/lncrna/5_1_feelnc/5_1_1_feelnc_filter/

# Filter
FEELnc_filter.pl \
 -p 4 \
 -i /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_all.gtf \
 -a /cluster/work/users/magdalena/lncrna/genome_index/carcar_annotation_v5.gtf  \
 --monoex=1 \
 > /cluster/work/users/magdalena/lncrna/5_1_feelnc/5_1_1_feelnc_filter/feelnc_candidate_lncRNA_all.gtf

# keep monoexonic transcripts (sense and antisense) 

