#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_Carassius_alignment
#SBATCH --time=24:00:00
#SBATCH --mem=16G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16


# load the needed modules
module purge 
module load HISAT2/2.1.0-foss-2018b

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena

# alignment of RNA sequences to the reference genome 
hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A1 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A1_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A1_R2.fq.gz, \
-S crucian_carp_alignment_A1.sam

#gzip -v crucian_carp_alignment_A1.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A2 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A2_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A2_R2.fq.gz, \
-S crucian_carp_alignment_A2.sam

#gzip -v crucian_carp_alignment_A2.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A3 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A3_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A3_R2.fq.gz, \
-S crucian_carp_alignment_A3.sam

#gzip -v crucian_carp_alignment_A3.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A4 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A4_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A4_R2.fq.gz, \
-S crucian_carp_alignment_A4.sam

#gzip -v crucian_carp_alignment_A4.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A5 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A5_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A5_R2.fq.gz, \
-S crucian_carp_alignment_A5.sam

#gzip -v crucian_carp_alignment_A5.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_A6 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A6_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_A6_R2.fq.gz, \
-S crucian_carp_alignment_A6.sam

#gzip -v crucian_carp_alignment_A6.sam \


hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N14 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N14_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N14_R2.fq.gz, \
-S crucian_carp_alignment_N14.sam

#gzip -v crucian_carp_alignment_N14.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N15 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N15_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N15_R2.fq.gz, \
-S crucian_carp_alignment_N15.sam

#gzip -v crucian_carp_alignment_N15.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N16 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N16_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N16_R2.fq.gz, \
-S crucian_carp_alignment_N16.sam

#gzip -v crucian_carp_alignment_N16.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N17 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N17_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N17_R2.fq.gz, \
-S crucian_carp_alignment_N17.sam

#gzip -v crucian_carp_alignment_N17.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N18 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N18_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N18_R2.fq.gz, \
-S crucian_carp_alignment_N18.sam

#gzip -v crucian_carp_alignment_N18.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_N21 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N21_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_N21_R2.fq.gz, \
-S crucian_carp_alignment_N21.sam

#gzip -v crucian_carp_alignment_N21.sam \



hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R8 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R8_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R8_R2.fq.gz, \
-S crucian_carp_alignment_R8.sam

#gzip -v crucian_carp_alignment_R8.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R9 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R9_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R9_R2.fq.gz, \
-S crucian_carp_alignment_R9.sam

#gzip -v crucian_carp_alignment_R9.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R10 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R10_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R10_R2.fq.gz, \
-S crucian_carp_alignment_R10.sam

#gzip -v crucian_carp_alignment_R10.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R11 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R11_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R11_R2.fq.gz, \
-S crucian_carp_alignment_R11.sam

#gzip -v crucian_carp_alignment_R11.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R12 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R12_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R12_R2.fq.gz, \
-S crucian_carp_alignment_R12.sam

#gzip -v crucian_carp_alignment_R12.sam \

hisat2 -p 16 --reorder --dta --summary-file cc_alignment_summary_R13 /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index \
-1 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R13_R1.fq.gz \
-2 /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/Sample_R13_R2.fq.gz, \
-S crucian_carp_alignment_R13.sam

#gzip -v crucian_carp_alignment_R13.sam \



# to close everything 
ml purge 

