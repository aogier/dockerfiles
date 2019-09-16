FROM jupyter/base-notebook:a330137134e7

# from https://github.com/plotly/plotly.py#installation
RUN export NODE_OPTIONS=--max-old-space-size=4096; \
    conda install --quiet --yes -c plotly plotly=4.1.1 \
    && conda install --quiet --yes jupyterlab=1.0 "ipywidgets>=7.5" \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build \
    && jupyter labextension install plotlywidget@1.1.1 --no-build \
    && jupyter labextension install jupyterlab-plotly@1.1.2 --no-build \
    && jupyter labextension install jupyterlab-chart-editor@1.2 --no-build \
    && jupyter lab build \
    && conda install --quiet --yes -c plotly plotly-orca psutil \
    && rm -r .cache
