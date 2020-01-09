ARG BASE_NOTEBOOK_VERSION=7a0c7325e470
FROM jupyter/base-notebook:${BASE_NOTEBOOK_VERSION}

# from https://github.com/plotly/plotly.py#installation
RUN export NODE_OPTIONS=--max-old-space-size=4096; \
    conda install --quiet --yes -c plotly plotly=4.4.1 git=2.24.0 \
    && conda install --quiet --yes jupyterlab=1.2 "ipywidgets>=7.5" \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 --no-build \
    && jupyter labextension install plotlywidget@1.4.0 --no-build \
    && jupyter labextension install jupyterlab-plotly@1.4.0 --no-build \
    && jupyter labextension install jupyterlab-chart-editor --no-build \
    && jupyter lab build \
    && conda install --quiet --yes -c plotly plotly-orca psutil \
    && rm -r .cache
