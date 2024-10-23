#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=FEELnc_shuffle_classifier
#SBATCH --time=90:00:00
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# activate the environment 
module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/feelnc/

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/5_1_feelnc/


# Classifier
FEELnc_classifier.pl \
 -i /cluster/projects/nn8014k/magdalena/LncRNA/5_1_feelnc/5_1_2_feelnc_codpot_all/feelnc_candidate_lncRNA_all.gtf.lncRNA.gtf \
 -a /cluster/work/users/magdalena/lncrna/genome_index/carcar_annotation_v5.gtf >  /cluster/work/users/magdalena/lncrna/5_1_feelnc/5_1_3_feelnc_classifier/lncRNA_classes.txt
# the -p option is not available in the classifier module 


