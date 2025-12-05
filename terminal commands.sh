conda create -n aria2 -c conda-forge aria2

conda activate aria2

aria2c --max-connection-per-server=16 --split=16 --min-split-size=1M url
