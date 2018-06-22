FROM jupyter/minimal-notebook:latest

USER root
RUN apt update && apt -yq dist-upgrade \
 && apt install -yq --no-install-recommends \
    vim \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

COPY environment.yml /tmp/environment.yml
RUN  conda env update -n=base -f /tmp/environment.yml \
 && conda clean -tipsy \
 && fix-permissions $CONDA_DIR \
 && fix-permissions /home/$NB_USER

COPY install.sh $HOME/install.sh
RUN $HOME/install.sh

USER $NB_USER