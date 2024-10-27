# 🌟 Ada Adventures: Exploring Recursion and Input Handling 🌟

Welcome back! This branch documents my continued learning process in Ada, where I’ve delved into recursion and user input management. However, I've encountered significant challenges with handling large integer values. Join me as I navigate these hurdles and expand my knowledge and skills in Ada programming! 🖥️✨

## 🌟 What’s New Here?

### Recursion in Ada

Recursion is a programming technique where a function calls itself to solve smaller instances of the same problem. In my exploration, I attempted to implement the Fibonacci sequence using recursion. While this method illustrated the concept of recursive functions, it also revealed some difficulties when dealing with larger Fibonacci numbers.

- **Key Takeaway**: Understanding base cases and recursive calls is crucial for effective recursion. Although I learned how to break down the Fibonacci computation, I quickly ran into issues when the numbers grew large, leading to overflow errors.

### User Input with `Get`

Handling user input is essential for interactive programs. I learned to use the `Get` procedure to read integers from the user. Here are some highlights:

- **Input Handling**: I successfully captured user input for integers using `Ada.Integer_Text_IO`. However, when I tried using larger integers with `Ada.Long_Long_Integer_Text_IO`, I faced complications that made it difficult to manage the input effectively.

### Challenges with Overflow Issues

Calculating Fibonacci numbers highlighted significant challenges related to integer overflow:

- **Data Type Limitations**: The default `Integer` type led to overflow when I tried to compute larger Fibonacci numbers (e.g., Fibonacci(200)). This was a major setback as I could not compute these values correctly.
    
- **Solutions for Overflow**: Although I learned about using `Long_Long_Integer` for larger values, I struggled to implement it effectively within my recursive function. The transition was not as straightforward as I had hoped.
    

### Output Formatting

While managing output for Fibonacci numbers, I revisited output formatting techniques:

- **Using `Put` for Clean Output**: I worked on using `Put` to display output neatly, but this became complicated with large numbers, especially when the program crashed due to overflow.

---

Despite the challenges I faced with large integers and recursion, I am determined to continue my Ada programming journey. I aim to build more complex applications and deepen my understanding of this versatile language, even if it means taking more time to address these difficulties.

Happy coding! 🚀
