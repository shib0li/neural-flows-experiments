FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install git -y 

RUN /opt/conda/bin/conda install jupyter jupyter_server>=1.11.0 scipy -y \
  && /opt/conda/bin/pip install fire tqdm scikit-learn pandas matplotlib  \
  && /opt/conda/bin/pip install pyDOE sobol_seq \
  && /opt/conda/bin/pip install torchnet \
  && /opt/conda/bin/pip install torchdiffeq \
  && /opt/conda/bin/pip install sympy 

RUN jupyter notebook --generate-config

RUN echo "" > ~/.jupyter/jupyter_notebook_config.py  \
  && echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.allow_root=True" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.iopub_data_rate_limit = 10000000000" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.base_url='/GFGVEX/'" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.notebook_dir = '/workspace'" >> ~/.jupyter/jupyter_notebook_config.py \
  && echo "c.NotebookApp.password = u'sha1:069012a347ba:eb2713caaca33b015d1fab4da7f0b700d7e6b467'" >> ~/.jupyter/jupyter_notebook_config.py

