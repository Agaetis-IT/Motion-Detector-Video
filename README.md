# Motion Detector Video

Motion detection and sequence selection of a video using Python, OpenCV and Docker.

One video file per detection event is recorded.

# To use it:

Clone repo in your working directory

Build docker image:

> docker build -t motion-det .

Configure script (see bellow)

Launch script:

> bash runDocker.sh

# To configure it:

Configuration is made in exec.sh at python function call:

> python3 motion_detector.py ...

All possible arguments are:

```
-i (--input-video): type=str, default='': Input video file (in inputs/)

-a (--min-area): type=int, default=5000: minimum area size used to trigger motion

-r (--refresh-delay): type=int, default=5: Reference Frame refresh delay (s)

-d (--detection-release): type=int, default=5: Detection release (s) e.g. delay to stop record after the last motion detected

-c (--output-codec): type=str, default="mkv": Ouput video codec. Supported codec (for now): "mkv" and "avi"

-l (--display-level): type=int, default=0: Display level (0: no display)
```

Outputs file are in outputs/ folder
