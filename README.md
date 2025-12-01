# InMAP-BREATHE
InMAP version and workflow used to generate NOx source–receptor matrices.

# InMAP

InMAP documentation is located at:  
https://github.com/spatialmodel/inmap

---

## **Prerequisites**
- Install **Docker** from https://www.docker.com

---

## **Quick Start Guide**

### **1. Pull the image**
```bash
docker pull irishwithaxe/inmap:1.6.1

docker run --rm \
  -v <path to evaldata>:/evaldata \
  -e evaldata=/evaldata \
  -w /evaldata \
  irishwithaxe/inmap:1.6.1 \
  run steady --config=/evaldata/<path to the config.toml>

## Parameter Notes
- Setting variable `-e evaldata=/evaldata` is required if the variable is referenced in your config  
  (the original config example contains it).
- The output folder specified in the config must be created before running InMAP.

## Path Notes
Replace `<path to evaldata>` and `<path to output>` with actual local paths.  
These paths connect your local data directories to the Docker container.

Examples:
- Linux / macOS: `/home/username/projects/data`
- Windows: `C:\Users\Username\Projects\Data`

Your input files go into the mounted folders.  
Results will appear in the output directory defined in your configuration.
