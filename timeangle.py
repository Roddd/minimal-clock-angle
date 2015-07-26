#!/usr/bin/python
# Author:          I-Ming Chen

import sys
import string
import math

def findAngle(s_time):
    hour,minute = s_time.split(":")
    hour = float(hour)
    minute = float(minute)

    if (hour == 12):
        hour = 0;
    degree_hour = hour * 30 + minute / 2;
    degree_min = minute * 6;
    degree = math.fabs(degree_hour - degree_min);

    # If reflex angle (between 180 and 360 degrees), it must be the other angle
    if ((degree > 180) and (degree_hour > degree_min)):
        degree = 360 - degree_hour + degree_min
    elif ((degree > 180) and (degree_hour < degree_min)):
        degree = 360 - degree_min + degree_hour

    # For noon/midnight and fail safe
    if (degree >= 360):
        degree = 0

    print "Angle between hour and minute hand: " + str(degree) + " degrees."

def main(argv):
    print "You entered: " + argv
    findAngle(argv)

if __name__ == '__main__':
    main(sys.argv[1])
    sys.exit()
