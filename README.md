## A Docker Container for HBase

A Docker container for a HBase. The current version installs HBase 1.0.1.

### Building the image

```
docker build -t hbase-container .
```

### Running the image

```
docker run -p 80:80 -td hbase-container:latest
```

