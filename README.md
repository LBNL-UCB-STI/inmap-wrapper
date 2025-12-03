### Docker Installation Guide

#### Prerequisites

* Administrator/root privileges on your machine
* 64-bit processor with virtualization support (for Windows/macOS)
* At least 4GB RAM (8GB+ recommended)
* Internet connection

#### Installation links 

Windows - [Install Docker Desktop on Windows](https://docs.docker.com/desktop/setup/install/windows-install)

MAC OS - [Install Docker Desktop on Mac](https://docs.docker.com/desktop/setup/install/mac-install/)

Linux - [Install Docker Desktop on Linux](https://docs.docker.com/desktop/setup/install/linux/)


#### Verifying the docker installation

To verify installation of docker run following commands:

```
docker pull hello-world:latest
docker run --rm hello-world:latest
```

The output should contain ‘Hello from Docker!’ text and a short explanation how it works.


### INMAP

InMAP documentation is located on [spatialmodel/inmap](https://github.com/spatialmodel/inmap). 

Data code run trials [are located here](https://docs.google.com/spreadsheets/d/1nC7L08OsDM_PD99sLf-CWUPrJLUNj-sh6KDkZc9z1UQ/edit?gid=1975391811#gid=1975391811)


#### Quick Start Guide

Pull image

```
docker pull haitamlaarabi/inmap:latest
```


Run container

```
docker run --rm \
  -v <path to evaldata>:/evaldata \
  -e evaldata=/evaldata \
  -w /evaldata \
  haitamlaarabi/inmap:latest \
  run steady --config=/evaldata/<path to the config.toml>
```

Notes:

* Setting variable `-e evaldata=/evaldata` required if the variable exist in the config (original config example contains it - [spatialmodel/inmap/blob/master/eval/nei2005Config.toml](https://github.com/spatialmodel/inmap/blob/master/eval/nei2005Config.toml))
* Setting `-w /evaldata` required if output files in config specified with relative paths (i.e. default path in config example "nei2005/2005nei_output_${InMAPRunType}.shp")
* Output folder specified in config should be created before InMAP execution
* `<path to evaldata>` needs to be replaced with a real paths, the path connects your local data folder to the container
* Linux/Mac example: `/home/username/projects/data`
* Windows example: `C:\Users\Username\Projects\Data`

Your input files go in the mounted folders, results appear in the output location, according to configuration.


#### Example

* Download [evaldata_v1.6.1.zip](https://zenodo.org/records/3403934/files/evaldata_v1.6.1.zip?download=1) from [zenodo.org/records/3403934](https://zenodo.org/records/3403934).
* Unzip evaldata archive to user home folder (`/home/username/evaldata_v1.6.1`)
* Create output folder with name `out` inside evaldata (`/home/username/evaldata_v1.6.1/out`)
* Download nei2005Config.toml config file and put it inside evaldata folder (`/home/username/evaldata_v1.6.1/nei2005Config.toml`)
* Execute:
```
docker run --rm \
	-v $(realpath evaldata_v1.6.1):/evaldata \
	-e evaldata=/evaldata \
	-w /evaldata \
	haitamlaarabi/inmap:latest \
	run steady --config=/evaldata/nei2005Config.toml
```


#### Build the image

To build the inmap docker image: 

```
docker build . -t <inmap image name>
```


