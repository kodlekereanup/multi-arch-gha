FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

RUN echo "Container for $(uname -m) CPU architecture." > /opt/output

CMD cat /opt/output
