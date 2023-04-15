FROM prom/prometheus
ADD prometheus.yaml /etc/prometheus/prometheus.yml
EXPOSE 9090/tcp
