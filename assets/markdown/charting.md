# FNF Psych Engine Charting Guide (v1.0)

Charting in Friday Night Funkin' (FNF) using the Psych Engine requires familiarity with the various tools and settings provided by the engine. This guide will help you understand the updated 1.0 UI, covering everything from basic chart properties to advanced features like custom note types and events.

## Introduction to Charting

Charting involves creating the sequences of notes, events, and sections that make up a song in FNF. With the Psych Engine's comprehensive chart editor, you can fine-tune every aspect of your chart to ensure it syncs perfectly with the music and provides a smooth gameplay experience. This guide will walk you through the different tabs and options available, helping you master the charting process.

## 1. Chart Properties

The **Chart Properties** section allows you to control key settings that impact the entire chart. These settings are critical for ensuring that your song's chart is synchronized with the music and behaves as expected during gameplay.

### 1.1 Basic Settings Overview

In the **Charting** tab, you'll find several important properties:

- **Playback Rate**: Adjusts the speed at which the song plays back in the editor. This does not affect the actual gameplay speed but is useful for testing and editing at different speeds.
- **Mouse Scroll Snap**: When enabled, this option makes scrolling through the chart snap to the nearest beat, making precise edits easier.
- **Ignore Progress Warnings**: Disables warnings about progress while editing, useful when testing incomplete or experimental sections.
- **Hitsound (Player)**, **Hitsound (Opp.)**, **Metronome**: These settings adjust the sound effects that play when notes are hit or missed during editing.
- **Inst. Volume**, **Main Vocals Volume**, **Opp. Vocals Volume**: Adjusts the volume levels for the instrumental, main vocals, and opponent vocals respectively. The **Mute** options allow you to silence these tracks during editing.

### 1.2 Song Properties

The **Song** tab allows you to configure settings specific to the song being charted:

- **Song Name**: The name of the song you're charting.
- **Allow Vocals**: Enables or disables the use of vocals in the chart.
- **BPM**: Sets the Beats Per Minute, which controls the timing and spacing of notes.
- **Scroll Speed**: Determines how fast the notes scroll during gameplay.
- **Audio Offset (ms)**: Adjusts the timing of the audio in milliseconds to sync with the chart.
- **Player**, **Opponent**, **Girlfriend**: Select the characters that will be used in the chart.
- **Stage**: Specifies the stage or background that will be used during the song.

## 2. Section Properties

The **Section** tab is where you can control how each section of the chart behaves:

- **Must Hit Section**: Determines if the player must hit the notes in this section.
- **GF Section**: Designates a section where Girlfriend sings or plays.
- **Alt Anim**: Uses alternate animations for opponent character during this section.
- **Change BPM**: Allows you to change the BPM for a specific section.
- **Beats per Section**: Sets the number of beats in a section.
- **Copy Section**, **Paste Section**, **Clear**: Tools to copy, paste, or clear sections of the chart.
- **Swap Section**, **Duet Section**, **Mirror Notes**: Options for adjusting sections, enabling duets, or mirroring notes.

## 3. Note Properties

The **Note** tab is crucial for customizing the notes in your chart:

- **Sustain Length**: Sets the length of sustained notes (hold notes).
- **Note Hit Time (ms)**: Adjusts the timing of note hits in milliseconds.
- **Note Type**: Select from predefined note types or add custom note types.

### 3.1 Custom Note Types

You can create custom note types by placing Lua files in the `mods/Your-Mod-Name/custom_notetypes/` directory. For song-specific custom notes, list them in the `mods/Your-Mod-Name/data/yourSongName/notetypes.txt` file.

Example note types include:
- **Alt Animation**: Plays alternate animations for characters [e.g. normally left note plays `singLEFT`, but alt left note plays `singLEFT-alt`]. [here](https://www.mediafire.com/file/vrwne3ye6t4bqf9/sfg-bf-alt-anims.zip/file)'s a link that gives BF his alternate animations from Super Funkin' Galaxy [an SMG FNF mod by SPG64, but that's not important].
- **HEY!**: Plays the respective character's `hey` animation, if there is one.
- **Hurt Note!**: Basic hurt notes that take some of the player's health away if hit.
- **GF Sing**: Instead of the `boyfriend`/`dad` characters singing, instead the `gf` character sings.
- **No Animation**: Functions like a normal note, but without the character doing their animation. This is useful for moments in which a pivotal animation is playing [e.g. Pico's breakdancing from Unloaded].

## 4. Event Properties

The **Events** tab allows you to add and manage events within your chart:

- **Event**: Select from a list of predefined events, such as **Hey!**, **Screen Shake**, or **Change Character**.
- **Value 1** and **Value 2**: These fields allow you to input specific parameters for the events.
- **Add Event**, **Remove Event**, **Previous/Next Event**: Controls for adding, removing, or navigating through events.

### 4.1 Custom Events

Custom events can be added by placing Lua or Haxe files in the `mods/Your-Mod-Name/custom_events/` directory. For a visual explanation, you can also include a `.txt` file with instructions. (Refer to the scripting page for detailed guidance on scripting events.)

## 5. Data Properties

The **Data** tab lets you adjust game over settings and other visual properties:

- **Game Over Character**: Selects the character displayed during the game over screen.
- **Game Over Death Sound**: Specifies the sound that plays when the player dies.
- **Game Over Loop Music** and **Retry Music**: Sets the music that plays during the game over screen.
- **Disable Note RGB**: Disables the RGB effect on notes. This has the notes viewed as red [main note color], green [white middle], and blue [outline] textures.
- **Note Texture** and **Note Splashes Texture**: Allows you to set custom textures for notes and note splashes.

## 6. Saving and Managing Charts

Once you've configured your chart, it's important to save your work properly:

- **Save Location**: Charts should be saved in the `mods/Your-Mod-Name/data/yourSongName/` folder, with the song name being your actual song name.
- **File Naming**:
  - **Notes**: Save as `yourSongName-difficulty.json` (e.g., `roses-hard.json`). For normal difficulty, simply use `yourSongName.json` [if your song is, say, blammed, then just save blammed normal difficulty as `blammed.json`]
  - **Events**: Save events across all difficulties as `events.json`.

---

[link back to readme/home doc](https://github.com/BobbyDrawz/psych-engine-modding-docs-unofficial/blob/main/README.md)
