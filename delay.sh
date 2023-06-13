#!/bin/bash

delay_time=$(who -b | awk -F: '{print substr($2, 2, length($2) -1)}')

sleep $delay_time'm' && bash /home/diodos-s/monitoring.sh
