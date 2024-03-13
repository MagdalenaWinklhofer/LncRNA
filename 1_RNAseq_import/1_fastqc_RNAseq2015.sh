#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=Fastqc_cc
#SBATCH --time=10:00:00
#SBATCH --mem=12G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --array=0-36

# load the needed modules
module purge 
ml load FastQC/0.11.9-Java-11

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/1_sequences/

# Command of the program 
input=("Sample_A1_R1.fq.gz" \
        "Sample_A2_R1.fq.gz" \
        "Sample_A3_R1.fq.gz" \
        "Sample_A4_R1.fq.gz" \
        "Sample_A5_R1.fq.gz" \
        "Sample_A6_R1.fq.gz" \
        "Sample_N14_R1.fq.gz" \
        "Sample_N15_R1.fq.gz" \
        "Sample_N16_R1.fq.gz" \
        "Sample_N17_R1.fq.gz" \
        "Sample_N18_R1.fq.gz" \
        "Sample_N21_R1.fq.gz"\
        "Sample_R10_R1.fq.gz" \
        "Sample_R11_R1.fq.gz" \
        "Sample_R12_R1.fq.gz" \
        "Sample_R13_R1.fq.gz" \
        "Sample_R8_R1.fq.gz" \
        "Sample_R9_R1.fq.gz" \
        "Sample_A1_R2.fq.gz" \
        "Sample_A2_R2.fq.gz" \
        "Sample_A3_R2.fq.gz" \
        "Sample_A4_R2.fq.gz" \
        "Sample_A5_R2.fq.gz" \
        "Sample_A6_R2.fq.gz" \
        "Sample_N14_R2.fq.gz" \
        "Sample_N15_R2.fq.gz" \
        "Sample_N16_R2.fq.gz" \
        "Sample_N17_R2.fq.gz" \
        "Sample_N18_R2.fq.gz" \
        "Sample_N21_R2.fq.gz"\
        "Sample_R10_R2.fq.gz" \
        "Sample_R11_R2.fq.gz" \
        "Sample_R12_R2.fq.gz" \
        "Sample_R13_R2.fq.gz" \
        "Sample_R8_R2.fq.gz" \
        "Sample_R9_R2.fq.gz" )



fastqc \
 -o /cluster/work/users/magdalena/lncrna/1_fastqc/ \
 /cluster/work/users/magdalena/lncrna/1_sequences/${input[$SLURM_ARRAY_TASK_ID]}


# to close everything 
ml purge 