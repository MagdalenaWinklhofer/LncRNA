# General information 

The RNA sequencing was performed 2015 and the data are stored in the directory: `/cluster/projects/nn8014k/rnaseq2015`. The sequences were tested with the FastQC program and it was determined that the sequences are trimmed and have a good quality. 

# Data import (13.03.2024)
Sequencing data were copied from the storage directory into the work directory `/cluster/work/users/magdalena/lncrna/1_sequences`. 

# Quality assessment (13.03.2024)
The quality was assessed with Fastqc and the script `1_fastqc_RNAseq2015.sh`. 

| Run complete | Sample  | R1   | R2  | Commend |
|---|---|---|---|--|
| Y  |  A1 |  X | X  | -  |
| Y  |  A2 |  X | X  | -  |
| Y  |  A3 | X  |  X |  - |
| Y  |  A4 | X  |  X |  - |
| Y  |  A5 | X  |  X |  - |
| Y  |  A6 | X  |  X |  - |
| Y  |  N14 |  X | X  | -  |
| Y  |  N15 |  X |  X |  Overrepresented sequences |
| Y  |  N16 |  X |  X |  Overrepresented sequences |
| Y  |  N17 |  X |  X |  Overrepresented sequences |
| Y  |  N18 |  X |  X |  - |
| Y  |  N21 |  X |  X |  - |
| Y  |  R10 |  X |  X |  - |
| Y  |  R11 |  X |  X | -  |
| Y  |  R12 |  X | X  | -  |
| Y  |  R13 |  X | X  | -  |
| Y  |  R8 | X  | X  | -  |
| Y  |  R9 | X  | X  | Overrepresented sequences  |

Nn adapter contamination. 
In all samples the "Per base sequence content" is noted as problematic, but since HISAT2 does soft clipping that should not be a plroblem for the alignment. Just check that the mapping efficiency is high!

Y= yes ; N= no

