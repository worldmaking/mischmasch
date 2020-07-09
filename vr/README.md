# A package for Max/MSP/Jitter to support virtual reality head-mounted displays

This Max package adds support for the Oculus Rift and the HTC Vive head-mounted displays (HMD) hardware. 

[Read Cory Metcalf's introduction here](https://cycling74.com/articles/hardware-overview-wtc-vive)

## Installing

Make sure you have the prerequisite hardware and drivers (see below).

Download the package and place into your Max Packages folder. (On Windows, My Documents/Max 7/Packages, on Mac, ~/Documents/Max 7/Packages), then restart Max.

Take a look at patchers in the `help` and `examples` folders to get to know the package.

If you have trouble loading externals you might need to install the [visual studio 2015 redistributable package](https://www.microsoft.com/en-us/download/details.aspx?id=48145). It is free.

## Supported systems

To use an HMD you will need the appropriate drivers installed, and a high end PC and graphics card. For these particular consumer head-mounted displays, it requires the equivalent of two HD or better resolution screens rendering at 90 frames per second. 

At present the recommended PC requirements to cover both the Oculus Rift and the HTC Vive are:

- **GPU:** NVIDIA GTX 970 / AMD R9 290 equivalent or greater
- **Video Output:** HDMI 1.4 or DisplayPort 1.2 or newer
- **CPU:** Intel i5-4590 / AMD FX 8350 equivalent or greater
- **Memory:** 8GB+ RAM
- **USB:** 3x USB 3.0 ports plus 1x USB 2.0 port
- **OS:** Windows 7 SP1 64 bit or newer (OSX might also work in High Sierra)

**Oculus Rift**

The [Oculus Home](http://www.oculus.com/en-us/setup/) software should be installed & calibrated. It is free, but you need to create an Oculus account (free). Once installed, you may need to go into Oculus Home settings and enable the option to allow apps not downloaded from the Oculus Home store.

**HTC Vive** 

The [Steam and SteamVR](http://store.steampowered.com/steamvr) should be installed & calibrated. They are free, but you need to create a Steam account (also free).

**Configuration tips**

It's important that both Max/MSP/Jitter and the head-mounted display driver are running on the same GPU so that they can share texture data. If you see `submit error: Texture is on wrong device`, you might need to check that the desktop displays are plugged into the same GPU as the HMD, and that in your display settings Max is using the GPU rather than any CPU-embedded discrete graphics device. For example, in the Nvidia Settings, this means selecting the Max application and setting it for Maximum Performance.  

## History

This package draws from earlier work supporting HMDs in Max since the Oculus DK1 in 2013 -- [see this epic forum topic](https://cycling74.com/forums/oculus-rift).

Thanks to KCOUL, Mathiew Chamagne, Dale Rosen for additional contributions!
