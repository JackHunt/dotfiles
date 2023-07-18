#!/bin/bash

systemctl --user mask plasma-kwin_x11.service
systemctl --user daemon-reload
systemctl --user enable plasma-i3.service
