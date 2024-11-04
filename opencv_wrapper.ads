with Interfaces.C;
use Interfaces.C;

package Opencv_Wrapper is
   type MotionDetector_Handle is access all Integer;

   function Create_Detector return MotionDetector_Handle;
   function Initialize_Detector (Handle : MotionDetector_Handle) return Interfaces.C.char;
   function Capture_Frame (Handle : MotionDetector_Handle) return Interfaces.C.char;
   procedure Convert_To_Gray (Handle : MotionDetector_Handle);
   procedure Compute_Difference (Handle : MotionDetector_Handle);
   procedure Apply_Threshold (Handle : MotionDetector_Handle);
   procedure Display_Result (Handle : MotionDetector_Handle);
   procedure Save_Frame_With_Motion (Handle : MotionDetector_Handle);
   procedure Destroy_Detector (Handle : MotionDetector_Handle);
   
   pragma Import (C, Create_Detector, "create_detector");
   pragma Import (C, Initialize_Detector, "initialize_detector");
   pragma Import (C, Capture_Frame, "capture_frame");
   pragma Import (C, Convert_To_Gray, "convert_to_gray");
   pragma Import (C, Compute_Difference, "compute_difference");
   pragma Import (C, Apply_Threshold, "apply_threshold");
   pragma Import (C, Display_Result, "display_result");
   pragma Import (C, Save_Frame_With_Motion, "save_motion_frame");
   pragma Import (C, Destroy_Detector, "destroy_detector");
end Opencv_Wrapper;

