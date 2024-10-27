with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Calculator is

   -- Function to add two integers
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   -- Function to subtract two integers
   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   -- Function to multiply two integers
   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   -- Function to divide two integers, handling division by zero
   function Divide(A, B : Integer) return Integer is
   begin
      if B = 0 then
         Put_Line("Error: Division by zero.");
         return 0;
      else
         return A / B;
      end if;
   end Divide;

begin
   -- Variables to store test numbers
   declare
      Num1 : Integer := 20;
      Num2 : Integer := 5;
      Result : Integer;
   begin
      -- Call each function and print the result
      Result := Add(Num1, Num2);
      Put("Addition of "); Put(Num1); Put(" + "); Put(Num2); Put(" is "); Put(Result); New_Line;

      Result := Subtract(Num1, Num2);
      Put("Subtraction of "); Put(Num1); Put(" - "); Put(Num2); Put(" is "); Put(Result); New_Line;

      Result := Multiply(Num1, Num2);
      Put("Multiplication of "); Put(Num1); Put(" * "); Put(Num2); Put(" is "); Put(Result); New_Line;

      Result := Divide(Num1, Num2);
      Put("Division of "); Put(Num1); Put(" / "); Put(Num2); Put(" is "); Put(Result); New_Line;
   end;

end Calculator;

