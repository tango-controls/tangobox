FROM base-new:latest AS jupyter-build
RUN apt update && apt install -y git python-pip
RUN git clone https://github.com/nleclercq/jupyter-for-controls.git \
 && cd jupyter-for-controls/ \
 && git checkout 30fd1a917f979692e250dac6a51d478a90261c13
RUN cd jupyter-for-controls/jupytango/ \
 && python setup.py sdist

FROM base-new:latest

RUN apt update \
 && apt install -y \
    nodejs \
    node-gyp \
    libssl1.0-dev \
    npm \
    python3 \
    python3-six \
    python3-setuptools \
 && apt clean

RUN apt update \
 && apt install -y python-pip \
 && pip install \
    itango \
    PTable \
    ipywidgets \
    h5py \
    bokeh \
    scikit-image \
 && apt autoremove -y python-pip \
 && apt clean

RUN apt update \
 && apt install -y python3-pip \
 && pip3 install \
    jupyter==1.0.0 \
    jupyterlab==0.35.4 \
 && apt autoremove -y python3-pip \
 && apt clean

RUN /usr/local/bin/jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager@0.38.1

RUN /usr/local/bin/jupyter labextension install \
    jupyterlab_bokeh@0.6.3

COPY --from=jupyter-build \
    /jupyter-for-controls/jupytango/dist/* \
    /

RUN apt update \
 && apt install -y python-pip \
 && pip install /JupyTango-0.0.1.tar.gz  \
 && apt autoremove -y python-pip \
 && apt clean

RUN /usr/local/bin/ipython profile create jupytango

COPY resources/ipython_config.py \
    /root/.ipython/profile_jupytango/

COPY resources/kernel.json \
    /usr/local/share/jupyter/kernels/jupytango/

ENV JUPYTER_CONTEXT LAB

CMD ["sh", "-c", "/usr/local/bin/jupyter-lab \
    --ip=`hostname --short` \
    --no-browser \
    --allow-root"]
