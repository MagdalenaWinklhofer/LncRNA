#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=ASSA_cc_lncRNA
#SBATCH --time=200:00:00
#SBATCH --partition=bigmem
#SBATCH --mem-per-cpu=300G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=3


# change directory to data 
cd /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/ASSA

# program command: 
apptainer exec --bind /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/ASSA/data:/opt/uio/data assa_1.0.1.sif bash -c "source /usr/local/conda/etc/profile.d/conda.sh && conda activate &&  \
assa.pl --num_threads 2 /opt/uio/data/cc_lncRNA_transcripts.fasta /opt/uio/data/transcripts_without_N.fasta  > /opt/uio/data/output.txt && cat /opt/uio/data/output.txt"





