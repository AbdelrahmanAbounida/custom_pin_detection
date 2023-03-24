FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
FROM python:3.7-slim

RUN apt-get update -y && apt-get install -y python3-pip python3-dev libpq-dev build-essential libsm6 libxext6 libxrender-dev


RUN \
	apt-get install -y \
	wget \
	unzip \
	ffmpeg \ 
	git

COPY . /customModel
WORKDIR /customModel

RUN pip install --no-cache-dir -r requirements.txt


ENTRYPOINT ["python", "train.py"]

CMD [""]

# CMD ["--weights yolov7.pt",  "--data data/custom.yaml " , "--device 0" , "--workers 8",  "--batch-size 8",  "--cfg cfg/training/custom_cfg.yaml",  "--name yolo7",  "--epochs 10"]


