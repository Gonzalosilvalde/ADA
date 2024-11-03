with Ada.Text_IO; use Ada.Text_IO;

procedure Semaphore is

   -- Declare the directions of the intersection
   type Direction is (North, South, East, West);

   -- TrafficLight type: Maintains the state of each traffic light (red or green)
   task type TrafficLight(Dir : Direction) is
      entry Change_To_Green;
      entry Change_To_Red;
   end TrafficLight;

   -- Implementation of the TrafficLight
   task body TrafficLight is
      State : Boolean := False;  -- False = Red, True = Green
   begin
      loop
         select
            when not State =>
               accept Change_To_Green do
                  State := True;
                  Put_Line("Traffic light in " & Direction'Image(Dir) & " is Green");
               end Change_To_Green;
         or
            when State =>
               accept Change_To_Red do
                  State := False;
                  Put_Line("Traffic light in " & Direction'Image(Dir) & " is Red");
               end Change_To_Red;
         end select;
      end loop;
   end TrafficLight;

   -- Intersection task that coordinates vehicle crossing
   protected type Intersection is
      entry Enter(D : Direction);
   private
      Counter : Integer := 0;
   end Intersection;

   protected body Intersection is
      entry Enter(D : Direction) when Counter < 1 is
      begin
         Counter := Counter + 1;
         Put_Line("Car in direction " & Direction'Image(D) & " is crossing");
         delay 1.0;  -- Simulates the time it takes to cross
         Put_Line("Car in direction " & Direction'Image(D) & " has crossed");
         Counter := Counter - 1;
      end Enter;
   end Intersection;

   -- Car task
   task type Car(D : Direction; Light : access TrafficLight; Int : access Intersection) is
   end Car;

   task body Car is
   begin
      loop
         Put_Line("Car in " & Direction'Image(D) & " waiting for green light...");
         Light.Change_To_Green;
         delay 1.0;  -- Waits on green light

         Int.Enter(D); -- The car enters the intersection

         Light.Change_To_Red;
         delay 2.0;  -- The car "moves" to the queue after crossing
         Put_Line("Car in direction " & Direction'Image(D) & " waiting again.");
      end loop;
   end Car;

   -- Intersection instance
   Central_Intersection : aliased Intersection;

   -- Instantiate traffic lights for each direction
   TrafficLight_N : aliased TrafficLight(North);
   TrafficLight_S : aliased TrafficLight(South);
   TrafficLight_E : aliased TrafficLight(East);
   TrafficLight_W : aliased TrafficLight(West);

   -- Instantiate cars and assign corresponding traffic lights
   Car_1 : Car(North, Light => TrafficLight_N'Access, Int => Central_Intersection'Access);
   Car_2 : Car(South, Light => TrafficLight_S'Access, Int => Central_Intersection'Access);
   Car_3 : Car(East, Light => TrafficLight_E'Access, Int => Central_Intersection'Access);
   Car_4 : Car(West, Light => TrafficLight_W'Access, Int => Central_Intersection'Access);
   Car_5 : Car(North, Light => TrafficLight_N'Access, Int => Central_Intersection'Access);
   Car_6 : Car(South, Light => TrafficLight_S'Access, Int => Central_Intersection'Access);

begin
   Put_Line("Starting concurrent intersection simulation...");
   delay 30.0;  -- Run the simulation for 30 seconds
   Put_Line("End of simulation.");
end Semaphore;
