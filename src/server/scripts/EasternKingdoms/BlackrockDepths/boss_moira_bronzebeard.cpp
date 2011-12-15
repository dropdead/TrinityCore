/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptPCH.h"
#include "blackrock_depths.h"

enum Spells
{
    SPELL_HEAL                                             = 10917,
    SPELL_RENEW                                            = 10929,
    SPELL_SHIELD                                           = 10901,
    SPELL_MINDBLAST                                        = 10947,
    SPELL_SHADOWWORDPAIN                                   = 10894,
    SPELL_SMITE                                            = 10934
};

class boss_moira_bronzebeard : public CreatureScript
{
public:
    boss_moira_bronzebeard() : CreatureScript("boss_moira_bronzebeard") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_moira_bronzebeardAI (creature);
    }

    struct boss_moira_bronzebeardAI : public ScriptedAI
    {
        boss_moira_bronzebeardAI(Creature* creature) : ScriptedAI(creature) 
        {
            instance = me->GetInstanceScript();
        }

        uint32 Heal_Timer;
        uint32 Renew_Timer;
        uint32 MindBlast_Timer;
        uint32 ShadowWordPain_Timer;
        uint32 Smite_Timer;
        InstanceScript *instance;

        void Reset()
        {
            Heal_Timer            = urand(10000,12000); 
            Renew_Timer           = urand(12000,15000);
            MindBlast_Timer       = urand(8000,12000);
            ShadowWordPain_Timer  = urand(2000,4000);
            Smite_Timer           = urand(8000,10000);
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            //MindBlast_Timer
            if (MindBlast_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_MINDBLAST);
                MindBlast_Timer = urand(8000,12000);
            } else MindBlast_Timer -= diff;

            //ShadowWordPain_Timer
            if (ShadowWordPain_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SHADOWWORDPAIN);
                ShadowWordPain_Timer = urand(12000,14000);
            } else ShadowWordPain_Timer -= diff;

            //Smite_Timer
            if (Smite_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_SMITE);
                Smite_Timer = urand(8000,10000);
            } else Smite_Timer -= diff;

            if (Unit *target = DoSelectLowestHpFriendly(40.0f))
            {
                if (Heal_Timer <= diff)
                {
                    DoCast(target, SPELL_HEAL);
                    Heal_Timer = urand(8000,10000);
                } else Heal_Timer -= diff;

                if (Renew_Timer <= diff)
                {
                    DoCast(target, SPELL_RENEW);
                    Renew_Timer = urand(12000,15000);
                } else Renew_Timer -= diff;
            }

            if (instance && instance->GetData(DATA_EMPEROR) == DONE)
            {
                me->setFaction(35);
                me->SetReactState(REACT_PASSIVE);
                EnterEvadeMode();
            }

            DoMeleeAttackIfReady();
       }
    };
};

void AddSC_boss_moira_bronzebeard()
{
    new boss_moira_bronzebeard();
}
