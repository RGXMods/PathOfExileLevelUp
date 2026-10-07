# <span style="color: #b37c44;"></span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #b37c44;">| </span> <span style="color: #b37c44;">P</span><span style="color: #ffffff;">ath of </span><span style="color: #b37c44;">E</span><span style="color: #ffffff;">xile </span><span style="color: #b37c44;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #b37c44;">U</span><span style="color: #ffffff;">p</span><span style="color: #b37c44;">!</span>

![POELU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #b37c44;">Overview</span>

**Path of Exile Level-Up! (POELU)** replaces World of Warcraft's configured default level-up sound with a Path of Exile-inspired chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Exile ding! Bwwiiiee."</span>

***

## <span style="color: #b37c44;">Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Path of Exile sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #b37c44;">Behavior and Features</span>

- Plays the selected Path of Exile-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while POELU is enabled.
- Persists enablement and sound-variant choices in `POELUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.

POELU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #b37c44;">Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `PathOfExileLevelUp.toc` | `120100` |
| WoW Forever (Beta) | `PathOfExileLevelUp_Forever.toc` | `16001` |
| Mists of Pandaria Classic | `PathOfExileLevelUp_Mists.toc` | `50504` |
| Cataclysm Classic | `PathOfExileLevelUp_Cata.toc` | `40402` |
| Wrath Classic | `PathOfExileLevelUp_Wrath.toc` | `38002` |
| Burning Crusade Classic | `PathOfExileLevelUp_TBC.toc` | `20506` |
| Classic Era | `PathOfExileLevelUp_Vanilla.toc` | `11509` |

These values describe the current release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #b37c44;">Language Support</span>

POELU is fully localized across all 12 World of Warcraft client locales. The addon ships a single `data/locales.lua` that selects a locale block via `GetLocale()`, with an unconditional `enUS` base table providing the structural fallback — every key is present in every block. Supported locales (enUS plus eleven translations):

| Locale | Native name | Block |
|---|---|---|
| `enUS` | English (base/fallback) | unconditional base table |
| `deDE` | Deutsch | `deDE` |
| `esES` | Español (Europa) | `esES` |
| `esMX` | Español (Latinoamérica) | `esMX` |
| `frFR` | Français | `frFR` |
| `itIT` | Italiano | `itIT` |
| `koKR` | 한국어 | `koKR` |
| `ptBR` | Português (Brasil) | `ptBR` |
| `ptPT` | Português (Portugal) | `ptPT` |
| `ruRU` | Русский | `ruRU` |
| `zhCN` | 简体中文 | `zhCN` |
| `zhTW` | 繁體中文 | `zhTW` |

Each TOC declares `## X-Localizations` listing all twelve locales. `ptBR` and `ptPT` use separate blocks; `esMX` has its own dedicated block (no longer sharing `esES`'s block). Every block translates the complete key set — including the shared `RGX_MODS_PREFIX` brand key — so no untranslated key can leak into the game UI.

***

## <span style="color: #b37c44;">Installation</span>

1. Download a packaged release of PathOfExileLevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `PathOfExileLevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Path of Exile Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #b37c44;">⌨Usage and Configuration</span>

POELU works automatically once enabled. It has no graphical configuration panel; use `/poelu` commands in chat:

| Command | Result |
|---|---|
| `/poelu` or `/poelu help` | List available commands. |
| `/poelu test` | Play the selected sound variant. |
| `/poelu enable` | Enable replacement playback. |
| `/poelu disable` | Disable replacement playback. |
| `/poelu high` | Select the high-quality file. |
| `/poelu med` or `/poelu medium` | Select the medium-quality file. |
| `/poelu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `POELUSettings`.

***

## <span style="color: #b37c44;">Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/poelu` command.
- `sounds/path_of_exile_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, POELU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #b37c44;">Troubleshooting</span>

- If WoW marks POELU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/poelu test`, then `/poelu enable` and select a variant again.
- If the default sound also plays, verify that POELU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/PathOfExileLevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #b37c44;">Project Links</span>

- [Repository](https://github.com/RGXMods/PathOfExileLevelUp)
- [Releases](https://github.com/RGXMods/PathOfExileLevelUp/releases)
- [Issues](https://github.com/RGXMods/PathOfExileLevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! </span>
