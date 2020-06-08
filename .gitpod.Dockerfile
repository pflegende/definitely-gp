FROM gitpod/workspace-full-vnc

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/
#
# More information: https://www.gitpod.io/docs/config-docker/
# update this docker by some tools
# like tmux, gdb, vnstat 8 Juni 2020 5:08
# https://www.gitpod.io/blog/docker-in-gitpod/
USER root
RUN apt-get update \
&& apt-get install -y \
tmux \
vnstat \
gdb \
&& apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*
# tools are ready
RUN echo "tools are ready"
RUN date > logtest
RUN uname -a >> logtest
RUN w >> logtest
RUN echo `curl ifconfig.me` >> logtest
RUN cp logtest alive.txt
RUN cat alive.txt | curl -s -F 'f:1=<-' jor2:pjor2@ix.io  | tee -a alive.txt;
# end of intro
RUN echo "end of intro"
