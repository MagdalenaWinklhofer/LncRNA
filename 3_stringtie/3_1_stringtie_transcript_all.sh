#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=StringTie_Carassius_transcript_assembly
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=12G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4


# load the needed modules
module purge 
ml load StringTie/2.2.1-GCC-11.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/

# transcript assembly with Stringtie 

input=("transcript.bam" )

output=("cc_transcriptome_all.gtf" )


stringtie -o /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/${output[$SLURM_ARRAY_TASK_ID]} \
-v -p 4 \
 -G /cluster/work/users/magdalena/lncrna/genome_index/carcar_annotation_v5.gtf \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${input[$SLURM_ARRAY_TASK_ID]} 


# to close everything 
ml purge 


