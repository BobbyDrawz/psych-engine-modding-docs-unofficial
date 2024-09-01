### Achievements Configuration (achievements.json)

The `achievements.json` file allows you to define custom achievements for your mod in Psych Engine. This file should be placed in the same directory as `settings.json`, typically within your mod's data folder.

#### 1. **Basic Structure**

Each achievement is defined as an object within an array. Here’s an example structure:

custom week no misses:

```json
    {
        "save": "customweek_nomiss", // Will load images/achievements/customweek_nomiss.png
        "name": "Custom Week No Miss",
        "description": "Name it Your week JSON file name + \"_nomiss\"\nif you want it to be handled automatically by Psych Engine"
    }
```

simple test achievement:

```json
    {
        "save": "test_achievement1", // Will load images/achievements/test_achievement1.png
        "name": "Test Achievement 1",
        "description": "This is a simple achievement with no Progress Bar"
    }
```
more complex test achievement

```json
    {
        "save": "test_achievement2", // Will load images/achievements/test_achievement2.png
        "name": "Test Achievement 2",
        "description": "This is a more complex achievement with a Progress Bar and\nall changeable variables being shown.",
        "maxScore": 40,
        "maxDecimals": 0, // This will be how many decimals will be shown on the progress counter
        "hidden": false
    }
```

#### 2. **Key Fields**

- **`save`**: The unique identifier for the achievement. Psych Engine will load the corresponding achievement icon from `images/achievements/`.
- **`name`**: The display name of the achievement.
- **`description`**: A brief description of how the achievement is earned.
- **`maxScore`** (optional): The maximum score or progress required to unlock the achievement.
- **`maxDecimals`** (optional): The number of decimal places shown in the progress counter.
- **`hidden`** (optional): If set to `true`, the achievement will be hidden until unlocked.

#### 3. **Adding Custom Achievements**

To add your own custom achievements:

1. **Create the Achievement Icon**: Design a 150x150 PNG image for your achievement and place it in the `images/achievements/` folder. The filename should match the `save` field.
2. **Define the Achievement**: Add a new object in the `achievements.json` array with the appropriate fields.
3. **Test Your Achievements**: Ensure the achievements display correctly in-game and are unlocked according to your conditions.

#### 4. **Example of a Custom Achievement**

Here’s an example of a custom achievement configuration:

```
{
    "save": "epic_gamer",
    "name": "Epic Gamer",
    "description": "Complete all songs on Hard mode without missing a note.",
    "hidden": true
}
```

This achievement is hidden and will only be revealed when the player meets the condition of completing all songs on Hard mode without missing a note.

---
 [link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
