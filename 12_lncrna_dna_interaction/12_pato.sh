#!/bin/bash
#SBATCH --account=nn8014k
#SBATCH --job-name=pato_cc_lncRNA
#SBATCH --time=150:00:00
#SBATCH --mem=64G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

# conda environment and mosules
ml load  OpenMPI/4.1.5-GCC-12.3.0

# change directory to the program script 
cd /cluster/projects/nn8014k/magdalena/.program_pato/pato/target/gnu

# program command: 
OMP_NUM_THREADS=4 ./pato.release \
 -ss /cluster/projects/nn8014k/magdalena/script_LncRNA/12_lncrna_dna_interaction/cc_lncRNA_transcripts.fasta\
 -ds /cluster/projects/nn8014k/magdalena/genome/genome_crucian_carp/genome/ccar_genome_v1_262scaffolds_masked.fasta

# -l 20 -e 5 -fr on -mrl 7 -mrp 3 -dcs -of 1

- l 10 -e 20 - mamg 70

# l: min length of TFO, TTS or triplex
# e: maximal error-rate in % tolerated
# m: 
# mamg: minimum guanine content in TFO
  

  
  [ -m ],  [ --triplex-motifs MOTIF1,MOTIF2,... ]
  
  Specifies the motifs from the canonical triplex-formation rules to be 
  used when searching for TFOs in the third strand:
  R - the purine motif that permit guanines (G) and adenines (A).
  Y - the pyrimidine motif that permit cytosines (C) and thymines (T).
  M - the mixed motif, purine-pyrimdine, that permit guanines (G) and 
      thymines (T).
  P - parallel binding, i.e. motifs facilitating Hoogsten bonds;
      this covers the pyrimidine motif and the purine-pyrimidine motif
	  in parallel configuration.
  A - anti-parallel binding, i.e. motifs facilitating reverse Hoogsten 
      bonds; this covers the purine motif and the purine-pyrimidine motif
	  in anti-parallel configuration.
	  





  		

  [ -mf NUM],  [ --merge-features NUM ]

   merge overlapping features into a cluster and report the spanning region
   Only supported for TFO and TTS detection, respectively. 
   For TFO-TTS pairs (triplexes) features are merged in the TFO and TTS
   detection phase on default.
   Any merge is performed before duplicate detection (-dd).
  		
  [ -dd NUM],  [ --detect-duplicates NUM ]

  Indiates whether and how duplicates should be detected (default 0). 
  Choices are:
  
  0 = off         do not detect any duplicates
  1 = permissive  detect duplicates in feature space, 
                  e.g. AGGGAcGAGGA != AGGGAtGAGGA
  2 = strict      detect duplicates in target space, 
                  e.g. AGGGAcGAGGA == AGGGAtGAGGA == AGGGAYGAGGA
				
  Detection of duplicates requires all input sequence to be present in 
  memory at the same time, which will increase memory consumption 
  particularly when whole genomes are under investigation. 
  
  It is further advised to enable filtering of repeat and low complexity
  regions to minimize the workload during duplicate detection. 

  [ -ssd [on|off] ], [--same-sequence-duplicates [on|off] ]
  
  Whether to count a feature copy in the same sequence as duplicates 
  or not. (default off)
 























# close everything
ml purge 




