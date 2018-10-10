FROM jupyter/scipy-notebook:1145fb1198b2

# Install nbgitpuller: https://github.com/jupyterhub/nbgitpuller
RUN pip install --quiet --no-cache-dir \
    'nbgitpuller' && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix

RUN conda install --quiet --yes \
    'qt' \
    'pyqt' && \
    conda clean -tipsy

COPY update-symbulate /usr/local/bin/