#!/usr/bin/env bash

set -eou pipefail

show_aws_sso_expiry() {
  _SSO_PROFILE=default
  expiry=$(aws configure get aws_expiration --profile "$_SSO_PROFILE")
  expiry_unix=$(date -d "$expiry" +%s)
  current_unix=$(date +%s)
  seconds_to_expiry=$((expiry_unix - current_unix))

  if [[ current_unix -gt expiry_unix ]]; then
    echo  expired
  else
    echo " $(date -ud "@$seconds_to_expiry" +'%H:%M:%S')"
  fi
}

show_aws_sso_expiry
