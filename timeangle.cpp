/*
  Compiled with:   GCC v4.6.3
  Compile command: g++ -std=c++0x timeangle.cpp -o timeangle

  Author:          I-Ming Chen
*/


#include <iostream>
#include <string>
#include <cmath>

void findAngle(char *);

int main(int argc, char * argv[])
{
  using namespace std;

  cout << "You entered " << argv[1] << endl;

  findAngle(argv[1]);
  return 0;
}

void findAngle(char *input)
{
  using namespace std;

  // Parse and convert string to usable data
  string time = input;
  string delimiter = ":";
  int pos = 0;
  string token;
  pos = time.find(delimiter);
  float hour = std::stof(time.substr(0, pos));
  time.erase(0, pos + delimiter.length());  // NOTE: This does mangle the original time string
  float min = std::stof(time);

  if (hour == 12) hour = 0;
  float degree_hour = hour * 30 + min / 2;
  float degree_min = min * 6;
  float degree = abs(degree_hour - degree_min);

  // If reflex angle (between 180 and 360 degrees), it must be the other angle
  if ((degree > 180) && (degree_hour > degree_min))
    degree = 360 - degree_hour + degree_min;
  else if ((degree > 180) && (degree_hour < degree_min))
    degree = 360 - degree_min + degree_hour;

  // For noon/midnight and fail safe
  if (degree >= 360)
    degree = 0;

  cout << "Angle between hour and minute hand: " << degree << " degrees." << endl;
}
