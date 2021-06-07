FROM centos:7

LABEL maintainer=mwsong@rockplace.co.kr \ 
      com.rock.ansible.is-beta="" \
      com.rock.ansible.is-production= \
      com.rock.ansible.version="0.0.1-beta" \
      com.rock.ansible.release-date="2021-04-22"

RUN yum -y update && \
    yum -y install python3-pip wget git libcurl-devel gcc python3-devel libxml2-devel && \
    yum clean all && \
    rm -rf /var/cache/yum

ADD requirements.txt /tmp/requirements.txt
ADD ansible.cfg /etc/ansible/ansible.cfg

COPY . /code

RUN pip3 install -r /tmp/requirements.txt && \ 
    ansible-galaxy collection install ovirt.ovirt

