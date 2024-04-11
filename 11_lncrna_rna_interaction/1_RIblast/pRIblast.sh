#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=pRIblast_cc_lncRNA
#SBATCH --time=150:00:00
#SBATCH --mem=64G
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=8

# conda environment and mosules
ml load  OpenMPI/4.1.5-GCC-12.3.0

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_pRIblast/pRIblast/pRIblast/target/

# program command: 
mpirun -np 8 -x OMP_NUM_THREADS=8 \
         pRIblast.release db -i /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/RIblast/cc_transcripts.fa \
                     -o /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/RIblast/database_cc \
                     -a dynamic \
                     -p /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/RIblast/tmp/scratch -c 500


# close everything
ml purge 
