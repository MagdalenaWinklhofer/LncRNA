#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=StringTie_Carassius_merge
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

# merge of a list of GTF files with Stringtie 
stringtie \
 --merge \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A1.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A2.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A3.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A4.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A5.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_A6.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N14.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N15.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N16.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N17.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N18.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_N21.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R8.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R9.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R10.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R11.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R12.gtf \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_R13.gtf \
 -p 4 \
 -G /cluster/work/users/magdalena/lncrna/genome_index/carcar_annotation_v5.gtf \
 -o /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_merged.gtf \

# to close everything 
ml purge 



