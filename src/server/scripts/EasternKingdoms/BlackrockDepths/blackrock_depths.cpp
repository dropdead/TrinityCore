/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
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


/* ScriptData
SDName: Blackrock_Depths
SD%Complete: 95
SDComment: Quest support: 4001, 4342, 7604, 4322. Vendor Lokhtos Darkbargainer. Need to rewrite the Jail Break support
SDCategory: Blackrock Depths
EndScriptData */

/* ContentData
go_shadowforge_brazier
at_ring_of_law
npc_grimstone
mob_phalanx
npc_kharan_mighthammer
npc_lokhtos_darkbargainer
npc_dughal_stormwing
npc_marshal_windsor
npc_marshal_reginald_windsor
npc_tobias_seecher
npc_rocknot
EndContentData */

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "blackrock_depths.h"
#include "LFGMgr.h"
#include "SpellAuraEffects.h"
#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "World.h"

//go_shadowforge_brazier
class go_shadowforge_brazier : public GameObjectScript
{
public:
    go_shadowforge_brazier() : GameObjectScript("go_shadowforge_brazier") { }

    bool OnGossipHello(Player* /*player*/, GameObject* go)
    {
        if (InstanceScript* instance = go->GetInstanceScript())
        {
            if (instance->GetData(TYPE_LYCEUM) == IN_PROGRESS)
                instance->SetData(TYPE_LYCEUM, DONE);
            else
                instance->SetData(TYPE_LYCEUM, IN_PROGRESS);
            // If used brazier open linked doors (North or South)
            if (go->GetGUID() == instance->GetData64(DATA_SF_BRAZIER_N))
                instance->HandleGameObject(instance->GetData64(DATA_GOLEM_DOOR_N), true);
            else if (go->GetGUID() == instance->GetData64(DATA_SF_BRAZIER_S))
                instance->HandleGameObject(instance->GetData64(DATA_GOLEM_DOOR_S), true);
        }
        return false;
    }
};

// npc_grimstone
enum eGrimstone
{
    NPC_GRIMSTONE                                          = 10096,
    NPC_THELDREN                                           = 16059,

    //4 or 6 in total? 1+2+1 / 2+2+2 / 3+3. Depending on this, code should be changed.
    MAX_MOB_AMOUNT                                         = 4
};

uint32 RingMob[]=
{
    8925,                                                   // Dredge Worm
    8926,                                                   // Deep Stinger
    8927,                                                   // Dark Screecher
    8928,                                                   // Burrowing Thundersnout
    8933,                                                   // Cave Creeper
    8932,                                                   // Borer Beetle
};

uint32 RingBoss[]=
{
    9027,                                                   // Gorosh
    9028,                                                   // Grizzle
    9029,                                                   // Eviscerator
    9030,                                                   // Ok'thor
    9031,                                                   // Anub'shiah
    9032,                                                   // Hedrum
};

class at_ring_of_law : public AreaTriggerScript
{
public:
    at_ring_of_law() : AreaTriggerScript("at_ring_of_law") { }

    bool OnTrigger(Player* player, const AreaTriggerEntry* /*at*/)
    {
        if (InstanceScript* instance = player->GetInstanceScript())
        {
            if (instance->GetData(TYPE_RING_OF_LAW) == IN_PROGRESS || instance->GetData(TYPE_RING_OF_LAW) == DONE)
                return false;

            instance->SetData(TYPE_RING_OF_LAW, IN_PROGRESS);
            player->SummonCreature(NPC_GRIMSTONE, 625.559f, -205.618f, -52.735f, 2.609f, TEMPSUMMON_DEAD_DESPAWN, 0);

            return false;
        }
        return false;
    }
};

// npc_grimstone
enum GrimstoneTexts
{
    SCRIPT_TEXT1          = -1230003,
    SCRIPT_TEXT2          = -1230004,
    SCRIPT_TEXT3          = -1230005,
    SCRIPT_TEXT4          = -1230006,
    SCRIPT_TEXT5          = -1230007,
    SCRIPT_TEXT6          = -1230008
};

//TODO: implement quest part of event (different end boss)
class npc_grimstone : public CreatureScript
{
public:
    npc_grimstone() : CreatureScript("npc_grimstone") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_grimstoneAI(creature);
    }

    struct npc_grimstoneAI : public npc_escortAI
    {
        npc_grimstoneAI(Creature* creature) : npc_escortAI(creature)
        {
            instance = creature->GetInstanceScript();
            MobSpawnId = rand()%6;
        }

        InstanceScript* instance;

        uint8  EventPhase;
        uint32 Event_Timer;

        uint8  MobSpawnId;
        uint8  MobCount;
        uint32 MobDeath_Timer;

        uint64 RingMobGUID[4];
        uint64 RingBossGUID;

        bool CanWalk;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

            EventPhase         = 0;
            Event_Timer        = 1000;

            MobCount           = 0;
            MobDeath_Timer     = 0;

            for (uint8 i = 0; i < MAX_MOB_AMOUNT; ++i)
                RingMobGUID[i] = 0;

            RingBossGUID       = 0;

            CanWalk = false;
        }

        //TODO: move them to center
        void SummonRingMob()
        {
            if (Creature* tmp = me->SummonCreature(RingMob[MobSpawnId], 608.960f, -235.322f, -53.907f, 1.857f, TEMPSUMMON_DEAD_DESPAWN, 0))
                RingMobGUID[MobCount] = tmp->GetGUID();

            ++MobCount;

            if (MobCount == MAX_MOB_AMOUNT)
                MobDeath_Timer = 2500;
        }

        //TODO: move them to center
        void SummonRingBoss()
        {
            if (Creature* tmp = me->SummonCreature(RingBoss[rand()%6], 644.300f, -175.989f, -53.739f, 3.418f, TEMPSUMMON_DEAD_DESPAWN, 0))
                RingBossGUID = tmp->GetGUID();

            MobDeath_Timer = 2500;
        }

        void WaypointReached(uint32 i)
        {
            switch (i)
            {
            case 0:
                DoScriptText(SCRIPT_TEXT1, me);//2
                CanWalk      = false;
                Event_Timer  = 5000;
                break;
            case 1:
                DoScriptText(SCRIPT_TEXT2, me);//4
                CanWalk      = false;
                Event_Timer  = 5000;
                break;
            case 2:
                CanWalk      = false;
                break;
            case 3:
                DoScriptText(SCRIPT_TEXT3, me);//5
                break;
            case 4:
                DoScriptText(SCRIPT_TEXT4, me);//6
                CanWalk      = false;
                Event_Timer  = 5000;
                break;
            case 5:
                if (instance)
                {
                    instance->UpdateEncounterState(ENCOUNTER_CREDIT_KILL_CREATURE, NPC_GRIMSTONE, me);
                    instance->SetData(TYPE_RING_OF_LAW, DONE);
                    sLog->outDebug(LOG_FILTER_TSCR, "TSCR: npc_grimstone: event reached end and set complete.");
                }
                break;
            }
        }

        void HandleGameObject(uint32 id, bool open)
        {
            instance->HandleGameObject(instance->GetData64(id), open);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!instance)
                return;

            if (MobDeath_Timer)
            {
                if (MobDeath_Timer <= diff)
                {
                    MobDeath_Timer           = 2500;

                    if (RingBossGUID)
                    {
                        Creature* boss = Unit::GetCreature(*me, RingBossGUID);
                        if (boss && !boss->isAlive() && boss->isDead())
                        {
                            RingBossGUID    = 0;
                            Event_Timer     = 5000;
                            MobDeath_Timer  = 0;
                            return;
                        }
                        return;
                    }

                    for (uint8 i = 0; i < MAX_MOB_AMOUNT; ++i)
                    {
                        Creature* mob = Unit::GetCreature(*me, RingMobGUID[i]);
                        if (mob && !mob->isAlive() && mob->isDead())
                        {
                            RingMobGUID[i]  = 0;
                            --MobCount;

                            //seems all are gone, so set timer to continue and discontinue this
                            if (!MobCount)
                            {
                                Event_Timer = 5000;
                                MobDeath_Timer = 0;
                            }
                        }
                    }
                } else MobDeath_Timer -= diff;
            }

            if (Event_Timer)
            {
                if (Event_Timer <= diff)
                {
                    switch (EventPhase)
                    {
                    case 0:
                        DoScriptText(SCRIPT_TEXT5, me);//1
                        HandleGameObject(DATA_ARENA4, false);
                        Start(false, false);
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 1:
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 2:
                        Event_Timer = 2000;
                        break;
                    case 3:
                        HandleGameObject(DATA_ARENA1, true);
                        Event_Timer = 3000;
                        break;
                    case 4:
                        CanWalk = true;
                        me->SetVisible(false);
                        SummonRingMob();
                        Event_Timer = 8000;
                        break;
                    case 5:
                        SummonRingMob();
                        SummonRingMob();
                        Event_Timer = 8000;
                        break;
                    case 6:
                        SummonRingMob();
                        Event_Timer = 0;
                        break;
                    case 7:
                        me->SetVisible(true);
                        HandleGameObject(DATA_ARENA1, false);
                        DoScriptText(SCRIPT_TEXT6, me);//4
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    case 8:
                        HandleGameObject(DATA_ARENA2, true);
                        Event_Timer = 5000;
                        break;
                    case 9:
                        me->SetVisible(false);
                        SummonRingBoss();
                        Event_Timer = 0;
                        break;
                    case 10:
                        //if quest, complete
                        HandleGameObject(DATA_ARENA2, false);
                        HandleGameObject(DATA_ARENA3, true);
                        HandleGameObject(DATA_ARENA4, true);
                        CanWalk = true;
                        Event_Timer = 0;
                        break;
                    }
                    ++EventPhase;
                } else Event_Timer -= diff;
            }

            if (CanWalk)
                npc_escortAI::UpdateAI(diff);
           }
    };
};

// mob_phalanx
enum PhalanxSpells
{
    SPELL_THUNDERCLAP                   = 8732,
    SPELL_FIREBALLVOLLEY                = 22425,
    SPELL_MIGHTYBLOW                    = 14099
};

class mob_phalanx : public CreatureScript
{
public:
    mob_phalanx() : CreatureScript("mob_phalanx") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_phalanxAI (creature);
    }

    struct mob_phalanxAI : public ScriptedAI
    {
        mob_phalanxAI(Creature* c) : ScriptedAI(c) {}

        uint32 ThunderClap_Timer;
        uint32 FireballVolley_Timer;
        uint32 MightyBlow_Timer;

        void Reset()
        {
            ThunderClap_Timer       = 12000;
            FireballVolley_Timer    = 0;
            MightyBlow_Timer        = 15000;
        }

        void UpdateAI(const uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            //ThunderClap_Timer
            if (ThunderClap_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_THUNDERCLAP);
                ThunderClap_Timer = 10000;
            } else ThunderClap_Timer -= diff;

            //FireballVolley_Timer
            if (HealthBelowPct(51))
            {
                if (FireballVolley_Timer <= diff)
                {
                    DoCast(me->getVictim(), SPELL_FIREBALLVOLLEY);
                    FireballVolley_Timer = 15000;
                } else FireballVolley_Timer -= diff;
            }

            //MightyBlow_Timer
            if (MightyBlow_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_MIGHTYBLOW);
                MightyBlow_Timer = 10000;
            } else MightyBlow_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

// npc_kharan_mighthammer
enum KharamQuests
{
    QUEST_4001                          = 4001,
    QUEST_4342                          = 4342
};

#define GOSSIP_ITEM_KHARAN_1    "I need to know where the princess are, Kharan!"
#define GOSSIP_ITEM_KHARAN_2    "All is not lost, Kharan!"
#define GOSSIP_ITEM_KHARAN_3    "Gor'shak is my friend, you can trust me."
#define GOSSIP_ITEM_KHARAN_4    "Not enough, you need to tell me more."
#define GOSSIP_ITEM_KHARAN_5    "So what happened?"
#define GOSSIP_ITEM_KHARAN_6    "Continue..."
#define GOSSIP_ITEM_KHARAN_7    "So you suspect that someone on the inside was involved? That they were tipped off?"
#define GOSSIP_ITEM_KHARAN_8    "Continue with your story please."
#define GOSSIP_ITEM_KHARAN_9    "Indeed."
#define GOSSIP_ITEM_KHARAN_10   "The door is open, Kharan. You are a free man."

class npc_kharan_mighthammer : public CreatureScript
{
public:
    npc_kharan_mighthammer() : CreatureScript("npc_kharan_mighthammer") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*Sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                player->SEND_GOSSIP_MENU(2475, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);
                player->SEND_GOSSIP_MENU(2476, creature->GetGUID());
                break;

            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+4);
                player->SEND_GOSSIP_MENU(2477, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+5);
                player->SEND_GOSSIP_MENU(2478, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+5:
                 player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+6);
                player->SEND_GOSSIP_MENU(2479, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+6:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_8, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+7);
                player->SEND_GOSSIP_MENU(2480, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+7:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_9, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+8);
                player->SEND_GOSSIP_MENU(2481, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+8:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_10, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+9);
                player->SEND_GOSSIP_MENU(2482, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+9:
                player->CLOSE_GOSSIP_MENU();
                if (player->GetTeam() == HORDE)
                    player->AreaExploredOrEventHappens(QUEST_4001);
                else
                    player->AreaExploredOrEventHappens(QUEST_4342);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_4001) == QUEST_STATUS_INCOMPLETE)
             player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        if (player->GetQuestStatus(4342) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+3);

        if (player->GetTeam() == HORDE)
            player->SEND_GOSSIP_MENU(2473, creature->GetGUID());
        else
            player->SEND_GOSSIP_MENU(2474, creature->GetGUID());

        return true;
    }
};

// npc_lokhtos_darkbargainer
enum LokhtosItems
{
    ITEM_THRORIUM_BROTHERHOOD_CONTRACT                     = 18628,
    ITEM_SULFURON_INGOT                                    = 17203
};

enum LokhtosQuests
{
    QUEST_A_BINDING_CONTRACT                               = 7604
};

enum LokhtosSpells
{
    SPELL_CREATE_THORIUM_BROTHERHOOD_CONTRACT_DND          = 23059
};

#define GOSSIP_ITEM_SHOW_ACCESS     "Show me what I have access to, Lothos."
#define GOSSIP_ITEM_GET_CONTRACT    "Get Thorium Brotherhood Contract"

class npc_lokhtos_darkbargainer : public CreatureScript
{
public:
    npc_lokhtos_darkbargainer() : CreatureScript("npc_lokhtos_darkbargainer") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*Sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->CLOSE_GOSSIP_MENU();
            player->CastSpell(player, SPELL_CREATE_THORIUM_BROTHERHOOD_CONTRACT_DND, false);
        }
        if (action == GOSSIP_ACTION_TRADE)
            player->GetSession()->SendListInventory(creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (creature->isVendor() && player->GetReputationRank(59) >= REP_FRIENDLY)
              player->ADD_GOSSIP_ITEM(GOSSIP_ICON_VENDOR, GOSSIP_ITEM_SHOW_ACCESS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_TRADE);

        if (player->GetQuestRewardStatus(QUEST_A_BINDING_CONTRACT) != 1 &&
            !player->HasItemCount(ITEM_THRORIUM_BROTHERHOOD_CONTRACT, 1, true) &&
            player->HasItemCount(ITEM_SULFURON_INGOT, 1))
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_GET_CONTRACT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
        }

        if (player->GetReputationRank(59) < REP_FRIENDLY)
            player->SEND_GOSSIP_MENU(3673, creature->GetGUID());
        else
            player->SEND_GOSSIP_MENU(3677, creature->GetGUID());

        return true;
    }
};

// npc_dughal_stormwing
enum DughalQuests
{
    QUEST_JAIL_BREAK                      = 4322
};

// DELETE THIS IF IT IS NOT NEEDED!
#define SAY_DUGHAL_FREE         "Thank you, $N! I'm free!!!"
#define GOSSIP_DUGHAL           "You're free, Dughal! Get out of here!"

/*
class npc_dughal_stormwing : public CreatureScript
{
public:
    npc_dughal_stormwing() : CreatureScript("npc_dughal_stormwing") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        npc_dughal_stormwingAI* dughal_stormwingAI = new npc_dughal_stormwingAI(creature);

        dughal_stormwingAI->AddWaypoint(0, 280.42f, -82.86f, -77.12f, 0);
        dughal_stormwingAI->AddWaypoint(1, 287.64f, -87.01f, -76.79f, 0);
        dughal_stormwingAI->AddWaypoint(2, 354.63f, -64.95f, -67.53f, 0);

        return dughal_stormwingAI;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 Sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->CLOSE_GOSSIP_MENU();
            CAST_AI(npc_escort::npc_escortAI, (creature->AI()))->Start(false, true, player->GetGUID());
            creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            instance->SetData(DATA_QUEST_JAIL_BREAK, ENCOUNTER_STATE_IN_PROGRESS);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_JAIL_BREAK) == QUEST_STATUS_INCOMPLETE && instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_IN_PROGRESS)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_DUGHAL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(2846, creature->GetGUID());
        }
        return true;
    }

    struct npc_dughal_stormwingAI : public npc_escortAI
    {
        npc_dughal_stormwingAI(Creature* c) : npc_escortAI(c) {}

        void WaypointReached(uint32 i)
        {
        switch (i)
            {
            case 0:me->Say(SAY_DUGHAL_FREE, LANG_UNIVERSAL, PlayerGUID); break;
            case 1:instance->SetData(DATA_DUGHAL, ENCOUNTER_STATE_OBJECTIVE_COMPLETED);break;
            case 2:
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                instance->SetData(DATA_DUGHAL, ENCOUNTER_STATE_ENDED);
                break;
            }
        }

        void EnterCombat(Unit* who) {}
        void Reset() {}

        void JustDied(Unit* killer)
        {
            if (IsBeingEscorted && killer == me)
            {
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                instance->SetData(DATA_DUGHAL, ENCOUNTER_STATE_ENDED);
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_NOT_STARTED) return;
            if ((instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_IN_PROGRESS || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_FAILED || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_ENDED)&& instance->GetData(DATA_DUGHAL) == ENCOUNTER_STATE_ENDED)
            {
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            else
            {
                me->SetVisibility(VISIBILITY_ON);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            npc_escortAI::UpdateAI(diff);
        }
    };
};

 */

// npc_marshal_windsor
#define SAY_WINDSOR_AGGRO1          "You locked up the wrong Marshal. Prepare to be destroyed!"
#define SAY_WINDSOR_AGGRO2          "I bet you're sorry now, aren't you !?!!"
#define SAY_WINDSOR_AGGRO3          "You better hold me back $N or they are going to feel some prison house beatings."
#define SAY_WINDSOR_1               "Let's get a move on. My gear should be in the storage area up this way..."
#define SAY_WINDSOR_4_1             "Check that cell, $N. If someone is alive in there, we need to get them out."
#define SAY_WINDSOR_4_2             "Get him out of there!"
#define SAY_WINDSOR_4_3             "Good work! We're almost there, $N. This way."
#define SAY_WINDSOR_6               "This is it, $N. My stuff should be in that room. Cover me, I'm going in!"
#define SAY_WINDSOR_9               "Ah, there it is!"
#define MOB_ENTRY_REGINALD_WINDSOR  9682

/*
Player* playerStart;
class npc_marshal_windsor : public CreatureScript
{
public:
    npc_marshal_windsor() : CreatureScript("npc_marshal_windsor") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        npc_marshal_windsorAI* marshal_windsorAI = new npc_marshal_windsorAI(creature);

        marshal_windsorAI->AddWaypoint(0, 316.336f, -225.528f, -77.7258f, 7000);
        marshal_windsorAI->AddWaypoint(1, 316.336f, -225.528f, -77.7258f, 2000);
        marshal_windsorAI->AddWaypoint(2, 322.96f, -207.13f, -77.87f, 0);
        marshal_windsorAI->AddWaypoint(3, 281.05f, -172.16f, -75.12f, 0);
        marshal_windsorAI->AddWaypoint(4, 272.19f, -139.14f, -70.61f, 0);
        marshal_windsorAI->AddWaypoint(5, 283.62f, -116.09f, -70.21f, 0);
        marshal_windsorAI->AddWaypoint(6, 296.18f, -94.30f, -74.08f, 0);
        marshal_windsorAI->AddWaypoint(7, 294.57f, -93.11f, -74.08f, 0);
        marshal_windsorAI->AddWaypoint(8, 314.31f, -74.31f, -76.09f, 0);
        marshal_windsorAI->AddWaypoint(9, 360.22f, -62.93f, -66.77f, 0);
        marshal_windsorAI->AddWaypoint(10, 383.38f, -69.40f, -63.25f, 0);
        marshal_windsorAI->AddWaypoint(11, 389.99f, -67.86f, -62.57f, 0);
        marshal_windsorAI->AddWaypoint(12, 400.98f, -72.01f, -62.31f, 0);
        marshal_windsorAI->AddWaypoint(13, 404.22f, -62.30f, -63.50f, 2300);
        marshal_windsorAI->AddWaypoint(14, 404.22f, -62.30f, -63.50f, 1500);
        marshal_windsorAI->AddWaypoint(15, 407.65f, -51.86f, -63.96f, 0);
        marshal_windsorAI->AddWaypoint(16, 403.61f, -51.71f, -63.92f, 1000);
        marshal_windsorAI->AddWaypoint(17, 403.61f, -51.71f, -63.92f, 2000);
        marshal_windsorAI->AddWaypoint(18, 403.61f, -51.71f, -63.92f, 1000);
        marshal_windsorAI->AddWaypoint(19, 403.61f, -51.71f, -63.92f, 0);

        return marshal_windsorAI;
    }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == 4322)
            {PlayerStart = player;
            if (instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_NOT_STARTED)
            {
                    CAST_AI(npc_escort::npc_escortAI, (creature->AI()))->Start(true, false, player->GetGUID());
                    instance->SetData(DATA_QUEST_JAIL_BREAK, ENCOUNTER_STATE_IN_PROGRESS);
                    creature->setFaction(11);
            }
            }
        return false;
    }

    struct npc_marshal_windsorAI : public npc_escortAI
    {
        npc_marshal_windsorAI(Creature* c) : npc_escortAI(c)
        {
            instance = c->GetInstanceScript();
        }

        void WaypointReached(uint32 i)
        {
        switch (i)
            {
            case 1:
                me->Say(SAY_WINDSOR_1, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 7:
                me->HandleEmoteCommand(EMOTE_STATE_POINT);
                me->Say(SAY_WINDSOR_4_1, LANG_UNIVERSAL, PlayerGUID);
                IsOnHold=true;
                break;
            case 10:
                me->setFaction(534);
                break;
            case 12:
                me->Say(SAY_WINDSOR_6, LANG_UNIVERSAL, PlayerGUID);
                instance->SetData(DATA_SUPPLY_ROOM, ENCOUNTER_STATE_IN_PROGRESS);
                break;
            case 13:
                me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);//EMOTE_STATE_WORK
                break;
            case 14:
                instance->SetData(DATA_GATE_SR, 0);
                me->setFaction(11);
                break;
            case 16:
                me->Say(SAY_WINDSOR_9, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 17:
                me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);//EMOTE_STATE_WORK
                break;
            case 18:
                instance->SetData(DATA_GATE_SC, 0);
                break;
            case 19:
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SummonCreature(MOB_ENTRY_REGINALD_WINDSOR, 403.61f, -51.71f, -63.92f, 3.600434f, TEMPSUMMON_DEAD_DESPAWN, 0);
                instance->SetData(DATA_SUPPLY_ROOM, ENCOUNTER_STATE_ENDED);
                break;
            }
        }

        void EnterCombat(Unit* who)
            {
            switch (urand(0, 2))
            {
                case 0: me->Say(SAY_WINDSOR_AGGRO1, LANG_UNIVERSAL, PlayerGUID); break;
                case 1: me->Say(SAY_WINDSOR_AGGRO2, LANG_UNIVERSAL, PlayerGUID); break;
                case 2: me->Say(SAY_WINDSOR_AGGRO3, LANG_UNIVERSAL, PlayerGUID); break;
            }
            }

        void Reset() {}

        void JustDied(Unit* slayer)
        {
            instance->SetData(DATA_QUEST_JAIL_BREAK, ENCOUNTER_STATE_FAILED);
        }

        void UpdateAI(const uint32 diff)
        {
            if (instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_NOT_STARTED) return;
            if (instance->GetData(DATA_DUGHAL) == ENCOUNTER_STATE_OBJECTIVE_COMPLETED)
                SetEscortPaused(false);
            if (!instance->GetData(DATA_GATE_D) && instance->GetData(DATA_DUGHAL) == ENCOUNTER_STATE_NOT_STARTED)
                {
                me->Say(SAY_WINDSOR_4_2, LANG_UNIVERSAL, PlayerGUID);
                instance->SetData(DATA_DUGHAL, ENCOUNTER_STATE_BEFORE_START);
                }
            if (instance->GetData(DATA_DUGHAL) == ENCOUNTER_STATE_OBJECTIVE_COMPLETED)
                {
                me->Say(SAY_WINDSOR_4_3, LANG_UNIVERSAL, PlayerGUID);
                instance->SetData(DATA_DUGHAL, ENCOUNTER_STATE_ENDED);
                }
            if ((instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_IN_PROGRESS || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_FAILED || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_ENDED)&& instance->GetData(DATA_SUPPLY_ROOM) == ENCOUNTER_STATE_ENDED)
            {
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            else
            {
                me->SetVisibility(VISIBILITY_ON);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            npc_escortAI::UpdateAI(diff);
        }
    };
};

  */

// npc_marshal_reginald_windsor
#define SAY_REGINALD_WINDSOR_0_1    "Can you feel the power, $N??? It's time to ROCK!"
#define SAY_REGINALD_WINDSOR_0_2    "Now we just have to free Tobias and we can get out of here. This way!"
#define SAY_REGINALD_WINDSOR_5_1    "Open it."
#define SAY_REGINALD_WINDSOR_5_2    "I never did like those two. Let's get moving."
#define SAY_REGINALD_WINDSOR_7_1    "Open it and be careful this time!"
#define SAY_REGINALD_WINDSOR_7_2    "That intolerant dirtbag finally got what was coming to him. Good riddance!"
#define SAY_REGINALD_WINDSOR_7_3    "Alright, let's go."
#define SAY_REGINALD_WINDSOR_13_1   "Open it. We need to hurry up. I can smell those Dark Irons coming a mile away and I can tell you one thing, they're COMING!"
#define SAY_REGINALD_WINDSOR_13_2   "Administering fists of fury on Crest Killer!"
#define SAY_REGINALD_WINDSOR_13_3   "He has to be in the last cell. Unless... they killed him."
#define SAY_REGINALD_WINDSOR_14_1   "Get him out of there!"
#define SAY_REGINALD_WINDSOR_14_2   "Excellent work, $N. Let's find the exit. I think I know the way. Follow me!"
#define SAY_REGINALD_WINDSOR_20_1   "We made it!"
#define SAY_REGINALD_WINDSOR_20_2   "Meet me at Maxwell's encampment. We'll go over the next stages of the plan there and figure out a way to decode my tablets without the decryption ring."
#define MOB_ENTRY_SHILL_DINGER      9678
#define MOB_ENTRY_CREST_KILLER      9680

/*
int wp = 0;
class npc_marshal_reginald_windsor : public CreatureScript
{
public:
    npc_marshal_reginald_windsor() : CreatureScript("npc_marshal_reginald_windsor") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        npc_marshal_reginald_windsorAI* marshal_reginald_windsorAI = new npc_marshal_reginald_windsorAI(creature);

        marshal_reginald_windsorAI->AddWaypoint(0, 403.61f, -52.71f, -63.92f, 4000);
        marshal_reginald_windsorAI->AddWaypoint(1, 403.61f, -52.71f, -63.92f, 4000);
        marshal_reginald_windsorAI->AddWaypoint(2, 406.33f, -54.87f, -63.95f, 0);
        marshal_reginald_windsorAI->AddWaypoint(3, 407.99f, -73.91f, -62.26f, 0);
        marshal_reginald_windsorAI->AddWaypoint(4, 557.03f, -119.71f, -61.83f, 0);
        marshal_reginald_windsorAI->AddWaypoint(5, 573.40f, -124.39f, -65.07f, 0);
        marshal_reginald_windsorAI->AddWaypoint(6, 593.91f, -130.29f, -69.25f, 0);
        marshal_reginald_windsorAI->AddWaypoint(7, 593.21f, -132.16f, -69.25f, 0);
        marshal_reginald_windsorAI->AddWaypoint(8, 593.21f, -132.16f, -69.25f, 3000);
        marshal_reginald_windsorAI->AddWaypoint(9, 622.81f, -135.55f, -71.92f, 0);
        marshal_reginald_windsorAI->AddWaypoint(10, 634.68f, -151.29f, -70.32f, 0);
        marshal_reginald_windsorAI->AddWaypoint(11, 635.06f, -153.25f, -70.32f, 0);
        marshal_reginald_windsorAI->AddWaypoint(12, 635.06f, -153.25f, -70.32f, 3000);
        marshal_reginald_windsorAI->AddWaypoint(13, 635.06f, -153.25f, -70.32f, 1500);
        marshal_reginald_windsorAI->AddWaypoint(14, 655.25f, -172.39f, -73.72f, 0);
        marshal_reginald_windsorAI->AddWaypoint(15, 654.79f, -226.30f, -83.06f, 0);
        marshal_reginald_windsorAI->AddWaypoint(16, 622.85f, -268.85f, -83.96f, 0);
        marshal_reginald_windsorAI->AddWaypoint(17, 579.45f, -275.56f, -80.44f, 0);
        marshal_reginald_windsorAI->AddWaypoint(18, 561.19f, -266.85f, -75.59f, 0);
        marshal_reginald_windsorAI->AddWaypoint(19, 547.91f, -253.92f, -70.34f, 0);
        marshal_reginald_windsorAI->AddWaypoint(20, 549.20f, -252.40f, -70.34f, 0);
        marshal_reginald_windsorAI->AddWaypoint(21, 549.20f, -252.40f, -70.34f, 4000);
        marshal_reginald_windsorAI->AddWaypoint(22, 555.33f, -269.16f, -74.40f, 0);
        marshal_reginald_windsorAI->AddWaypoint(23, 554.31f, -270.88f, -74.40f, 0);
        marshal_reginald_windsorAI->AddWaypoint(24, 554.31f, -270.88f, -74.40f, 4000);
        marshal_reginald_windsorAI->AddWaypoint(25, 536.10f, -249.60f, -67.47f, 0);
        marshal_reginald_windsorAI->AddWaypoint(26, 520.94f, -216.65f, -59.28f, 0);
        marshal_reginald_windsorAI->AddWaypoint(27, 505.99f, -148.74f, -62.17f, 0);
        marshal_reginald_windsorAI->AddWaypoint(28, 484.21f, -56.24f, -62.43f, 0);
        marshal_reginald_windsorAI->AddWaypoint(29, 470.39f, -6.01f, -70.10f, 0);
        marshal_reginald_windsorAI->AddWaypoint(30, 451.27f, 30.85f, -70.07f, 0);
        marshal_reginald_windsorAI->AddWaypoint(31, 452.45f, 29.85f, -70.37f, 1500);
        marshal_reginald_windsorAI->AddWaypoint(32, 452.45f, 29.85f, -70.37f, 7000);
        marshal_reginald_windsorAI->AddWaypoint(33, 452.45f, 29.85f, -70.37f, 10000);
        marshal_reginald_windsorAI->AddWaypoint(34, 451.27f, 31.85f, -70.07f, 0);

        return marshal_reginald_windsorAI;
    }

    struct npc_marshal_reginald_windsorAI : public npc_escortAI
    {
        npc_marshal_reginald_windsorAI(Creature* c) : npc_escortAI(c)
        {
        }

        void WaypointReached(uint32 i)
        {
        wp=i;
        switch (i)
            {
            case 0:
                me->setFaction(11);
                me->Say(SAY_REGINALD_WINDSOR_0_1, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 1:
                me->Say(SAY_REGINALD_WINDSOR_0_2, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 7:
                me->HandleEmoteCommand(EMOTE_STATE_POINT);
                me->Say(SAY_REGINALD_WINDSOR_5_1, LANG_UNIVERSAL, PlayerGUID);
                IsOnHold=true;
                break;
            case 8:
                me->Say(SAY_REGINALD_WINDSOR_5_2, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 11:
                me->HandleEmoteCommand(EMOTE_STATE_POINT);
                me->Say(SAY_REGINALD_WINDSOR_7_1, LANG_UNIVERSAL, PlayerGUID);
                IsOnHold=true;
                break;
            case 12:
                me->Say(SAY_REGINALD_WINDSOR_7_2, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 13:
                me->Say(SAY_REGINALD_WINDSOR_7_3, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 20:
                me->HandleEmoteCommand(EMOTE_STATE_POINT);
                me->Say(SAY_REGINALD_WINDSOR_13_1, LANG_UNIVERSAL, PlayerGUID);
                IsOnHold=true;
                break;
            case 21:
                me->Say(SAY_REGINALD_WINDSOR_13_3, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 23:
                me->HandleEmoteCommand(EMOTE_STATE_POINT);
                me->Say(SAY_REGINALD_WINDSOR_14_1, LANG_UNIVERSAL, PlayerGUID);
                IsOnHold=true;
                break;
            case 24:
                me->Say(SAY_REGINALD_WINDSOR_14_2, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 31:
                me->Say(SAY_REGINALD_WINDSOR_20_1, LANG_UNIVERSAL, PlayerGUID);
                break;
            case 32:
                me->Say(SAY_REGINALD_WINDSOR_20_2, LANG_UNIVERSAL, PlayerGUID);
                PlayerStart->GroupEventHappens(QUEST_JAIL_BREAK, me);
                instance->SetData(DATA_SHILL, ENCOUNTER_STATE_ENDED);
                break;
            }
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                return;

            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                if (CAST_PLR(who)->GetQuestStatus(4322) == QUEST_STATUS_INCOMPLETE)
                {
                    float Radius = 10.0f;
                    if (me->IsWithinDistInMap(who, Radius))
                    {
                        SetEscortPaused(false);
                        Start(true, false, who->GetGUID());
                    }
                }
            }
        }

        void EnterCombat(Unit* who)
            {
            switch (urand(0, 2))
            {
                case 0: me->Say(SAY_WINDSOR_AGGRO1, LANG_UNIVERSAL, PlayerGUID); break;
                case 1: me->Say(SAY_WINDSOR_AGGRO2, LANG_UNIVERSAL, PlayerGUID); break;
                case 2: me->Say(SAY_WINDSOR_AGGRO3, LANG_UNIVERSAL, PlayerGUID); break;
            }
            }
        void Reset() {}

        void JustDied(Unit* slayer)
        {
            instance->SetData(DATA_QUEST_JAIL_BREAK, ENCOUNTER_STATE_FAILED);
        }

        void UpdateAI(const uint32 diff)
        {
            if (instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_NOT_STARTED) return;
            if (wp == 7)
                {
                if (!instance->GetData(DATA_GATE_J) && instance->GetData(DATA_JAZ) == ENCOUNTER_STATE_NOT_STARTED)
                    {
                        instance->SetData(DATA_CREATURE_JAZ, 1);
                        instance->SetData(DATA_JAZ, ENCOUNTER_STATE_IN_PROGRESS);
                    }
                if (instance->GetData(DATA_CREATURE_JAZ) && instance->GetData(DATA_CREATURE_OGRABISI) && instance->GetData(DATA_JAZ) == ENCOUNTER_STATE_IN_PROGRESS)
                    {
                        SetEscortPaused(false);
                        instance->SetData(DATA_JAZ, ENCOUNTER_STATE_ENDED);
                    }
                }
            else if (wp == 11)
                {
                if (!instance->GetData(DATA_GATE_S) && instance->GetData(DATA_SHILL) == ENCOUNTER_STATE_NOT_STARTED)
                    {
                        instance->SetData(DATA_CREATURE_SHILL, 1);
                        instance->SetData(DATA_SHILL, ENCOUNTER_STATE_IN_PROGRESS);
                    }
                if (instance->GetData(DATA_CREATURE_SHILL) && instance->GetData(DATA_SHILL) == ENCOUNTER_STATE_IN_PROGRESS)
                    {
                        instance->SetData(DATA_SHILL, ENCOUNTER_STATE_ENDED);
                        SetEscortPaused(false);
                    }
                }
            else if (wp == 20)
                {
                if (!instance->GetData(DATA_GATE_C) && instance->GetData(DATA_CREST) == ENCOUNTER_STATE_NOT_STARTED)
                    {
                        instance->SetData(DATA_CREATURE_CREST, 1);
                        me->Say(SAY_REGINALD_WINDSOR_13_2, LANG_UNIVERSAL, PlayerGUID);
                        instance->SetData(DATA_CREST, ENCOUNTER_STATE_IN_PROGRESS);
                    }
                if (instance->GetData(DATA_CREATURE_CREST) && instance->GetData(DATA_CREST) == ENCOUNTER_STATE_IN_PROGRESS)
                    {
                        SetEscortPaused(false);
                        instance->SetData(DATA_CREST, ENCOUNTER_STATE_ENDED);
                    }
                }
            if (instance->GetData(DATA_TOBIAS) == ENCOUNTER_STATE_OBJECTIVE_COMPLETED) SetEscortPaused(false);
            npc_escortAI::UpdateAI(diff);
        }
    };
};
*/

// npc_tobias_seecher
#define SAY_TOBIAS_FREE         "Thank you! I will run for safety immediately!"
/*
class npc_tobias_seecher : public CreatureScript
{
public:
    npc_tobias_seecher() : CreatureScript("npc_tobias_seecher") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        npc_tobias_seecherAI* tobias_seecherAI = new npc_tobias_seecherAI(creature);

        tobias_seecherAI->AddWaypoint(0, 549.21f, -281.07f, -75.27f);
        tobias_seecherAI->AddWaypoint(1, 554.39f, -267.39f, -73.68f);
        tobias_seecherAI->AddWaypoint(2, 533.59f, -249.38f, -67.04f);
        tobias_seecherAI->AddWaypoint(3, 519.44f, -217.02f, -59.34f);
        tobias_seecherAI->AddWaypoint(4, 506.55f, -153.49f, -62.34f);

        return tobias_seecherAI;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 Sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            player->CLOSE_GOSSIP_MENU();
            CAST_AI(npc_escort::npc_escortAI, (creature->AI()))->Start(false, true, player->GetGUID());
            creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            instance->SetData(DATA_TOBIAS, ENCOUNTER_STATE_IN_PROGRESS);
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_JAIL_BREAK) == QUEST_STATUS_INCOMPLETE && instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_IN_PROGRESS)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Get out of here, Tobias, you're free!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(2847, creature->GetGUID());
        }
        return true;
    }

    struct npc_tobias_seecherAI : public npc_escortAI
    {
        npc_tobias_seecherAI(Creature* c) :npc_escortAI(c) {}

        void EnterCombat(Unit* who) {}
        void Reset() {}

        void JustDied(Unit* killer)
        {
            if (IsBeingEscorted && killer == me)
            {
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                instance->SetData(DATA_TOBIAS, ENCOUNTER_STATE_ENDED);
            }
        }

        void WaypointReached(uint32 i)
        {
        switch (i)
            {
            case 0:me->Say(SAY_TOBIAS_FREE, LANG_UNIVERSAL, PlayerGUID); break;
            case 2:
                instance->SetData(DATA_TOBIAS, ENCOUNTER_STATE_OBJECTIVE_COMPLETED);break;
            case 4:
                me->SetVisibility(VISIBILITY_OFF);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                instance->SetData(DATA_TOBIAS, ENCOUNTER_STATE_ENDED);
                break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_NOT_STARTED) return;
            if ((instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_IN_PROGRESS || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_FAILED || instance->GetData(DATA_QUEST_JAIL_BREAK) == ENCOUNTER_STATE_ENDED)&& instance->GetData(DATA_TOBIAS) == ENCOUNTER_STATE_ENDED)
            {
                me->SetVisibility(VISIBILITY_OFF);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            else
            {
                me->SetVisibility(VISIBILITY_ON);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            npc_escortAI::UpdateAI(diff);
        }
    };
};

*/

// npc_rocknot
enum RocknotSays
{
    SAY_GOT_BEER                       = -1230000
};

enum RocknotSpells
{
    SPELL_DRUNKEN_RAGE                 = 14872
};

enum RocknotQuests
{
    QUEST_ALE                          = 4295
};

class npc_rocknot : public CreatureScript
{
public:
    npc_rocknot() : CreatureScript("npc_rocknot") { }

    bool OnQuestReward(Player* /*player*/, Creature* creature, Quest const* quest, uint32 /*item*/)
    {
        InstanceScript* instance = creature->GetInstanceScript();
        if (!instance)
            return true;

        if (instance->GetData(TYPE_BAR) == DONE || instance->GetData(TYPE_BAR) == SPECIAL)
            return true;

        if (quest->GetQuestId() == QUEST_ALE)
        {
            if (instance->GetData(TYPE_BAR) != IN_PROGRESS)
                instance->SetData(TYPE_BAR, IN_PROGRESS);

            instance->SetData(TYPE_BAR, SPECIAL);

            //keep track of amount in instance script, returns SPECIAL if amount ok and event in progress
            if (instance->GetData(TYPE_BAR) == SPECIAL)
            {
                DoScriptText(SAY_GOT_BEER, creature);
                creature->CastSpell(creature, SPELL_DRUNKEN_RAGE, false);

                if (npc_escortAI* escortAI = CAST_AI(npc_rocknot::npc_rocknotAI, creature->AI()))
                    escortAI->Start(false, false);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_rocknotAI(creature);
    }

    struct npc_rocknotAI : public npc_escortAI
    {
        npc_rocknotAI(Creature* creature) : npc_escortAI(creature)
        {
            instance = creature->GetInstanceScript();
        }

        InstanceScript* instance;

        uint32 BreakKeg_Timer;
        uint32 BreakDoor_Timer;

        void Reset()
        {
            if (HasEscortState(STATE_ESCORT_ESCORTING))
                return;

            BreakKeg_Timer    = 0;
            BreakDoor_Timer   = 0;
        }

        void DoGo(uint32 id, uint32 state)
        {
            if (GameObject* go = instance->instance->GetGameObject(instance->GetData64(id)))
                go->SetGoState((GOState)state);
        }

        void WaypointReached(uint32 i)
        {
            if (!instance)
                return;

            switch (i)
            {
            case 1:
                me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                break;
            case 2:
                me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACKUNARMED);
                break;
            case 3:
                me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACKUNARMED);
                break;
            case 4:
                me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                break;
            case 5:
                me->HandleEmoteCommand(EMOTE_ONESHOT_KICK);
                BreakKeg_Timer = 2000;
                break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if (!instance)
                return;

            if (BreakKeg_Timer)
            {
                if (BreakKeg_Timer <= diff)
                {
                    DoGo(DATA_GO_BAR_KEG, 0);
                    BreakKeg_Timer     = 0;
                    BreakDoor_Timer    = 1000;
                } else BreakKeg_Timer -= diff;
            }

            if (BreakDoor_Timer)
            {
                if (BreakDoor_Timer <= diff)
                {
                    DoGo(DATA_GO_BAR_DOOR, 2);
                    DoGo(DATA_GO_BAR_KEG_TRAP, 0);               //doesn't work very well, leaving code here for future
                    //spell by trap has effect61, this indicate the bar go hostile

                    if (Unit* tmp = Unit::GetUnit(*me, instance->GetData64(DATA_PHALANX)))
                        tmp->setFaction(14);

                    //for later, this event(s) has alot more to it.
                    //optionally, DONE can trigger bar to go hostile.
                    instance->SetData(TYPE_BAR, DONE);

                    BreakDoor_Timer = 0;
                } else BreakDoor_Timer -= diff;
            }

            npc_escortAI::UpdateAI(diff);
        }
    };
};

/*######
## Brew Fest Evento.
######*/

enum CorenDirebrew
{
    SPELL_DISARM                = 47310,
    SPELL_DISARM_PRECAST        = 47407,
    SPELL_MOLE_MACHINE_EMERGE   = 50313, 
    NPC_ILSA_DIREBREW           = 26764,
    NPC_URSULA_DIREBREW         = 26822,
    NPC_DIREBREW_MINION         = 26776,
    EQUIP_ID_TANKARD            = 48663,
    FACTION_HOSTILE_CORE        = 736
};

#define GOSSIP_TEXT_INSULT "Insult Coren Direbrew's brew."

static Position _pos[]=
{
    {890.87f, -133.95f, -48.0f, 1.53f},
    {892.47f, -133.26f, -48.0f, 2.16f},
    {893.54f, -131.81f, -48.0f, 2.75f}
};

class npc_coren_direbrew : public CreatureScript
{
    public:
        npc_coren_direbrew() : CreatureScript("npc_coren_direbrew") { }

        bool OnGossipHello(Player* player, Creature* creature)
        {
            if (creature->isQuestGiver())
                player->PrepareQuestMenu(creature->GetGUID());

            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_TEXT_INSULT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(15858, creature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
        {
            player->PlayerTalkClass->ClearMenus();

            if (action == GOSSIP_ACTION_INFO_DEF + 1)
            {
                creature->setFaction(FACTION_HOSTILE_CORE);
                creature->AI()->AttackStart(player);
                creature->AI()->DoZoneInCombat();
                player->CLOSE_GOSSIP_MENU();
            }

            return true;
        }

        struct npc_coren_direbrewAI : public ScriptedAI
        {
            npc_coren_direbrewAI(Creature* c) : ScriptedAI(c), _summons(me)
            {
            }

            void Reset()
            {
                me->RestoreFaction();
                me->SetCorpseDelay(90); // 1.5 minutes

                _addTimer = 20000;
                _disarmTimer = urand(10, 15) *IN_MILLISECONDS;

                _spawnedIlsa = false;
                _spawnedUrsula = false;
                _summons.DespawnAll();

                for (uint8 i = 0; i < 3; ++i)
                    if (Creature* creature = me->SummonCreature(NPC_DIREBREW_MINION, _pos[i], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000))
                        _add[i] = creature->GetGUID();
            }

            void EnterCombat(Unit* /*who*/)
            {
                SetEquipmentSlots(false, EQUIP_ID_TANKARD, EQUIP_ID_TANKARD, EQUIP_NO_CHANGE);

                for (uint8 i = 0; i < 3; ++i)
                {
                    if (_add[i])
                    {
                        Creature* creature = ObjectAccessor::GetCreature((*me), _add[i]);
                        if (creature && creature->isAlive())
                        {
                            creature->setFaction(FACTION_HOSTILE_CORE);
                            creature->SetInCombatWithZone();
                        }
                        _add[i] = 0;
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                // disarm
                if (_disarmTimer <= diff)
                {
                    DoCast(SPELL_DISARM_PRECAST);
                    DoCastVictim(SPELL_DISARM, false);
                    _disarmTimer = urand(20, 25) *IN_MILLISECONDS;
                }
                else
                    _disarmTimer -= diff;

                // spawn non-elite adds
                if (_addTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    {
                        float posX, posY, posZ;
                        target->GetPosition(posX, posY, posZ);
                        target->CastSpell(target, SPELL_MOLE_MACHINE_EMERGE, true, 0, 0, me->GetGUID());
                        me->SummonCreature(NPC_DIREBREW_MINION, posX, posY, posZ, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);

                        _addTimer = 15000;
                        if (_spawnedIlsa)
                            _addTimer -= 3000;
                        if (_spawnedUrsula)
                            _addTimer -= 3000;
                    }
                }
                else
                    _addTimer -= diff;

                if (!_spawnedIlsa && HealthBelowPct(66))
                {
                    DoSpawnCreature(NPC_ILSA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                    _spawnedIlsa = true;
                }

                if (!_spawnedUrsula && HealthBelowPct(33))
                {
                    DoSpawnCreature(NPC_URSULA_DIREBREW, 0, 0, 0, 0, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 15000);
                    _spawnedUrsula = true;
                }

                DoMeleeAttackIfReady();
            }

            void JustSummoned(Creature* summon)
            {
                if (me->getFaction() == FACTION_HOSTILE_CORE)
                {
                    summon->setFaction(FACTION_HOSTILE_CORE);

                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                        summon->AI()->AttackStart(target);
                }

                _summons.Summon(summon);
            }

            void JustDied(Unit* /*killer*/)
            {
                _summons.DespawnAll();

                // TODO: unhack
                Map* map = me->GetMap();
                if (map && map->IsDungeon())
                {
                    Map::PlayerList const& players = map->GetPlayers();
                    if (!players.isEmpty())
                        for (Map::PlayerList::const_iterator i = players.begin(); i != players.end(); ++i)
                            if (Player* player = i->getSource())
                                if (player->GetDistance(me) < 100.0f)
                                    sLFGMgr->RewardDungeonDoneFor(287, player);
                }
            }

        private:
            SummonList _summons;
            uint64 _add[3];
            uint32 _addTimer;
            uint32 _disarmTimer;
            bool _spawnedIlsa;
            bool _spawnedUrsula;
        };

        CreatureAI* GetAI(Creature* c) const
        {
            return new npc_coren_direbrewAI(c);
        }
};

/*######
## dark iron brewmaiden
######*/

enum Brewmaiden
{
    SPELL_SEND_FIRST_MUG = 47333,
    SPELL_SEND_SECOND_MUG = 47339,
    //SPELL_CREATE_BREW = 47345,
    SPELL_HAS_BREW_BUFF = 47376,
    //SPELL_HAS_BREW = 47331,
    //SPELL_DARK_BREWMAIDENS_STUN = 47340,
    SPELL_CONSUME_BREW = 47377,
    SPELL_BARRELED = 47442,
    SPELL_CHUCK_MUG = 50276
};

class npc_brewmaiden : public CreatureScript
{
    public:
        npc_brewmaiden() : CreatureScript("npc_brewmaiden") { }

        struct npc_brewmaidenAI : public ScriptedAI
        {
            npc_brewmaidenAI(Creature* c) : ScriptedAI(c)
            {
            }

            void Reset()
            {
                _brewTimer = 2000;
                _barrelTimer = 5000;
                _chuckMugTimer = 10000;
            }

            void EnterCombat(Unit* /*who*/)
            {
                me->SetInCombatWithZone();
            }

            void AttackStart(Unit* who)
            {
                if (!who)
                    return;

                if (me->Attack(who, true))
                {
                    me->AddThreat(who, 1.0f);
                    me->SetInCombatWith(who);
                    who->SetInCombatWith(me);

                    if (me->GetEntry() == NPC_URSULA_DIREBREW)
                        me->GetMotionMaster()->MoveFollow(who, 10.0f, 0.0f);
                    else
                        me->GetMotionMaster()->MoveChase(who);
                }
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell)
            {
                // TODO: move to DB

                if (spell->Id == SPELL_SEND_FIRST_MUG)
                    target->CastSpell(target, SPELL_HAS_BREW_BUFF, true);

                if (spell->Id == SPELL_SEND_SECOND_MUG)
                    target->CastSpell(target, SPELL_CONSUME_BREW, true);
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                if (_brewTimer <= diff)
                {
                    if (!me->IsNonMeleeSpellCasted(false))
                    {
                        Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);

                        if (target && me->GetDistance(target) > 5.0f)
                        {
                            DoCast(target, SPELL_SEND_FIRST_MUG);
                            _brewTimer = 12000;
                        }
                    }
                }
                else
                    _brewTimer -= diff;

                if (_chuckMugTimer <= diff)
                {
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                        DoCast(target, SPELL_CHUCK_MUG);

                    _chuckMugTimer = 15000;
                }
                else
                    _chuckMugTimer -= diff;

                if (me->GetEntry() == NPC_URSULA_DIREBREW)
                {
                    if (_barrelTimer <= diff)
                    {
                        if (!me->IsNonMeleeSpellCasted(false))
                        {
                            DoCastVictim(SPELL_BARRELED);
                            _barrelTimer = urand(15, 18) *IN_MILLISECONDS;
                        }
                    }
                    else
                        _barrelTimer -= diff;
                }
                else
                    DoMeleeAttackIfReady();
            }

        private:
            uint32 _brewTimer;
            uint32 _barrelTimer;
            uint32 _chuckMugTimer;
        };

        CreatureAI* GetAI(Creature* c) const
        {
            return new npc_brewmaidenAI(c);
        }
};

/*######
## go_mole_machine_console
######*/

enum MoleMachineConsole
{
    SPELL_TELEPORT = 49466 // bad id?
};

#define GOSSIP_ITEM_MOLE_CONSOLE "[PH] Please teleport me."

class go_mole_machine_console : public GameObjectScript
{
    public:
        go_mole_machine_console() : GameObjectScript("go_mole_machine_console") { }

        bool OnGossipHello (Player* player, GameObject* go)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MOLE_CONSOLE, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(12709, go->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, GameObject* /*go*/, uint32 /*sender*/, uint32 action)
        {
            if (action == GOSSIP_ACTION_INFO_DEF + 1)
                player->CastSpell(player, SPELL_TELEPORT, true);

            return true;
        }
};


enum BrewfestQuestChugAndChuck
{
    QUEST_CHUG_AND_CHUCK_A    = 12022,
    QUEST_CHUG_AND_CHUCK_H    = 12191,
    NPC_BREWFEST_STOUT        = 24108
};
class item_brewfest_ChugAndChuck : public ItemScript
{
public:
    item_brewfest_ChugAndChuck() : ItemScript("item_brewfest_ChugAndChuck") { }

    bool OnUse(Player* player, Item* pItem, const SpellCastTargets & /*pTargets*/)
    {
        if (player->GetQuestStatus(QUEST_CHUG_AND_CHUCK_A) == QUEST_STATUS_INCOMPLETE
            || player->GetQuestStatus(QUEST_CHUG_AND_CHUCK_H) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature* pStout = player->FindNearestCreature(NPC_BREWFEST_STOUT, 10.0f)) // spell range
            {
                return false;
            } else
                player->SendEquipError(EQUIP_ERR_OUT_OF_RANGE, pItem, NULL);
        } else
            player->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW ,pItem, NULL);
        return true;
    }
};

/*####
## npc_brewfest_trigger
####*/
enum eBrewfestBarkQuests
{
    BARK_FOR_THE_THUNDERBREWS       = 11294,
    BARK_FOR_TCHALIS_VOODOO_BREWERY = 11408,
    BARK_FOR_THE_BARLEYBREWS        = 11293,
    BARK_FOR_DROHNS_DISTILLERY      = 11407,
    SPELL_RAMSTEIN_SWIFT_WORK_RAM   = 43880,
    SPELL_BREWFEST_RAM              = 43883,
    SPELL_RAM_FATIGUE               = 43052,
    SPELL_SPEED_RAM_GALLOP          = 42994,
    SPELL_SPEED_RAM_CANTER          = 42993,
    SPELL_SPEED_RAM_TROT            = 42992,
    SPELL_SPEED_RAM_NORMAL          = 43310,
    SPELL_SPEED_RAM_EXHAUSED        = 43332,
    NPC_SPEED_BUNNY_GREEN           = 24263,
    NPC_SPEED_BUNNY_YELLOW          = 24264,
    NPC_SPEED_BUNNY_RED             = 24265,
    NPC_BARKER_BUNNY_1              = 24202,
    NPC_BARKER_BUNNY_2              = 24203,
    NPC_BARKER_BUNNY_3              = 24204,
    NPC_BARKER_BUNNY_4              = 24205,
};

class npc_brewfest_trigger : public CreatureScript
{
public:
    npc_brewfest_trigger() : CreatureScript("npc_brewfest_trigger") { }
    
    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_brewfest_triggerAI(creature);
    }

    struct npc_brewfest_triggerAI : public ScriptedAI
    {
        npc_brewfest_triggerAI(Creature* c) : ScriptedAI(c) {}
        
        void MoveInLineOfSight(Unit *who)
        {
            if (!who)
                return;

            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                if (!(CAST_PLR(who)->GetAura(SPELL_BREWFEST_RAM)))
                    return;

                if (CAST_PLR(who)->GetQuestStatus(BARK_FOR_THE_THUNDERBREWS) == QUEST_STATUS_INCOMPLETE||
                    CAST_PLR(who)->GetQuestStatus(BARK_FOR_TCHALIS_VOODOO_BREWERY) == QUEST_STATUS_INCOMPLETE||
                    CAST_PLR(who)->GetQuestStatus(BARK_FOR_THE_BARLEYBREWS) == QUEST_STATUS_INCOMPLETE||
                    CAST_PLR(who)->GetQuestStatus(BARK_FOR_DROHNS_DISTILLERY) == QUEST_STATUS_INCOMPLETE) 
                {
                    uint32 creditMarkerId = me->GetEntry();
                    if ((creditMarkerId >= 24202) && (creditMarkerId <= 24205))
                    {
                        // 24202: Brewfest Barker Bunny 1, 24203: Brewfest Barker Bunny 2, 24204: Brewfest Barker Bunny 3, 24205: Brewfest Barker Bunny 4
                        if (!CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_BARLEYBREWS, creditMarkerId)||
                            !CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_THUNDERBREWS, creditMarkerId)||
                            !CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_DROHNS_DISTILLERY, creditMarkerId)||
                            !CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_TCHALIS_VOODOO_BREWERY, creditMarkerId))
                            CAST_PLR(who)->KilledMonsterCredit(creditMarkerId, me->GetGUID());
                        // Caso para quest 11293 que no se completa teniendo todas las marcas
                        if (CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_BARLEYBREWS, NPC_BARKER_BUNNY_1)&&
                            CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_BARLEYBREWS, NPC_BARKER_BUNNY_2)&&
                            CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_BARLEYBREWS, NPC_BARKER_BUNNY_3)&&
                            CAST_PLR(who)->GetReqKillOrCastCurrentCount(BARK_FOR_THE_BARLEYBREWS, NPC_BARKER_BUNNY_4))
                            CAST_PLR(who)->CompleteQuest(BARK_FOR_THE_BARLEYBREWS);
                    }
                }
            }
        }
    };
};
 
class spell_brewfest_speed : public SpellScriptLoader
{
public:
    spell_brewfest_speed() : SpellScriptLoader("spell_brewfest_speed") {}

    class spell_brewfest_speed_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_brewfest_speed_AuraScript);

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_RAM_FATIGUE))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_RAMSTEIN_SWIFT_WORK_RAM))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_BREWFEST_RAM))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_GALLOP))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_CANTER))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_TROT))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_NORMAL))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_GALLOP))
                return false;
            if (!sSpellMgr->GetSpellInfo(SPELL_SPEED_RAM_EXHAUSED))
                return false;
            return true;
        }
        
        void HandlePeriodicTick(AuraEffect const* aurEff)
        {
            if (GetId() == SPELL_SPEED_RAM_EXHAUSED)
                return;

            Player* pCaster = GetCaster()->ToPlayer();            
            if (!pCaster)
                return;
            int i;
            switch (GetId())
            {
                case SPELL_SPEED_RAM_GALLOP:
                    for (i = 0; i < 5; i++)
                        pCaster->AddAura(SPELL_RAM_FATIGUE,pCaster);
                    break;
                case SPELL_SPEED_RAM_CANTER:
                    pCaster->AddAura(SPELL_RAM_FATIGUE,pCaster);
                    break;
                case SPELL_SPEED_RAM_TROT:
                    if (pCaster->HasAura(SPELL_RAM_FATIGUE))
                        if (pCaster->GetAura(SPELL_RAM_FATIGUE)->GetStackAmount() <= 2)
                            pCaster->RemoveAura(SPELL_RAM_FATIGUE);
                        else
                            pCaster->GetAura(SPELL_RAM_FATIGUE)->ModStackAmount(-2);
                    break;
                case SPELL_SPEED_RAM_NORMAL:
                    if (pCaster->HasAura(SPELL_RAM_FATIGUE))
                        if (pCaster->GetAura(SPELL_RAM_FATIGUE)->GetStackAmount() <= 4)
                            pCaster->RemoveAura(SPELL_RAM_FATIGUE);
                       else
                           pCaster->GetAura(SPELL_RAM_FATIGUE)->ModStackAmount(-4);
                    break;
            }

            switch (aurEff->GetId())
            {
                case SPELL_SPEED_RAM_TROT:
                    if (aurEff->GetTickNumber() == 4)
                        pCaster->KilledMonsterCredit(NPC_SPEED_BUNNY_GREEN, 0);
                    break;
                case SPELL_SPEED_RAM_CANTER:
                    if (aurEff->GetTickNumber() == 8)
                        pCaster->KilledMonsterCredit(NPC_SPEED_BUNNY_YELLOW, 0);
                    break;
                case SPELL_SPEED_RAM_GALLOP:
                    if (aurEff->GetTickNumber() == 8)
                        pCaster->KilledMonsterCredit(NPC_SPEED_BUNNY_RED, 0);
                    break;
            }
            if (pCaster->HasAura(SPELL_RAM_FATIGUE))
                if (pCaster->GetAura(SPELL_RAM_FATIGUE)->GetStackAmount() >= 100)
                    pCaster->CastSpell(pCaster,SPELL_SPEED_RAM_EXHAUSED, false);
        }

        void OnRemove(AuraEffect const * aurEff, AuraEffectHandleModes /*mode*/)
        {
            Player* pCaster = GetCaster()->ToPlayer();
            if (!pCaster)
                return;
            if (!pCaster->HasAura(SPELL_BREWFEST_RAM) || !pCaster->HasAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM))
                return;
            if (GetId() == SPELL_SPEED_RAM_EXHAUSED) 
            {
                if (pCaster->HasAura(SPELL_RAM_FATIGUE))
                    pCaster->GetAura(SPELL_RAM_FATIGUE)->ModStackAmount(-15);
            } else if (!pCaster->HasAura(SPELL_RAM_FATIGUE) || pCaster->GetAura(SPELL_RAM_FATIGUE)->GetStackAmount() < 100)
                
                switch (GetId())
                {
                    case SPELL_SPEED_RAM_GALLOP:
                        if (!pCaster->HasAura(SPELL_SPEED_RAM_EXHAUSED))
                            pCaster->CastSpell(pCaster,SPELL_SPEED_RAM_CANTER, false);
                        break;
                    case SPELL_SPEED_RAM_CANTER:
                        if (!pCaster->HasAura(SPELL_SPEED_RAM_GALLOP))
                            pCaster->CastSpell(pCaster,SPELL_SPEED_RAM_TROT, false);
                        break;
                    case SPELL_SPEED_RAM_TROT:
                        if (!pCaster->HasAura(SPELL_SPEED_RAM_CANTER))
                            pCaster->CastSpell(pCaster,SPELL_SPEED_RAM_NORMAL, false);
                        break;
                }
        }

        void OnApply(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
        {
            Player* pCaster = GetCaster()->ToPlayer();
            
            if (!pCaster)
                return;

            switch (GetId())
            {
                case SPELL_SPEED_RAM_GALLOP:
                    pCaster->GetAura(SPELL_SPEED_RAM_GALLOP)->SetDuration(4000);
                    break;
                case SPELL_SPEED_RAM_CANTER:
                    pCaster->GetAura(SPELL_SPEED_RAM_CANTER)->SetDuration(4000);
                    break;
                case SPELL_SPEED_RAM_TROT:
                    pCaster->GetAura(SPELL_SPEED_RAM_TROT)->SetDuration(4000);
                    break;
             }
        }

        void Register()
        {
            OnEffectApply += AuraEffectApplyFn(spell_brewfest_speed_AuraScript::OnApply, EFFECT_0, SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED, AURA_EFFECT_HANDLE_REAL);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_brewfest_speed_AuraScript::HandlePeriodicTick, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
            OnEffectRemove += AuraEffectRemoveFn(spell_brewfest_speed_AuraScript::OnRemove, EFFECT_2, SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const
    {
        return new spell_brewfest_speed_AuraScript();
    }
};


class item_brewfest_ram_reins : public ItemScript
{
public:
    item_brewfest_ram_reins() : ItemScript("item_brewfest_ram_reins") { }

    bool OnUse(Player* player, Item* pItem, const SpellCastTargets & /*pTargets*/)
    {
        if ((player->HasAura(SPELL_BREWFEST_RAM) || player->HasAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM)) && !player->HasAura(SPELL_SPEED_RAM_EXHAUSED))
        {
            if (player->HasAura(SPELL_SPEED_RAM_NORMAL))
                player->CastSpell(player,SPELL_SPEED_RAM_TROT,false);
            else if (player->HasAura(SPELL_SPEED_RAM_TROT))
            {
                if (player->GetAura(SPELL_SPEED_RAM_TROT)->GetDuration() < 3000)
                    player->GetAura(SPELL_SPEED_RAM_TROT)->SetDuration(4000);
                else
                  player->CastSpell(player,SPELL_SPEED_RAM_CANTER,false);
            } else if (player->HasAura(SPELL_SPEED_RAM_CANTER))
            {
                if (player->GetAura(SPELL_SPEED_RAM_CANTER)->GetDuration() < 3000)
                    player->GetAura(SPELL_SPEED_RAM_CANTER)->SetDuration(4000);
                else
                  player->CastSpell(player,SPELL_SPEED_RAM_GALLOP,false);
            } else if (player->HasAura(SPELL_SPEED_RAM_GALLOP))
                player->GetAura(SPELL_SPEED_RAM_GALLOP)->SetDuration(4000);
        } 
        else
            player->SendEquipError(EQUIP_ERR_CANT_DO_RIGHT_NOW ,pItem, NULL);

        return true;
    }
};

/*####
## npc_brewfest_apple_trigger
####*/

#define SPELL_RAM_FATIGUE    43052

class npc_brewfest_apple_trigger : public CreatureScript
{
public:
    npc_brewfest_apple_trigger() : CreatureScript("npc_brewfest_apple_trigger") { }
    
    struct npc_brewfest_apple_triggerAI : public ScriptedAI
    {
        npc_brewfest_apple_triggerAI(Creature* c) : ScriptedAI(c) {}
        
        void MoveInLineOfSight(Unit *who)
        {
            Player *player = who->ToPlayer();
            if (!player)
                return;
            if (player->HasAura(SPELL_RAM_FATIGUE) && me->GetDistance(player->GetPositionX(),player->GetPositionY(),player->GetPositionZ()) <= 7.5f)
                player->RemoveAura(SPELL_RAM_FATIGUE);
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_brewfest_apple_triggerAI(creature);
    }
};

/*####
## npc_brewfest_keg_thrower
####*/

enum BrewfestKegThrower
{
    SPELL_THROW_KEG      = 43660,
    ITEM_BREWFEST_KEG    = 33797
};

class npc_brewfest_keg_thrower : public CreatureScript
{
public:
    npc_brewfest_keg_thrower() : CreatureScript("npc_brewfest_keg_thrower") { }

    struct npc_brewfest_keg_throwerAI : public ScriptedAI
    {
        npc_brewfest_keg_throwerAI(Creature* c) : ScriptedAI(c) {}

        void MoveInLineOfSight(Unit *who)
        {
            Player *player = who->ToPlayer();
            if (!player)
                return;
            if ((player->HasAura(SPELL_BREWFEST_RAM) || player->HasAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM))
                && me->GetDistance(player->GetPositionX(),player->GetPositionY(),player->GetPositionZ()) <= 25.0f
                && !player->HasItemCount(ITEM_BREWFEST_KEG,1))
            {
                me->CastSpell(player,SPELL_THROW_KEG,false);
                me->CastSpell(player,42414,false);
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_brewfest_keg_throwerAI(creature);
    }
};

/*####
## npc_brewfest_keg_receiver
####*/

enum BrewfestKegReceiver
{
    SPELL_CREATE_TICKETS            = 44501,
    QUEST_THERE_AND_BACK_AGAIN_A    = 11122,
    QUEST_THERE_AND_BACK_AGAIN_H    = 11412,
    NPC_BREWFEST_DELIVERY_BUNNY     = 24337,
    ACHIEV_BREW_OF_THE_MONTH        = 2796
};

class npc_brewfest_keg_receiver : public CreatureScript
{
public:
    npc_brewfest_keg_receiver() : CreatureScript("npc_brewfest_keg_receiver") { }

    struct npc_brewfest_keg_receiverAI : public ScriptedAI
    {
        npc_brewfest_keg_receiverAI(Creature* c) : ScriptedAI(c) {}
        
        void MoveInLineOfSight(Unit *who)
        {
            Player *player = who->ToPlayer();
            if (!player)
                return;

            if ((player->HasAura(SPELL_BREWFEST_RAM) ||  player->HasAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM))
                && me->GetDistance(player->GetPositionX(),player->GetPositionY(),player->GetPositionZ()) <= 5.0f
                && player->HasItemCount(ITEM_BREWFEST_KEG,1)) 
            {
                player->CastSpell(me,SPELL_THROW_KEG,true);
                player->DestroyItemCount(ITEM_BREWFEST_KEG,1,true);
                if (player->HasAura(SPELL_BREWFEST_RAM))
                    player->GetAura(SPELL_BREWFEST_RAM)->SetDuration(player->GetAura(SPELL_BREWFEST_RAM)->GetDuration() + 30000);
                if (player->HasAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM))
                    player->GetAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM)->SetDuration(player->GetAura(SPELL_RAMSTEIN_SWIFT_WORK_RAM)->GetDuration() + 30000);
                if (player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_A) 
                    || player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_H))
                {
                    player->CastSpell(player,SPELL_CREATE_TICKETS,true);
                }
                else
                {
                    player->KilledMonsterCredit(NPC_BREWFEST_DELIVERY_BUNNY,0);
                    if (player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_A) == QUEST_STATUS_INCOMPLETE) 
                        player->AreaExploredOrEventHappens(QUEST_THERE_AND_BACK_AGAIN_A);
                    if (player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_H) == QUEST_STATUS_INCOMPLETE) 
                        player->AreaExploredOrEventHappens(QUEST_THERE_AND_BACK_AGAIN_H);
                    if (player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_A) == QUEST_STATUS_COMPLETE
                        || player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_H) == QUEST_STATUS_COMPLETE)
                        player->RemoveAura(SPELL_BREWFEST_RAM);
                }
            }
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new npc_brewfest_keg_receiverAI(creature);
    }
};

/*####
## npc_brewfest_ram_master
####*/
#define GOSSIP_ITEM_RAM             "Do you have additional work?"
#define GOSSIP_ITEM_RAM_REINS       "Give me another Ram Racing Reins"
#define SPELL_BREWFEST_SUMMON_RAM   43720

class npc_brewfest_ram_master : public CreatureScript
{
public:
    npc_brewfest_ram_master() : CreatureScript("npc_brewfest_ram_master") { }

    bool OnGossipHello(Player *player, Creature *pCreature)
    {
        if (pCreature->isQuestGiver())
            player->PrepareQuestMenu(pCreature->GetGUID());

            if (player->HasSpellCooldown(SPELL_BREWFEST_SUMMON_RAM) 
                && !player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_A) 
                && !player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_H)
                && (player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_A) == QUEST_STATUS_INCOMPLETE
                || player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_H) == QUEST_STATUS_INCOMPLETE))
                player->RemoveSpellCooldown(SPELL_BREWFEST_SUMMON_RAM);

            if (!player->HasAura(SPELL_BREWFEST_RAM) && ((player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_A) == QUEST_STATUS_INCOMPLETE 
            || player->GetQuestStatus(QUEST_THERE_AND_BACK_AGAIN_H) == QUEST_STATUS_INCOMPLETE 
            || (!player->HasSpellCooldown(SPELL_BREWFEST_SUMMON_RAM) && 
                (player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_A) 
                || player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_H))))))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_RAM, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

            if ((player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_A) 
                || player->GetQuestRewardStatus(QUEST_THERE_AND_BACK_AGAIN_H))
                && !player->HasItemCount(33306,1,true))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_RAM_REINS, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

        player->SEND_GOSSIP_MENU(384, pCreature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
    {
        if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
        {
            if (player->HasItemCount(ITEM_BREWFEST_KEG,1)) 
                player->DestroyItemCount(ITEM_BREWFEST_KEG,1,true);
            player->CastSpell(player,SPELL_BREWFEST_SUMMON_RAM,true);
            player->AddSpellCooldown(SPELL_BREWFEST_SUMMON_RAM,0,time(NULL) + 18*60*60);
        }
        if (uiAction == GOSSIP_ACTION_INFO_DEF+2)
        {
            player->CastSpell(player,44371,false);
        }
        return true;
    }
};

/*
1. Walk to one keg. Arrived at keg casts a spell and repeats that spell every 5 seconds
2. ALWAYS run a localize check on spawn. Blizzard used spells for this. When they spawn at Durotar they move to diferent kegs than at Dun Morogh.
3. On spellhit of spell that is yet to be scripted by QAston (don't bother - missing support in core) we should EMOTE death
4. If players gets within 3 yards cast Knockback
*/
 
enum DarkIronGuzzler
{
    NPC_DARK_IRON_GUZZLER  = 23709,
 
    NPC_FESTIVE_KEG_1      = 23702, // Thunderbrew Festive Keg
    NPC_FESTIVE_KEG_2      = 23700, // Barleybrew Festive Keg
    NPC_FESTIVE_KEG_3      = 23706, // Gordok Festive Keg
    NPC_FESTIVE_KEG_4      = 24373, // T'chalis's Festive Keg
    NPC_FESTIVE_KEG_5      = 24372, // Drohn's Festive Keg
 
    SPELL_SPAWN                 = 43668,
    SPELL_ORG                   = 43669,
    SPELL_IF                    = 43670,
    SPELL_GO_TO_NEW_TARGET      = 42498,
    SPELL_ATTACK_KEG            = 42393,
    SPELL_DRINK                 = 42436,
    SPELL_RETREAT               = 42341,
    SPELL_KNOCKBACK             = 42299,
    SPELL_KNOCKBACK_AURA        = 42676,
};
 
class npc_dark_iron_guzzler : public CreatureScript
{
public:
    npc_dark_iron_guzzler() : CreatureScript("npc_dark_iron_guzzler") { }
 
    CreatureAI *GetAI(Creature* creature) const
    {
        return new npc_dark_iron_guzzlerAI(creature);
    }
 
    struct npc_dark_iron_guzzlerAI : public ScriptedAI
    {
        npc_dark_iron_guzzlerAI(Creature* creature) : ScriptedAI(creature) { }
 
        bool atKeg;
        bool barleyDead;
        bool thunderDead;        
        bool gordokDead;
        bool drohnDead;
        bool tchaliDead;
        uint32 AttackKegTimer;
 
        void Reset()
        {
            AttackKegTimer = 5000;
            me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
        }
 
        // These values are set through SAI - when a Festive Keg dies it will set data to all Dark Iron Guzzlers within 3 yards (the killers)
        void SetData(uint32 type, uint32 data)
        {
            if (type == 10 && data == 10)
            {
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
                thunderDead = true;
            }
 
            if (type == 11 && data == 11)
            {
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
                barleyDead = true;
            }
 
            if (type == 12 && data == 12)
            {
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
                gordokDead = true;
            }
 
            if (type == 13 && data == 13)
            {
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
                drohnDead = true;
            }
 
            if (type == 14 && data == 14)
            {
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
                tchaliDead = true;
            }
        }
 
        void KilledUnit(Unit* victim)
        {
            switch (victim->GetEntry())
            {
                case NPC_FESTIVE_KEG_1:
                case NPC_FESTIVE_KEG_2:
                case NPC_FESTIVE_KEG_3:
                case NPC_FESTIVE_KEG_4:
                case NPC_FESTIVE_KEG_5:
                    DoCast(me, SPELL_GO_TO_NEW_TARGET);
                break;
            default:
                break;
            }
 
            // If the kill is not a festive keg we shouldn't cast the spell
            /*if (victim->GetEntry() != NPC_FESTIVE_KEG_1 || victim->GetEntry() != NPC_FESTIVE_KEG_2 || victim->GetEntry() != NPC_FESTIVE_KEG_3 ||
                victim->GetEntry() != NPC_FESTIVE_KEG_4 || victim->GetEntry() != NPC_FESTIVE_KEG_5)
                return;*/
        }
 
        void IsSummonedBy(Unit* summoner)
        {
            // Move forward only on spawn
            me->GetMotionMaster()->MovePoint(1, me->GetPositionX()+5, me->GetPositionY(), me->GetPositionZ());
        }
       
        // As you can see here we do not have to use a spellscript for this
        void SpellHit(Unit* caster, const SpellInfo* spell)
        {
            if (spell->Id == SPELL_DRINK)
            {
                // Fake death - it's only visual!
                me->SetUInt32Value(UNIT_FIELD_BYTES_1, UNIT_STAND_STATE_DEAD);
 
                // Time based on information from videos
                me->ForcedDespawn(7000);
            }
 
            // Retreat - run back
            if (spell->Id == SPELL_RETREAT)
            {
                if (me->GetAreaId() == 1296)
                {
                    me->GetMotionMaster()->MovePoint(2, 1197.63f, -4293.571f, 21.243f);
                }
                else if (me->GetAreaId() == 1)
                {
                     me->GetMotionMaster()->MovePoint(3, -5152.3f, -603.529f, 398.356f);
                }
            }
 
            if (spell->Id == SPELL_GO_TO_NEW_TARGET)
            {
                // If we're at Durotar we target different kegs than the ones at Dun Morogh
                if (me->GetAreaId() == 1296)
                {
                    if (!drohnDead && !gordokDead && !tchaliDead)
                    {
                        switch (urand(0, 2))
                        {
                            case 0: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(4, 1220.86f, -4297.37f, 21.192f);
                                break;
                            case 1: // Drohn's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(5, 1185.98f, -4312.98f, 21.294f);
                                break;
                            case 2: // Ti'chali's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(6, 1184.12f, -4275.21f, 21.191f);
                                break;
                        }
                    }
                    else if (drohnDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(4, 1220.86f, -4297.37f, 21.192f);
                                break;
                            case 1: // Ti'chali's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(6, 1184.12f, -4275.21f, 21.191f);
                                break;
                        }
                    }
                    else if (gordokDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Drohn's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(5, 1185.98f, -4312.98f, 21.294f);
                                break;
                            case 1: // Ti'chali's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(6, 1184.12f, -4275.21f, 21.191f);
                                break;
                        }
                    }
                    else if (tchaliDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Drohn's Festive Keg                            
                                me->GetMotionMaster()->MovePoint(5, 1185.98f, -4312.98f, 21.294f);
                                break;
                            case 1: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(4, 1220.86f, -4297.37f, 21.192f);
                                break;
                        }
                    }
                }
                // If we're at Dun Morogh we target different kegs than the ones at Durotar
                else if (me->GetAreaId() == 1)
                {
                    if (!barleyDead && !gordokDead && !thunderDead)
                    {
                        switch (urand(0, 2))
                        {
                            case 0: // Barleybrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(7, -5183.67f, -599.58f, 397.177f);
                                break;
                            case 1: // Thunderbrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(8, -5159.53f, -629.52f, 397.213f);
                                break;
                            case 2: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(9, -5148.01f, -578.34f, 397.177f);
                                break;
                        }
                    }
                    else if (barleyDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Thunderbrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(8, -5159.53f, -629.52f, 397.213f);
                                break;
                            case 1: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(9, -5148.01f, -578.34f, 397.177f);
                                break;
                        }
                    }
                    else if (gordokDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Thunderbrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(8, -5159.53f, -629.52f, 397.213f);
                                break;
                            case 1: // Barleybrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(7, -5183.67f, -599.58f, 397.177f);
                                break;
                        }
                    }
                    else if (thunderDead)
                    {
                        switch (urand(0, 1))
                        {
                            case 0: // Gordok Festive Keg                            
                                me->GetMotionMaster()->MovePoint(9, -5148.01f, -578.34f, 397.177f);
                                break;
                            case 1: // Barleybrew Festive Keg                            
                                me->GetMotionMaster()->MovePoint(7, -5183.67f, -599.58f, 397.177f);
                                break;
                        }
                    }
                }
                atKeg = false;
            }
        }
 
        void MovementInform(uint32 Type, uint32 PointId)
        {
            if (Type != POINT_MOTION_TYPE)
                return;
 
            // After moving forward on spawn we should move to new target
            if (PointId == 1)
                DoCast(me, SPELL_GO_TO_NEW_TARGET);
 
            // Arrived at the retreat spot, we should despawn
            if (PointId == 2 || PointId == 3)
                me->ForcedDespawn(1000);
 
            // Arrived at the new keg - the spell has conditions in database
            if (PointId == 4 || PointId == 5 || PointId == 6 || PointId == 7 || PointId == 8 || PointId == 9)
            {
                DoCast(SPELL_ATTACK_KEG);
                atKeg = true;
            }
        }
 
        void UpdateAI(const uint32 diff)
        {
            if (!IsHolidayActive(HOLIDAY_BREWFEST))
                return;
 
            // Only happens if we're at keg
            if (atKeg)
            {
                if (AttackKegTimer <= diff)
                {
                    DoCast(SPELL_ATTACK_KEG);
                    AttackKegTimer = 5000;
                } else AttackKegTimer -= diff;
            }
        }
    };
};


void AddSC_blackrock_depths()
{
    new go_shadowforge_brazier();
    new at_ring_of_law();
    new npc_grimstone();
    new mob_phalanx();
    new npc_kharan_mighthammer();
    new npc_lokhtos_darkbargainer();
    new npc_rocknot();
    new npc_coren_direbrew();
    new npc_brewmaiden();
    new go_mole_machine_console();
    new npc_brewfest_trigger();
    new item_brewfest_ChugAndChuck();
    new spell_brewfest_speed();
    new item_brewfest_ram_reins;
    new npc_brewfest_apple_trigger;
    new npc_brewfest_keg_thrower;
    new npc_brewfest_keg_receiver;
    new npc_brewfest_ram_master;
    new npc_dark_iron_guzzler;
	// Fix us
    /*new npc_dughal_stormwing();
      new npc_tobias_seecher();
      new npc_marshal_windsor();
      new npc_marshal_reginald_windsor();
    */
}
