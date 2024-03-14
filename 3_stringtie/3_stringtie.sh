#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=StringTie_Carassius_transcript_assembly
#SBATCH --time=10:00:00
#SBATCH --mem=32G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2

# load the needed modules
module purge 
ml load StringTie/2.2.1-GCC-11.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/

# transcript assembly with Stringtie 
stringtie \
-o /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome.gtf \
-p 2 -G /cluster/work/users/magdalena/lncrna/genome_index/ccar_annotation.gtf \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A1.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A2.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A3.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A4.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A5.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/A6.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N14.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N15.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N16.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N17.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N18.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/N21.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R10.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R11.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R12.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R13.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R8.bam \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/R9.bam \


# to close everything 
ml purge 


