#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=StringTie_Carassius_transcript_assembly
#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=12G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --array=0-17

# load the needed modules
module purge 
ml load StringTie/2.2.1-GCC-11.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/

# transcript assembly with Stringtie 

input=("A1.bam" \
"A2.bam" \
"A3.bam" \
"A4.bam" \
"A5.bam" \
"A6.bam" \
"N14.bam" \
"N15.bam" \
"N16.bam" \
"N17.bam" \
"N18.bam" \
"N21.bam" \
"R10.bam" \
"R11.bam" \
"R12.bam" \
"R13.bam" \
"R8.bam" \
"R9.bam" )

output=("cc_transcriptome_A1.gtf" \
       "cc_transcriptome_A2.gtf" \
       "cc_transcriptome_A3.gtf" \
       "cc_transcriptome_A4.gtf" \
       "cc_transcriptome_A5.gtf" \
       "cc_transcriptome_A6.gtf" \
       "cc_transcriptome_N14.gtf" \
       "cc_transcriptome_N15.gtf" \
       "cc_transcriptome_N16.gtf" \
       "cc_transcriptome_N17.gtf" \
       "cc_transcriptome_N18.gtf" \
       "cc_transcriptome_N21.gtf" \
       "cc_transcriptome_R10.gtf" \
       "cc_transcriptome_R11.gtf" \
       "cc_transcriptome_R12.gtf" \
       "cc_transcriptome_R13.gtf" \
       "cc_transcriptome_R8.gtf" \
       "cc_transcriptome_R9.gtf" )


stringtie -o /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/${output[$SLURM_ARRAY_TASK_ID]} \
-v -p 4 \
 -G /cluster/work/users/magdalena/lncrna/genome_index/carcar_annotation_v5.gtf \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${input[$SLURM_ARRAY_TASK_ID]} 


# to close everything 
ml purge 


