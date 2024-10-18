# HISAT2/2.1.0-foss-2018b
This module is a fast alignment program to map sequencing reads (cleaned reads from RNA sequencing) against the reference genome (index). The module is available on the saga server (`HISAT2/2.2.1-gompi-2022a`). The module can be loaded and no further environmental conditions are needed. Since the newer version (2.1.0) is installed on the saga server, two additional scripts are needed. The newer version (2.1.0) does not contain the python scripts (`hisat2_extract_exons.py`,`hisat2_extract_splice_sites.py`). Those can be added by downloading the hisat2 program version **2.2.0** and adding the two scripts from your local mashine (via sftp) to the saga server. 

For more information about the program please consult the manual: https://daehwankimlab.github.io/hisat2/manual/

Further I found the YouTube video a helpful source: https://www.youtube.com/watch?v=WN4hulOIGVM


## 1) Build an index 
Since crucian carp is not a model organisms hisat2 does not provide a index file. For other organisms the hisat2 webpage should be consultet under the `Download` to make sure that no index is available. For this study a index had to be established from scratch. Therefore, exons and splice sites were extracted and an index build. 

Builing an index is done once. After that the index gets reused for other applications. 

### 1) Extracting exons and splicing sites from the GTF file.  (13.09.2024)
To prepare the genome data the `hisat2_buid` command was used to extract exons and splicing sites from the GFT file (`/cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/annotation/carcar_annotation_v5.gtf`). Two python scripts were used to get a .exon and .ss file. They were used as input in 2). 

**Slurm file**:  
`2_1_hisat2_build_indexer_1.sh`

**Basic command**:  
`python hisat2_SCRIPT.py <reference_in> <out.exon or out.ss>`

input: 
- the reference in was a gtf file 
- `-p`: Launch NTHREADS parallel build threads (default: 1).
- `--ss`: Note this option should be used with the following --exon option. 
Use hisat2_extract_splice_sites.py (in the HISAT2 package) to extract splice sites from a GTF file.
- `--exon`: Note this option should be used with the above --ss option. Use hisat2_extract_exons.py (in the HISAT2 package) to extract exons from a GTF file.

**Outcome**:  (information from previous runs)
The program was given a time window of 10 minutes, but the process was done after 5 minutes. Memory of 1 GB is sufficient, since the program only used 173 MG. The program was started with ntasks 1 and cpus-per-task=1. This can be kept for future runs since the CPU Efficiency was low with 7%. Setting are good for future runs. 

The output files are `extracted_exons.exon` for the extracted exons and `splice_sites.ss`for the extracted splice sites. These files were used as input for the builing process of the index itself. Both files are stored in the directory `/cluster/work/users/magdalena/lncrna/genome_index/`. 

### 2) Build the index itself (13.09.2024)
To build the index itself the output from the `slurm_hisat2_build_indexer_1.sh` script (=`extracted_exons.exon`,`splice_sites.ss`) were used as input. The information about the command can be found on the hisat2 webpage under HowTo. The option `Build HGFM (= Hierarchical Graph FM index) index with transcripts` was choosen. The .exon and .ss files were used as input and a 8 `NAME.ht2` files were created. From the reference genome (here the `ccar_genome_v1_262scaffolds_masked.fasta` file was taken from /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp) (.fasta file) 8 files with suffixes e.g. `NAME.1.ht2, 2.ht2` are created. All these files together constitute the index (=is all that is needed to align the reads to the reference; the .fasta file is no longer needed)

**Slurm file**:  
`2_2_hisat2_build_indexer_2.sh`

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
The output of this steps should be 8 files with suffixes e.g. `NAME.1.ht2, 2.ht2` (wrapper choose small index option by default). They can be found  in the directory `/cluster/work/users/magdalena/lncrna/genome_index`. All these files together constitute the index (=is all that is needed to align the reads to the reference; the .fasta file is no longer needed)


## 2) Alignment (13.09.2024)
During the alignment step the sequences RNA transcripts are aligned to the 8 index files. Since the transcripts were sequences in a paired end manor, the forward and the reverse sequences have to be added.  
The index files were used to create a SAM file during the alignment of RNA transcripts to the indexes. 

**Since the .sam files are large, the slurm script was started in the `/cluster/work/users/magdalena` driectory. When starting the script in another directory make sure that the suitable directories are given.**

For the alignment of the RNA transcripts as single samples each **biological sample (6)** of each **condition** (normoxia, anoxia, reoxygenation) with **2 transcripts** (forward (R1) and reverse (R2)) was used to create one sam file as an alignment. During this step a total of **18 .sam** files are created.  

**Slurm file**:  
`2_3_hisat2_alignment.sh`

**Basic command**:  
`hisat2 [options]* -x <hisat2-idx> {-1 <m1> -2 <m2> } [-S <hit>]`

input: 
- `-p`: program was started in parallel on 8 cores. **Launch NTHREADS parallel search threads (default: 1). Threads will run on separate processors/cores and synchronize when parsing reads and outputting alignments. Searching for alignments is highly parallel, and speedup is close to linear. Increasing -p increases HISAT2’s memory footprint**
- `--reorder`: Guarantees that output SAM records are printed in an order corresponding to the order of the reads in the original input file, even when -p is set greater than 1. Specifying --reorder and setting -p greater than 1 causes HISAT2 to run somewhat slower and use somewhat more memory then if --reorder were not specified. Has no effect if -p is set to 1, since output order will naturally correspond to input order in that case.
- `--dta/--downstream-transcriptome-assembly`: **Report alignments tailored for transcript assemblers including StringTie. With this option, HISAT2 requires longer anchor lengths for de novo discovery of splice sites. This leads to fewer alignments with short-anchors, which helps transcript assemblers improve significantly in computation and memory usage.**
- `--summary-file` to receive an `alignment_summary_file` (this information is also included in the .out file); Print alignment summary to this file.
- hisat2 index files: /cluster/projects/nn8014k/magdalena/program_HISAT2/index/crucian_carp_index (8 files); -x <hisat2-idx> = The basename of the index for the reference genome.
- `-1`and `-2` describe the forward (R1) and reverse (R2) transcript sequence. Multiple sequences can be added by komma seperation. The `.fq` files don't have to be unzipped. (directory: /cluster/projects/nn8014k/magdalena/transcripts/RNA_seq2015_zip/ )
- `-S` specifies the output file. Is in this case a `.sam` file (`crucian_carp_alignment_multiple.sam`).  

**Outcome**:  
The outcome files were used as input in the SAMtools module. Since each of the .sam files occupied ca. 50 GB of storage space, non of the .sam files were kept. The converted .bam files were ket for further analysis. 



**Mapping efficiency**: 
| Sample  | Mapping efficiency   | Slurm task id |
|---|---|---|
|  A1 | 97.78% | 0  |
|  A2 |  98.20% | 1  |
|  A3 | 98.27%  | 2  |
|  A4 | 98.20% | 3  |
|  A5 | 98.19%  | 4  |
|  A6 | 98.36% | 5  |
|  N14 | 98.38% | 6  |
|  N15 |  98.44% |  7 |
|  N16 |  98.40% | 8 |
|  N17 | 98.48% |  9 |
|  N18 |  98.25% | 10 |
|  N21 |  98.40% |  11 |
|  R10 | 98.35% | 12  |
|  R11 |  98.24% | 13  |
|  R12 |  98.27% | 14  |
|  R13 |  98.17% | 15  |
|  R8 | 98.38%  | 16  |
|  R9 | 98.34%  | 17  |



## 3) Converstion from .sam to .bam files (13.09.2024)
For StringTie the files have to be converted to bam files. This was done with the `2_4_samtools_convert_to_bam.sh` script. 

**SAMtools**  
The Samtool webpage can help with further information: https://www.htslib.org/doc/samtools-sort.html  
Further information can be found in the Hisat2 manual. 

The Samtool is a available module on the saga server (`SAMtools/1.15.1-GCC-11.3.0`) and was used to convert the SAM file received from the hisat2 alignment to be converted into a BAM file. 

## A) Single samples
**Slurm file**:  
`2_4_samtools_convert_to_bam.sh`

**Basic command**:  
`samtools sort [-l level] [-o out.bam] [-O format] [-@ threads] [in.sam]`

input: 
- `-l`: set the desired compression level for the final output file, ranging from 0 (uncompressed) or 1 (fastest but minimal compression) 
to 9 (best compression but slowest to write), similarly to gzip(1)s compression level setting.
- `-O`: write the final output as sam, bam, or cram.
- `-@`: set number of sorting and compression threads. By default, operation is single-threaded.



**Setting for the script**:  
Since the single .sam files were created in the `/cluster/work/users/magdalena/lncrna/2_hisat_alignment` directory, the slurm script to convert the .sam files to .bam files was also started there. The .bam files were created in the same directory. 

**Outcome**:  
`crucian_carp_alignment_*_out.bam`   
Information from previous runs :The program was given a time window of 10 hours, but it finished after 2:33 h. The program was given ntasks=1 and 16 cpus per task. The CPU efficiency was with 77% very good. 12 GB out of the 16 GB given were used (memory efficency: 80%). 


## 4) Merge all bam files into one transcript.bam file (02.10.2024)

To prohibit problems with the assembly of the transcriptome all bam files were merged into one big transcript.bam file with the `2_5_samtools_merge_bam.sh` script. 
