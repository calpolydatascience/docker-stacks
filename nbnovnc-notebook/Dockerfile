FROM jupyter/minimal-notebook

USER root

# Install all OS dependencies for fully functional notebook server
RUN apt-get update && apt-get install -yq --no-install-recommends \
    xvfb \
    x11vnc \
    novnc \
    websockify && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install git+https://github.com/ryanlovett/nbnovnc circus && \
    jupyter serverextension enable  --py --sys-prefix nbserverproxy && \
    jupyter serverextension enable  --py --sys-prefix nbnovnc && \
    jupyter nbextension     install --py --sys-prefix nbnovnc && \
    jupyter nbextension     enable  --py --sys-prefix nbnovnc

USER root