# HISAT2/2.1.0-foss-2018b
This module is a fast alignment program to map sequencing reads (clean reads from RNA sequencing) against the reference genome (index). The module is available on the saga server (`HISAT2/2.1.0-foss-2018b`). The module can be loaded and no further environmental conditions are needed. Since the newer version (2.1.0) is installed on the saga server, two additional scripts are needed. The newer version (2.1.0) does not contain the python scripts (`hisat2_extract_exons.py`,`hisat2_extract_splice_sites.py`). Those can be added by downloading the hisat2 program version **2.2.0** and sneding the two scripts from your local mashine (via sftp) to the saga server. 

For more information about the program please consult the manual: https://daehwankimlab.github.io/hisat2/manual/

Further I found the YouTube video a helpful source: https://www.youtube.com/watch?v=WN4hulOIGVM


## 1) Build an index 
Since crucian carp is not a model organisms hisat2 does not provide a index file. For other organisms the hisat2 webpage should be consultet under the `Download` to make sure that no index is available. For this study a index had to be established from scratch. Therefore, exons and splice sites were extracted and an index build. 

Builin an index is done once. After that the index gets reused for other applications. 

### 1) Extracting exons and splicing sites from the GTF file.  
To prepare the genome data the `hisat2_buid` command was used to extract exons and splicing sites from the GFT file (`/cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/augustus.hints.gtf`). Two python scripts were used to get a .exon and .ss file. They were used as input in 2). 

**Slurm file**:  
`slurm_hisat2_build_indexer_1.sh`

**Basic command**:  
`python hisat2_SCRIPT.py <reference_in> <out.exon or out.ss>`

**Used command**:  
Extract exons:  
`python hisat2_extract_exons.py /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/augustus.hints.gtf >extracted_exons.exon`

Extract splice sites:  
`python hisat2_extract_splice_sites.py /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/augustus.hints.gtf >splice_sites.ss`

input: 
- the reference in was a gtf file 
- `-p`: Launch NTHREADS parallel build threads (default: 1).
- `--ss`: Note this option should be used with the following --exon option. 
Use hisat2_extract_splice_sites.py (in the HISAT2 package) to extract splice sites from a GTF file.
- `--exon`: Note this option should be used with the above --ss option. Use hisat2_extract_exons.py (in the HISAT2 package) to extract exons from a GTF file.

**Setting for the script**:  
time memory  tasks cpu anything special 

**Outcome**:  
`slurm-2022_10_31_indexer_1.out`

The program was given a time window of 10 minutes, but the process was done after 5 minutes. Memory of 1 GB is sufficient, since the program only used 173 MG. The program was started with ntasks 1 and cpus-per-task=1. This can be kept for future runs since the CPU Efficiency was low with 7%. Setting are good for future runs. 

The output files are `extracted_exons.exon` for the extracted exons and `splice_sites.ss`for the extracted splice sites. These files were used as input for the builing process of the index itself. Both files are stored in the directory `/cluster/projects/nn8014k/magdalena/program_HISAT2`. 

### 2) Build the index itself
To build the indes itself the output from the `slurm_hisat2_build_indexer_1.sh` script (=`extracted_exons.exon`,`splice_sites.ss`) were used as input. The information about the command can be sound on the hisat2 webpage under HowTo. The option `Build HGFM (= Hierarchical Graph FM index) index with transcripts` was choosen. The .exon and .ss files were used as input and a 8 `NAME.ht2` files were created. From the reference genome (here the `genome_top100.fasta` file was taken from /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp) (.fasta file) 8 files with suffixes e.g. `NAME.1.ht2, 2.ht2` are created. All these files together constitute the index (=is all that is needed to align the reads to the reference; the .fasta file is no longer needed)

**Slurm file**:  
`slurm_hisat2_build_indexer_2.sh`

**Basic command**:  
`hisat2-build -p 16 --exon genome.exon --ss genome.ss genome.fa genome_tran`

input: 
- p = parallel search threads `16` were started in my study (= Each thread runs on a different processor/core and all threads find alignments in parallel, increasing alignment throughput by approximately a multiple of the number of threads)
- `--exon extracted_exons.exon`
- `--ss splice_sites.ss`
- reference genome: `genome_top100.fasta` (From the reference genome (here the `genome_top100.fasta` file was taken from /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp))
- output: `crucian_carp_index`

**Setting for the script**:  
Since the option `Build HGFM index with transcripts` was choosen the program needs about an hour to build the index and requires at least 160 GB memory. In my setting I choose 170 GB memory. 

**Outcome**:  
`slurm-2022_11_01_indexer_2.out`

The program was given a 5h time window, but it already completed after 34 minutes. Next time the time setting could be lowered to 3h for example. During the run 49% of the memory was used (~83 GB), but since the program ran out of memory the first few runs, I would leave the setting as it is for future runs. The program started with ntasks = 1, but opened 16 copies of it simultaniously. HISAT2 is using the multithreading software model in order to speed up execution time. The CPU Efficiency was 21.35%. I would leave those setting as they are for furture runs. 

The output of this steps should be 8 files with suffixes e.g. `NAME.1.ht2, 2.ht2` (wrapper choose small index option by default). They can be found  in the directory `/cluster/projects/nn8014k/magdalena/program_HISAT2/index`. All these files together constitute the index (=is all that is needed to align the reads to the reference; the .fasta file is no longer needed)

## 2) Alignment 
During the alignment step the sequences RNA transcripts are aligned to the 8 index files (see `slurm_hisat2_build_indexer2.sh` script). Since the transcripts were sequences in a paired end manor, the forward and the reverse sequences have to be added.  
The index files were used to create a SAM file during the alignment of RNA transcripts to the indexes. SAM_multiple specifies that multiple RNA transcripts were incooperated into the SAM file. 

#### A) Single samples
**Since the .sam files are large, the slurm script was started in the `/cluster/work/users/magdalena` driectory. When starting the script in another directory make sure that the suitable directories are given.**

For the alignment of the RNA transcripts as single samples each **biological sample (6)** of each **condition** (normoxia, anoxia, reogygenation) with **2 transcripts** (forward (R1) and reverse (R2)) was used to create one sam file as an alignment. During this step a total of **36 .sam** files are created.  

**Slurm file**:  
`slurm_hisat2_alignment_single.sh`

**Basic command**:  
`hisat2 [options]* -x <hisat2-idx> {-1 <m1> -2 <m2> } [-S <hit>]`

input: 
- `-p`: program was started in parallel on 16 cores. **Launch NTHREADS parallel search threads (default: 1). Threads will run on separate processors/cores and synchronize when parsing reads and outputting alignments. Searching for alignments is highly parallel, and speedup is close to linear. Increasing -p increases HISAT2’s memory footprint**
- `--reorder`: Guarantees that output SAM records are printed in an order corresponding to the order of the reads in the original input file, even when -p is set greater than 1. Specifying --reorder and setting -p greater than 1 causes HISAT2 to run somewhat slower and use somewhat more memory then if --reorder were not specified. Has no effect if -p is set to 1, since output order will naturally correspond to input order in that case.
- `--dta/--downstream-transcriptome-assembly`: **Report alignments tailored for transcript assemblers including StringTie. With this option, HISAT2 requires longer anchor lengths for de novo discovery of splice sites. This leads to fewer alignments with short-anchors, which helps transcript assemblers improve significantly in computation and memory usage.**
- `--summary-file` to receive an `alignment_summary_file` (this information is also included in the .out file); Print alignment summary to this file.
- hisat2 index files: /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index (8 files); -x <hisat2-idx> = The basename of the index for the reference genome.
- `-1`and `-2` describe the forward (R1) and reverse (R2) transcript sequence. Multiple sequences can be added by komma seperation. The `.fq` files don't have to be unzipped. (directory: /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/ )
- `-S` specifies the output file. Is in this case a `.sam` file (`crucian_carp_alignment_multiple.sam`).  

**Setting for the script**:  
The program was given a time window of 24 hours, but it was not enought to create all 36 .sam files (R13 (the last one was missing). Hence the program was started again with 24 hours, only to create the .sam files of the last condition (reoxygenation (R8, R9, R10, R11, R12, R13)). Therefore, two slurm.out files are available. The program was started with ntasks=1 and 16 cpus per task. The CPU was used to 83 - 86% and out of the 16GB memory only 23% (3.7 GB) were used. When running the script for the next time, memory could be downsized to 8GB. 

**Outcome**:  
The outcome files were used as input in the SAMtools module. Since each of the .sam files occupied ca. 50 GB of storage space, non of the .sam files were kept. The converted .bam files were ket for further analysis. The alignment summaries of each individual sample can be found in the `/cluster/project/nn8014k/magdalena/program_HISAT2/cc_alignment_summary_single/` directory. 



### B) Multiple samples 
For the alignment the RNA transcripts of **3 conditions** (normoxia, anoxia, reogygenation) with each **6 biological samples** and **2 transcripts** (forward (R1) and reverse (R2)) were added (**total 36 sequences**). 

**Slurm file**:  
`slurm_hisat2_alignment.sh`

**Basic command**:  
`hisat2 [options]* -x <hisat2-idx> {-1 <m1> -2 <m2> } [-S <hit>]`

input: 
- `-p`: program was started in parallel on 16 cores. **Launch NTHREADS parallel search threads (default: 1). Threads will run on separate processors/cores and synchronize when parsing reads and outputting alignments. Searching for alignments is highly parallel, and speedup is close to linear. Increasing -p increases HISAT2’s memory footprint**
- `--reorder`: Guarantees that output SAM records are printed in an order corresponding to the order of the reads in the original input file, even when -p is set greater than 1. Specifying --reorder and setting -p greater than 1 causes HISAT2 to run somewhat slower and use somewhat more memory then if --reorder were not specified. Has no effect if -p is set to 1, since output order will naturally correspond to input order in that case.
- `--dta/--downstream-transcriptome-assembly`: **Report alignments tailored for transcript assemblers including StringTie. With this option, HISAT2 requires longer anchor lengths for de novo discovery of splice sites. This leads to fewer alignments with short-anchors, which helps transcript assemblers improve significantly in computation and memory usage.**
- `--summary-file` to receive an `alignment_summary_file` (this information is also included in the .out file); Print alignment summary to this file.
- hisat2 index files: /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index (8 files); -x <hisat2-idx> = The basename of the index for the reference genome.
- `-1`and `-2` describe the forward (R1) and reverse (R2) transcript sequence. Multiple sequences can be added by komma seperation. The `.fq` files don't have to be unzipped. (directory: /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/ )
- `-S` specifies the output file. Is in this case a `.sam` file (`crucian_carp_alignment_multiple.sam`).  

**Setting for the script**:  
The program was given a time window of 15 hours, but it completed after 5:35 h. The memory of 16 GB were used. 43% of the memory (6.8 GB) were used. In the first tries the memory was exceeded (I used 5GB), hence I would leave the setting as it is. The program was started with ntasks = 1 and in parallel (cpus-per-task=16). The CPU efficiency was with 99.83% very high and should be kept as it is. 

**Outcome**:  
`slurm-2022_11_02_alignment.out` &rarr; only one R1 and R2 aligned. 

The programm was run with 1 (ntasks), 16 cpus-per-task and a memory of 8GB. The CPU Efficiency was 98% and 46% of the memory were used. The program finished after 16 minutes. By adding the option `--reorder` a bit more memory capacity was needed for the alignment. The paired end input files were fastq (fq) files in a zipped format (unzipping them was not needed to let the program run). As an output the SAM (Sequence Alignment Map - is a human readable file) file (`crucian_carp_alignment.sam`) was created. 


The output file `crucian_carp_alignment_multiple.sam` is with 819 GB a very large file and is stored in the `/cluster/projects/nn8014k/magdalena/program_HISAT2` directory. Since the `dusage` was exceeded during the alignment of the single samples the output file was downloaded to the backup HDD and deleted from the project directory on the saga sever. 










