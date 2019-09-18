# Start from a core stack version
FROM jupyter/datascience-notebook:9f9e5ca8fe5a
# Install from requirements.txt file
USER root
RUN apt-get update
RUN apt-get install -y openssh-client
COPY requirements.txt /tmp/
COPY requirements_pip.txt /tmp/
COPY rpackages.R /tmp/
RUN mkdir /tmp/trvae
RUN mkdir /tmp/Benchmarking_data_integration
COPY trvae/ /tmp/trvae/
COPY Benchmarking_data_integration/ /tmp/Benchmarking_data_integration/
WORKDIR /tmp
RUN conda config --append channels conda-forge
RUN conda config --append channels bioconda
RUN conda install --yes --file /tmp/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN pip install --requirement /tmp/requirements_pip.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN Rscript /tmp/rpackages.R
