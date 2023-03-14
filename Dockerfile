FROM runpod/stable-diffusion:web-automatic-1.5.16

SHELL ["/bin/bash", "-c"]

ENV PATH="${PATH}:/workspace/stable-diffusion-webui/venv/bin"

WORKDIR /

RUN rm /workspace/v1-5-pruned-emaonly.ckpt

ADD ./models/base.safetensors /workspace/stable-diffusion-webui/models/Stable-diffusion/base.safetensors
ADD ./models/Lora/ /workspace/stable-diffusion-webui/models/Lora/
ADD ./models/VAE/ /workspace/stable-diffusion-webui/models/VAE/


ADD relauncher.py .
ADD webui-user.sh .
ADD start.sh /start.sh
RUN chmod a+x /start.sh

SHELL ["/bin/bash", "--login", "-c"]
CMD [ "/start.sh" ]