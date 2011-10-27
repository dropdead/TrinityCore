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
SDName: Sholazar_Basin
SD%Complete: 100
SDComment: Quest support: 11253, 11241.
SDCategory: howling_fjord
EndScriptData */

/* ContentData
npc_plaguehound_tracker
npc_apothecary_hanes
EndContentData */

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"

/*######
## npc_apothecary_hanes
######*/
enum Entries
{
    NPC_APOTHECARY_HANES         = 23784,
    FACTION_ESCORTEE_A           = 774,
    FACTION_ESCORTEE_H           = 775,
    NPC_HANES_FIRE_TRIGGER       = 23968,
    QUEST_TRAIL_OF_FIRE          = 11241,
    SPELL_COSMETIC_LOW_POLY_FIRE = 56274
};

class npc_apothecary_hanes : public CreatureScript
{
public:
    npc_apothecary_hanes() : CreatureScript("npc_apothecary_hanes") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_TRAIL_OF_FIRE)
        {
            switch (player->GetTeam())
            {
                case ALLIANCE:
                    creature->setFaction(FACTION_ESCORTEE_A);
                    break;
                case HORDE:
                    creature->setFaction(FACTION_ESCORTEE_H);
                    break;
            }
            CAST_AI(npc_escortAI, (creature->AI()))->Start(true, false, player->GetGUID());
        }
        return true;
    }

    struct npc_Apothecary_HanesAI : public npc_escortAI
    {
        npc_Apothecary_HanesAI(Creature* creature) : npc_escortAI(creature){}
        uint32 PotTimer;

        void Reset ()
        {
            SetDespawnAtFar(false);
            PotTimer = 10000; //10 sec cooldown on potion
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player* player = GetPlayerForEscort())
                player->FailQuest(QUEST_TRAIL_OF_FIRE);
        }

        void UpdateEscortAI(const uint32 diff)
        {
            if (HealthBelowPct(75))
            {
                if (PotTimer <= diff)
                {
                    DoCast(me, 17534, true);
                    PotTimer = 10000;
                } else PotTimer -= diff;
            }
            if (GetAttack() && UpdateVictim())
                DoMeleeAttackIfReady();
        }

        void WaypointReached(uint32 i)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;
            switch (i)
            {
                case 1:
                    me->SetReactState(REACT_AGGRESSIVE);
                    SetRun(true);
                    break;
                case 23:
                    if (player)
                        player->GroupEventHappens(QUEST_TRAIL_OF_FIRE, me);
                    me->DespawnOrUnsummon();
                    break;
                case 5:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 6:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
                case 8:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(false);
                    break;
                case 9:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    break;
                case 10:
                    SetRun(true);
                    break;
                case 13:
                    SetRun(false);
                    break;
                case 14:
                    if (Unit* Trigger = me->FindNearestCreature(NPC_HANES_FIRE_TRIGGER, 10.0f))
                        Trigger->CastSpell(Trigger, SPELL_COSMETIC_LOW_POLY_FIRE, false);
                    SetRun(true);
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_Apothecary_HanesAI(creature);
    }
};

/*######
## npc_plaguehound_tracker
######*/

enum ePlaguehound
{
    QUEST_SNIFF_OUT_ENEMY        = 11253
};

class npc_plaguehound_tracker : public CreatureScript
{
public:
    npc_plaguehound_tracker() : CreatureScript("npc_plaguehound_tracker") { }

    struct npc_plaguehound_trackerAI : public npc_escortAI
    {
        npc_plaguehound_trackerAI(Creature* creature) : npc_escortAI(creature) { }

        void Reset()
        {
            uint64 summonerGUID = 0;

            if (me->isSummon())
                if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                    if (summoner->GetTypeId() == TYPEID_PLAYER)
                        summonerGUID = summoner->GetGUID();

            if (!summonerGUID)
                return;

            me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
            Start(false, false, summonerGUID);
        }

        void WaypointReached(uint32 waypointId)
        {
            if (waypointId != 26)
                return;

            me->DespawnOrUnsummon();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_plaguehound_trackerAI(creature);
    }
};

/*######
## npc_razael_and_lyana
######*/

#define GOSSIP_RAZAEL_REPORT "High Executor Anselm wants a report on the situation."
#define GOSSIP_LYANA_REPORT "High Executor Anselm requests your report."

enum eRazael
{
    QUEST_REPORTS_FROM_THE_FIELD = 11221,
    NPC_RAZAEL = 23998,
    NPC_LYANA = 23778,
    GOSSIP_TEXTID_RAZAEL1 = 11562,
    GOSSIP_TEXTID_RAZAEL2 = 11564,
    GOSSIP_TEXTID_LYANA1 = 11586,
    GOSSIP_TEXTID_LYANA2 = 11588
};

class npc_razael_and_lyana : public CreatureScript
{
public:
    npc_razael_and_lyana() : CreatureScript("npc_razael_and_lyana") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(QUEST_REPORTS_FROM_THE_FIELD) == QUEST_STATUS_INCOMPLETE)
            switch (creature->GetEntry())
            {
                case NPC_RAZAEL:
                    if (!player->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_RAZAEL))
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_RAZAEL_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL1, creature->GetGUID());
                        return true;
                    }
                break;
                case NPC_LYANA:
                    if (!player->GetReqKillOrCastCurrentCount(QUEST_REPORTS_FROM_THE_FIELD, NPC_LYANA))
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_LYANA_REPORT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                        player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA1, creature->GetGUID());
                        return true;
                    }
                break;
            }
        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF + 1:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_RAZAEL2, creature->GetGUID());
                player->TalkedToCreature(NPC_RAZAEL, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF + 2:
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_LYANA2, creature->GetGUID());
                player->TalkedToCreature(NPC_LYANA, creature->GetGUID());
                break;
        }
        return true;
    }
};

/*######
## npc_mcgoyver
######*/

#define GOSSIP_ITEM_MG_I  "Walt sent me to pick up some dark iron ingots."
#define GOSSIP_ITEM_MG_II "Yarp."

enum eMcGoyver
{
    QUEST_WE_CAN_REBUILD_IT             = 11483,

    SPELL_CREATURE_DARK_IRON_INGOTS     = 44512,
    SPELL_TAXI_EXPLORERS_LEAGUE         = 44280,

    GOSSIP_TEXTID_MCGOYVER              = 12193
};

class npc_mcgoyver : public CreatureScript
{
public:
    npc_mcgoyver() : CreatureScript("npc_mcgoyver") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_WE_CAN_REBUILD_IT) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_I, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_MG_II, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
                player->SEND_GOSSIP_MENU(GOSSIP_TEXTID_MCGOYVER, creature->GetGUID());
                player->CastSpell(player, SPELL_CREATURE_DARK_IRON_INGOTS, true);
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->CastSpell(player, SPELL_TAXI_EXPLORERS_LEAGUE, true);
                player->CLOSE_GOSSIP_MENU();
                break;
        }
        return true;
    }
};

/*######
## npc_daegarn
######*/

enum eDaegarnn
{
    QUEST_DEFEAT_AT_RING            = 11300,

    NPC_FIRJUS                      = 24213,
    NPC_JLARBORN                    = 24215,
    NPC_YOROS                       = 24214,
    NPC_OLUF                        = 23931,

    NPC_PRISONER_1                  = 24253,  // looks the same but has different abilities
    NPC_PRISONER_2                  = 24254,
    NPC_PRISONER_3                  = 24255,
};

static float afSummon[] = {838.81f, -4678.06f, -94.182f};
static float afCenter[] = {801.88f, -4721.87f, -96.143f};

class npc_daegarn : public CreatureScript
{
public:
    npc_daegarn() : CreatureScript("npc_daegarn") { }

    bool OnQuestAccept(Player* player, Creature* creature, const Quest* quest)
    {
        if (quest->GetQuestId() == QUEST_DEFEAT_AT_RING)
        {
            if (npc_daegarnAI* pDaegarnAI = CAST_AI(npc_daegarn::npc_daegarnAI, creature->AI()))
                pDaegarnAI->StartEvent(player->GetGUID());
        }

        return true;
    }

    // TODO: make prisoners help (unclear if summoned or using npc's from surrounding cages (summon inside small cages?))
    struct npc_daegarnAI : public ScriptedAI
    {
        npc_daegarnAI(Creature* creature) : ScriptedAI(creature) { }

        bool bEventInProgress;
        uint64 uiPlayerGUID;

        void Reset()
        {
            bEventInProgress = false;
            uiPlayerGUID = 0;
        }

        void StartEvent(uint64 uiGUID)
        {
            if (bEventInProgress)
                return;

            uiPlayerGUID = uiGUID;

            SummonGladiator(NPC_FIRJUS);
        }

        void JustSummoned(Creature* summon)
        {
            if (Player* player = me->GetPlayer(*me, uiPlayerGUID))
            {
                if (player->isAlive())
                {
                    summon->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
                    summon->GetMotionMaster()->MovePoint(0, afCenter[0], afCenter[1], afCenter[2]);
                    summon->AI()->AttackStart(player);
                    return;
                }
            }

            Reset();
        }

        void SummonGladiator(uint32 uiEntry)
        {
            me->SummonCreature(uiEntry, afSummon[0], afSummon[1], afSummon[2], 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30*IN_MILLISECONDS);
        }

        void SummonedCreatureDies(Creature* summoned, Unit* /*killer*/)
        {
            uint32 uiEntry = 0;

            // will eventually reset the event if something goes wrong
            switch (summoned->GetEntry())
            {
                case NPC_FIRJUS:    uiEntry = NPC_JLARBORN; break;
                case NPC_JLARBORN:  uiEntry = NPC_YOROS;    break;
                case NPC_YOROS:     uiEntry = NPC_OLUF;     break;
                case NPC_OLUF:      Reset();                return;
            }

            SummonGladiator(uiEntry);
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_daegarnAI(creature);
    }
};

/*######
## Fix Quest Drop It then Rock It 11429
######*/

enum DropItTheRockIT
{
    NPC_WINTERSKORN_DEFENDER    =	24015,
    QUEST_DROP_IT_THEN_ROCK_IT  =	11429
};

class npc_alliance_banner_standard : public CreatureScript
{
public:
    npc_alliance_banner_standard() : CreatureScript("npc_alliance_banner_standard") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_alliance_banner_standardAI(creature);
    }

    struct npc_alliance_banner_standardAI : public ScriptedAI
    {
        npc_alliance_banner_standardAI(Creature *c) : ScriptedAI(c), lSummons(me)
        {
            summonNumber    = 0;
            summonTimer     = 2000;
        }

        uint32 summonTimer;
        uint8 summonNumber;
        uint8 summons;
        SummonList lSummons;

        void Reset()
        {
            me->SetReactState(REACT_PASSIVE);
        }

        void JustSummoned(Creature* summon)
        {
            lSummons.Summon(summon);
        }

        void JustDied(Unit *who)
        {
            lSummons.DespawnAll();
        }

        void UpdateAI(const uint32 diff)
        {
            if (summonTimer <= diff)
            {
                if (summonNumber >= 3)
                {
                    if (Unit* owner = me->GetOwner())
                    {
                        if (owner->GetTypeId() == TYPEID_PLAYER)
                        {
                            Player* player = CAST_PLR(owner);
                            player->GroupEventHappens(QUEST_DROP_IT_THEN_ROCK_IT, me);
                        }
                    }
                    me->DisappearAndDie();
                }
                if (summonNumber <= 3)
                    summons = 1;
                else if (summonNumber <= 4)
                    summons = 2;
                else summons = 3;
                for (int i = 0 ; i < summons ; i++)
                {
                    Creature* defender = me->SummonCreature(NPC_WINTERSKORN_DEFENDER, me->GetPositionX()+20, me->GetPositionY()+20, me->GetPositionZ());
                    if (defender)
                    {
                        defender->AI()->AttackStart(me) ;
                    }
                }
                summonNumber ++;
                summonTimer = 16000;
            } else summonTimer -= diff; 
            if (!UpdateVictim())
                return;
        }
    };
};


/*################
# [Part 1]
# Quest Soporte The Echo of Ymiron - 11343
# Lichking = 35877
###############*/
 
enum Yells
{
    SAY_YMIRON_LK_1                                = -1700005, //Shamanism has brought you here... Its scent permeates the air. I was once a shaman.
    SAY_YMIRON_LK_2                                = -1700006, //No, minion. This one is not ready.
    SAY_YMIRON_LK_3                                = -1700007, //Do you feel it, mortal? Death seeps through me, enveloping all that I touch. With just a snap of my finger your soul will languish in damnation for all eternity.
    SAY_YMIRON_LK_4                                = -1700008, //But... It is not yet your time to serve the Lich King. Yes, a greater destiny awaits you. Power... You must become more powerful before you are to serve me.
    SAY_YMIRON_LK_5                                = -1700009, //Now watch, val\'kyr. Observe as I apply pressure. Can you see that it is not yet ripe? Watch as it pops and falls lifeless to the floor.
    SAY_YMIRON_LK_6                                = -1700010, //Valkyre Shall we prepare it for you, my lord?
    SAY_ANCIENT_MALE_VRYKUL_1                      = -1700011, //So then we too are cursed?
    SAY_ANCIENT_MALE_VRYKUL_2                      = -1700012, //The gods have forsaken us! We must dispose of it before Ymiron is notified!
    SAY_ANCIENT_MALE_VRYKUL_3                      = -1700013, //Then what are we to do, wife? The others cannot find out. Should they learn of this aberration, we will all be executed.
    SAY_ANCIENT_FEMALE_VRYKUL_1                    = -1700014, //NO! You cannot! I beg of you! It is our child!
    SAY_ANCIENT_FEMALE_VRYKUL_2                    = -1700015, //I... I will hide it. I will hide it until I find it a home, far away from here...
};

enum Spells
{
    SPELL_WRATH_OF_THE_LICH_KING        = 5,
    SPELL_GRASP_OF_THE_LICH_KING        = 43489,
    SPELL_MAGNETIC_PULL                 = 29661,
};

// Variables y boleanos - Glovales para los 3 npcs
uint32 uiPhase_Ymiron_LK; 
uint32 uiPhaseTimer_Ymiron_LK;                                  
uint32 uiEventCounter;
uint32 EventAncientVrykulPhase;
uint32 EventAncientVrykulTimer;
bool EventStartedYmiron; 
bool EventStarted;

class LichKingYmiron : public CreatureScript
{
public:
    LichKingYmiron() : CreatureScript("LichKingYmiron") { }

    CreatureAI *GetAI(Creature *creature) const
    {
        return new LichKingYmironAI (creature);
    }

    struct LichKingYmironAI : public ScriptedAI
    {
        LichKingYmironAI(Creature *c) : ScriptedAI(c) {}
        
        void Reset()    
        {
            uiPhase_Ymiron_LK = 0;
            uiPhaseTimer_Ymiron_LK = 1000;
            EventStartedYmiron = false;
        }
     
        void UpdateAI(const uint32 uiDiff)
        {
     
            if (me->getVictim())
            {
                me->StopMoving();
                Unit *LK_VICTIM = me->getVictim();
     
                if (LK_VICTIM == NULL)
                    return;
     
                if (uiPhaseTimer_Ymiron_LK <= uiDiff)
                {
                    switch (uiPhase_Ymiron_LK)
                    {
                        case 0:                                               
                            me->CastSpell(me->getVictim(), SPELL_MAGNETIC_PULL, false, 0, 0, 0);
                            me->CastSpell(me->getVictim(), SPELL_GRASP_OF_THE_LICH_KING, false, 0, 0, 0);
                            me->AttackStop();
                            uiPhase_Ymiron_LK = 1;
                            break;     
                        case 1:
                            DoScriptText(SAY_YMIRON_LK_1, me);
                            uiPhaseTimer_Ymiron_LK = 10000;
                            uiPhase_Ymiron_LK = 2;
                            break;                                       
                        case 2:
                            EventStartedYmiron = true;
                            uiPhaseTimer_Ymiron_LK = 10000;
                            uiPhase_Ymiron_LK = 3;
                            break;         
                        case 3:
                            DoScriptText(SAY_YMIRON_LK_2, me);
                            uiPhaseTimer_Ymiron_LK = 10000;
                            uiPhase_Ymiron_LK = 4;
                            break;         
                        case 4:
                            DoScriptText(SAY_YMIRON_LK_3, me);
                            uiPhaseTimer_Ymiron_LK = 10000;
                            uiPhase_Ymiron_LK = 5;
                            break;         
                        case 5:
                            DoScriptText(SAY_YMIRON_LK_4, me);
                            uiPhaseTimer_Ymiron_LK = 10000;
                            uiPhase_Ymiron_LK = 6;
                            break;         
                        case 6:
                            DoScriptText(SAY_YMIRON_LK_5, me);
                            uiPhaseTimer_Ymiron_LK = 4000;
                            uiPhase_Ymiron_LK = 7;
                            break;     
                        case 7:
                            me->CastSpell(LK_VICTIM, SPELL_WRATH_OF_THE_LICH_KING, false, 0, 0, 0);
                            uiPhase_Ymiron_LK = 8;
                            break;     
                        case 8:
                            Reset();
                            LK_VICTIM = NULL; 
                            break;
                    }
                }
                else
                    uiPhaseTimer_Ymiron_LK -= uiDiff;
            }
        }
    };
};

/*################
# [Parte 2]
# LichKing dialog con Valkyre
# Valkyre = 24327
###############*/

class ValkyreYmiron : public CreatureScript
{
public:
    ValkyreYmiron() : CreatureScript("ValkyreYmiron") { }

    CreatureAI *GetAI(Creature *creature) const
    {
        return new ValkyreYmironAI (creature);
    }

    struct ValkyreYmironAI : public ScriptedAI
    {
        ValkyreYmironAI(Creature *c) : ScriptedAI(c) {}
       
        uint32 EventValkyreTimer;
       
        void Reset()
        {
            EventValkyreTimer = 17000;  
        }
     
        void UpdateAI(const uint32 uiDiff)
        {
            if (me->isInCombat())
            {
                me->StopMoving();
                me->AttackStop();
            }
            if (EventValkyreTimer <= uiDiff)
            {
                if (EventStartedYmiron == true)
                {
                    DoScriptText(SAY_YMIRON_LK_6, me);
                    EventStartedYmiron = false;
                }
            }
            else
                EventValkyreTimer -= uiDiff;
        }
    };
};

/*###############
# [Parte 3]
# The Echo of Ymiron 
# Parte donde completas la quest (parte inciial).
# Ancient Male Vrykul = 24314, Ancient Female Vrykul = 24315
###############*/

class AncientMaleVrykul : public CreatureScript
{
public:
    AncientMaleVrykul() : CreatureScript("AncientMaleVrykul") { }

    struct AncientMaleVrykulAI : public ScriptedAI
    {
        AncientMaleVrykulAI(Creature *c) : ScriptedAI(c) {}
       
        void Reset()    
        {
            EventAncientVrykulPhase = 0;
            EventAncientVrykulTimer = 5000; 
            EventStarted            = false;
        }
     
        void CompleteQuest()
        {
            if (Map *pMap = me->GetMap())
            {
                Map::PlayerList const &PlayerList = pMap->GetPlayers();
                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (Player *curPlayer = i->getSource())
                    {
                        if (me->IsInRange(curPlayer, 0.0f, 30.0f))
                            curPlayer->CompleteQuest(11343);
                    }
                }
            }
        }
       
        void MoveInLineOfSight(Unit* who)
        {
            if (who->HasAura(42786, 0, 3) == true)
            {
                EventStarted = true;
            }
        }
       
        void UpdateAI(const uint32 uiDiff)
        {
            if (me->getFaction() == 14)
            {
                me->setFaction(11);
                me->SetPhaseMask(2, true);
            }
     
            if (EventStarted == true)
            {
                if (EventAncientVrykulTimer <= uiDiff)
                {
                    switch (EventAncientVrykulPhase)
                    {
                    case 0:
                        DoScriptText(SAY_ANCIENT_MALE_VRYKUL_1, me);
                        EventAncientVrykulTimer = 7000;
                        EventAncientVrykulPhase++;
                        break;
     
                    case 1:
                       DoScriptText(SAY_ANCIENT_MALE_VRYKUL_2, me);
                        EventAncientVrykulTimer = 7000;
                        EventAncientVrykulPhase++;
                        break;
     
                    case 3:
                        DoScriptText(SAY_ANCIENT_MALE_VRYKUL_3, me);
                        EventAncientVrykulTimer = 7000;
                        EventAncientVrykulPhase++;
                        break;    
     
                    case 5:
                        CompleteQuest();
                        break;
                    }
                }
                else EventAncientVrykulTimer -= uiDiff;
            }  
        }
    };

    CreatureAI *GetAI(Creature *creature) const
    {
        return new AncientMaleVrykulAI (creature);
    }
};

class AncientFeMaleVrykul : public CreatureScript
{
public:
    AncientFeMaleVrykul() : CreatureScript("AncientFeMaleVrykul") { }

    CreatureAI *GetAI(Creature *creature) const
    {
        return new AncientFeMaleVrykulAI (creature);
    }

    struct AncientFeMaleVrykulAI : public ScriptedAI
    {
        AncientFeMaleVrykulAI(Creature *c) : ScriptedAI(c) {}
       
        void UpdateAI(const uint32 uiDiff)
        {
            if (me->getFaction() == 14)
            {
                me->setFaction(11);
                me->SetPhaseMask(2, true);
            }     
     
            if (EventStarted == true)
            {
                if (EventAncientVrykulTimer <= uiDiff)
                {
                    switch (EventAncientVrykulPhase)
                    {
                        case 2:
                            DoScriptText(SAY_ANCIENT_FEMALE_VRYKUL_1, me);
                            EventAncientVrykulTimer = 7000;
                            EventAncientVrykulPhase++;
                            break;
         
                        case 4:
                            DoScriptText(SAY_ANCIENT_FEMALE_VRYKUL_2, me);
                            EventAncientVrykulTimer = 7000;
                            EventAncientVrykulPhase++;
                            break;
                    }
                }
                else EventAncientVrykulTimer -= uiDiff;
            }
        }
    };
};

void AddSC_howling_fjord()
{
    new npc_apothecary_hanes;
    new npc_plaguehound_tracker;
    new npc_razael_and_lyana;
    new npc_mcgoyver;
    new npc_daegarn;
    new npc_alliance_banner_standard;
    new LichKingYmiron;
    new ValkyreYmiron;
    new AncientMaleVrykul;
    new AncientFeMaleVrykul;
 }
