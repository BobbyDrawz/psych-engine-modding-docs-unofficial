# Metadata Setup

This section will guide you through setting up the metadata for your FNF Psych Engine mod. The metadata file usually controls key aspects like the mod’s name, description, mod loader color, Discord RPC, and more.

## 1. **The Modpack File**

To start, create a new folder within your mods folder. Next, create a new text file, and change its name to `pack.json`. Make sure you didn't accidentally name it `pack.json.txt`! Avoid this by going to File Explorer and enabling view/show/file extensions.

Inside this file, we will put the information the game needs in order to display your mod. [Note that the one line at the end of the JSON is there by default.]

```json
{
    "name": "Name",
    "description": "Description",
    "restart": false,
    "runsGlobally": false,
    "color": [170, 0, 255],
    "discordRPC": "863222024192262205",
    "iconFramerate": 10
}
```

`pack.json` has these fields:

- **`name`**: The name of the mod. This will show up in the mod menu.
- **`description`**: The description of the mod.
  - You can use escape sequences.
  - Here's a list of common escape sequences to use if you want.
- **`restart`**: A bool value that triggers a game restart on enabling/disabling/reordering the mod if true.
- **`runsGlobally`**: A bool value that determines if scripts and characters are mod-specific.
- **`color`**: RGB color that is shown in the mod loader preview. Here's a list of pre-made colors I recommend starting out with:
  - `Red`: [255, 81, 82]
  - `Orange`: [255, 142, 66]
  - `Yellow`: [249, 207, 81]
  - `Green`: [127, 254, 76]
  - `Cyan`: [98, 255, 202]
  - `Blue`: [108, 158, 255]
  - `Indigo`: [65, 60, 174]
  - `PsychPurple (default)`: [170, 0, 255]
  - `DearestPurple`: [195, 107, 255]
  - `Pink`: [255, 161, 200]
  - `White`: [237, 237, 237]
  - `LightGray`: [192, 192, 192]
  - `DarkGray`: [120, 120, 120]
  - `Black`: [64, 64, 64]
- **`discordRPC [optional]`**: Config value for Discord rich presence. Remove it if you don't want custom Discord RPC on your mod.
- **`iconFramerate [optional]`**: Framerate for mod loader icon. Remove if your icon is not animated.

## 2. **Mod Settings Configuration**

In addition to the `pack.json` file, your mod can include a `settings.json` file located in `mods/data/settings.json` [if you want it across everything] or `mods/Your-Mod-Name/data/settings.json` [if it's for a modpack]. This file allows you to define customizable settings that players can adjust within the game's mod settings menu. The `settings.json` file is particularly useful for providing users with control over various aspects of your mod, such as enabling/disabling features, adjusting numerical values, and selecting options from a predefined list.

### sub-1. **Overview of Settings Types**

Each setting in the `settings.json` file consists of several key attributes that define its behavior and appearance in the settings menu:

- **`save`**: The internal name used to reference this setting in your mod’s code.
- **`name`**: The name displayed to the user in the mod settings menu.
- **`description`**: This is pretty self-explanatory.
- **`type`**: The data type of the setting, which determines how it is presented to the user. Supported types include:
  - **`bool`**: A checkbox, representing a true/false value.
  - **`int`**: An integer value (whole numbers only).
  - **`float`**: A floating-point number (numbers with decimals).
  - **`percent`**: A floating-point number displayed as a percentage.
  - **`string`**: A text string, typically with predefined options.
  - **`keybind`**: (To be implemented) Allows users to customize key bindings.
- **`value`**: You already know how this goes.

### sub-2. **`settings.json` modules**

**boolean module example**

```json
{
    "save": "testbool",
    "name": "Test Bool Option",
    "type": "bool",
    "description": "This is a test bool option",
    "value": true
}
```

**int/float/percent module example**

```json
{
    "save": "testnumber",
    "name": "Test Number Option",
    "type": "float",
    "description": "This is a test number option",
    "value": 5,
    "min": 0,
    "max": 10,
    "step": 1,
    "decimals": 1,
    "scroll": 5
}
```

**string module example**

```json
{
    "save": "teststring",
    "name": "Test String Option",
    "type": "string",
    "description": "This is a test string option",
    "value": "Sun",
    "format": "%vday",
    "options": ["Sun", "Mon", "Tues", "Wednes", "Thurs", "Fri", "Satur"]
}
```

**keybind module example**

```json
{
    "save": "testkey",
    "name": "Test Custom Key",
    "type": "keybind",
    "keyboard": "T",
    "gamepad": "RIGHT_TRIGGER"
}
```

To use these, add a square bracket pairing, open it [press enter] and then import as many settings as you like.

## 3. **The Credits**

If you want to create a custom credits section for your mod, you can do so by creating a `credits.txt` file. This file should be placed in either the `mods/data` or `mods/Your-Mod-Name/data` folder. Each line in the credits.txt file follows a specific format that defines how the credit information is displayed in the game.

**credits file here:**

```plaintext
name::iconname::description::link::colorHex
```

- **`name`**: Name of contributor. Pretty self-explanatory.
- **`iconname`**: Name of 150x150 PNG in `mods/Your-Mod-Name/images/credits`. This will show up in the person's credits line. If you don't have an icon name, instead `missing_icon.png` shows up.
- **`description`**: Description stating what the contributor did.
- **`link`**: Link to a social media page of the contributor. If there is none, or you need a placeholder, I recommend using `about:blank`.
- **`colorHex`**: Hexadecimal color that the menu tints itself upon hovering over a contributor.

For a section header, only fill out the `name` field.

An example of this is here:

```plaintext
bobbyDX_::bobby::insert description here::https://gamebanana.com/members/3384454::FFDD33
```

In order to create a credits icon, refer to [this icon guide](https://gamebanana.com/tuts/17214).

---
[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
