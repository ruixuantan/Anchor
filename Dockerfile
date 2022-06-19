FROM ubuntu:20.04

ARG UID=1000
ARG GID=1000
ARG USERNAME=frodo
ARG PROJNAME=mordor
ARG HOMEPATH=/home/$USERNAME

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  software-properties-common sudo curl vim \
  && apt-get install build-essential -y \
  && apt-get install valgrind -y --no-install-recommends

RUN mkdir -p /etc/sudoers.d \
  && groupadd -g ${GID} -o ${USERNAME} \
  && useradd -d ${HOMEPATH} -u ${UID} -g ${GID} -m -s /bin/bash ${USERNAME} \
  && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/sudoers_${USERNAME}
USER ${USERNAME}

COPY . ${HOMEPATH}/${PROJNAME}
RUN sudo chown -R ${USERNAME}:${USERNAME} ${HOMEPATH}
WORKDIR ${HOMEPATH}/${PROJNAME}

CMD ["/bin/bash"]