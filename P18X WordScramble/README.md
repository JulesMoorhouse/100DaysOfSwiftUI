# Day 94 | [HWS 94](https://www.hackingwithswift.com/100/swiftui/94) | [Index](https://github.com/JulesMoorhouse/100DaysOfSwiftUI/blob/main/README.md)

- [P18X WordScramble](https://github.com/JulesMoorhouse/100DaysOfSwiftUI/blob/main/P18X%20WordScramble/P05C%20WordScramble/ContentView.swift) 

- Change project 5 (Word Scramble) so that words towards the bottom of the list slide in from the right as you scroll. Ideally at least the top 8-10 words should all be positioned normally, but after that they should be offset increasingly to the right.
  
- For a real challenge make the letter count images in project 5 change color as you scroll. For the best effect, you should create colors using the Color(red:green:blue:) initializer, feeding in values for whichever of red, green, and blue you want to modify. The values to input can be figured out using the row’s current position divided by maximum position, which should give you values in the range 0 to 1.