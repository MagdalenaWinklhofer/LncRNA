#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_Carassius_alignment
#SBATCH --time=15:00:00
#SBATCH --mem=16G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16


# load the needed modules
module purge 
module load HISAT2/2.1.0-foss-2018b

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/program_HISAT2

# alignment of RNA sequences to the reference genome 
hisat2 -p 16 --reorder --dta --summary-file alignment_summary_file /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A1_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A1_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A2_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A2_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A3_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A3_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A4_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A4_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A5_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A5_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A6_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A6_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N14_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N14_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N15_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N15_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N16_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N16_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N17_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N17_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N18_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N18_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N21_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N21_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R8_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R8_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R9_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R9_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R10_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R10_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R11_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R11_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R12_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R12_R2.fq.gz, \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R13_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R13_R2.fq.gz, \
-S crucian_carp_alignment_multiple.sam 

# for summary the option "--new-summary" could tested 

# to close everything 
ml purge 








