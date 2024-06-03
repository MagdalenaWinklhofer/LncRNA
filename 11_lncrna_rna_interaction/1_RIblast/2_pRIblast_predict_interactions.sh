#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=pRIblast_cc_lncRNA
#SBATCH --time=300:00:00
#SBATCH --ntasks=80
#SBATCH --partition=bigmem
#SBATCH --mem-per-cpu=16GB
#SBATCH --cpus-per-task=1


# conda environment and modules
ml load  OpenMPI/4.1.5-GCC-12.3.0

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_pRIblast/pRIblast/pRIblast/target/

# program command: 
srun \
         pRIblast.release ris -i /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/cc_lncRNA_transcripts_no_softmasked.fasta \
                    -o /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/lncRNA_interactions.txt \
                    -d /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/database_cc \
                    -p /cluster/work/users/magdalena/lncrna/11_lncRNA_interaction/pRIblast/scratch \
                    -a dynamic  \

# for next run remove -s 1

# close everything
ml purge 


