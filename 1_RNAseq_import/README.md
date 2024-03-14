# General information 

The RNA sequencing was performed 2015 and the data are stored in the directory: `/cluster/projects/nn8014k/rnaseq2015`. The sequences were tested with the FastQC program and it was determined that the sequences are trimmed and have a good quality. 

# Data import (13.03.2024)
Sequencing data were copied from the storage directory into the work directory `/cluster/work/users/magdalena/lncrna/1_sequences`. 

# Quality assessment (13.03.2024)
The quality was assessed with Fastqc and the script `1_fastqc_RNAseq2015.sh`. 

| Run complete | Sample  | R1   | R2  | Commend |
|---|---|---|---|--|
| N  |  A1 |  X | X  | -  |
| N  |  A2 |  X | X  | -  |
| N  |  A3 | X  |  X |  - |
| N  |  A4 | X  |  X |  - |
| N  |  A5 | X  |  X |  - |
| N  |  A6 | X  |  X |  - |
| N  |  N14 |  X | X  | -  |
| N  |  N15 |  X |  X |  Overrepresented sequences |
| N  |  N16 |  X |  X |  Overrepresented sequences |
| N  |  N17 |  X |  X |  Overrepresented sequences |
| N  |  N18 |  X |  X |  - |
| N  |  N21 |  X |  X |  - |
| N  |  R10 |  X |  X |  - |
| N  |  R11 |  X |  X | -  |
| N  |  R12 |  X | X  | -  |
| N  |  R13 |  X | X  | -  |
| N  |  R8 | X  | X  | -  |
| N  |  R9 | X  | X  | Overrepresented sequences  |

Nn adapter contamination. 
In all samples the "Per base sequence content" is noted as problematic, but since HISAT2 does soft clipping that should not be a plroblem for the alignment. Just check that the mapping efficiency is high!

Y= yes ; N= no

