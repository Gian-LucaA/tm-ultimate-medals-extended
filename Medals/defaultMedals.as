
class AutoGoldMedal : DefaultMedal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Auto Gold';
        c.icon = '\\$db4' + Icons::CircleO;
        c.shareIcon = false;
        c.sortPriority = 72;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.validMedal = false;
        if (MapData::validationMode && !MapData::validated) {return;}
        CGameCtnChallenge@ rootmap = getMap();
        this.medalTime = getAutoGold(rootmap.TMObjective_AuthorTime);
        if (this.medalTime != rootmap.TMObjective_GoldTime) {
            this.validMedal = true;
        }
    }
}
uint getAutoGold(uint time) {
    if (MapData::gamemode == GameMode::Stunt) {
        return uint(Math::Floor(float(time) * 0.085f) * 10.f);
    } else if (MapData::gamemode == GameMode::Platform) {
        return time + 3;
    } else {
        return uint((Math::Floor(float(time) * 0.00106f) + 1.f) * 1000.f);
    }
}

class AutoSilverMedal : DefaultMedal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Auto Silver';
        c.icon = '\\$899' + Icons::CircleO;
        c.shareIcon = false;
        c.sortPriority = 71;
        c.startEnabled = false;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.validMedal = false;
        if (MapData::validationMode && !MapData::validated) {return;}
        CGameCtnChallenge@ rootmap = getMap();
        this.medalTime = getAutoSilver(rootmap.TMObjective_AuthorTime);
        if (this.medalTime != rootmap.TMObjective_SilverTime) {
            this.validMedal = true;
        }
    }
}
uint getAutoSilver(uint time) {
    if (MapData::gamemode == GameMode::Stunt) {
        return uint(Math::Floor(float(time) * 0.06f) * 10.f);
    } else if (MapData::gamemode == GameMode::Platform) {
        return time + 10;
    } else {
        return uint((Math::Floor(float(time) * 0.0012f) + 1.f) * 1000.f);
    }
}

class AutoBronzeMedal : DefaultMedal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;
        c.defaultName = 'Auto Bronze';
        c.icon = '\\$964' + Icons::CircleO;
        c.shareIcon = false;
        c.sortPriority = 70;
        c.startEnabled = false;
        return c;
    }

    void UpdateMedal(const string&in uid) override {
        this.validMedal = false;
        if (MapData::validationMode && !MapData::validated) {return;}
        CGameCtnChallenge@ rootmap = getMap();
        this.medalTime = getAutoBronze(rootmap.TMObjective_AuthorTime);
        if (this.medalTime != rootmap.TMObjective_BronzeTime) {
            this.validMedal = true;
        }
    }
}

uint getAutoBronze(uint time) {
    if (MapData::gamemode == GameMode::Stunt) {
        return uint(Math::Floor(float(time) * 0.037f) * 10.f);
    } else if (MapData::gamemode == GameMode::Platform) {
        return time + 30;
    } else {
        return uint((Math::Floor(float(time) * 0.0015f) + 1.f) * 1000.f);
    }
}