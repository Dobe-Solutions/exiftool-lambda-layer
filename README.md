# exiftool-lambda-layer

A simple build script to create a Lambda layer for [ExifTool](https://exiftool.org/). In order to run the build `Docker` needs to be installed on your build system.

To create the Lambda layer artifact run simply:

```
./run.sh
```

It will create a pre-tested zip file. The zip file can easily integrated in IaC pipelines or for manual use.
