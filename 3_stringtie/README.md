# StringTie (03.10.2024)
For further information the Manual should be consulted: https://ccb.jhu.edu/software/stringtie/index.shtml?t=manual

StringTie is a fast and highly efficient assembler of RNA-Seq alignments into potential transcripts. The module is available on the saga server `StringTie/2.2.1-GCC-11.2.0`. 

**Slurm file**:  
`3_stringtie.sh`

**Basic command**:  
`stringtie -G reference.gtf -o transcripts.gtf input_all.bam`

input: 
- `-o`: output file with directory and name (.gtf) 
- `-p`: number of threads (in my case 16) 
- `-G`: Use a reference annotation file (in GTF or GFF3 format) to guide the assembly process. The output will include expressed reference transcripts as well as any novel transcripts that are assembled. 

**Outcome**:  
`cc_transcriptome_all.gtf`   
Information from previous runs:   
The program was given a time window of 10 hours, but it completed after 3 hours. 55% of the given memory (32 GB) were used (actually used: 17.8 GB). The CPU efficiency was 54.72%, but since only 2 cores were used I would keep this setting for future runs. The program was started with ntasks=1. 

The main output of the program is a GTF file containing the structural definitions of the transcripts assembled by StringTie from the BAM file. The `cc_transcriptome_all.gtf` file can be found in the `/cluster/work/users/magdalena/lncrna/3_stringtie_transcriptome/` directory. 



**NOTE**: Since we merged the HISAT2 output bam files only the stringtie_transcipt_all.sh was needed and run sucessfully on the 02.10.2024