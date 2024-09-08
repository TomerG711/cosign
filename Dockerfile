#FROM nvcr.io/nvidia/pytorch:21.04-py3
FROM cosign-base:latest

#RUN pip install scikit-image


COPY . /opt/cosign
WORKDIR /opt/cosign

#RUN pip install -U torch
#RUN pip uninstall numpy -y
#RUN pip install numpy===1.22.0
#RUN pip install -e .
#RUN pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2
#RUN python -m pip install -U scikit-image

CMD ./launch.sh -t inpainting -s sample_cc --control_net_ckpt /opt/cosign/control_net_ckpt/super_resolution.pt
#  --ts 0,17,39 --hard_constraint
#CMD sleep infinity
