# Dockerized VOTS 2024 code

## Download the data

To download the data, you need to install the `vot-toolkit` in any environment.
This step only needs to be done ONCE.
```shell
pip install vot-toolkit
```

Then download the data, run the following command (it will download 26 GiB of data)

```shell
vot evaluate swinb_dm_deaot_vots
```

This will download the data first and then attempts to evaluate. The evaluation part will likely fail / throw an error. It should not matter. The main thing is that you should have a `sequences` folder with all the challenge sequences from VOTS2023/2024.

## Run the tracker
