# ASSA 

## Installation
The assa program was installed locally in the project directory .program_assa and the corresponding dependecies were installed in a conda envrionment. 

1) change to `/cluster/projects/nn8014k/magdalena/.program_assa`

2) execute:  
mkdir -p /cluster/projects/nn8014k/magdalena/.program_assa/.apptainer
export APPTAINER_TMPDIR=/cluster/projects/nn8014k/magdalena/.program_assa/.apptainer
export APPTAINER_CACHEDIR=/cluster/projects/nn8014k/magdalena/.program_assa/.apptainer

3) get image (was built by Sylabs): 
apptainer remote add --no-login SylabsCloud cloud.sylabs.io 
apptainer remote use SylabsCloud
apptainer pull --arch amd64 library://j34ni/nris/assa:1.0.1
apptainer shell assa_1.0.1.sif 



## Running

Make sure that the directories used in the command are bound to the container. 


## More information
`https://apptainer.org/docs/user/main/introduction.html`

