FROM jupyter/datascience-notebook:9f9e5ca8fe5a

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow=1.11*' \
    'keras=2.2*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER