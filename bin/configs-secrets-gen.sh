#!/bin/sh
################################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza             #
#      SPDX-License-Identifier:  GPL-2.0-only                                  #
################################################################################
        set -x                                                                 ;
                                                                               #
        sudo cp -rv run/* /run                                                 ;
        for config in $( find /run/configs -type f )                           ;
          do                                                                   \
            file=$( basename $config )                                         ;
            kubectl create configmap $file --from-file $config                 ;
            sudo rm -f $config                                                 ;
          done                                                                 ;
        for secret in $( find /run/secrets -type f )                           ;
          do                                                                   \
            file=$( basename $secret )                                         ;
            kubectl create secret generic $file --from-file $secret            ;
            sudo rm -f $secret                                                 ;
          done                                                                 ;
################################################################################
