# Start from a core stack version
#FROM jupyter/datascience-notebook:9f9e5ca8fe5a
FROM continuumio/miniconda3
# Install from requirements.txt file
#USER root
RUN apt-get update && apt-get -y install gcc
COPY requirements.txt /tmp/
COPY requirements_pip.txt /tmp/
COPY rpackages.R /tmp/
COPY requirements_R.txt /tmp/
RUN mkdir /tmp/scib
COPY scib/ /tmp/scib/
WORKDIR /tmp
RUN conda config --append channels conda-forge
RUN conda config --append channels bioconda
RUN conda install --yes --file /tmp/requirements.txt

RUN pip install --requirement /tmp/requirements_pip.txt

RUN Rscript /tmp/rpackages.R requirements_R.txt
