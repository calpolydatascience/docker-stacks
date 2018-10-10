FROM jupyter/scipy-notebook:1145fb1198b2

# Install symbulate which does not have a pip or conda package at the moment
RUN cd /tmp && \
    git clone https://github.com/dlsun/symbulate && \
    cd symbulate && \
    python setup.py install && \
    cd && \
    rm -rf /tmp/symbulate && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Install nbgitpuller: https://github.com/jupyterhub/nbgitpuller
RUN pip install --quiet --no-cache-dir \
    'nbgitpuller' && \
    jupyter serverextension enable --py nbgitpuller --sys-prefix