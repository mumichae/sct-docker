conda create -y -n scIB_env python=3.7
conda activate scIB_env
conda config --append channels conda-forge
conda config --append channels bioconda
conda install -y --file requirements.txt
pip install --requirement requirements_pip.txt

CURRENT_DIR=$(pwd)
cd $CONDA_PREFIX
conda deactivate
mkdir -p etc/conda/activate.d/
cp $CURRENT_DIR/conda_vars/activate_env_vars.sh etc/conda/activate.d/env_vars.sh
mkdir -p etc/conda/deactivate.d/
cp $CURRENT_DIR/conda_vars/deactivate_env_vars.sh etc/conda/deactivate.d/env_vars.sh
cd $CURRENT_DIR

conda activate scIB_env
Rscript rpackages.R requirements_R.txt

