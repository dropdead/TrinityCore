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
    //Npc Captain Arnath - http://old.wowhead.com/npc=37122
    SPELL_DOMINATE_MIND         = 14515, // http://old.wowhead.com/spell=14515
    SPELL_FLASH_HEAL_MODE_10    = 71782, // http://old.wowhead.com/spell=71782 - Mode 10 player
    SPELL_FLASH_HEAL_MODE_25    = 71783, // http://old.wowhead.com/spell=71783 - Mode 25 player
    SPELL_FLASH_HEAL_MODE_ALL   = 71595, // http://old.wowhead.com/spell=71595 - Mode todos
    SPELL_POWER_WORD_SHIELD_10  = 71780, // http://old.wowhead.com/spell=71780 - Mode 10 player
    SPELL_POWER_WORD_SHIELD_25  = 71781, // http://old.wowhead.com/spell=71781 - Mode 25 player
    SPELL_POWER_WORD_SHIELD_ALL = 71548, // http://old.wowhead.com/spell=71548 - Mode todos
    SPELL_SMITE_10  			= 71546, // http://old.wowhead.com/spell=71546
    SPELL_SMITE_10_HEROIC  		= 71778, // http://old.wowhead.com/spell=71778
    SPELL_SMITE_25  			= 71779, // http://old.wowhead.com/spell=71779
    SPELL_SMITE_25_HEROIC 		= 71547, // http://old.wowhead.com/spell=71547
    SPELL_UNDEAD_ALL 			= 70089, // http://old.wowhead.com/spell=70089
    // Npc Deathbound Ward - http://old.wowhead.com/npc=37007
    SPELL_DISRUPTING_SHOUT_ALL  = 71022, // http://old.wowhead.com/spell=71022
    SPELL_SABER_LASH_ALL		= 71021, // http://old.wowhead.com/spell=71021
    SPELL_SOUL_FEAST_ALL 		= 71203, // http://old.wowhead.com/spell=71203
    // Npc Captain Brandon - http://old.wowhead.com/npc=37123
    SPELL_CRUSADER_STRIKE       = 71549, // http://old.wowhead.com/spell=71549
    SPELL_DIVINE_SHIELD         = 71550, // http://old.wowhead.com/spell=71550
    SPELL_HAMMER_OF_BETRAYAL    = 71784, // http://old.wowhead.com/spell=71784
    SPELL_JUDGEMENT_OF_COMMAND  = 71551, // http://old.wowhead.com/spell=71551
    SPELL_UNDEATH               = 70089, // http://old.wowhead.com/spell=70089
};

// Aca definimos spell para 4 modos es 10normal/10heroic/25normal/25heroic
#define SPELL_SMITE_MODES  RAID_MODE <uint32> (SPELL_SMITE_10,SPELL_SMITE_10_HEROIC,SPELL_SMITE_25,SPELL_SMITE_25_HEROIC);

class mobs_icecrown_citadel : public CreatureScript
{
public:
    mobs_icecrown_citadel() : CreatureScript("mobs_icecrown_citadel") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        switch (creature->GetEntry())
        {
            // Aca añadir los Entry de los trash de la insta con el correspondiente load
            // Ejemplo
            case 37122:// Npc Captain Arnath - http://old.wowhead.com/npc=37122
                return new mob_icecrown_citadel_captain_arnathAI (creature);// aca remplazar el nombre por el nombre del trash
            case 37007:// Npc Deathbound Ward - http://old.wowhead.com/npc=37007
                return new mob_icecrown_citadel_Deathbound_WardAI (creature);
            case 37123:// Npc Captain Brandon - http://old.wowhead.com/npc=37123 
                return new mob_icecrown_citadel_captain_brandonAI (creature);
            default:
                return new mob_icecrown_citadel_captain_brandonAI (creature);
        }
    }

    // ahora empezamos con la estructura
    // los tiempos estan en milisegundos debes ajustarlos.
    struct mob_icecrown_citadel_captain_arnathAI: public mobs_icecrown_citadelAI
    {
        mob_icecrown_citadel_captain_arnathAI(Creature *c) : mobs_icecrown_citadelAI(c) { }

        uint32 Dominate_Mind;
        uint32 Flash_heal;
        uint32 Power_word_shield;
        uint32 Smite;

        void Reset()
        {
            Dominate_Mind       = 5000;
            Flash_heal          = urand(15000,25000);
            Power_word_shield   = urand(30000,20000);
            Smite               = urand (5000,10000);
        }

        void EnterCombat(Unit *who)
        {
            mobs_icecrown_citadelAI::EnterCombat(who);
            DoCast(me,POWER_WORD_SHIELD_ALL);
        }

        void JustDied(Unit* killer)
        {
            mobs_icecrown_citadelAI::JustDied(who);
            DoCast(me,SPELL_UNDEAD_ALL);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim() )
                return;

            if (Dominate_Mind <= diff)
            {
                if (TryDoCast(SPELL_DOMINATE_MIND))
                    Dominate_Mind = 15000;
            }else Dominate_Mind -= diff;

            if (Smite <= diff)
            {
                // marcamos 1 target rando a 40 yardas
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1,40,false))
                    if (TryDoCast(target,(SPELL_SMITE_MODES))
                        Smite = 10000; // tiempo generico para todas dificultades.
            }else Smite -= diff;

            if (Flash_heal <= diff)
            {
                // Aca como la spell Flash heal se utiliza en dos dificultades usamos RAID_MODE que tomara la dificultad de la insta.
                if (TryDoCast(me,RAID_MODE(SPELL_FLASH_HEAL_MODE_10,SPELL_FLASH_HEAL_MODE_25)))
                    Flash_heal = urand(2000,7000);
            }else Flash_heal -= diff;

            if (Power_word_shield <= diff)
            {
                if (TryDoCast(me,RAID_MODE(SPELL_POWER_WORD_SHIELD_10,SPELL_POWER_WORD_SHIELD_25)))
                    Power_word_shield = urand(5000,15000);
            }else Power_word_shield -= diff;

            mobs_icecrown_citadelAIAI::UpdateAI(diff);
        }
    };

    struct mob_icecrown_citadel_Deathbound_WardAI: public mobs_icecrown_citadelAI
    {
        mob_icecrown_citadel_Deathbound_WardAI(Creature *c) : mobs_icecrown_citadelAI(c) { }

        uint32 Disrupting_Shout;
        uint32 Saber_Lash;

        void Reset()
        {
            Disrupting_Shout    = 10000;
            Saber_Lash          =  7000;
        }

        /*void JustDied(Unit* killer)
        {
            mobs_icecrown_citadelAI::JustDied(who);
            // aca falta agregar 	50000 yards (Anywhere)
		}*/

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim() )
                return;

            if (Saber_Lash <= diff)
            {
                if (TryDoCast(SPELL_SABER_LASH_ALL))
                    Saber_Lash = 7000;
            }else Saber_Lash -= diff;

            if (SPELL_DISRUPTING_SHOUT_ALL <= diff)
            {
                // Random al interrumpir spells con Disrupting_Shout
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1,40,false))
                    if (TryDoCast(target,(SPELL_DISRUPTING_SHOUT_ALL))
                        Disrupting_Shout = 10000;
            }else Disrupting_Shout -= diff;

            mobs_icecrown_citadelAI::UpdateAI(diff);
        }
    };

    struct mob_icecrown_citadel_captain_brandonAI: public mobs_icecrown_citadelAI
    {
        mob_icecrown_citadel_captain_brandonAI(Creature *c) : mobs_icecrown_citadelAI(c) { }

        uint32 Crusader_Strike;
        uint32 Hammmer_Betrayal;
        uint32 Judgement_Of_Command;

        void Reset()
        {
            Crusader_Strike = 5000;
            Hammmer_Betrayal = 25000;
            Judgement_Of_Command = 30000;
        }

        void JustDied(Unit* killer)
        {
            mobs_icecrown_citadelAI::JustDied(who);
            DoCast(me,SPELL_UNDEATH);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            // al 50% de vida se tira divine shield
            if (HealthBelowPct(50))
            {
                DoCast(me,SPELL_DIVINE_SHIELD);
            }

            if (Crusader_Strike <= diff)
            {
                if (TryDoCast(me->getVictim(),SPELL_CRUSADER_STRIKE))
                    Crusader_Strike = 15000;
            }else Crusader_Strike -= diff;

            if (Hammmer_Betrayal <= diff)
            {
                // Marcamos 1 target random a 40 yardas
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1,40,false))
                    if (TryDoCast(target,(SPELL_HAMMER_OF_BETRAYAL))
                        Hammmer_Betrayal = 10000; 
            }else Hammmer_Betrayal -= diff;

            if (Judgement_Of_Command <= diff)
            {
                if (TryDoCast(me->getVictim(),SPELL_JUDGEMENT_OF_COMMAND))
                    Judgement_Of_Command = 15000;
            }else Judgement_Of_Command -= diff;   

            mobs_icecrown_citadelAI::UpdateAI(diff);
        }
    };
};

void AddSC_mobs_icecrown_citadel()
{
    new mobs_icecrown_citadel();
}	
	