[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/reddit
ExecStart=/bin/bash -lc 'puma'
Restart=always
Environment="DATABASE_URL=${db_address}"


[Install]
WantedBy=multi-user.target
