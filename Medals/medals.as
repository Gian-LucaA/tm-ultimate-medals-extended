#if TURBO

class SuperTrackmasterMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Super Trackmaster';
        c.icon = '\\$0ff' + Icons::Circle;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        CGameCtnChallenge@ map = getMap();
        if (map.AuthorLogin == "Nadeo") {
            uint mapNum = 0;
            Text::TryParseUInt(map.MapName, mapNum);
            this.medalTime = STM::getSuperTrackmaster(mapNum);
        } else {
            this.medalTime = 0;
        }
    }
    uint GetMedalTime() override {
        return this.medalTime;
    }
    bool HasMedalTime(const string &in uid) override {
        return this.medalTime > 0 && _hasIngameMedals();
    }
}

class SuperGoldMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Super Gold';
        c.icon = '\\$db4' + Icons::Circle;
        c.iconOverlay = '\\$0f1' + Icons::CircleO;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        CGameCtnChallenge@ map = getMap();
        if (map.AuthorLogin == "Nadeo") {
            uint mapNum = 0;
            Text::TryParseUInt(map.MapName, mapNum);
            this.medalTime = STM::getSuperGold(mapNum, map.TMObjective_AuthorTime);
        } else {
            this.medalTime = 0;
        }
    }
    uint GetMedalTime() override {
        return this.medalTime;
    }
    bool HasMedalTime(const string &in uid) override {
        return this.medalTime > 0 && _hasIngameMedals();
    }
}

class SuperSilverMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Super Silver';
        c.icon = '\\$899' + Icons::Circle;
        c.iconOverlay = '\\$0f1' + Icons::CircleO;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        CGameCtnChallenge@ map = getMap();
        if (map.AuthorLogin == "Nadeo") {
            uint mapNum = 0;
            Text::TryParseUInt(map.MapName, mapNum);
            this.medalTime = STM::getSuperSilver(mapNum, map.TMObjective_AuthorTime);
        } else {
            this.medalTime = 0;
        }
    }
    uint GetMedalTime() override {
        return this.medalTime;
    }
    bool HasMedalTime(const string &in uid) override {
        return this.medalTime > 0 && _hasIngameMedals();
    }
}

class SuperBronzeMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Super Bronze';
        c.icon = '\\$964' + Icons::Circle;
        c.iconOverlay = '\\$0f1' + Icons::CircleO;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        CGameCtnChallenge@ map = getMap();
        if (map.AuthorLogin == "Nadeo") {
            uint mapNum = 0;
            Text::TryParseUInt(map.MapName, mapNum);
            this.medalTime = STM::getSuperBronze(mapNum, map.TMObjective_AuthorTime);
        } else {
            this.medalTime = 0;
        }
    }
    uint GetMedalTime() override {
        return this.medalTime;
    }
    bool HasMedalTime(const string &in uid) override {
        return this.medalTime > 0 && _hasIngameMedals();
    }
}

#endif

class AuthorMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
#if TMNEXT
        c.defaultName = 'Author';
        c.icon = '\\$071' + Icons::Circle;
        c.iconOverlay = '\\$db4' + Icons::CircleO;
#elif MP4
        c.defaultName = 'Author';
        c.icon = '\\$071' + Icons::Circle;
#elif TURBO
        c.defaultName = 'Trackmaster';
        c.icon = '\\$0f1' + Icons::Circle;
#endif
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.medalTime = getMap().TMObjective_AuthorTime;
    }
    uint GetMedalTime() override {
        if (MapData::validationMode) {
            if (MapData::validated) {
                if (PreviousRun::session == uint(-1) || (MapData::highBetter ^^ this.medalTime < PreviousRun::session)) {
                    return this.medalTime;
                }
            }
            return PreviousRun::session;
        }
        return this.medalTime;
    }
}

class GoldMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Gold';
        c.icon = '\\$db4' + Icons::Circle;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.medalTime = getMap().TMObjective_GoldTime;
    }
    uint GetMedalTime() override {
        if (MapData::validationMode) {
            if (MapData::validated) {
                if (PreviousRun::session == uint(-1) || (MapData::highBetter ^^ this.medalTime < PreviousRun::gold)) {
                    return this.medalTime;
                }
            }
            return PreviousRun::gold;
        }
        return this.medalTime;
    }
}

class SilverMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Silver';
        c.icon = '\\$899' + Icons::Circle;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.medalTime = getMap().TMObjective_SilverTime;
    }
    uint GetMedalTime() override {
        if (MapData::validationMode) {
            if (MapData::validated) {
                if (PreviousRun::session == uint(-1) || (MapData::highBetter ^^ this.medalTime < PreviousRun::silver)) {
                    return this.medalTime;
                }
            }
            return PreviousRun::silver;
        }
        return this.medalTime;
    }
}

class BronzeMedal : Medal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Bronze';
        c.icon = '\\$964' + Icons::Circle;
        c.shareHidden = true;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.medalTime = getMap().TMObjective_BronzeTime;
    }
    uint GetMedalTime() override {
        if (MapData::validationMode) {
            if (MapData::validated) {
                if (PreviousRun::session == uint(-1) || (MapData::highBetter ^^ this.medalTime < PreviousRun::bronze)) {
                    return this.medalTime;
                }
            }
            return PreviousRun::bronze;
        }
        return this.medalTime;
    }
}