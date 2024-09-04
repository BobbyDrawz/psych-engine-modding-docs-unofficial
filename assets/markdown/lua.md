# FNF Psych Engine Scripting Guide (Lua)

This guide will help you understand and use Lua scripting in Friday Night Funkin' (FNF) with the Psych Engine. Lua scripting allows you to add custom behavior, events, and interactivity to your mods, offering a higher level of customization and control over the game.

## 1. Getting Started with Lua Scripting

Lua scripting in Psych Engine is versatile and powerful, enabling modders to create dynamic gameplay experiences. Before diving into specific functions and scripts, it's important to understand the basics:

- **Scripts Location**: Lua scripts should be placed in the `mods/Your-Mod-Name/scripts/` directory. Psych Engine will automatically load and run these scripts when the corresponding song is played.
- **Character-Specific Folder Check**: If a script is only meant to run on a specific character, then it should be in the `mods/Your-Mod-Name/characters` folder.
- **File Naming**: Lua files should be named clearly to reflect their purpose (e.g., `noteHit.lua` for a script that runs when a note is hit). If in characters folder, then name it the character's name [e.g. if the script is only supposed to run on `pico-playable.json`, then name the lua file `pico-player.lua`

## 2. Basic Structure of a Lua Script

A typical Lua script in Psych Engine includes the following components:

- **Functions**: Lua scripts are driven by functions that Psych Engine calls at specific times (e.g., when a song starts, when a note is hit, etc.). Common functions include:
  - `onCreate()`: Called when the script is first created.
  - `onUpdate(elapsed)`: Called every frame, useful for continuous checks or animations.
  - `onBeatHit()`: Called every beat, useful for timing events with the music.

- **Events and Hooks**: Lua scripts can hook into various game events, such as:
  - `goodNoteHit()`: Triggered when a note is successfully hit.
  - `opponentNoteHit()`: Triggered when the opponent's note is hit.
  - `noteMiss()`: Triggered when a note is missed.
  - `onEvent(name, value1, value2)`: Custom events triggered during the game.

### Example:

```lua
function onCreate()
    -- Code to initialize your script
end

function onUpdate(elapsed)
    -- Code that runs every frame
end

function onBeatHit()
    -- Code that runs on every beat
end
```

## 3. Advanced Lua Functions and Usage

Psych Engine extends Lua with a set of custom functions tailored to FNF modding. These include:

- **Character Manipulation**:
  - `setProperty('property_name', value)`: Changes a property of an object (e.g., setting the position of a character).
  - `getProperty('property_name')`: Retrieves the current value of a property.

- **Camera and HUD Control**:
  - `triggerEvent('Camera Follow Pos', x, y)`: Changes the camera focus to a specific position.
  - `setTextString('scoreTxt', 'New Score')`: Updates the HUD text, such as the score display.

- **Note and Event Handling**:
  - `addLuaSprite('sprite', true/false)`: Adds a sprite to the game, with the option to be on top of everything else.
  - `setNoteType('note', 'type')`: Changes the type of a note, useful for custom note behaviors.

```lua
function onUpdate(elapsed)
    if getProperty('health') < 0.02 then
        setProperty('health', 0.05) -- Prevents the player from dying
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        triggerEvent('Camera Follow Pos', 600, 450)
    end
end
```

## 4. Creating Custom Note Types

Custom note types can enhance your mod by adding new note behaviors. To create custom note types:

- **File Setup**: Place the Lua file defining your custom note type in the `mods/Your-Mod-Name/custom_notetypes/` directory.
- **Configuration**: List your custom note types in the `notetypes.txt` file within the song’s data folder (`mods/Your-Mod-Name/data/yourSongName/`).

### Example of a Custom Note Type:

```lua
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'template' then --Check if the note on the chart is this note
			--code goes here
		end
	end
end
```

## 5. Adding Custom Events

Custom events allow for complex interactions in your mod. These are particularly useful for triggering animations, changing the game state, or altering the gameplay dynamically.

- **File Setup**: Add custom event scripts to the `mods/Your-Mod-Name/custom_events/` directory.
- **Script Structure**: Custom events should have both a `.lua` or `.hx` script and an optional `.txt` file for configuration.

### Example:

```lua
function onEvent(name, value1, value2)
    if name == 'CustomEvent' then
        -- Custom behavior when the event is triggered
    end
end
```

## 6. Saving and Managing Scripts

Scripts are saved and managed within the song’s data folder:

- **Script Files**: Save your Lua scripts in `mods/Your-Mod-Name/scripts/` and make sure they are correctly named and organized.
- **Events**: If you have events that apply across multiple difficulties, save them as `events.json` in the `mods/Your-Mod-Name/data/yourSongName/` folder.

---
[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
[link to hscript doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/assets/markdown/haxe.md)
