# Instructions and Workflow for BLAST search
## General Information 
For investigating if any differentially expressed lncRNAs were contained in the already known lncRNA database from RNAcentral, I downloaded the known lncRNAs that were included into publications, without any warnings for quality issues. This resulted in 149,667 hits. 


## 1 Creating a database for the blast search 
### Needed programs: BLAST+/2.14.1-gompi-2023a

The downloaded lncrna.fa.gz file was unpacked and used in the `11_1_makedb.sh` script to create a database that our deg lncRNAs could be searched against. 


## 2 Split predicted transcipts and proteins in smaller files for array  

In this step I am splitting the predicted deg lncrna transcripts in smaller different files. This enables me to use arrays and was done very quick (only takes a few seconds). First I converted them into single line files and then split them. Then one subfile should contain 1000 transcript sequences. 

I checked that the extracted transcripts and proteins don't contain two stop codons (**) next to each other with the following command: 

`grep -B1 '\*\*' filtered_cc_transcripts.fa`  

For the files in use now this was not the case. 

# Convert multiline FASTA to single-line FASTA
awk 'BEGIN {FS = "\n"; RS = ">"}
NR > 1 {
    header = $1
    $1 = ""
    seq = $0
    gsub("\n", "", seq)
    print ">"header"\n"seq
}' deg_lncrna_cc_transcripts.fa > degs_cc_lncrna_transcripts_single.fa

# Split single-line FASTA into smaller files containing 1000 sequences each
split -l 2000 -d --additional-suffix=.fa degs_cc_lncrna_transcripts_single.fa sub1000_

# Verify the content of the split files
for file in sub1000_*; do
  count=$(grep -c '^>' "$file")
  if [ "$count" -eq 1000 ]; then
    echo "$file contains 1000 sequences."
  else
    echo "$file does not contain 1000 sequences. It contains $count sequences."
  fi
done



## 3 BLASTn  
### Needed programs: BLAST+/2.14.1-gompi-2023a

After running the BLASTn the output files were merged into one file: `cat blastn.0.tsv blastn.1.tsv blastn.2.tsv > merged_blastn.tsv`. 


