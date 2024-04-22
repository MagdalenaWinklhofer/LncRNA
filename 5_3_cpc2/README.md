# CPC2 
CPC2 is a software that predicts lncRNAs on the basis of **.fasta** files. 

For more information consult the manual: http://cpc2.gao-lab.org/index.php

The installation was done by cloning the gitHub directory: https://github.com/gao-lab/CPC2_standalone

For this project the latest relased version was choosen and can be found: https://github.com/gao-lab/CPC2_standalone/releases/tag/v1.0.1

### Program setup
The source code (zip) was downloaded and transfered from the local computer to the saga server via sftp. The folder was unzipped and from then on the READ_ME_manual instructions were followed (skip step a. and start with b.). Make sure libsvm is unpacked (tar.gz) file. 


## Before program start
The program is a stand alone version and hence does not need a python environment. The program can be started immedieately. The program is stored in the directory (`.program_CPC2`), but the scripts and the output is stored in the (`script_CPC2`) directory. 


**Slurm file**:  
`slurm_cpc2_script.sh`

**Basic command**:  
`CPC2.py -i data/example.fa -o example_output`
(`CPC2_output_peptide.py -i data/example.fa -o example_output --ORF` &rarr; if the program should predict peptide sequences)


input: 
- i: input 
- o: output 

To the script no special settings could be added (since there are no setting available). 

**Outcome**:  
The output of the program is further filtered in the jupiter notebook, to prepare the data for comparison with CPA and FEELnc. 

The program took 21 minutes to complete. It was given 8 GB, 1 task and 1 CPU. 


