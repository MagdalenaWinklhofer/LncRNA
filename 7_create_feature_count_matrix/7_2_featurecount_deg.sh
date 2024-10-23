#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=featurecounts_cc
#SBATCH --time=25:00:00
#SBATCH --mem-per-cpu=4G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --array=0-17


# load the needed modules
ml load Subread/2.0.3-GCC-11.2.0

# show me the loaded modules in a list
ml list

# change directory to the program script 
cd /cluster/work/users/magdalena/lncrna/7_featurecounts/

# additional settings 
set -o errexit  # Exit the script on any error
set -o nounset  # Treat any unset variables as an error

# Commands for the program (alignment of the reads to the genome)
echo running featureCounts

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

output=("cc_counts_A1.txt" \
         "cc_counts_A2.txt" \
         "cc_counts_A3.txt" \
         "cc_counts_A4.txt" \
         "cc_counts_A5.txt" \
         "cc_counts_A6.txt" \
         "cc_counts_N14.txt" \
         "cc_counts_N15.txt" \
         "cc_counts_N16.txt" \
         "cc_counts_N17.txt" \
         "cc_counts_N18.txt" \
         "cc_counts_N21.txt" \
         "cc_counts_R10.txt" \
         "cc_counts_R11.txt" \
         "cc_counts_R12.txt" \
         "cc_counts_R13.txt" \
         "cc_counts_R8.txt" \
         "cc_counts_R9.txt" )


featureCounts \
-T 4 -O -C -p --countReadPairs -s 2 -t exon -g gene_id \
-a /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_merged.gtf \
-o /cluster/work/users/magdalena/lncrna/7_2_featurecounts/${output[$SLURM_ARRAY_TASK_ID]}\
 /cluster/work/users/magdalena/lncrna/2_hisat_alignment/${input[$SLURM_ARRAY_TASK_ID]}



# T: threads
# O: creates a summary statsitsics file
# C: Exclude chimeric fragments from fragment counting. (should be excluded)
# p: It allows reads to be assigned to multiple features if they have the same best alignment score.
# s: Specifies the strandedness of the reads - 2 = assumes hat the reads are from the second strand (reverse strand).
# t: Specifies the feature type to be counted
# g: Specifies the attribute used to group reads. In this case, counts will be associated with unique gene IDs.

# settings were talked about with Sjannie 