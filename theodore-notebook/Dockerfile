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

USER $NB_USER
ENV ORBKITPATH /opt/conda/lib/python2.7/site-packages
RUN wget https://sourceforge.net/projects/theodore-qc/files/TheoDORE_1.7.2.tgz/download \
 && tar -xf download \
 && chown 1000:100 TheoDORE_1.7.2 \
 && rm -rf download work \
 && git clone https://github.com/orbkit/orbkit.git \
 && mv orbkit $ORBKITPATH/orbkit \
 && cd $ORBKITPATH/orbkit \
 && python setup.py build_ext --inplace clean \
 && echo './orbkit' > ../orbkit.pth \
 && echo '~/TheoDORE_1.7.2/bin' > ../theodore.pth \
 && echo '~/TheoDORE_1.7.2/lib' >> ../theodore.pth \ 
 && echo 'source TheoDORE_1.7.2/setpaths.bash' >> ~/.rcbash

USER $NB_USER