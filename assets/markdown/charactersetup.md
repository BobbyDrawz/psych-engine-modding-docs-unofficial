### Custom Characters

This guide will walk you through the process of importing characters into FNF Psych Engine. You'll learn how to set up basic animations, handle different types of character spritesheets, and use the Psych Engine Character Editor to fine-tune your character’s animations.

#### 1. **Character Importing Basics**

Before you can use your custom character in FNF Psych Engine, you need to properly set up their images and animations. Characters can be imported using two main methods: the Spritesheet Method and the Spritemap Method. Depending on the complexity of your character, you can choose either method.

##### 1.1 **Sparrow Spritesheet Importing**

This is the most common method used in FNF modding. Your character’s animations are stored in a single spritesheet image with a corresponding XML file.

File Setup:

- Spritesheet Image: template.png (replace "template" with your character's name)

- XML File: template.xml

- Location: Place both files in mods/images/characters/ or mods/Your-Mod-Name/images/characters/.

example directory structure:

```plaintext
mods/
└── images/
    └── characters/
        ├── template.png
        └── template.xml
```

##### 1.2 **Atlas Spritemap Importing**

This method is used for characters exported from Adobe Animate and is more suitable for complex animations.

File Setup:

- Spritesheet Images: spritemap1.png

- JSON Files: spritemap1.json, Animation.json

- Location: Place all files in mods/images/characters/template/ or mods/Your-Mod-Name/images/characters/template/.

example directory structure

```
mods/
└── images/
    └── characters/
        └── template/
            ├── spritemap1.png
            ├── spritemap1.json
            └── Animation.json
```

#### 2. **Animation Setup**

When setting up your character, there are several essential animations that you need to define:

singLEFT, singDOWN, singUP, singRIGHT: These animations correspond to the character singing in different directions.

idle: The character's idle animation (used by most FNF characters).

danceLeft and danceRight: Alternative idle animations used for GF-style characters.

If your character is playable (like BF), you should also include miss animations:

singLEFTmiss, singDOWNmiss, singUPmiss, singRIGHTmiss: Animations for when the player misses notes.

Beyond the basic animations, you can define additional animations for more complex interactions:

hey: Used for taunts or special moves (e.g., BF's V-pose).

Alternate Animations: Add variations like singDOWN-alt, singRIGHT-alt for unique character expressions during gameplay.

#### 3. **Using Character Editor**

Psych Engine provides a built-in Character Editor to help you set up and adjust animations for your character.

##### 3.1 **Loading Character Images**

Navigate to the Character Tab:

Go to the Character tab in the editor.
In the "Image File Name" field, type the directory name of your character's images (e.g., `characters/BOYFRIEND` or `characters/daddyDearest`).
Loading Multiple Spritesheets:

If your character uses multiple spritesheets, load each one accordingly. You can also work with a single sheet if that suits your character.

##### 3.2 **Adding or Updating Animations**

Go to the Animations Tab:

Select the "Animations" tab to manage the animations for your character.
Add a New Animation:

Type the name of the animation you want to add (e.g., singLEFT).
Then, type the symbol name or tag from the XML file that corresponds to that animation.
Edit Existing Animations:

Click on an existing animation to update its properties, such as frame rate, loop settings, or sprite offsets.

##### 3.3 **Saving and Testing**

Save Your Character: Once you’ve set up all your animations, save your character settings as a .json file in `mods/Your-Mod-Name/characters/`. Keep it short and easy to find like `bf.json` or `pico-playable.json`

Note: Sometimes if you select a character to be an opponent, it takes gf's spot like in tutorial. This is because the character json name starts with `gf`.

Test in-game: Test the character in-game to ensure all animations are playing correctly and transitions are smooth.

[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
