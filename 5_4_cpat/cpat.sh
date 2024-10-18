# The script is run in the terminal, but altering code was easier in a script. 

# NOTE: make sure cpat conda environment is activated before running the code. 

# code for cpat program 

# LncRNA from sense and antisense strand (used 26.09.2024)
cpat.py -x /home/maggy/LncRNA/5_4_cpat/zebrafish_Hexamer.tsv \
  --top-orf=1 \
 -d /home/maggy/LncRNA/5_4_cpat/Zebrafish_logitModel.RData \
 -g /home/maggy/LncRNA/5_4_cpat/cc_transcripts_all.fa \
 -o cpat_lncRNA_sense_ORF1


# x: hexamer frequency table
# g: genomic file (fasta)





