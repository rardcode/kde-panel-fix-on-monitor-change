#!/bin/bash

USER_NAME="your_user"

/bin/su - $USER_NAME -c "/usr/bin/systemd-run --user --on-active=2 /home/$USER_NAME/.local/bin/restart-plasma.sh"
