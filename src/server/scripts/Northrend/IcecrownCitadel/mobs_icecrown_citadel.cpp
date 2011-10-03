#include "ScriptPCH.h"

/* SQL IR AGREGANDO LOS ENTRY.
   UPDATE `creature_template` SET `ScriptName` = 'mobs_icecrown_citadel' 
   WHERE `entry` IN (37122,37123,37007);
 */
// Añadir las spells de los trash.
// porfavor realizarlo de forma ordenanda y con su corespondiente nombre si es posible comentar
// de que trash son las spells.
enum spells
{
    // Npc Deathbound Ward - http://old.wowhead.com/npc=37007
    SPELL_DISRUPTING_SHOUT_ALL  = 71022, // http://old.wowhead.com/spell=71022
    SPELL_SABER_LASH_ALL        = 71021, // http://old.wowhead.com/spell=71021
    SPELL_SOUL_FEAST_ALL        = 71203, // http://old.wowhead.com/spell=71203
};

struct mobs_icecrown_citadelAI : public ScriptedAI
{
    mobs_icecrown_citadelAI(Creature *c) : ScriptedAI(c)
    {
        if(c->GetMap()->IsDungeon())
            instance = c->GetInstanceScript();

        c->setActive(true);
    }

    void EnterCombat(Unit *who)
    {
        DoAttackerAreaInCombat(who, 100);
        Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 0);
    }

    bool DoCastTry(Unit *victim, uint32 spellId, bool triggered = false)
    {
        if(me->IsNonMeleeSpellCasted(false) && !triggered) return false;

        DoCast(victim,spellId,triggered);
        return true;
    }

    bool DoCastTryAOE(uint32 spellId, bool triggered = false)
    {
        if(me->IsNonMeleeSpellCasted(false) && !triggered) return false;

        DoCastAOE(spellId,triggered);
        return true;
    }

    InstanceScript* instance;
};

class mobs_icecrown_citadel : public CreatureScript
{
public:
    mobs_icecrown_citadel() : CreatureScript("mobs_icecrown_citadel") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        switch (creature->GetEntry())
        {
            case 37007:// Npc Deathbound Ward - http://old.wowhead.com/npc=37007
                return new mob_icecrown_citadel_Deathbound_WardAI (creature);
            default:
                return new mob_icecrown_citadel_Deathbound_WardAI (creature);
        }
    }

    struct mob_icecrown_citadel_Deathbound_WardAI: public mobs_icecrown_citadelAI
    {
        mob_icecrown_citadel_Deathbound_WardAI(Creature *c) : mobs_icecrown_citadelAI(c) 
        { 
            // Estas flags en la DB
            me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_FLAG_UNK_15);
            me->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_FLAG_UNK_6);
        }

        uint32 Disrupting_Shout;
        uint32 Saber_Lash;

        void Reset()
        {
            Disrupting_Shout    = 10000;
            Saber_Lash          = 7000;
        }

        /*void JustDied(Unit* killer)
        {
            // aca falta agregar 	50000 yards (Anywhere)
        }*/

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim() )
                return;

            if (Saber_Lash <= diff)
            {
                if (DoCastTry(me,SPELL_SABER_LASH_ALL))
                    Saber_Lash = 7000;
            }else Saber_Lash -= diff;

            if (Disrupting_Shout <= diff)
            {
                // Random al interrumpir spells con Disrupting_Shout
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1,40,false))
                    if (DoCastTry(target,(SPELL_DISRUPTING_SHOUT_ALL)))
                        Disrupting_Shout = 10000;
            }else Disrupting_Shout -= diff;

            mobs_icecrown_citadelAI::UpdateAI(diff);
        }
    };
};

void AddSC_mobs_icecrown_citadel()
{
    new mobs_icecrown_citadel();
}	
	