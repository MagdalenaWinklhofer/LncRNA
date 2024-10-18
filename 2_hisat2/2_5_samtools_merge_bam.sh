#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=samtools_merge_bam_cc
#SBATCH --time=27:00:00
#SBATCH --mem-per-cpu=6G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12



# load the needed modules
module purge 

ml load SAMtools/1.17-GCC-12.2.0
ml load BCFtools/1.17-GCC-12.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/2_hisat_alignment/

# use Samtools to merge a list of bam file into one bam file 
samtools merge -o transcript.bam \
 A1.bam A2.bam A3.bam A4.bam A5.bam A6.bam N14.bam N15.bam N16.bam N17.bam N18.bam N21.bam R10.bam R11.bam R12.bam R13.bam R8.bam R9.bam



# to close everything 
ml purge 

