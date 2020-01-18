export R_LIBS_USER="$HOME/R/Library"
conda create -y -n scIB_env python=3.7
conda activate scIB_env
conda config --append channels conda-forge
conda config --append channels bioconda
conda install -y --file requirements.txt
pip install --requirement requirements_pip.txt
Rscript rpackages.R requirements_R.txt

