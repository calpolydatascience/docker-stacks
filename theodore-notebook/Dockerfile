FROM jupyter/minimal-notebook:latest

USER root
RUN apt update && apt -yq dist-upgrade \
 && apt install -yq --no-install-recommends \
    vim \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

COPY environment.yml /tmp/environment.yml
RUN  conda install -y nb_conda_kernels \
 && conda env create -f /tmp/environment.yml \
 && conda clean -tipsy \
 && fix-permissions $CONDA_DIR \
 && fix-permissions /home/$NB_USER

USER $NB_USER
RUN ["/bin/bash", "-c", "source activate theodore \
 && wget https://sourceforge.net/projects/theodore-qc/files/TheoDORE_1.7.2.tgz/download \
 && tar -xf download \
 && chown 1000:100 TheoDORE_1.7.2 \
 && git clone https://github.com/orbkit/orbkit.git \
 && export ORBKITPATH=$HOME/orbkit \
 && cd $ORBKITPATH \
 && python setup.py build_ext --inplace clean \
 && cd $HOME \
 && export PYTHONPATH=$PYHONPATH:$ORBKITPATH"]
# RUN ["/bin/bash", "-c", "source deactivate"]

USER $NB_USER