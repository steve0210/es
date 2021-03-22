FROM docker.elastic.co/beats/metricbeat:7.10.2
USER root
RUN groupadd docker --gid 990 && \
    usermod --append --group docker metricbeat
COPY config/metricbeat.docker.yml /usr/share/metricbeat/metricbeat.yml
RUN chown root:metricbeat /usr/share/metricbeat/metricbeat.yml
RUN chmod go-w /usr/share/metricbeat/metricbeat.yml
USER metricbeat
