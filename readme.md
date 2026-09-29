> [!IMPORTANT]  
> Just vibe coded to test the idea. Therefor not save to use!
> It uses the API from this plugin: https://openplanet.dev/plugin/medalsdifficulty

# Ultimate Medals Extended
## wow another medals plugin
Unlike Ultimate Medals, (which only shows ingame medals) and Ultimate Medals++ (which has to code in any extra medals it shows), Ultimate Medals Extended is designed so that each medal plugin can add a medal to it. This way, it can automatically support any new medal plugin that is created.

### Builtin medals:
- Personal Best (127)
- Author/Trackmaster (*63*)
- Gold (62)
- Silver (61)
- Bronze (60)
- Super Trackmaster (67)
- Super Gold (66)
- Super Silver (65)
- Super Bronze (64)
- Default Gold (72)
- Default Silver (71) (disabled)
- Default Bronze (70) (disabled)
- Session best (126) (disabled)
- Previous run (125) (disabled)
### Supporting plugins:
- Champion Medals (*63*) (https://gitlab.com/naninf/champion-medals)
- Warrior Medals (*63*) (https://github.com/ezio416/tm-warrior-medals)
- Extra Leaderboard Positions (191-) (https://github.com/Banalian/ExtraLeaderboardPositions)
- Copium (*63*, *63*, *63*) (https://github.com/ezio416/tm-copium)
- s314ke Medals (*63*) (https://github.com/Mattynator0/s314keMedals)
- Glacial Medals (*63*) (https://github.com/Mattynator0/GlacialMedals)
- Validation Medal (for UME) (66, 65)

numbers mentioned with medals are sort priority if times are equal

## Exports
To use Ultimate Medals Extended as a dependency, you need to define a class implementing the `UltimateMedalsExtended::IMedal` interface
(defined and documented in Medals/IMedal.as).
You then pass it to `UltimateMedalsExtended::AddMedal`. (The other exports from are defined in Exports.as).
You must ensure that you remove medals when `OnDestroyed` is called, using `UltimateMedalsExtended::RemoveMedal(name)`, otherwise both plugins will crash if your plugin is reloaded / updated.


### Example usage as a dependency
In this example, the value of `exampleMedal` would be set elsewhere inside example medal plugin and is 0 when not avaliable.  
And it uses an internal variable `currentUID` for the map it has current example medal data for.  

```
#if DEPENDENCY_ULTIMATEMEDALSEXTENDED

class ExampleMedal : UltimateMedalsExtended::IMedal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = "Example Medal";
        c.icon = "\\$f0f" + Icons::Circle;
        return c;
    }

    void UpdateMedal(const string &in uid) override {}

    bool HasMedalTime(const string &in uid) override {
        return currentUID == uid && exampleMedal != 0;
    }
    uint GetMedalTime() override {
        return exampleMedal;
    }
}

void OnDestroyed() {
    UltimateMedalsExtended::RemoveMedal("Example Medal");
}

#endif
```

and in Main():

```
#if DEPENDENCY_ULTIMATEMEDALSEXTENDED
    UltimateMedalsExtended::AddMedal(ExampleMedal());
#endif
```

