FROM calpolydatascience/datascience-notebook:0.1

USER root
RUN pip install nbzip \
 && jupyter serverextension enable --py nbzip --sys-prefix \
 && jupyter nbextension install --py --sys-prefix nbzip \
 && jupyter nbextension enable --py --sys-prefix nbzip \
 && fix-permissions $CONDA_DIR \
 && fix-permissions /home/$NB_USER

USER $NB_UID