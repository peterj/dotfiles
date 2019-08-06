#!/bin/bash

###
# setup cputhrottle if doesn't exists
###
set_service_cpu_limit(){
     for service_pid in `pgrep $1`
     do
      limit=$2
      if [[ ! -z $service_pid  ]]; then
          service_cpu=$(ps aux | grep "sudo cputhrottle $service_pid $limit" | grep -v grep | wc -l)
          if [[ ! $service_cpu -gt 0 ]]; then
              sudo cputhrottle $service_pid $limit &
          fi
      fi
     done
}

###
# main
###
while true; do
    set_service_cpu_limit VShieldScanner 10
    sleep 0.5
done