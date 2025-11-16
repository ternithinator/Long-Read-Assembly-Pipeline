## I will be using conda to create seperate environments for all the tools that I shall be using

#### Instructions for miniconda installation

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

### After installing, close and reopen your terminal application or refresh it by running the following command:
source ~/miniconda3/bin/activate

### To initialize conda on all available shells, run the following command:
miniconda3/bin/./conda init --all

#### Making a new conda environment
conda create -n sratools -c bioconda sratools
# -n : to specify the name of the environment we want to create. Here and throughout I will name my environments exactly the same as the name of the tools that I will be using.
# -c : specifies the channel from which the tool needs to be downloaded. we need to specify the name of the tool after -c biconda, here it is sratools. If a particular tool is not availabe in bioconda try conda-forge.
# all conda environments will need to be installed in a similar fashion so that we can activate them and use when needed. I will not be repeating this line of code again but it need to be done for all tools.

#### Activate the environment
conda activate sratools

### download pacbio hifi reads using prefetch tool. Here I am using SRR33514231(pacbio hifi long reads) from https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1217107, https://doi.org/10.1101/2025.05.21.655187
prefetch SRR33514231 --max-size 50G
# set --max-size above the size of your sra file otherwise it wont be downloaded.

## One limitation I felt for prefetch tool is that it doesn't give you a progress bar to show how much has been downloaded. -p flag followed by a number, eg: -p 1 is supposed to give you a progress update every 1 minute but this did not work for me.

## One alternative to the above limitation is to use the wget command

# This will download the .sra file

#### Convert .sra file into a fastq file

fasterq-dump SRR33514231.sra

