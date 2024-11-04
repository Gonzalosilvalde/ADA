# ADA

## 🚶 Motion Detection System in Ada with OpenCV 🚶
Welcome to my motion detection project in Ada, which uses OpenCV for image processing and detecting changes in a video feed. This project simulates a basic surveillance system where detected motion is saved in a video file. I've applied Ada's concurrency features and built a C++ wrapper to interact with OpenCV, allowing me to learn and experiment with shared resource management and task synchronization in Ada.

## 🔍 Project Overview
This system detects real-time movement using a camera. Whenever motion is detected, it saves the frame in a video file. Several concurrent tasks are used to ensure parallel detection and storage, preventing system overload.

## 💡 What I Learned in This Project
Concurrency and Tasks in Ada
In this project, Ada allows the execution of parallel tasks for capturing frames and storing those with detected motion. The Save_Motion task runs concurrently to save frames, maintaining system efficiency. Learning to coordinate these tasks in Ada was key to managing real-time systems.

### OpenCV Wrapper in C++ for Ada
To connect Ada with OpenCV, I implemented a C++ wrapper that handles detector creation, frame capture, and processing operations. Each function in the C++ wrapper is exposed to Ada through pragma Import. This process taught me how to manage interoperability between Ada and C++ for complex applications.

### Shared Resource Management and Synchronization
Ada’s concurrency features facilitated safe access to OpenCV resources. In particular, synchronizing frame capture and storage was a practical exercise in controlling shared resources.

### Timing Control and Real-Time Simulation
I used delay statements to add small pauses between capturing and saving frames, managing CPU usage. This aspect was essential to make the simulation reflect a more realistic surveillance system.
