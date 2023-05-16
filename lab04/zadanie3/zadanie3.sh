#!/bin/bash

# Get current disk space in kilobytes
disk_space=$(df -k | grep /dev/sda4 | awk '{print $2}')

# Get all volumes with their disk space
# Values are stored as an array in format "<space>,<volume_name>"
volumes=$(docker system df -v | sed -n '/VOLUME NAME/,/Build/p' | head -n -2 | tail -n +2 | awk '{print $3, $1}' | tr ' ' ',')

echo "Available disk space: ${disk_space}KB"
echo ""
echo "Docker volumes disk usage:"

printf "%8s %9s %s\n" "SIZE" "USAGE" "NAME"

for i in ${volumes[@]}; do
  volume_space=$(echo $i | tr ',' ' ' | awk '{print $1}')
  volume_name=$(echo $i | tr ',' ' ' | awk '{print $2}')

  # MB, B, or KB
  size_postfix="$(echo $volume_space | grep -oE "(MB|B|KB)")"

  if [[ "$size_postfix" == "MB" ]]; then
    size="$(echo $volume_space | grep -Eo "([0-9]*\.*[0-9]*)|0" )"
    disk_usage=$(bc -l <<< "$size * 1000 / $disk_space * 100")
    disk_usage=$([[ ! $disk_usage =~ "^\d.*" ]] && echo "0${disk_usage}" || echo $disk_usage)
    printf "%8s %8s%% %s\n" $volume_space ${disk_usage:0:7}  $volume_name
  elif [[ "$size_postfix" == "KB" ]]; then
    size="$(echo $volume_space | grep -Eo "([0-9]*\.*[0-9]*)|0" )"
    disk_usage=$(bc -l <<< "$size * 1000 / $disk_space * 100")
    disk_usage=$([[ ! $disk_usage =~ "^\d.*" ]] && echo "0${disk_usage}" || echo $disk_usage)
    printf "%8s %8s%% %s\n" $volume_space ${disk_usage:0:7} $volume_name
  elif [[ "$size_postfix" == "B" ]]; then
    printf "%8s %8s%% %s\n" $volume_space 0 $volume_name
  fi

done

