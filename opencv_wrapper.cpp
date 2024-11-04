// file: opencv_wrapper.cpp
#include <opencv2/opencv.hpp>
#include <iostream>

extern "C" {
    using namespace cv;

    class MotionDetector {
    public:
        MotionDetector() : capture(0), initialized(false), movementDetected(false) {
            if (!capture.isOpened()) {
                std::cerr << "Error: Unable to open the camera." << std::endl;
            }
        }

        bool is_initialized() const {
            return capture.isOpened();
        }

        bool initialize() {
            if (!capture.isOpened()) return false;
            capture >> frame;
            cvtColor(frame, prevGray, COLOR_BGR2GRAY);
            initialized = true;
            return true;
        }

        bool capture_frame() {
            if (!initialized) return false;
            capture >> frame;
            return !frame.empty();
        }

        void convert_to_gray() {
            if (!frame.empty()) {
                cvtColor(frame, gray, COLOR_BGR2GRAY);
            }
        }

        void compute_difference() {
            absdiff(prevGray, gray, diff);
        }

        void apply_blur_and_threshold() {
            GaussianBlur(diff, blurred, Size(9, 9), 0);
            threshold(blurred, thresholded, 25, 255, THRESH_BINARY);

            // Detect if there is movement
            movementDetected = (countNonZero(thresholded) > movement_threshold);
        }

        void display_result() {
            imshow("Movement Detected", thresholded);
            prevGray = gray.clone();
            waitKey(1);  // Delay to update the window
        }

        void save_motion_frame() {
            if (movementDetected) {
                if (!video_writer.isOpened()) {
                    video_writer.open("movement_detected.avi", VideoWriter::fourcc('M','J','P','G'), 10, 
                                      Size(frame.cols, frame.rows), true);
                    if (!video_writer.isOpened()) {
                        std::cerr << "Error: Unable to open the video file to save." << std::endl;
                        return;
                    }
                }
                video_writer.write(frame);  // Save the frame in color
            }
        }

        void release() {
            capture.release();
            video_writer.release();
            destroyAllWindows();
        }

    private:
        VideoCapture capture;
        VideoWriter video_writer;
        Mat frame, gray, prevGray, diff, blurred, thresholded;
        bool initialized;
        bool movementDetected;
        const int movement_threshold = 5000; // Threshold to determine if there is movement
    };

    // Functions exposed to Ada
    using MotionDetector_Handle = MotionDetector*;

    MotionDetector_Handle create_detector() {
        auto* detector = new MotionDetector();
        return detector->is_initialized() ? detector : nullptr;
    }

    bool initialize_detector(MotionDetector_Handle handle) {
        return handle ? handle->initialize() : false;
    }

    bool capture_frame(MotionDetector_Handle handle) {
        return handle ? handle->capture_frame() : false;
    }

    void convert_to_gray(MotionDetector_Handle handle) {
        if (handle) handle->convert_to_gray();
    }

    void compute_difference(MotionDetector_Handle handle) {
        if (handle) handle->compute_difference();
    }

    void apply_threshold(MotionDetector_Handle handle) {
        if (handle) handle->apply_blur_and_threshold();
    }

    void display_result(MotionDetector_Handle handle) {
        if (handle) handle->display_result();
    }

    void save_motion_frame(MotionDetector_Handle handle) {
        if (handle) handle->save_motion_frame();
    }

    void destroy_detector(MotionDetector_Handle handle) {
        if (handle) {
            handle->release();
            delete handle;
        }
    }
}

