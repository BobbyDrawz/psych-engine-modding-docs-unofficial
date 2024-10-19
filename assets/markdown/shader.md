# Adding Shaders to FNF Psych Engine

Shaders can enhance the visual effects in Friday Night Funkin' by adding dynamic effects like distortions, color changes, and more. This guide will walk you through importing and applying shaders in Psych Engine.

## 1. Converting Shadertoy Shaders to HaxeFlixel

To use a Shadertoy shader in Psych Engine, you first need to convert it into a format compatible with HaxeFlixel. Here's how:

### 1.1 Using the Shader Conversion Tool

- Visit the [Shadertoy to Flixel Converter](https://theleername.github.io/ShadertoyToFlixel).
- Copy the shader code from Shadertoy and paste it into the converter.
- The converter will output a `.frag` shader file that can be used in HaxeFlixel.

### 1.2 Importing the Shader

Once you have the `.frag` file:

1. **Place the Shader**: 
   - Save the `.frag` file in the `mods/shaders/` or `mods/Your-Mod-Name/shaders/` directory within your Psych Engine mod.

2. **Add the Shader in Haxe Code**:
   - If you're comfortable with the source code, you can integrate the shader directly into the engine by adding it to the appropriate state (e.g., `PlayState`).

## 2. Applying Shaders Using Lua

If you're using Lua scripting in Psych Engine, you can apply shaders dynamically during gameplay.

### 2.1 Example Lua Script for Applying Shaders

Below is a Lua script template that applies a shader dynamically. This is meant to be in the `scripts` folder if your mod. Replace `"shader"` with the name of your shader, and adjust the `camera` variable as needed:

```lua
local shaderName = 'shader'
local camera = 'camGame'  -- Replace this with 'camHUD' or any other camera if needed

function onCreatePost()
    if (shadersEnabled) then
        initLuaShader(shaderName);

        makeLuaSprite("temporaryShader");
        makeGraphic("temporaryShader", screenWidth, screenHeight);
        
        setSpriteShader("temporaryShader", shaderName);
        --addHaxeLibrary("ShaderFilter", "openfl.filters");

	--apparently addHaxeLibrary is deprecated for psych engine 1.0, uncomment the line if you are below 1.0 on something that supports shaders
	
        runHaxeCode([[
            trace(ShaderFilter);
            game.]] .. camera .. [[.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]]);
    end
end

local time = 0;
function onUpdatePost(e)
    time = time + e;
    setShaderFloat('temporaryShader','iTime', time)
end
```

### 2.2 Applying Shaders to Specific Elements

You can apply shaders to specific elements like characters, backgrounds, or even notes. Replace `camera` with the target element's ID or name if needed.

## 3. Generative Shaders on Stages

If you found a good shader and you want to use it for a full stage, then add a new file in `mods/stages/` or `mods/Your-Mod-Name/stages/` and call it whatever you want. There are 2 components to a stage. the `.json` file [for character offset and image directory n' shit] and the `.lua` file [which actually assembles graphics for stage]. for the `.json` file, its easiest to simply copy-paste the file from `assets/shared/stages/stage.json` as the week 1 stage offset config is as good as it is. For the `.lua` file, you are going to want something like this:

```lua
local bgShaderName = 'shader'

function onCreate()
	-- background shit
	makeLuaSprite('background', 'stageback', -600, -300);
	setScrollFactor('background', 0.9, 0.9);

	addLuaSprite('background', false);
end

function onCreatePost()
    initLuaShader(bgShaderName)
 
    setSpriteShader("background", bgShaderName)
end
 
function onUpdate()
    --setShaderFloat("background", "uVariable", 1)
end
```

This loads the week 1 stage background and applies a shader to it. The `setShaderFloat` comment in the `onUpdate` function is to have comment marks removed incase there's an actual variable in the haxeflixel shader you need to configure.

## 4. Testing and Tweaking

After applying the shader, it's essential to test it across different levels and scenes to ensure it behaves as expected. Sometimes, shaders may need tweaking, especially in terms of how they interact with other visual effects.

## Conclusion

By following this guide, you can add visually stunning shaders to your Friday Night Funkin' mods, enhancing the gameplay experience. Shaders offer a powerful way to customize and improve the visual fidelity of your mod, making it stand out in the community.

---

Happy modding!

[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
