Power Testing
=============

Requirements
--------------
* Create a directory normal-profile for firefox profile
* disable defender and search indexer
* Install www.autohotkey.com to run .ahk files
* Install http://software.intel.com/en-us/articles/intel-power-gadget

Howto
-------------
1. Run power1.ahk. On first run you might have to deal with both browsers [x] prompt with multiple tabs open dialog.
2. Import `ie_power.log` and `nightly_power.log` into a spreadsheet
3. Graph "Processor Power_0(Watt)" columns against each other, eg: https://dl.dropboxusercontent.com/u/5961467/scrolling.pdf
