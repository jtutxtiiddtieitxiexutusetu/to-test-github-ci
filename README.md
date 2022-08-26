## Introduction

This is a sample Nest.js application that is packaged as a docker image.

This repository is created in a way that Nest.js development will be done inside a docker container and isolated from the real hardware. This ensures development consistency.

## Development

The `do_dev.sh` file will create a dev image and exec bash inside of it, so you will get an interactive shell directly into the `source` directory.

To start developing just hit the following commands

```bash
./do_dev.sh ;
# then when inside the dev container:
nest new . ;
# configure it the way you like. then:
yarn start:dev ;
# now you can develop your Nest.js app as you would do normally.
```

## Production

This repository is fully compatible with CI/CD workloads.

The `do_build_push.sh` file will build a production image of your Nest.js app.

You just have to edit the last part of `do_build_push.sh` to instruct it on how to push the image to a container registry (depends on the CI you are using), Then you just have to configure a CI for this project and instruct it to start the `do_build_push.sh` file when this repository is pushed there.

## License

GPL