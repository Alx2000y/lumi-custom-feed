#!/bin/sh

cd /overlay/upper/
tar -cvpzf /tmp/lumi_backup.tar.gz -C /overlay/upper/ /overlay/upper/ --exclude='/opt/*'