![example workflow](https://github.com/dalmatialab/zeppelin/actions/workflows/main.yml/badge.svg)


# Supported tags and respective Dockerfile links

 - [0.8.0-rc-1](https://github.com/dalmatialab/zeppelin/blob/a1f0718a054a22fc1969b5f86f6b972e059c4e6f/Dockerfile)
 - [0.8.0-rc-2](https://github.com/dalmatialab/zeppelin/blob/dd245fa40a3b244a3a4ab4c9bb9b4cbd685c5ded/Dockerfile)

# What is Zeppelin ? 

[Apache Zeppelin](https://zeppelin.apache.org/) is web-based notebook that enables data-driven, interactive data analytics and collaborative documents with SQL, Scala and more.

<img src="https://github.com/dalmatialab/zeppelin/blob/7871e1cc4592b0e8bd3e7a46d257ad1ca0d83912/logo.png?raw=true" width="200" height="150">

# How to use this image

## Start Zeppelin instance

    $ docker run -d --name some-zeppelin -p 8080:8080 image:tag

Where:

 - `some-zeppelin` is name you want to assign to your container
 - `image` is Docker image name
 - `tag` is Docker image version

## Environment variables

**TZ**

This is *optional* variable. It specifes timezone. Default value is `Europe/Zagreb`.

## Ports

Zeppelin exposes user interface at port 8080.

## Volumes

To save Zeppelin data mount container path `/zeppelin/notebook` to host path.  

    $ -v some-host-path:/zeppelin/notebook

## NOTE

Default `username` and `password` to login is `admin`. To modify users in Dockerimage edit `users section` in `shiro.ini` file.  

This image comes with pre-installed zeppelin-leaflet package. To add multiple pre-installed packages modify helium.json.  
This image comes with Geomesa runtime jar to use with Spark.

# License

