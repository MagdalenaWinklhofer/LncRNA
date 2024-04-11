#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=FEELnc_shuffle_classifier
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# activate the environment 
module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/feelnc/

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/10_lncRNA_classification/

# Classifier
FEELnc_classifier.pl \
-i /cluster/work/users/magdalena/lncrna/10_lncRNA_classification/lncRNA_for_classifier.gtf \
-a /cluster/work/users/magdalena/lncrna/genome_index/ccar_annotation.gtf > lncRNA_candiates_classified.txt
# the -p option is not available in the classifier module 
