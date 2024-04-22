#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=pRIblast_cc_lncRNA
#SBATCH --time=100:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=8


# conda environment and modules
ml load  OpenMPI/4.1.5-GCC-12.3.0

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_pRIblast/pRIblast/pRIblast/target/

# program command: 
mpirun -np 20 -x OMP_NUM_THREADS=8 \
         pRIblast.release ris -i /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/cc_lncRNA_transcripts.fasta \
                    -o /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/lncRNA_interactions.txt \
                    -d /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/database_cc \
                    -a dynamic -s 1 \

#                     -p /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/scratch/ \

# close everything
ml purge 


