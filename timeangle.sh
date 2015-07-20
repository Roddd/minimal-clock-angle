#!/bin/bash

# Author: I-Ming Chen

INPUT="$1"

function findAngle {
  HOUR=$((10#$(echo ${INPUT} | awk -F':' '{print $1}')))
  MIN=$(echo ${INPUT} | awk -F':' '{print $2}')
  if [[ ${HOUR} -eq 12 ]]; then
    HOUR="0"
  fi

  HOUR_DEGREE="$(echo "scale=1;${HOUR}*30+${MIN}/2" | bc)"
  MIN_DEGREE="$(echo "scale=1;${MIN}*6" | bc)"

  if [[ $(echo "${HOUR_DEGREE} > ${MIN_DEGREE}" | bc) -eq 1 ]]; then
    DEGREE="$(echo "scale=1;${HOUR_DEGREE}-${MIN_DEGREE}" | bc)"
  else
    DEGREE="$(echo "scale=1;${MIN_DEGREE}-${HOUR_DEGREE}" | bc)"
  fi

  # If reflex angle, then find other angle
  if [[ $(echo "${DEGREE} > 180" | bc) -eq 1 ]] && [[ $(echo "${HOUR_DEGREE} > ${MIN_DEGREE}" | bc) -eq 1 ]]; then
    DEGREE="$(echo "360-${HOUR_DEGREE}+${MIN_DEGREE}" | bc)"
  elif [[ $(echo "${DEGREE} > 180" | bc) -eq 1 ]] && [[ $(echo "${HOUR_DEGREE} < ${MIN_DEGREE}" | bc) -eq 1 ]]; then
    DEGREE="$(echo "360-${MIN_DEGREE}+${HOUR_DEGREE}" | bc)"
  fi

  # For noon/midnight and fail safe
  if [[ $(echo "${DEGREE} >= 360" | bc) -eq 1 ]]; then
    DEGREE="0"
  fi

  echo "Angle between hour and minute hand: ${DEGREE} degrees."
}

echo "You entered ${INPUT}"
findAngle
