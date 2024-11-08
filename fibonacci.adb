with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Fibonacci is

   -- Recursive function to calculate the n-th Fibonacci number
   function Fibonacci(N : Integer) return Integer is
   begin
      if N = 0 then
         return 0;  -- Return F(0)
      elsif N = 1 then
         return 1;  -- Return F(1)
      else
         return Fibonacci(N - 1) + Fibonacci(N - 2);  -- Recursive call
      end if;
   end Fibonacci;

   N : Integer;

begin
   -- Prompt the user for an integer
   Put("Enter an integer to calculate the n-th Fibonacci number: ");
   Get(N);  -- Read the number entered by the user

   -- Calculate and display the result
   Put_Line("The " & Integer'Image(N) & " Fibonacci number is: " & Integer'Image(Fibonacci(N)));
end Fibonacci;
