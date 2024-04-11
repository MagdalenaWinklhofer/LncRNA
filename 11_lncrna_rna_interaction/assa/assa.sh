#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=ASSA_cc_lncRNA
#SBATCH --time=01:00:00
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2


# change directory to data 
cd /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/ASSA

# program command: 
apptainer exec --bind /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/ASSA/data:/opt/uio/data assa_1.0.1.sif bash -c "source /usr/local/conda/etc/profile.d/conda.sh && conda activate &&  assa.pl --num_threads 2 /usr/local/assa-1.0.1/examples/7SL.fna /usr/local/assa-1.0.1/examples/TP53.fna > /opt/uio/data/output.txt && cat /opt/uio/data/output.txt"










