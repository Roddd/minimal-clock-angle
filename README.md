# README

So I heard about an interesting problem recently:

"Given a time in string format (e.g. '03:30'), find the minimal angle between
the hour and minute hands on an analog clock."

Seemed like an interesting problem because it merges two different concepts:
* Time
* Angles

## What We Know

* Each minute is 6 degrees; each hour is 30 degrees.
* On a real analog clock, the hour hand moves relative to the minute hand. So
3:30p means the hour hand is already halfway between 3p and 4p.
* (Highest angle - lowest angle) always gives you an angle but it is not always
the "minimal" angle. It may be the reflex angle (e.g 10:10's reflex angle is
245 degrees but we want the smaller angle of 115 degrees).

## Included Sources

I did the program in different forms to get reacquainted with other languages
I used before.

* Bash
* C++
* Python
