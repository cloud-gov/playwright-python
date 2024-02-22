ARG base_image

FROM ${base_image}

ENV NODE_VERSION v20.11.0

COPY . /playwright
WORKDIR /playwright

# Set to skip prompt during USG audit
ARG DEBIAN_FRONTEND=noninteractive

RUN /playwright/scripts/build.sh

ENTRYPOINT ["bash"]