#!/bin/bash

# Update CentOS with any patches, exclude kernal packages
yum update -y --exclude=kernal

# Tools (nc and telnet for tesing network between virtual machines)
yum install -y nano git unzip screen nc telnet

