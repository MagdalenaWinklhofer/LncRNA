# CPAT
This program was easier to be installed in Ubuntu on the local computer than on the saga server. 

# Installation 
For the installation of the CPAT program a conda environment was created (`cpat`). Here the three packages (python=3.11.0, numpy and R) were installed from the `-c conda-forge` channel. 

After activating the environment follow the instructions in the manual: https://cpat.readthedocs.io/en/latest/ 

# Before using the program 
Activate the `cpat` conda environment. 

I downloaded the prebuild models for zebrafish, since we don't have any files that contain known coding/noncoding sequences to build our own regression model. (https://cpat.readthedocs.io/en/latest/#build-your-own-logit-model) (https://sourceforge.net/projects/rna-cpat/files/prebuilt_models/)

# Running the program 
Input: The extracted transcripts from Stringtie (extraction was performed with gffread --> take output of gffread). 

For more information see the script `cpat.sh`. 

The command is run in the terminal and takes usually up to 30 min. Make sure that the terminal is not closed in that time, since the command is run locally. 

## NOTE: I decided to take the sense results for further analysis, since they found more lncRNA hits. 

# Identification of common lncRNA 
I used the `output.ORF_prob.tsv` file, since this file contains all the information about all the identified transcripts. In the publication (Wang et al. 2013) they stated that the cut of for non-coding DNA is 0.364. Hence I filtered the dataframe for a coding potential lower than 0.364 and added the gene-ids. Afterwards the file was exported for the comparison. 

NOTE: script completed on 03.10.2024

