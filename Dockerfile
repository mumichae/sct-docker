# Start from a core stack version
FROM jupyter/datascience-notebook:9f9e5ca8fe5a
# Install from requirements.txt file
COPY requirements.txt /tmp/
COPY requirements_pip.txt /tmp/
RUN conda config --append channels conda-forge
RUN conda config --append channels bioconda
RUN conda install --yes --file /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN pip install --requirement /tmp/requirements_pip.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN Rscript rpackages.R
