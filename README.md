Created with QML on QT Creator 7.0.1 (community)
Android Qt 6.3.0 Clang x86 kit was used for creation
Emulators Pixel_3a and Pixel_C were used during testing


Fuctionality:
    
    -Click "Open" button to select your video file
    -Click the play, pause, or stop button to navigate your video
    -The video progress is mutable, allowing you to skip or retrace
    -Volume slider is included to change volume
    -Loop toggle slider is included to enable infinite replay
    -Made to fit the vertical view of device
    -Dynamic resizing of components for vertical view


Possible Next Steps:

    -Figure out dynamic resizing for when orientation switches
    -Figure out how PowerManager.WakeLock works for QML to prevent device sleeping
    -Tests on more devices to make sure the dynamic resizing works for all
    -Possibily combine the pause and play button into one