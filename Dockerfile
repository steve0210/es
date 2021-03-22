FROM centos:7.8.2003

RUN yum update -y \
  && yum install -y \
  ca-certificates \
  gnupg2 \
  procps \
  curl \
  gcc \
  gcc-c++ \
  glibc-devel \
  make \
  which \
  wget \
  less \
  libcurl-devel \
  && yum clean all

RUN command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.2.2"

WORKDIR /tmp
RUN useradd -ms /bin/bash -G rvm,disk rails \
  && mkdir -p /home/rails/tmp

COPY Gemfile* /home/rails/tmp/
COPY scripts/bundle.sh /tmp/
RUN chown -R rails:rails /home/rails && /tmp/bundle.sh

WORKDIR /var/www/es/current
COPY . .
RUN chown -R rails:rails /var/www/es
