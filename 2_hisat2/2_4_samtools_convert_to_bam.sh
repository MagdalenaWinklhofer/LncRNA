#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=hisat2_alignment_cc
#SBATCH --time=27:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --array=0-17


# load the needed modules
module purge 

ml load SAMtools/1.17-GCC-12.2.0
ml load BCFtools/1.17-GCC-12.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/2_hisat_alignment/

# alignment of RNA sequences to the reference genome 
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

output2=("A1.bam" \
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


# use Samtools to sort and convert the SAM file (from hisat2 alignment) into a BAM file 
samtools sort -l 9 -o /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${output2[$SLURM_ARRAY_TASK_ID]} -O bam -@ 4 \
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${output1[$SLURM_ARRAY_TASK_ID]} \

# to close everything 
ml purge 

