#include "ScriptPCH.h"

class Duelo_Reset : public PlayerScript
{
    public:
        Duelo_Reset() : PlayerScript("Duelo_Reset") { }

    void OnDuelEnd(Player *winner, Player *looser, DuelCompleteType type)
    {
        // Reinicio de Cd en Ogri - SW, implica tambien Full HP y mana .
        if (winner->GetZoneId() == 0 || winner->GetZoneId() == 41 || winner->GetZoneId() == 616)
        {
            winner->RemoveArenaSpellCooldowns();
            looser->RemoveArenaSpellCooldowns();
            winner->SetHealth(winner->GetMaxHealth());
            winner->SetPower(POWER_MANA, winner->GetMaxPower(POWER_MANA));
            looser->SetHealth(looser->GetMaxHealth());
            looser->SetPower(POWER_MANA, looser->GetMaxPower(POWER_MANA));
        }
    }
};

void AddSC_Duelo_Reset()
{
    new Duelo_Reset;
}