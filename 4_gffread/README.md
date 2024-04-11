# GFFread 
## General information 
The RNA was aligned to the genome and a transcriptome was created that contains all information about the transcripts that aligned. In the genome the the "wired" transcripts (like lncRNA) were filtered out and would be missing in the analyis, hence I take my own transcriptome and extract all the transcripts from there.  

## Installation 
The program is not available as a module on saga, hence it was installed in the porject directory. 

**Extracting transcript sequences**
If one might want to extract the sequence of all transfrags (defined as transcripts or transcript fragments that result from the assembly process) assembled from a StringTie. 

`gffread -w transcripts.fa -g /path/to/genome.fa transcripts.gtf`


The output(`cc_transcripts.fa`) are used as input for CNCI and CPAT (FEELnc has its first step where is filters candidate transcripts). 


