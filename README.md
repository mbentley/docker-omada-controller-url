# mbentley/omada-controller-url

docker image to return URLs for the Omada Controller as a simple server response
based off of mbentley/alpine:latest

To pull this image:
`docker pull mbentley/omada-controller-url`

Example usage:

```
docker run -d \
 --name omada-controller-url \
 -p 9000:9000 \
 mbentley/omada-controller-url
```

Using the API:

```
$ curl -f "http://host.example.com:9000/hooks/omada_ver_to_url?omada-ver=5.9"
https://static.tp-link.com/upload/software/2023/202303/20230321/Omada_SDN_Controller_v5.9.31_Linux_x64.tar.gz
```

Live API example for Omada Controller installs:

```
$ curl -sf "https://omada-controller-url.mbentley.net/hooks/omada_ver_to_url?omada-ver=5.9"
https://static.tp-link.com/upload/software/2023/202303/20230321/Omada_SDN_Controller_v5.9.31_Linux_x64.tar.gz
```

For supported versions that the API will return, see the `omada_ver_to_url.sh` file.
