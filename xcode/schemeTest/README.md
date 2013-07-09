## working with schemes and projects in XCode 

based from WWDC 2012 session #408 


### tips 

* use opt-click on Run/Profile/Analyze/ to bring up scheme panel
* find derived data directory from Preference => Location 
* File ==> Workspace Setting to set per workspace/project derived data location
* File ==> Workspace Setting => Advanced 
* xcrun nm -a  /Path-to-Build-Project

* xcodebuild -showBuildSettings -project /Path-to-Project-File
* opt-click on Product Menu, select Clean Build Folder



### share schemes

MyApp.xcodeproj/ 
    * xcuserdata
        * denny.xcuserdata/
        * someoneealse.xcuserdata/
            * xcschemes   (Per User Schemes)
                * MyApp.xcscheme
                * xcschememanagement.plist
    * xcsharedata
        * xcschemes/  
            * MyApp.xcscheme
            * MyFramework.xcscheme

### Use static library

* add __-ObjC__ to Other Linker Flag in app project to ensure the app project link against all avaialble objective c object files in a static library !!