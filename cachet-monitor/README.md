# Cachet-Monitor
Full credit goes to CastawayLabs for development and more information on this
'plugin' can be found on it's Github Page: [CastawayLabs/cachet-monitor]

The Dockerfile essentially builds an image for running cachet-monitor from the
official [Alpine] image and fetches the binary from the cachet-monitor [releases] page.

The config is copied into the Docker Image, so currently any changes to the [monitor.yml]
require a full rebuild of the image, unless you use volumes.
This isn't nice and I intend to find a more customisable solution.

I'd also like to make the image take advantage of Docker's ONBUILD features,
pulling from the [CastawayLabs/cachet-monitor] repo, compiling from source and
building an image from scratch rather than from [Alpine].

[CastawayLabs/cachet-monitor]: https://github.com/CastawayLabs/cachet-monitor
[Alpine]: https://hub.docker.com/_/alpine/
[releases]: https://github.com/CastawayLabs/cachet-monitor/releases
[monitor.yml]: ./monitor.yml
