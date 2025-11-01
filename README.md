## Usage

```shell
docker build -t arjix-aur/runner-image-arch:latest .
docker run -it runner-image-arch:latest bash
```

> [!CAUTION]
> For Security Reasons, this image strips the pacman keyring.
> This is because the same key would be spread to all containers of the same
> image, allowing for malicious actors to inject packages (via, for example,
> a man-in-the-middle). In order to create a lsign-key run `pacman-key
> --init` on the first execution, but be careful to not redistribute that
> key.
