FROM jupyter/base-notebook:latest

# from https://github.com/plotly/plotly.py#installation
RUN export NODE_OPTIONS=--max-old-space-size=4096; \
    conda install --quiet --yes -c plotly plotly=3.6.1 \
    && conda install --quiet --yes jupyterlab=0.35 "ipywidgets>=7.2" \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.38 --no-build \
    && jupyter labextension install plotlywidget@0.7.1 --no-build \
    && jupyter labextension install @jupyterlab/plotly-extension@0.18.1 --no-build \
    && jupyter labextension install jupyterlab-chart-editor@1.0 --no-build \
    && jupyter lab build \
    && conda install --quiet --yes -c plotly plotly-orca psutil \
    && rm -r .cache
