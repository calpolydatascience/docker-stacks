FROM r-notebook:3.5

USER root

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		libapparmor1 \
		libcurl4-openssl-dev \
		libedit2 \
		libssl-dev  \
		libssl1.0.0 \
		lsb-release \
		psmisc \
		;

#You can use rsession from rstudio's desktop package as well.
ENV RSTUDIO_PKG=rstudio-server-1.1.456-amd64.deb

RUN wget -q http://download2.rstudio.org/${RSTUDIO_PKG}
RUN dpkg -i ${RSTUDIO_PKG}
RUN rm ${RSTUDIO_PKG}

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    ## RStudio wants an /etc/R, will populate from $R_HOME/etc
    && mkdir -p /etc/R \
    ## Write config files in $R_HOME/etc
    && echo "PATH=${PATH}" >> /opt/conda/lib/R/etc/Renviron \
	&&  echo 'rsession-which-r=/opt/conda/bin/R' >> /etc/rstudio/rserver.conf

RUN git clone https://github.com/jupyterhub/nbserverproxy /opt/nbserverproxy
RUN pip install -e /opt/nbserverproxy

USER $NB_USER

# RUN pip install git+https://github.com/jupyterhub/nbserverproxy.git
RUN jupyter serverextension enable --sys-prefix --py nbserverproxy

RUN pip install git+https://github.com/jupyterhub/nbrsessionproxy.git
RUN jupyter serverextension enable --sys-prefix --py nbrsessionproxy
RUN jupyter nbextension install    --sys-prefix --py nbrsessionproxy
RUN jupyter nbextension enable     --sys-prefix --py nbrsessionproxy
RUN jupyter serverextension enable --py nbrsessionproxy
#RUN jupyter labextension link /opt/nbrsessionproxy/jupyterlab-rsessionproxy

# The desktop package uses /usr/lib/rstudio/bin
ENV PATH="${PATH}:/usr/lib/rstudio-server/bin"
ENV LD_LIBRARY_PATH="/usr/lib/R/lib:/lib:/usr/lib/x86_64-linux-gnu:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server:/opt/conda/lib/R/lib"

