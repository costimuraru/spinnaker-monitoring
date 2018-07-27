cat > /etc/systemd/system/spinnaker-monitoring.service <<EOF
[Unit]
Description=Spinnaker Monitoring Daemon
After=network.target

[Service]
Type=simple
User=spinnaker
WorkingDirectory=/home/spinnaker
ExecStart=/opt/spinnaker-monitoring/bin/spinnaker-monitoring.sh monitor
Restart=on-failure # or always, on-abort, etc

[Install]
WantedBy=multi-user.target
EOF
