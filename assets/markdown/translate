# How to Add Language Translations to Psych Engine

This guide will walk you through the process of adding language translations to **Friday Night Funkin' Psych Engine**. The steps below will help you understand how to work with the language files and translate important text elements, while keeping placeholders and structure intact.

## Step 1: Download the Language Template

Before starting, download the **Psych Engine Language Template**:

[Download Template](https://gamebanana.com/mods/536068)

The template file, `template-US.lang`, contains all the necessary key-value pairs used in the game. You will modify this file to add your language.

I created this template file by modifying the stock `pt-BR.lang` file

## Step 2: Understanding the Template File

Open `template-US.lang` to see the structure of the language file. Each key corresponds to specific game text, and the value is what you need to translate. **Important:** You must keep the placeholders (e.g., `{1}`, `{2}`) unchanged in the translation.

For example:

```
// Gameplay
score_text: "Score: {1} | Misses: {2} | Rating: {3}"
botplay: "Botplay"
```

This key-value pair handles the display of the score and botplay text. When translating, you only need to change the text within the quotes, **not** the key (`score_text`) or placeholders (`{1}`, `{2}`, etc.).

### Key Points to Notice:
- **Placeholders (`{1}`, `{2}`)**: These represent dynamic values such as scores or player names. **Do not translate or modify** these placeholders.
- **Keys**: Keep all keys unchanged. Only translate the value after the colon (`:`).

## Step 3: Adding Translations (Country vs Language Codes)

When naming your translation file, you need to understand the difference between **language** and **country** abbreviations. For instance:
- **English (United States)**: `en-US`
- **Spanish (Mexico)**: `es-MX`
- **Portuguese (Brazil)**: `pt-BR`
- **Chinese (Simplified)**: `zh-CN`

Here’s an example of translating the above file to **French (France)** (language code `fr` and country code `FR`):

```
// Gameplay
score_text: "Score: {1} | Erreurs: {2} | Évaluation: {3}"
botplay: "Autoplay"
```

Notice how the **placeholders remain unchanged**, and only the text values are translated.

### Additional Example:
For **Spanish (Spain)** (language code `es`, country code `ES`), the file would look like this:

```
// Gameplay
score_text: "Puntuación: {1} | Fallos: {2} | Evaluación: {3}"
botplay: "Autoplay"
```

## Step 4: Important Sections to Translate

Here are the key sections in `template-US.lang` to focus on when translating:

1. **Gameplay**: Handles in-game text such as score, misses, and ratings.
2. **Dialogues**: Contains any text related to story mode dialogues.
3. **Pause Menu**: Text displayed in the pause menu during gameplay.
4. **Main Menu**: Translation for options like "Story Mode" and "Freeplay".
5. **Story Mode**: Week names and track names for story mode.
6. **Freeplay**: Text shown in the Freeplay mode, including tips and best scores.
7. **Mods Menu**: For text in the mods management screen.
8. **Achievements**: Descriptions of achievements the player can unlock.
9. **Options**: The settings menu, covering controls, gameplay, visuals, etc.

## Step 5: Saving and Naming the File

Once you have finished translating, save the file as `<language-code>.lang`, where `<language-code>` represents the language and country code. 

### Examples:
- **Spanish (Spain)**: `es-ES.lang`
- **French (France)**: `fr-FR.lang`
- **Chinese (Simplified)**: `zh-CN.lang`

Place your `.lang` file in `mods/data/languages/`.

## Step 6: Testing Your Translation

To test your translation in-game:
1. Open **Psych Engine**.
2. Go to the **Options** menu.
3. Select the new language from the **Language** settings.

Make sure to test all game modes (e.g., Story Mode, Freeplay) to ensure that everything is correctly translated and placeholders are working.

## Step 7: Share Your Translation

Once your translation is complete, feel free to share it as part of your mod or upload it as a standalone language mod. Ensure it is correctly named and stored in the `mods/data/languages/` directory for others to use easily.

---

Happy translating! If you encounter any issues, please check out the [official Psych Engine documentation](https://github.com/ShadowMario/FNF-PsychEngine) for more information.

[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
