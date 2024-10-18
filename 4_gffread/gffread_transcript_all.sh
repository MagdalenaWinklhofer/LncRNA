#!/bin/bash

#SBATCH --account=nn8014k
#SBATCH --job-name=GFFUtils_Carassius_transcripts
#SBATCH --time=02:00:00
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_gffread/


# Basic command 
# gffread -w transcripts.fa -g /path/to/genome.fa transcripts.gtf

# Generate a fasta file with all transcripts 
gffread/gffread \
-w cc_transcripts_all.fa \
-g /cluster/work/users/magdalena/lncrna/genome_index/ccar_genome_v1_262scaffolds_masked.fasta \
 /cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/cc_transcriptome_all.gtf 


# Shows a table 
#gffread/gffread --table @id,@chr,@start,@end,@strand,@exons,Name,gene,product \
#  -o cc_annotation_altered_augustus_hints.tbl \
# /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/augustus.hints_altered.gtf



  