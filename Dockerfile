#FROM nvcr.io/nvidia/pytorch:21.04-py3
FROM cosign-base:latest
#FROM cm-tf-base:latest

#RUN pip install scikit-image


COPY . /opt/cosign
WORKDIR /opt/cosign

#RUN pip install -U torch
#RUN pip uninstall numpy -y
#RUN pip install numpy===1.22.0
#RUN pip install -e .
#RUN pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2
#RUN python -m pip install -U scikit-image
#RUN pip install matplotlib
#RUN pip install -r /opt/cosign/evaluations/requirements.txt
#RUN pip install --upgrade "protobuf<=3.20.1"
#
#CMD ./launch.sh -t super_resolution -s sample_cc --control_net_ckpt /opt/cosign/control_net_ckpt/super_resolution.pt
CMD ./launch.sh -t inpainting -s sample_cc --control_net_ckpt /opt/cosign/control_net_ckpt/inpaint.pt --ts 0,17,39 --hard_constraint
#CMD sleep infinity
# inpainting 0 single step: 20.24 / 0.380
#python evaluations/evaluator.py /opt/cosign/datasets/lsun_val/VIRTUAL_lsun_bedroom256.npz /opt/cosign/logs/sample_cc-inpainting/samples_300x256x256x3.npz inpaint

