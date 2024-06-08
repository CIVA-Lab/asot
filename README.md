# Dockerized VOTS 2024 code

## Download the data

To download the data, you need to install the `vot-toolkit` in any environment.
This step only needs to be done ONCE.
```shell
pip install vot-toolkit
```

Then download the data, run the following command (it will download 26 GiB of data)

```shell
vot initialize vot2024/main
```

This will download the data. The main thing is that you should have a `sequences` folder with all the challenge sequences from VOTS2023/2024.

Create a directory to store results:
```shell
mkdir results
```

## Run the tracker

1. **Build the Docker Image**:
```bash
docker build -t tracker-image .
```

2. **Run the Docker Container**:
Make sure the `results` and `sequences` directories exist on your host machine before running this command. This will also ensure that the container can write outputs to these directories.

```bash
docker run -v $(pwd)/results:/app/results -v $(pwd)/sequences:/app/sequences tracker-image
```

This command mounts the `results` and `sequences` directories from your current directory to the container and runs the default command specified in the Dockerfile.