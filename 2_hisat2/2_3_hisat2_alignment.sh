#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_lncRNA_cc_alignment
#SBATCH --time=36:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=4
#SBATCH --array=0-17


# load the needed modules
module purge 
ml load HISAT2/2.2.1-gompi-2022a

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/2_hisat_alignment/

input1_forward=("/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A1_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A2_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A3_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A4_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A5_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A6_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N14_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N15_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N16_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N17_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N18_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N21_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R10_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R11_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R12_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R13_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R8_R1.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R9_R1.fq.gz")


input1_reverse=("/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A1_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A2_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A3_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A4_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A5_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_A6_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N14_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N15_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N16_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N17_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N18_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_N21_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R10_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R11_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R12_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R13_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R8_R2.fq.gz" \
         "/cluster/work/users/magdalena/lncrna/1_sequences/Sample_R9_R2.fq.gz")

output1=("A1.sam" \
         "A2.sam" \
         "A3.sam" \
         "A4.sam" \
         "A5.sam" \
         "A6.sam" \
         "N14.sam" \
         "N15.sam" \
         "N16.sam" \
         "N17.sam" \
         "N18.sam" \
         "N21.sam" \
         "R10.sam" \
         "R11.sam" \
         "R12.sam" \
         "R13.sam" \
         "R8.sam" \
         "R9.sam" )


output2=("A1" \
         "A2" \
         "A3" \
         "A4" \
         "A5" \
         "A6" \
         "N14" \
         "N15" \
         "N16" \
         "N17" \
         "N18" \
         "N21" \
         "R10" \
         "R11" \
         "R12" \
         "R13" \
         "R8" \
         "R9" )


# alignment of RNA sequences to the reference genome
hisat2 -p 8 --reorder --dta --summary-file cc_alignment_summary_${output2[$SLURM_ARRAY_TASK_ID]} /cluster/work/users/magdalena/lncrna/genome_index/crucian_carp_index \
-1 ${input1_forward[$SLURM_ARRAY_TASK_ID]} \
-2 ${input1_reverse[$SLURM_ARRAY_TASK_ID]} \
-S /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${output1[$SLURM_ARRAY_TASK_ID]} 

# to close everything 
ml purge 

