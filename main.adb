with Opencv_Wrapper;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; -- To use timers if necessary
with Interfaces.C;
use Interfaces.C;  -- Facilitates the use of "char"

procedure Main is
   use Opencv_Wrapper;

   Detector : MotionDetector_Handle := null;

   task Save_Motion is
      -- Task that will run concurrently to save frames with motion.
   end Save_Motion;

   task body Save_Motion is
   begin
      loop
         -- Call the function to save the frame with motion
         Save_Frame_With_Motion(Detector);
         -- Add a small delay to avoid CPU overload
         delay 0.1;
      end loop;
   end Save_Motion;

begin
   -- Create the detector
   Detector := Create_Detector;
   
   if Detector = null then
      Put_Line("Error creating the detector.");
      return;
   end if;
   
   -- Initialize the detector
   if Initialize_Detector(Detector) = char'Val(1) then
      Put_Line("Detector initialized successfully.");
   else
      Put_Line("Error initializing the detector.");
      Destroy_Detector(Detector);
      return;
   end if;

   -- Infinite loop to continuously capture and process frames
   loop
      -- Capture a frame
      if Capture_Frame(Detector) = char'Val(1) then
         
         -- Convert to grayscale
         Convert_To_Gray(Detector);
         
         -- Calculate the difference with the previous frame
         Compute_Difference(Detector);
         
         -- Apply threshold to detect motion
         Apply_Threshold(Detector);
         
         -- Display the result
         Display_Result(Detector);
      else
         Put_Line("Error capturing the frame.");
      end if;
   end loop;

   -- Release the detector when finished (will never be reached due to infinite loop)
   Destroy_Detector(Detector);
end Main;

