with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Fibonacci is

   -- Iterative function to calculate the n-th Fibonacci number
   function Fibonacci(N : Integer) return Integer is
      A : Integer := 0;  -- F(0)
      B : Integer := 1;  -- F(1)
      Temp : Integer;
   begin
      if N = 0 then
         return A;  -- Return F(0)
      elsif N = 1 then
         return B;  -- Return F(1)
      else
         for I in 2 .. N loop
            Temp := A + B;  -- Calculate the next Fibonacci number
            A := B;         -- Shift for next iteration
            B := Temp;      -- Update B to the latest Fibonacci number
         end loop;
         return B;  -- Return F(N)
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

