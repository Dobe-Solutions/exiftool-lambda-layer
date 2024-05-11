# exiftool-lambda-layer

A simple build script to create a Lambda layer for [ExifTool](https://exiftool.org/). In order to run the build, [Docker](https://www.docker.com/) needs to be installed on your build system.

To create the Lambda layer artifact run simply:

```
./run.sh
```

It will create a pre-tested zip file. The zip file can easily integrated in IaC pipelines or for manual use.

If you want to use pre-defined configurations from [ExifTool](https://exiftool.org/), use the `--config` argument and specify the names of the configuration files you want to include:

```
# copies all configuration files into the layer
./run.sh --config=all
# copies specified configuration files into the layer
./run.sh --config=time_zone,nksc
```

The list of possible options can be found [here](https://github.com/exiftool/exiftool/tree/master/config_files). Please be aware that there might be differences when an older version is being built.
