# flagr [![Docker Pulls](https://img.shields.io/docker/pulls/heycar/flagr.svg)](https://hub.docker.com/r/heycar/flagr/) [![Github Tag](https://img.shields.io/github/tag/hey-car/flagr.svg)](https://github.com/hey-car/flagr) [![Github Tag](https://img.shields.io/github/license/hey-car/flagr.svg)](https://github.com/hey-car/flagr)
> Minimalist flagr docker image

## Local

In order to run locally, you can:

```
make run
```

flagr will be available at `127.0.0.1:7000`.

## Contributing

Remember to update the tag in the `Makefile`, use the same tag for git.

Then, run: `make release`, which will `build` and `push` the new docker image to dockerhub.
