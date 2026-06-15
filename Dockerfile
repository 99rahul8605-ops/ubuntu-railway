FROM ubuntu:26.04

RUN apt-get update && apt-get install -y \
    openssh-server sudo curl wget nano git python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# Root password set karo
RUN echo 'root:Admin@1234' | chpasswd
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
