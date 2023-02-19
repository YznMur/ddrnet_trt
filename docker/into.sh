#!/bin/bash
docker exec -it ddrnet \
    /bin/bash -c "
    cd /home/ddrnet;
    nvidia-smi;
    /bin/bash"