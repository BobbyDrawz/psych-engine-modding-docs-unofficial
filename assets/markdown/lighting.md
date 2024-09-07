# How to Use the RTX Lighting Shader Modpack for FNF Psych Engine

This guide will show you how to install and use the RTX-style lighting shader modpack in *Friday Night Funkin'* Psych Engine. With this mod, you can manipulate real-time lighting effects through an easy-to-use interface and copy settings directly into your Lua scripts.

## 1. Installing the Modpack

### Step 1: Download the Modpack

Download the RTX shader modpack from [here](https://gamebanana.com/mods/486094).

### Step 2: Extract the Modpack

Extract the contents into your `mods/` folder under a new directory (e.g., `mods/rtxLighting1`).

### Step 3: Ensure Compatibility

Make sure you have the latest version of Psych Engine installed. The mod may not work correctly on outdated versions. Minimum version required to use this is 0.6.3.

## 2. Opening the RTX Editor

In-game, you can access the RTX editor during gameplay. To open the editor:

- **Add Instance of Open RTX Editor event**: This will bring up the RTX editor interface. The editor allows you to manipulate various lighting parameters such as `overlayR`, `satinB`, and more, which control the appearance of the lighting.

[RTX Editor Example Video](https://www.youtube.com/watch?v=CEx1uYIOGMw&t=2s)

## 3. Setting and Adjusting Shader Values

Each slider controls different aspects of the lighting:

- **overlayR, overlayG, overlayB, overlayA**: Controls the overlay color and opacity.
- **satinR, satinG, satinB, satinA**: Adjusts the saturation and intensity of the lighting.
- **innerR, innerG, innerB, innerA**: Controls the color and brightness of the inner lighting.
- **innerAngle, innerDistance**: Adjusts the angle and distance of the inner lighting.

- **tip to remember**: R is red, G is green, B is blue, and A is alpha [transparency]

### Example:

If you want to give the game a red-tinted overlay, you could adjust the `overlayR` slider to max, while keeping `overlayG` and `overlayB` at zero. The same applies for other colors and effects.

## 4. Copying and Using Shader Data

Once you're satisfied with your settings, click **"Copy data to clipboard"**. The editor will provide a string of data like this:

```
overlayR, overlayG, overlayB, overlayA, satinR, satinG, satinB, satinA, innerR, innerG, innerB, innerA, innerAngle, innerDistance
```

Replace the values with the actual numbers from the sliders. Here's an example string:

```
1.0, 0.0, 0.0, 0.8, 0.5, 0.5, 0.5, 1.0, 1.0, 0.8, 0.8, 1.0, 45, 20
```

You can paste this string directly into your Lua script to apply these settings.

### Example Lua Script:

```lua
function onCreate()
    triggerEvent('Set RTX Data', 'exampleShitHere', '')
end
```

## 5. My Custom Stage Presets (you can use these)

These are some presets I made based around the official FNF stages at the time of weekend 1.

- **Preset 1 - Arcade Flashback**:

```
0, 0, 0.05, 0.44, 0.01, 0, 0.15, 0.11, 0.59, 0, 1, 0.03, 271.06, 32.52
```

- **Preset 2 - Neon Skyline**:

```
0.09, 0.25, 0.4, 0.18, 0, 0, 1, 0.19, 0, 0.19, 0.3, 0.6, 270.27, 24.84
```

- **Preset 3 - Sunset Cruise**:

```
0.87, 0.44, 0, 0.15, 0, 0, 0, 0, 0.3, 0.28, 0.67, 0.13, 271.36, 40.91
```

- **Preset 4 - Winter Glow**:

```
0, 0.25, 0.53, 0.24, 0, 0, 1, 0.18, 0.14, 0.76, 1, 0.12, 268.65, 21.12
```

- **Preset 5 - Golden Afternoon**:

```
0, 0, 0.34, 0.59, 0, 0, 0, 0, 0, 0.28, 0.41, 0.17, 264.22, 5.81
```

- **Preset 6 - Digital Corruption**:

```
0, 0, 0.34, 0, 0.25, 0, 0.34, 0.26, 0.54, 0, 0.17, 0.17, 210.6, 8.03
```

- **Preset 7 - Warzone Dusk**:

```
0.62, 0.32, 0, 0.3, 0, 0, 0, 0, 1, 0.48, 0, 0.12, 269.89, 50
```

- **Preset 8 - The Downtown City**:

```
0, 0.44, 0.83, 0.09, 0, 0.35, 0, 0.13, 0, 0.37, 0.59, 0.14, 270.55, 20.33
```

## 6. Applying Custom Stage Presets in a Stage (Placeholder for Instructions)

You just have to add the Set RTX Data event and add the numbers in value 1. Nothing for value 2.

[link to readme/home doc here](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
