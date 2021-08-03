# ensembl-linuxbrew-docker
Linuxbrew docker to run test on new and updated formulas

## Writing a formula
First it is recommended to look at the cookbook: https://docs.brew.sh/Formula-Cookbook

Then you might want to copy a formula from homebrew-core or any Ensembl homebrew
repository which uses the same programming language than your software to avoid starting
from scratch

Now you can edit the file to suit your purpose!

## Testing on your machine with Docker
This is the recommended way as it allows more flexibility.

1. Pull the image:  
`docker pull thibauthourlier/ensembl-linuxbrew-docker:latest`
2. Add a mount point to the directory where the formula is
3. Start an interactive terminal and try to install your formula:  
`brew install <path to>/<amazing software>.rb`


## Testing with Singularity
If you don't have access to Docker but Singularity, you need to work in a sandbox
to be able to have write access.

1. Pull the image in a Singularity sandbox:  
`singularity build --sandbox <path to>/linxuxbrew docker://thibauthourlier/ensembl-linuxbrew-docker:latest`
2. Open an interacitve terminal and mount the directory where the formula is:  
`singularity shell --writable -B <path to>/homebrew-ensembl:/tmp/formulas <path to>/linxuxbrew`
3. Try to install the formula:  
`brew install <path to>/<amazing software>.rb`

## Updating the Linuxbrew version
Whenever the Ensembl environment uses a newer version of Linuxbrew, the Dockerfile needs to be updated
otherwise continuous tests and user tests might fail
