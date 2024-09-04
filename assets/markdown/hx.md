# FNF Psych Engine Scripting Guide (Haxe with hscript)

Psych Engine supports scripting through Haxe using hscript, a softcoded scripting method that allows for dynamic script execution without needing to recompile the entire game. This guide will walk you through setting up hscript files, placing them correctly, and enabling Haxe autocompletion in Visual Studio Code using the most optimal configuration.

## 1. Setting Up hscript in Psych Engine

Hscript is a lightweight Haxe scripting engine that allows you to write Haxe scripts interpreted at runtime, similar to Lua scripts. This makes it easier to add or modify features in your mod without needing to compile the entire engine.

### 1.1 Script Placement

- **Script Files**: Place your `.hx` files in the `mods/Your-Mod-Name/scripts/` directory. Psych Engine will automatically detect and execute these scripts during gameplay.
- **Character Specific Scripts**: Character-specific `.hx` files work in the same manner as lua files in naming sense. If you only want a script to run on a specific character [e.g. `bf-pixel.json`], then add the script in `mods/Your-Mod-Name/characters` and title it the character's name [e.g. `bf-pixel.hx`].

### 1.2 Basic Structure of an hscript File

An hscript file is similar to a regular Haxe script but is interpreted at runtime. Here’s a basic template for a softcoded Haxe script:

```
class Script extends PsychScript {
    public function new() {
        super();
    }

    public function create() {
        // Code to initialize your script
        trace("Script initialized!");
    }

    public function update(elapsed:Float) {
        // Code that runs every frame
        trace("Elapsed time: " + elapsed);
    }

    public function beatHit() {
        // Code that runs on every beat
        trace("Beat hit!");
    }
}
```

### 1.3 Running hscript Files

Once your hscript file is in place, it will be executed automatically when the corresponding song or event is loaded. You can structure your hscript files similarly to how you would structure Haxe code, using functions that are triggered by specific game events such as `beatHit`, `update`, or `create`.

## 2. Advanced hscript Usage

Hscript in Psych Engine allows you to access various internal functions and classes, providing the ability to manipulate characters, control the camera, and manage game states.

### 2.1 Handling Custom Song Modes

Your script can modify songs dynamically based on the difficulty or mode (e.g., "ERECT" mode). Here’s an example of how to structure such a script:

```
import backend.Difficulty;
import states.PlayState;

var difficulty:String;
var mode:String = "erect";  // Define the mode variable here
var erect:Bool = false;
var difficulties:Array<String> = ["ERECT", "NIGHTMARE"];  // Add your difficulties here

function onCreate() {
    difficulty = Difficulty.getString().toUpperCase();
    
    // Check if the current difficulty is in the list of difficulties
    if (difficulties.indexOf(difficulty) != -1) {
        erect = true;
    }
}
```

This script dynamically adjusts the song name and loads different assets based on the selected difficulty or mode. It also adjusts how certain songs behave during specific events, such as dialogues in Week 6.

### 2.2 Modifying Song Attributes During Gameplay

This example shows how to change a song's name, load different instrumental and vocal tracks, and trigger events based on the song’s state:

```
function onNextDialogue(count) {
    if (count == 3 && game.curSong == "Senpai") {
        game.curSong = "Senpai " + mode.charAt(0).toUpperCase() + mode.substr(1).toLowerCase();
        PlayState.SONG.song = "Senpai " + mode.charAt(0).toUpperCase() + mode.substr(1).toLowerCase();
        game.inst.loadEmbedded(Paths.returnSound(null, "senpai-" + mode.toLowerCase() + "/Inst", 'songs'));
        game.vocals.loadEmbedded(Paths.returnSound(null, "senpai-" + mode.toLowerCase() + "/Voices-Player", 'songs'));
        game.opponentVocals.loadEmbedded(Paths.returnSound(null, "senpai-" + mode.toLowerCase() + "/Voices-Opponent", 'songs'));
    }
}
```

This code block handles different songs based on dialogue counts, allowing for variations in gameplay depending on the mode or difficulty.

## 3. Setting Up Haxe Autocompletion in Visual Studio Code

To make coding in Haxe more efficient, you can set up Haxe autocompletion in Visual Studio Code without needing a specific project configuration. This approach allows you to work in a flexible environment, perfect for softcoded hscript files.

### 3.1 Installing the Haxe Extension

1. **Install Haxe and Haxelib**: Ensure you have Haxe and Haxelib installed on your system.
   - Download from: [Haxe Downloads](https://haxe.org/download/)

2. **Install Visual Studio Code**: If you haven’t already, download and install Visual Studio Code.
   - Download from: [Visual Studio Code](https://code.visualstudio.com/)

3. **Install the Haxe Extension for VS Code**:
   - Open Visual Studio Code.
   - Go to the Extensions view by clicking the square icon in the sidebar or pressing `Ctrl+Shift+X`.
   - Search for "Haxe" and install the official Haxe extension.

### 3.2 Configuring Autocompletion Without Project Files

You can configure autocompletion for Haxe in VS Code even without using specific project files like `build.hxml`:

1. **Ensure Global Libraries Are Installed**:
   - Make sure you have installed necessary Haxe libraries globally using `haxelib`, such as `flixel`, `openfl`, and `lime`.

   ```
   haxelib install flixel
   haxelib install openfl
   haxelib install lime
   ```

2. **Check VS Code Haxe Settings**:
   - Open VS Code Settings (Ctrl + , or Cmd + , on macOS).
   - Search for "Haxe" to filter settings related to the Haxe extension.
   - Ensure that the `Haxe: Executable` path is correct and points to your Haxe installation.
   - Adjust the `Haxe: Library Path` if your Haxe libraries are installed in a non-standard location.

3. **Enable Autocompletion**:
   - Autocompletion should be enabled automatically once the Haxe extension is configured correctly.
   - As you type in `.hx` files, VS Code will provide autocompletion suggestions based on the Haxe libraries you have installed globally.

### 3.3 Final Configuration Tips

- **No Additional Files Needed**: This setup doesn’t require any additional files like `build.hxml`. The Haxe extension will use the globally installed libraries to provide autocompletion.
- **Lightweight Development**: This method is ideal for working on lightweight or small-scale Haxe projects, especially when you’re writing scripts that don’t need a full project setup.

## 4. Final Tips and Tricks

- **Debugging**: Use the `trace()` function to print debugging information to the console. This is similar to `print()` in Lua.
- **Optimization**: Haxe scripts can be optimized for performance by minimizing the use of global variables and frequent updates that do not need to occur every frame.

---
[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)

[link to source import stuff](https://github.com/ShadowMario/FNF-PsychEngine/tree/main/source)
