FROM centos:7
RUN yum install -y epel-release && yum install -y npm && yum clean all
COPY package.json /
RUN npm install
EXPOSE 8080
COPY index.js /
CMD ["node", "/index.js"]
