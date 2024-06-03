#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=pRIblast_cc_lncRNA
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --mem=128GB
#SBATCH --cpus-per-task=4


# conda environment and modules

module load Anaconda3/2022.10
source ${EBROOTANACONDA3}/bin/activate
conda activate /cluster/projects/nn8014k/magdalena/conda_environments/JupyterNotebook

# program command: 

jupyter nbconvert --allow-errors --to notebook --execute /cluster/projects/nn8014k/magdalena/script_LncRNA/11_lncrna_rna_interaction/1_RIblast/3_analysis.ipynb

# close everything
ml purge 