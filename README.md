README
======

So I heard about an interesting problem.

"Given a time in string format (e.g. '03:30'), find the minimal angle between the hour and minute hands on an analog clock."

I thought about it and knew immediately it was a math problem. My first approach in my mind was to convert everything to radians since that's how I normally approach a circle. We'd subtract the hand with the higher angle from the hand with the lower angle. The issue here is that you might get a reflex angle instead of the minimal angle. Add in some checks and that's easily resolved. Another aspect to consider is that the hour hand on an analog clock does not stay stationary at the hour it is at. It also moves relative to the minute hand.

I first wrote everything in Bash since I've been doing system administration for the last few years. One thing I couldn't do was do things in radians since there's no math libraries with plain old Bash. However, it made me realize that I was overcomplicating the issue since the hour and minute degrees could be easily calculated without any kind of conversion.

After doing it in Bash, I wanted to do the same thing but in C++. I had not touched C++ in years, yet I was trained as a C/C++ programmer. Sounds like fun! I got reacquainted with C++ Standard Library and tried to minimize the code since it was a straight Bash port at first. I learned a few things about my code and was able to refactor the Bash version as a result. I bet I could make the code a bit tighter and cleaner but this will take some more time to catch up to current C++ standards.

I'm also considering writing this in Ruby but we'll see. =)
