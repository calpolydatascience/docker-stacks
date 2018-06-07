FROM jupyter/tensorflow-notebook:latest

# Install System Utils
USER root
RUN apt update && apt -yq dist-upgrade \
 && apt install -yq --no-install-recommends \
    vim \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

# Install Tensorflow
RUN conda install --quiet --yes \
    'basemap' \
    'blaze=0.11*' \
    'odo=0.5*' \
    'altair=2.0*'\
    'vega_datasets' \
    'vega3' \
    #'mkl-service=1.1*' \
    'pymc3=3.3*' \
    #'pytorch=0.3*' \
    #'torchvision=0.2*' \
    'brewer2mpl=1.4*' \
    'lxml=4.2*' \
    'plotly=2.5*' \
    'scikit-image=0.14*' \
 && conda clean -tipsy \
 && pip install ipythonblocks vdom \
 && jupyter labextension install "@jupyterlab/geojson-extension" \
 && jupyter labextension install "@jupyterlab/plotly-extension" \
 && npm cache clean --force \
 && rm -rf $CONDA_DIR/share/jupyter/lab/staging \
 && rm -rf /home/$NB_USER/.cache/yarn \
 && rm -rf /home/$NB_USER/.node-gyp \
 && fix-permissions $CONDA_DIR \
 && fix-permissions /home/$NB_USER

USER $NB_USER
