## 🌟 Ada Adventures 🌟

Welcome back! This branch documents my learning process around functions, procedures, and output formatting in Ada. I’ve explored the core differences between functions and procedures, learned how to control Ada’s default output formatting, and continued my journey with the basics of Ada programming. Dive in and follow along as I expand my Ada toolkit! 🖥️✨

## 🌟 What’s New Here?
Functions and Procedures
In Ada, functions and procedures help break code into modular, reusable pieces:

Functions return a single value and can be used within expressions, making them ideal for calculations or operations that yield a specific result.
Procedures execute actions without returning a value, making them suitable for tasks like displaying output or modifying variables by reference.
## Output Formatting with `Put` and `Integer'Image`
As I implemented these functions and procedures, I also explored ways to control output alignment with `Put` and `Integer'Image`. By default, Ada aligns numbers in the output, which can add unnecessary spaces. To manage this, I learned a few strategies:

- Using `Put` with a width of 0: Setting the width to 0 in `Put` prevents extra spaces in numeric output, simplifying the display.
- Trimming `Integer'Image`: Ada’s `Integer'Image` function also adds spaces for alignment. Using `'Trim` removes these, allowing for cleaner, more compact output.

Reference:
For more details on Put and Ada's output alignment features, check out the [Put](https://docs.adacore.com/live/wave/arm22/html/arm22/arm22-A-10.html) 
and the [Integer'Image](https://docs.adacore.com/live/wave/arm22/html/arm22/arm22-4-10.html) where these output features and formatting options are discussed.


