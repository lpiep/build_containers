#!/bin/bash

#install tensorflow
apt-get update
apt-get install -y python3-pip

cat > tensorflow_dep.txt << EOF
absl-py==0.13.0
astunparse==1.6.3
cachetools==4.2.2
certifi==2021.5.30
charset-normalizer==2.0.4
flatbuffers==1.12
gast==0.4.0
GDAL==3.0.4
google-auth==1.34.0
google-auth-oauthlib==0.4.5
google-pasta==0.2.0
grpcio==1.34.1
h5py==3.1.0
idna==3.2
keras==2.6.0
Keras-Preprocessing==1.1.2
Markdown==3.3.4
mnist==0.2.2
numpy==1.19.2
oauthlib==3.1.1
opt-einsum==3.3.0
Pillow==8.3.1
portpicker==1.4.0
protobuf==3.17.3
pyasn1==0.4.8
pyasn1-modules==0.2.8
PyYAML==5.4.1
requests==2.26.0
requests-oauthlib==1.3.0
rsa==4.7.2
scipy==1.7.1
six==1.15.0
tensorboard==2.5.0
tensorboard-data-server==0.6.1
tensorboard-plugin-wit==1.8.0
tensorflow-estimator==2.5.0
termcolor==1.1.0
typing==3.7.4.3
typing-extensions==3.7.4.3
urllib3==1.26.6
wheel==0.35
Werkzeug==2.0.1
wrapt==1.12.1
EOF

pip install -r tensorflow_dep.txt --no-dependencies --force-reinstall
pip install intel-tensorflow==2.5.0  --no-dependencies --force-reinstall
python3 -m pip freeze

### tensorflow for R (via reticulate) ###
Rscript -e 'install.packages(c("reticulate", "tensorflow","keras"))' 

### torch for R (native) ###
Rscript -e 'install.packages(c("torch","luz","torchvision","torchdatasets"))'
Rscript -e 'torch::install_torch()' 

cd /