--[[

Forbidden v0.0.8 [Alpha]

Thank you for using Forbidden! Remember to look inside the modules you are using
for detailed explanations.

For more info on how to use modules go to Crit on YT (@CritDev) 
https://www.youtube.com/channel/UCD3EEMeX-fLtHfd1pg09SSQ

Discord: discord.com/invite/7vTTmRC2Zm

Please Like and Subscribe to Support the Project
Send your projects using Forbidden in a comment section!

Much love, @rman501




Known bugs:

	Modules can take up to 20 seconds to load in (noticable by shadows being updated visually; I believe it is a Roblox high graphics settings issue) - solution, SetNetworkOwner
	Module loading in while facing attempted usage will brick any script without error codes, leading to confusion - solution, AI_Init_Time in precoded examples.
	Lock Icon not shown when player loads. (all functionality remains.) - Pets

Common Fixes:
	Restart Studio. Confirmed issue with Roblox Studio for many issues.
	
If none of the above works, send a comment, or a bug report in the discord, with the following information:
	> Module used
	> Call to module
	> Error (either quantative or qualitive)
	> Example (optional)
	> Video	  (optional)
	> A possible way to replicate (optional)

------------------------------------------------------------------------------
--FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN--
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN----FORBIDDEN--
------------------------------------------------------------------------------


									UPDATE LOGS
									
UPDATE v0.0.8

	- AI System rewrite.
	 - "Actually looks like a script, and not c***kwired!" - @rman501
	
		> Thank you for the play testers who helped once and for all solve the issues with the AI system and dependents
			- @RJCowles, @Fastboy_Gaming
			Check out the game I'm making with them, it will be on my channel (very bad game, but just to demonstrate Forbidden!)
									
									
UPDATE v0.0.7

	- Notable Changes
	
		> AI Precoded Examples Rewrite.
		

	- Math->IsInView
	
		> Check if an NPC or any humanoid can see part in the game!
		
		> Soon: ToObjectSpace rotations to check vertical, only works horizontally for now.
		
		
	- Math->IsInView (PREVIOUS), name changed to IsOnScreen.
	
		> To reference that it, firstly, only works for players, and two, only works in local scripts (i.e. something is on screen).


	- Bug Fixes
	
		- AI
			
			> As good practice, it is recommended to require the AI module on the server-side and do, ai.Stop(npc: Model) through there
			otherwise, the delay in the event may mess up certain scripts (tracking, nextbots, etc...)
		
			
				
									
UPDATE v0.0.6

	- AI->precoded->ChaseAI->ChaseAIWithHiding
	
		> A basic hiding system to get you started, implemented using the ChaseAIBase!
		
	- AI->precoded->ChaseAI
	
		>	Cleaning of settings, finishing of StandardPathfindSettings, setting.
		>	Added AntiLag setting.
		
		
	- Bug Fixes
	
		>	Missed passed parameters in calls to hooked functions in ChaseAIBase.
		>	AI.SmartPathfind - StandardPathfindSettings was not defaulted correctly.
		>	AI->precoded->ChaseAI - PlayerChaseBegan was not hooked.
		>	AI->precoded->ChaseAI - AI now has a setting to disable sitting.
		>	AI->precoded->ChaseAI - cleanNodesTable did not remove non-BaseParts from the table.
		>	AI->precoded->ChaseAI - cleanNodesTable did not remove iteratively, added concurrency protection as well.
		>	AI->precoded->ChaseAI - reduced network ownership api usage to reduce induced lag.
		
		
	- Major Bug Fixes
		>	AI->precoded->ChaseAI - NPC would sometimes nope out, and just turn around. Very complex ALLT solution (Anti Lock Lost Timing)
			Note: Awful, but it serves to protect against most problems


UPDATE v0.0.5

	- AI->precoded->ChaseAI->ChaseAIBase
	
		> An example script with settings and functions to get you started.
			Yes the code is pretty difficult to read, yes it is my fault.
			Leave a comment in a video saying you want me to comment it and I will but the key functions are labeled
			for your use :). (please edit them, make it your own!)
			
	- AI->SmartPathfind
	
		> Fixed an issue where the waypoints would not delete unless Settings.Visualize was set to true. 


UPDATE v0.0.4

	- MAJOR UPDATE FOR AI->SmartPathfind
	
		> Added 'SwapMovementMethodDistance' setting: allows control of the distance at which the ai stops pathfinding and just tries to move to the player if its in LoS.
		> If no path is available, the script now returns Enum.PathStatus.NoPath (only when Yield = true as no value is returned otherwise.)

UPDATE v0.0.3

	- MAJOR UPDATE FOR AI->SmartPathfind
	
		> Added 'Tracking' setting
		> Fixed major bug where two pathfinds would conflict
		> Fixed multithreading issues.
	
	
	- Added Math->Round
		> Vector3
		> Number
		> Int
		> adding more soon...
	
	- Math->LineOfSight bug


UPDATE v0.0.2

	> Added precoded queue functions (Forbidden->Multiplayer->Queue)
	> Added teleport with extreme flexibility (Forbidden->Standard) reference via API.basic
	> Major bug fixes regarding the AI module
	> Other minor bug fixes
	
Release
	
	- AI
		> SmartPathfind
		> Stop
		> Signals
	- Deque by Pierre "Maxwell" Chapius (github)
	
	- Math
		> LineOfSight
		> SeeThroughTransparentParts (LOS check functionality update)
		
	- Standard
		> GetType
]]--