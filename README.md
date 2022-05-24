# BigFootShipWrecks with Critos AI Guards
 
# bigfoots-shipwrecks

#Changelog:
* 5/23/2022 v1.0.8 - Removed moving crate marker. Added AI Events Attack Heli and Rappeling Units. If you do not use advanced rappeling mod turn off in config.
* 5/7/2022 v1.0.7 - Added Marker for crate location after crate found. Creats marker for crate and moves with location of crate until cleanup.
* 5/1/2022 v1.0.6 - Fixed issue with player respect getting reset when using vehicle to kill boats.
* 4/30/2022 v1.0.5 - Fixed thread being added on every shipwreck spawn.
* 4/22/2022 v1.0.4 - Changed issues with variables and a sleep. Thank you to AeoG | El'Rabito for pointing these out.
* 4/17/2022 v1.0.3 - Crito release with AI boat Guards credit goes to Bigfoot for v1.0.2 to work off of.
* 8/5/2016 v1.0.2 - fixed undefined log call in preinit
* 8/5/2016 v1.0.1 - fixed filename typo
* 8/5/2016 v1.0.0 - initial release

#Author:
*Bigfoot


#Credits:
* Earliest known script variation: Darth_Rogue, Chisel, deadeye, and Robio.
* Based on modified script by Tuna.
* TaylorSwift for very helpful mod template.
* Second_Coming for Occupation mod from which I learned techniques.
* Thank you to all previous scriptors listed above and and Bigfoot for previous versions. - Crito
* Thank you to Ketanna for the depth and distance settings and hand in other portions. - Crito

#Summary:
Exile forum thread: http://www.exilemod.com/topic/17352-bigfoots-shipwrecks/

This addon spawns shipwrecks with loot crates and markers in random water locations on server restart with AI boats guarding each location.

Each wreck now has its own cleanup. Clean up of the wreck only happens when both the crate and player make it farther than distance defined
in config settings. Default is 1,000 meters.

New ship wrecks sites respawn when all of the initial spawned shipwrecks have been cleared.

Dead driver event - If driver gets shot out of a boat than the rest of the AI in that boat will jump out and swim to wreck to guard it under
water while the other Boats with drivers remain driving around fighting above water until their driver is killed.

Player at crate event - If a player skips fighting the AI on the surface and goes straight under water to crate the AI will jump out of the
boats and swim down to attack the player. This happens when the notification about player taking crate is triggered.

configs settings added for setting water how deep of water you want the crates to spawn in. These are a minimum and maximum depth
so if you don't want to swim forever to the crate than have them spawn in shallow waters.

config settings added for distance between each wreck. This is so wrecks do not spawn close to one another if you do not want them to.

Inventory can NOT be taken from crates while the crate is underwater, due to Arma mechanics. Use R3F, Igiload, or built-in Exile crate mounting to load crates onto SDVs to be transported to shore.

Feel free to extend this however you like. I encourage you to post your edits on http://www.exilemod.com/topic/17352-bigfoots-shipwrecks/ so others can enjoy your improvements and contribute with further enhancements.

Most settings can be configured to your preference in config.sqf.


#Features:
* Configurable crate loot, with loot spawn percentages, guaranteed items, additional random items, random poptab count, and random classname selection for loot items.
* Spawns up to a certain configurable number of shipwrecks in the ocean, at a configurable distance from a configurable center point.
* Displays marker on shipwreck.
* Players within a configurable distance of the shipwreck will cause the marker to disappear and an Exile Toast as well as chat message to be displayed to all players with the shipwreck's/player's coordinates. This can be turned on or off.
* Cleans up completed shipwrecks.
* Shipwrecks Respawn.
* AI boats guard the shipwrecks.
* spawns shipwrecks a configurable distance away from each other.
* spawns shipwrecks at a configurable water depth.
* AI event when player reaches crate if AI are still alive.
* AI event if driver is killed and crew is still in the boat.

#Roadmap:
* Add optional AI spawns around crates. //done by Crito
* Allow shipwrecks to cluster in certain areas - e.g 2/3 of ships would spawn in Altis central bay, and 1/3 of shipwrecks would spawn in deep water surrounding altis.
* Increased chance for certain loot


#License:
This work is license under the Arma Public License Share Alike (APL-SA). Full license text can be found in /src/BigfootsShipwrecks_Server/APL SA.txt.

Essentially you must not charge for, or to use, this addon. If you make modifications to this addon, it can only be distributed with the same APL-SA license. This is so others in the Exile Mod community can benefit from collaborative efforts.


#Installation:
Drop the BigfootsShipwrecks_Server.pbo file in your @ExileServer/addons/ folder.


#Configuration:
Edit values in config.sqf to your liking.

