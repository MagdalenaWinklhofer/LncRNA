#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=Gtftools_ccar_transcriptome
#SBATCH --time=02:00:00
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/4_gffread

# activate the environment 
module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/gtftools



cd /cluster/work/users/magdalena/lncrna/4_gffread

# command for program 
gtftools -l gene_length.txt cc_transcriptome_all.gtf



  