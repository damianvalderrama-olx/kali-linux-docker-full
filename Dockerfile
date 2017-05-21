FROM kalilinux/kali-linux-docker

# Update and install Kali tooks. -y flag for non-interactive process
RUN apt-get update && apt-get install -y  kali-linux-all

# Set password for root
RUN echo 'root:changeme' | chpasswd

# Automatically ssh into the container once it is built
CMD ["/usr/sbin/sshd", "-D"]
