Simple Calculator using RPC and TCL Programming Language
-----------------------------------------------------------------------

This project is an university project to implement a **simple RPC Client-Server**, coded on **TCL Programming Language**

-----------------------------------------------------------------------
**_HOW TO USE_**

Inside of this folder has two files: **client.tcl** and **server.tcl** which needs TCL Shell to run.

-----------------------------------------------------------------------

**_WINDOWS USERS_**

**0-** TCL needs to be installed on the machine in order to work properly. Please go to https://www.tcl3d.org/bawt/download.html and download **BAWT 2.3.1 Tcl-Bl - Windows Installer 8.6.13** which is the stable version and run the setup. Please keep in mind to install the proper **32 bit or 64 bit** version.

**1-** After installing, open two **Windows PowerShell** on this folder _or navigate to this folder on the PowerShell using the cd command_.

**2-** On first window, please run **tclsh** and press enter. On the following line please input **source server.tcl** and press enter.

**3-** On the second window, please run **tclsh** and press enter. On the next line please input **source client.tcl** and press enter.

**4-** Enjoy the Calculator

-----------------------------------------------------------------------

**_LINUX USERS_**

**0-** Normally TCL comes with the OS. If not, please install as usual for your linux machine.

**1-** After installing please open two **Terminals** on this folder _or navigate to this folder on Terminal using the cd command_.

**2-** On first window, please run **tclsh** and press enter. On the following line please input **source server.tcl** and press enter.

**3-** On the second window, please run **tclsh** and press enter. On the next line please input **source client.tcl** and press enter.

**4-** Enjoy the Calculator


-----------------------------------------------------------------------

**_OBSERVATIONS:_**

THE DEFAULT FILE RUNS ON SAME MACHINE ON LOCALHOST. IF NEEDED TO RUN ON OTHER MACHINE PLEASE REFER TO THE CLIENT.TCL FILE, AT **set server_address "localhost"** AND CHANGE **_LOCALHOST_** FOR THE DESIRED IP ADDRESS OF THE SERVER MACHINE
