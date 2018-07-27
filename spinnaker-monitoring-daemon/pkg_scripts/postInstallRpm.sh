cat > /etc/systemd/system/spinnaker-monitoring.service <<EOF
[Unit]
Description=Spinnaker Monitoring Daemon
After=network.target

[Service]
Type=simple
User=spinnaker
WorkingDirectory=/home/spinnaker
ExecStart=/opt/spinnaker-monitoring/bin/spinnaker-monitoring.sh monitor
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload

sh /opt/spinnaker-monitoring/third_party/prometheus/install.sh --client_only
