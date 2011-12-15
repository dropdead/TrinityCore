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

enum Yells
{
    SAY_AGGRO                                              = -1230001,
    SAY_SLAY                                               = -1230002
};

enum Spells
{
    SPELL_HANDOFTHAURISSAN                                 = 17492,
    SPELL_AVATAROFFLAME                                    = 15636
};

class boss_emperor_dagran_thaurissan : public CreatureScript
{
public:
    boss_emperor_dagran_thaurissan() : CreatureScript("boss_emperor_dagran_thaurissan") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_draganthaurissanAI (creature);
    }

    struct boss_draganthaurissanAI : public ScriptedAI
    {
        boss_draganthaurissanAI(Creature* creature) : ScriptedAI(creature)
        {
            instance = me->GetInstanceScript();
        }

        InstanceScript* instance;
        uint32 HandOfThaurissan_Timer;
        uint32 AvatarOfFlame_Timer;

        void Reset()
        {
            HandOfThaurissan_Timer   = 4000;
            AvatarOfFlame_Timer = 15000;
            if (instance)
                instance->SetData(DATA_EMPEROR, NOT_STARTED);
        }

        void EnterCombat(Unit * pWho)
        {
            DoScriptText(SAY_AGGRO, me);
            me->CallForHelp(VISIBLE_RANGE);

             if (instance)
                 instance->SetData(DATA_EMPEROR, IN_PROGRESS);
        }

        void KilledUnit(Unit* /*victim*/)
        {
            DoScriptText(SAY_SLAY, me);
        }

        void JustDied(Unit* /*who*/)
        {
            if (Creature* Moira = ObjectAccessor::GetCreature(*me, instance ? instance->GetData64(DATA_MOIRA) : 0))
            {
                Moira->AI()->EnterEvadeMode();
                Moira->setFaction(35);
            }

            if (instance)
                instance->SetData(DATA_EMPEROR, DONE);            
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            if (HandOfThaurissan_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    DoCast(target, SPELL_HANDOFTHAURISSAN);
                    HandOfThaurissan_Timer = urand(5000,7500);
            } else HandOfThaurissan_Timer -= diff;

            //AvatarOfFlame_Timer
            if (AvatarOfFlame_Timer <= diff)
            {
                DoCast(me, SPELL_AVATAROFFLAME);
                AvatarOfFlame_Timer = urand(12500,15000);
            } else AvatarOfFlame_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_draganthaurissan()
{
    new boss_emperor_dagran_thaurissan();
}
