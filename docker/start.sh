#!/bin/bash

cd "$(dirname "$0")"
cd ..

workspace_dir=$PWD


docker run -it -d --rm \
    --gpus '"device=0"' \
    --net host \
    -e "NVIDIA_DRIVER_CAPABILITIES=all" \
    -e "DISPLAY" \
    -e "QT_X11_NO_MITSHM=1" \
    --shm-size="25g" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name ddrnet \
    -v $workspace_dir/:/home/ddrnet:rw \
   x64trt/ddrnet:latest

# docker exec -it fmf_nusc \
#     /bin/bash -c "export PYTHONPATH=\"${PYTHONPATH}:/home/trainer/fmf/FMF\";
#     export PYTHONPATH=\"${PYTHONPATH}:/home/trainer/fmf/nuscenes-devkit/python-sdk\";
#     cd /home/trainer/fmf/FMF;
#     bash setup.sh;"


    #-v /datasets/nuScenes/:/home/trainer/Segformer/data/nuScenes:rw \
