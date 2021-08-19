# Pikmin 2 Restructured
Find your way with the help of an all-new filesystem and symbol map!

## How to use it
For Windows, drag and drop a Pikmin 2 USA (v1.00) \*.gcm file onto "patch_windows.bat".  Follow the instructions given.

For Linux, open a terminal in the directory of "patch_linux.sh".  Enter the following command `sh ./patch_linux.sh "<filepath>"`, replacing \<filepath\> with the filepath (not filename) to your Pikmin 2 USA (v1.00) \*.gcm file.  Follow the instructions given.  It may be necessary to recompile [NOD Tool](https://github.com/AxioDL/nod) for your Linux distro to run the patcher.

## How does it work
Pikmin 2 Restructured is a minimally invasive DOL and filesystem edit for Pikmin 2.  The sub-scripts "restructure.bat" and "restructure.sh" rearrange files from the original Pikmin 2 filesystem into a new layout, eliminating the confusing "user" folder.  Any files in the patch folder get copied in as well.  This includes a patched DOL and a few crucial files to make everything work, among other niceties.  The [DOL C-Kit](https://github.com/Minty-Meeo/dol_c_kit) project to edit the DOL from source can be found in the "project" folder of this repository.  Currently, the DOLs for USA Demo 1 and USA v1.00 are supported.

## An all-new filesystem!
The entire filesystem has been reworked to eliminate the "user" folder entirely.  Now, appropriately named folders populate the root directory.  For more information about specifically what files went where, look into the restructure.bat or restructure.sh scripts to see.

* AudioRes<br>
  Largely the same.  BgmList.txt, StreamList.txt, and trackMaps from the Totaka and Wakai folders have been moved to here.
* banner<br>
  Unchanged.  This folder is unused.
* cardE<br>
  Formerly "/user/Ebisawa/card_e_reader"
* caves<br>
  Contains a multitude of cave resources from all around the old filesystem.  Challenge and VS mode stagelists are found here, plus BgmLists for caves.<br>
  * arc<br>
  Cave unit models.
  * caveinfo<br>
  Sublevel information.
  * light<br>
  Light managers.
  * units<br>
  Cave unit definition.
  * vrbox<br>
  Skyboxes.
  * vs<br>
  VS stage layout.
* develop<br>
  Formerly "/user/Kando/develop".  This folder is unused.
* effects<br>
  \*.jpc files, plus a few miscellaneous files for effects, are located here.
* enemy<br>
  Unchanged.
* maps<br>
  This folder combines "/user/Kando/map" and "/user/Abe/map" into one.  "stages.txt" is also here.
* memoryCard<br>
  Unchanged.
* message<br>
  Unchanged.
* movie<br>
  Formerly "/user/Mukki/movie"
* new_screen<br>
  Largely the same.  Also contains a few miscellaneous screen resources from around the old filesystem.
* objects<br>
  Contains the many objects from the Kando and Abe user folders, all gathered in one place.
  * pellet<br>
    "otakara", "item", "numberpellet", "fruit", and "unused" subfolders have been made for each region to better organize everything.
* parms<br>
  Contains a myriad of parameter and config files from around the old filesystem.
* testdata<br>
  Formerly "/user/Ebisawa/testdata".  This folder is unused.
* testResource<br>
  This folder doesn't actually exist, but apparently some unreachable code references it.
* thp<br>
  Largely the same.  Extra teleprompter \*.ini files which USA Demo 1 requires have been added.
* title<br>
  Formerly "/user/Ebisawa/title".  Also, most of the contents of "/user/Yamashita/arc" has been moved to here.
* zukan<br>
  Contains resources for the Piklopedia and Treasure Hoard.
  * enemytex<br>
    Thumbnails for Piklopedia
  * maps<br>
    The same concept as the other maps folder, but for zukan.  Zukan stage managers for each region are nested in here as well.
  * resulttex<br>
    Thumbnails for Treasure Hoard

## The Symbol Map!
Retail releases of Pikmin 2 in all regions came with a huge tease-- a supposed symbol map that actually contained nothing but garbage data.  However, it was discovered that USA Demo 1 (found on Interactive Multi-Game Demo Disc 17 USA) had a matching symbol map!

By changing a single processor instruction of the USA Demo 1 version of Pikmin 2, it behaves exactly like normal.  For this reason, USA Demo 1 has become the de-facto standard in the Pikmin 2 hacking community.  While Pikmin 2 Restructured supports USA v1.00, it is recommended that you use USA Demo 1 instead.  USA Demo 1 is used by default.

"Pikmin2UP.MAP" at the root of the filesystem has been replaced with the one compatible with USA Demo 1.  In addition, "romhack.map" is outputted by the DOL C-Kit project used to generate the patched DOL.  This is relevant if you use Pikmin 2 Restructured as a base C-Kit project.
