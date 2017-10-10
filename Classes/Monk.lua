-- Monk.lua
-- October 2016

local addon, ns = ...
local Hekili = _G[ addon ]

local class = ns.class
local state = ns.state

local addHook = ns.addHook

local addAbility = ns.addAbility
local modifyAbility = ns.modifyAbility
local addHandler = ns.addHandler

local addAura = ns.addAura
local modifyAura = ns.modifyAura

local addCastExclusion = ns.addCastExclusion
local addGearSet = ns.addGearSet
local addGlyph = ns.addGlyph
local addMetaFunction = ns.addMetaFunction
local addTalent =  ns.addTalent
local addTrait = ns.addTrait
local addResource = ns.addResource
local addStance = ns.addStance

local addSetting = ns.addSetting
local addToggle = ns.addToggle

local registerCustomVariable = ns.registerCustomVariable
local registerInterrupt = ns.registerInterrupt

local removeResource = ns.removeResource

local setArtifact = ns.setArtifact
local setClass = ns.setClass
local setPotion = ns.setPotion
local setRole = ns.setRole
local setRegenModel = ns.setRegenModel
local setTalentLegendary = ns.setTalentLegendary

local RegisterEvent = ns.RegisterEvent

local retireDefaults = ns.retireDefaults
local storeDefault = ns.storeDefault


local PTR = ns.PTR


if select( 2, UnitClass( 'player' ) ) == 'MONK' then

    local function MonkInit()

        Hekili:Print("Initializing Monk Class Module.")

        setClass( 'MONK' )

        addResource( 'energy', SPELL_POWER_ENERGY )
        addResource( 'chi', SPELL_POWER_CHI, true )

        addTalent( 'ascension', 115396 )
        addTalent( 'black_ox_brew', 115399 )
        addTalent( 'blackout_combo', 196736 )
        addTalent( 'celerity', 115173 )
        addTalent( 'chi_burst', 123986 )
        addTalent( 'chi_orbit', 196743 )
        addTalent( 'chi_torpedo', 115008 )
        addTalent( 'chi_wave', 115098 )
        addTalent( 'dampen_harm', 122278 )
        addTalent( 'elusive_dance', 196738 )
        addTalent( 'energizing_elixir', 115288 )
        addTalent( 'eye_of_the_tiger', 196607 )
        addTalent( 'gift_of_the_mists', 196719 )
        addTalent( 'healing_elixir', 122281 )
        addTalent( 'high_tolerance', 196737 )
        addTalent( 'hit_combo', 196740 )
        addTalent( 'invoke_niuzao', 132578 )
        addTalent( 'invoke_xuen', 123904 )
        addTalent( 'leg_sweep', 119381 )
        addTalent( 'light_brewing', 196721 )
        addTalent( 'mystic_vitality', 237076 )
        addTalent( 'power_strikes', 121817 )
        addTalent( 'ring_of_peace', 116844 )
        addTalent( 'rushing_jade_wind', 116847 )
        addTalent( 'serenity', 152173 )
        addTalent( 'special_delivery', 196730 )
        addTalent( 'summon_black_ox_statue', 115315 )
        addTalent( 'whirling_dragon_punch', 152175 )
        addTalent( 'mystic_vitality', 237076 )


        addTrait( "concordance_of_the_legionfall", 239042 )
        addTrait( "crosswinds", 195650 )
        addTrait( "dark_skies", 195265 )
        addTrait( "death_art", 195266 )
        addTrait( "ferocity_of_the_broken_temple", 241136 )
        addTrait( "fists_of_the_wind", 195291 )
        addTrait( "gale_burst", 195399 )
        addTrait( "good_karma", 195295 )
        addTrait( "healing_winds", 195380 )
        addTrait( "inner_peace", 195243 )
        addTrait( "light_on_your_feet", 195244 )
        addTrait( "master_of_combinations", 238095 )
        addTrait( "power_of_a_thousand_cranes", 195269 )
        addTrait( "rising_winds", 195263 )
        addTrait( "spiritual_focus", 195298 )
        addTrait( "split_personality", 238059 )
        addTrait( "strength_of_xuen", 195267 )
        addTrait( "strike_of_the_windlord", 205320 )
        addTrait( "thunderfist", 238131 )
        addTrait( "tiger_claws", 218607 )
        addTrait( "tornado_kicks", 196082 )
        addTrait( "transfer_the_power", 195300 )
        addTrait( "windborne_blows", 214922 )


        addTrait( "brewstache", 214372 )
        addTrait( "concordance_of_the_legionfall", 239042 )
        addTrait( "dark_side_of_the_moon", 227689 )
        addTrait( "dragonfire_brew", 213183 )
        addTrait( "draught_of_darkness", 238057 )
        addTrait( "endurance_of_the_broken_temple", 241131 )
        addTrait( "exploding_keg", 214326 )
        addTrait( "face_palm", 213116 )
        addTrait( "fortification", 213340 )
        addTrait( "full_keg", 214428 )
        addTrait( "gifted_student", 213136 )
        addTrait( "healthy_appetite", 213133 )
        addTrait( "hot_blooded", 227685 )
        addTrait( "obsidian_fists", 213051 )
        addTrait( "obstinate_determination", 216424 )
        addTrait( "overflow", 213180 )
        addTrait( "potent_kick", 213047 )
        addTrait( "quick_sip", 238129 )
        addTrait( "smashed", 213050 )
        addTrait( "staggering_around", 213055 )
        addTrait( "stave_off", 238093 )
        addTrait( "swift_as_a_coursing_river", 213161 )
        addTrait( "wanderers_hardiness", 214920 )


        -- Buffs/Debuffs
        addAura( 'blackout_combo', 228563, 'duration', 15 )
        addAura( 'bok_proc', 116768, 'duration', 15 )
        addAura( 'breath_of_fire', 115181, 'duration', 8 )
        addAura( 'brewstache', 214373, 'duration', 4.5 )
        addAura( 'chi_torpedo', 115008, 'duration', 10, 'max_stack', 2 )
        addAura( 'dampen_harm', 122278, 'duration', 10 )
        addAura( 'diffuse_magic', 122783, 'duration', 6 )
        addAura( 'elusive_brawler', 195630, 'duration', 10, 'max_stack', 10 )
        addAura( 'eye_of_the_tiger', 196608, 'duration', 8 )
        addAura( 'fists_of_fury', 113656, 'duration', 4 )
        addAura( 'fortification', 213341, 'duration', 21 )
        addAura( 'fortifying_brew', 115203, 'duration', 15 )
        addAura( 'gale_burst', 195399, 'duration', 8 )
        addAura( 'healing_winds', 195380, 'duration', 6 )
        addAura( 'hidden_masters_forbidden_touch', 213112, 'duration', 3 )
        addAura( 'hit_combo', 196741, 'max_stack', 6, 'duration', 10 )
        addAura( 'ironskin_brew', 115308, 'duration', 6 )
        addAura( 'keg_smash', 121253, 'duration', 15 )
        addAura( 'leg_sweep', 119381, 'duration', 5 )
        addAura( 'mark_of_the_crane', 228287, 'duration', 15 )
        addAura( 'master_of_combinations', 238095, 'duration', 6 )
        addAura( 'paralysis', 115078, 'duration', 15 )
        addAura( 'power_strikes', 129914 )
        addAura( 'pressure_point', 247255, 'duration', 5 )
        addAura( 'provoke', 115546, 'duration', 8 )
        addAura( 'ring_of_peace', 116844, 'duration', 8 )
        addAura( 'rising_sun_kick', 107428, 'duration', 10 )
        addAura( 'rushing_jade_wind', 116847, 'duration', 6 )
        addAura( 'serenity', 152173, 'duration', 8 )
        addAura( 'special_delivery', 196734, 'duration', 15 )
        addAura( 'storm_earth_and_fire', 137639, 'duration', 15 )
        addAura( 'strike_of_the_windlord', 205320, 'duration', 6 )
        addAura( 'swift_as_a_coursing_river', 213177, 'duration', 15, 'max_stack', 5 )
        addAura( 'the_emperors_capacitor', 235054, 'duration', 30, 'max_stack', 20 )
        addAura( 'the_wind_blows', 248101, 'duration', 3600 )
        addAura( 'thunderfist', 242387, 'duration', 30, 'max_stack', 99 )        
        addAura( 'tigers_lust', 116841, 'duration', 6 )
        addAura( 'touch_of_death', 115080, 'duration', 8 )
        addAura( 'touch_of_karma', 122470, 'duration', 10 )
        addAura( 'touch_of_karma_debuff', 125174, 'duration', 10 )
        addAura( 'transfer_the_power', 195321, 'duration', 30, 'max_stack', 10 )

        addAura( 'light_stagger', 124275, 'duration', 10, 'unit', 'player' )
        addAura( 'moderate_stagger', 124274, 'duration', 10, 'unit', 'player' )
        addAura( 'heavy_stagger', 124273, 'duration', 10, 'unit', 'player' )

        addHook( 'reset_postcast', function( x )
            for k,v in pairs( state.stagger ) do
                state.stagger[k] = nil
            end
            return x
        end )


        -- Fake Buffs.
        -- None at this time.


        -- Gear Sets
        addGearSet( 'tier19', 138325, 138328, 138331, 138334, 138337, 138367 )
        addGearSet( 'tier20', 147154, 147156, 147152, 147151, 147153, 147155 )
        addGearSet( 'class', 139731, 139732, 139733, 139734, 139735, 139736, 139737, 139738 )
        
        addGearSet( 'fists_of_the_heavens', 128940 )
        setArtifact( 'fists_of_the_heavens' )

        addGearSet( 'fu_zan_the_wanderers_companion', 128938 )
        setArtifact( 'fu_zan_the_wanderers_companion' )

        addGearSet( 'cenedril_reflector_of_hatred', 137019 )
        addGearSet( 'cinidaria_the_symbiote', 133976 )
        addGearSet( 'drinking_horn_cover', 137097 )
        addGearSet( 'firestone_walkers', 137027 )
        addGearSet( 'fundamental_observation', 137063 )
        addGearSet( 'gai_plins_soothing_sash', 137079 )
        addGearSet( 'hidden_masters_forbidden_touch', 137057 )
        addGearSet( 'jewel_of_the_lost_abbey', 137044 )
        addGearSet( 'katsuos_eclipse', 137029 )
        addGearSet( 'march_of_the_legion', 137220 )
        addGearSet( 'prydaz_xavarics_magnum_opus', 132444 )
        addGearSet( 'salsalabims_lost_tunic', 137016 )
        addGearSet( 'sephuzs_secret', 132452 )
        addGearSet( 'the_emperors_capacitor', 144239 )

        addGearSet( 'soul_of_the_grandmaster', 151643 )
        addGearSet( 'stormstouts_last_gasp', 151788 )
        addGearSet( 'the_wind_blows', 151811 )

        setTalentLegendary( 'soul_of_the_grandmaster', 'brewmaster', 'mystic_vitality' )
        setTalentLegendary( 'soul_of_the_grandmaster', 'windwalker', 'chi_orbit' )


        addHook( 'specializationChanged', function ()
            setPotion( 'prolonged_power' )
            setRole( state.spec.brewmaster and 'tank' or 'attack' )
        end )


        addHook( 'reset_precast', function ()
            if state.spec.windwalker and state.talent.hit_combo.enabled and state.prev_gcd.tiger_palm and state.chi.current == 0 then
                -- We won't proc Hit Combo from Tiger Palm, but we don't have anything else to hit.
                state.prev.last = 'none'
                state.prev_gcd.last = 'none'
            end
            rawset( state.healing_sphere, 'count', nil )
            state.stagger.amount = nil
            state.spinning_crane_kick.count = nil
            state.healing_sphere.count = nil
        end )


        addHook( 'spend', function( amt, resource )
            if state.equipped.drinking_horn_cover and resource == 'chi' and state.buff.storm_earth_and_fire.up then
                state.buff.storm_earth_and_fire.expires = state.buff.storm_earth_and_fire.expires + 1
            end

            if state.equipped.the_emperors_capacitor and resource == 'chi' then
                state.addStack( 'the_emperors_capacitor', 30, 1 )
            end
        end )


        state.spinning_crane_kick = setmetatable( {}, {
            __index = function( t, k, v )
                if k == 'count' then
                    t[ k ] = max( GetSpellCount( state.action.spinning_crane_kick.id ), state.active_dot.mark_of_the_crane )
                    return t[ k ]
                end
            end } )

        state.healing_sphere = setmetatable( {}, {
            __index = function( t, k, v )
                if k == 'count' then
                    t[ k ] = GetSpellCount( state.action.expel_harm.id )
                    return t[ k ]
                end
            end } )


        local staggered_damage = {}
        local total_staggered = 0

        local myGUID = UnitGUID( 'player' )

        RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED", function( event, _, subtype, _, sourceGUID, sourceName, _, _, destGUID, destName, destFlags, _, arg1, _, _, _, arg5, _, _, arg8, _, _, arg11 )

            if state.spec.brewmaster and destGUID == myGUID and subtype == 'SPELL_ABSORBED' then

                local now = GetTime()

                if arg1 == myGUID and arg5 == 115069 then -- This was melee damage that was absorbed.

                    table.insert( staggered_damage, 1, {
                        t = now,
                        d = arg8,
                        s = 6603 -- auto attack
                    } )
                    total_staggered = total_staggered + arg8

                elseif arg8 == 115069 then

                    table.insert( staggered_damage, 1, {
                        t = now,
                        d = arg11,
                        s = arg1
                    } )
                    total_staggered = total_staggered + arg11

                end
            end

        end )

        local function stagger_in_last( t )

            local now = GetTime()

            for i = #staggered_damage, 1, -1 do
                if staggered_damage[i].t + 10 < now then
                    total_staggered = max( 0, total_staggered - staggered_damage[i].d )
                    table.remove( staggered_damage, i )
                else
                    break
                end
            end

            t = min( 10, t )

            if t == 10 then return total_staggered end

            local sum = 0

            for i = 1, #staggered_damage do
                if staggered_damage[i].t > now + t then
                    break
                end
                sum = sum + staggered_damage[i]
            end

            return sum

        end

        local function avg_stagger_ps_in_last( t )

            t = max( 1, min( 10, t ) )

            return stagger_in_last( t ) / t

        end

        local bt = BrewmasterTools

        state.stagger = setmetatable( {}, {
            __index = function( t, k, v )
                local stagger = state.debuff.heavy_stagger.up and state.debuff.heavy_stagger or nil
                stagger = stagger or ( state.debuff.moderate_stagger.up and state.debuff.moderate_stagger ) or nil
                stagger = stagger or ( state.debuff.light_stagger.up and state.debuff.light_stagger ) or nil

                if not stagger then
                    if k == 'up' then return false
                    elseif k == 'down' then return true
                    else return 0 end
                end

                if k == 'tick' then
                    if bt then
                        return state.stagger.amount / 20
                    end
                    return state.stagger.amount / state.stagger.ticks_remain

                elseif k == 'ticks_remain' then
                    return math.floor( stagger.remains / 0.5 )

                elseif k == 'amount' then
                    if bt then
                        t.amount = bt.GetNormalStagger()
                    else
                        t.amount = UnitStagger( 'player' )
                    end
                    return t.amount

                elseif k == 'incoming_per_second' then
                    return avg_stagger_ps_in_last( 10 )

                elseif k == 'time_to_death' then
                    return math.ceil( state.health.current / ( state.stagger.tick * 2 ) )

                elseif k == 'percent_max_hp' then
                    return ( 100 * state.stagger.amount / state.health.max )

                elseif k == 'percent_remains' then
                    return total_staggered > 0 and ( 100 * state.stagger.amount / stagger_in_last( 10 ) ) or 0

                elseif k == 'total' then
                    return total_staggered

                elseif k == 'dump' then
                    DevTools_Dump( staggered_damage )

                end

                return nil

            end } )


        addToggle( 'strike_of_the_windlord', true, 'Artifact Ability',
            'Set a keybinding to toggle your artifact ability on/off in your priority lists.' )

        addSetting( 'strike_cooldown', true, {
            name = "Artifact Ability: Cooldown Override",
            type = "toggle",
            desc = "If |cFF00FF00true|r, when your Cooldown toggle is |cFF00FF00ON|r then the toggle for your artifact ability will be overridden and your artifact ability will be shown regardless of its toggle above.",
            width = "full"
        } )

        addToggle( 'use_defensives', true, "Brewmaster: Use Defensives",
            "Set a keybinding to toggle your defensive abilities on/off in your priority lists." )

        addSetting( 'elixir_energy', 20, {
            name = "Windwalker: Energizing Elixir Energy Deficit",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of |cFFFF0000missing|r energy that must be missing before Energizing Elixir will be used.  The default is |cFFFFD10020|r.  If set to zero, Energizing Elixir " ..
                "can be used regardless of how much energy you have.",
            width = "full"
        } )


        addSetting( 'purify_light', 60, {
            name = "Brewmaster: Light Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Light.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_moderate', 60, {
            name = "Brewmaster: Moderate Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Moderate.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_heavy', 40, {
            name = "Brewmaster: Heavy Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Heavy.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'purify_extreme', 20, {
            name = "Brewmaster: Extreme Stagger Purify Threshold",
            type = "range",
            min = 0,
            max = 100,
            step = 1,
            desc = "Specify the amount of damage, as a percentage of damage Staggered in the previous 10 seconds, that must be Staggered before Purifying Brew can be recommended by the addon.  " ..
                "This setting applies when your current level of Stagger is Heavy and you have Staggered more than twice your maximum health in the past 10 seconds.\n\n" ..
                "If set to 0, Purifying Brew can be recommended regardless of your Stagger damage, based solely on the criteria of your action lists.\r\n\r\n" ..
                "Remember, tanking is complex and you may want to use your defensive abilities proactively to manage mechanics that the addon cannot see.",
            width = "full"
        } )

        addSetting( 'tp_energy', 65, {
            name = "Brewmaster: Tiger Palm Energy",
            type = "range",
            min = 25,
            max = 100,
            step = 1,
            desc = "Use this setting to specify the minimum Energy required before Tiger Palm is recommended.\r\n\r\n" ..
                "Using this setting, rather than adding an |cFFFFD100energy.current>=X|r condition is recommended, as this will allow the addon's engine to predict how long before Tiger Palm is ready with X energy.\r\n\r\n" ..
                "This setting applies only to Brewmaster Monks.",
            width = "full",
        } )


        -- Using these to abstract the 'Strike of the Windlord' options so the same keybinds/toggles work in Brewmaster spec.
        addMetaFunction( 'toggle', 'artifact_ability', function()
            return state.toggle.strike_of_the_windlord
        end )

        addMetaFunction( 'settings', 'artifact_cooldown', function()
            return state.settings.strike_cooldown
        end )

        addMetaFunction( 'state', 'gcd', function()
            return 1.0
        end )

        addMetaFunction( 'state', 'use_defensives', function()
            if not state.spec.brewmaster then return false end
            return state.toggle.use_defensives
        end )

        addMetaFunction( 'state', 'ee_maximum', function()
            return state.energy.max * ( 100 - state.settings.elixir_energy ) / 100
        end )


        -- Abilities.
        addAbility( 'black_ox_brew', {
            id = 115399,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function() return spec.brewmaster and talent.black_ox_brew.enabled end,
        } )

        addHandler( 'black_ox_brew', function ()
            gain( energy.max, 'energy' )
            gainCharges( 'ironskin_brew', class.abilities.ironskin_brew.charges )
            gainCharges( 'purifying_brew', class.abilities.purifying_brew.charges )
        end )

        addAbility( 'blackout_kick', {
            id = 100784,
            spend = 1,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'blackout_kick', 'spend', function( x )
            if buff.serenity.up then return 0
            elseif buff.bok_proc.up then return 0 end
            return x
        end )

        addHandler( 'blackout_kick', function ()
            if buff.bok_proc.up and buff.serenity.down then
                removeBuff( 'bok_proc' )
            end

            applyDebuff( 'target', 'mark_of_the_crane', 15 )
            
            if talent.dizzying_kicks.enbled then
                applyDebuff( 'target', 'dizzying_kicks', 3 )
            end

            if talent.hit_combo.enabled then
                if prev_gcd.blackout_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'blackout_strike', {
            id = 205523,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = '3',
            known = function () return spec.brewmaster end
        } )

        modifyAbility( 'blackout_strike', 'cooldown', function( x )
            return x * haste
        end )

        addHandler( 'blackout_strike', function ()
            if talent.blackout_combo.enabled then
                applyBuff( 'blackout_combo', 15 )
                addStack( 'elusive_brawler', 10, 1 )
            end
        end )


        addAbility( 'breath_of_fire', {
            id = 115181,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 15,
            cycle = 'breath_of_fire'
        } )

        modifyAbility( 'breath_of_fire', 'cooldown', function( x )
            if buff.blackout_combo.up then
                return x - 3
            end
            return x
        end )

        addHandler( 'breath_of_fire', function ()
            if debuff.keg_smash.up then applyDebuff( 'target', 'breath_of_fire', 8 ) end
            if equipped.firestone_walkers then setCooldown( 'fortifying_brew', max( 0, cooldown.fortifying_brew.remains - ( min( 6, active_enemies * 2 ) ) ) ) end
            addStack( 'elusive_brawler', 10, active_enemies )
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'chi_burst', {
            id = 123986,
            spend = 0,
            spend_type = 'energy',
            cast = 1,
            gcdType = 'spell',
            cooldown = 30,
            known = function () return talent.chi_burst.enabled end
        } )

        modifyAbility( 'chi_burst', 'cast', function( x )
            return x * haste
        end )

        addHandler( 'chi_burst', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.chi_burst then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )

        addCastExclusion( 123986 )


        addAbility( 'chi_wave', {
            id = 115098,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 15,
            known = function () return talent.chi_wave.enabled end
        } )

        addHandler( 'chi_wave', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.chi_wave then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )

        addCastExclusion( 115098 )


        addAbility( 'crackling_jade_lightning', {
            id = 117952,
            spend = 20,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 0,
            channeled = true,
            break_channel = true,
        } )

        addHandler( 'crackling_jade_lightning', function ()
            removeBuff( 'the_emperors_capacitor' )
            if talent.hit_combo.enabled then
                if prev_gcd.crackling_jade_lightning then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'dampen_harm', {
            id = 122278,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 120,
            known = function () return talent.dampen_harm.enabled end
        } )

        addHandler( 'dampen_harm', function ()
            applyBuff( 'dampen_harm', 10 )
        end )

        
        addAbility( 'diffuse_magic', {
            id = 122783,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function () return spec.windwalker or talent.diffuse_magic.enabled end,
        } )

        addHandler( 'diffuse_magic', function ()
            applyBuff( 'diffuse_magic', 6 )
        end )


        addAbility( 'effuse', {
            id = 116694,
            spend = 30,
            spend_type = 'energy',
            cast = 1.5,
            gcdType = 'spell',
            cooldown = 0,
            velocity = 60
        } )


        addAbility( 'energizing_elixir', {
            id = 115288,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 60,
            known = function () return talent.energizing_elixir.enabled end,
            usable = function () return energy.current < ee_maximum end,
        } )

        addHandler( 'energizing_elixir', function ()
            gain( energy.max, 'energy' )
            gain( chi.max, 'chi' )
        end )

        addCastExclusion( 'energizing_elixir' )


        addAbility( 'expel_harm', {
            id = 115072,
            spend = 15,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 0,
            usable = function () return healing_sphere.count > 0 end
        } )

        addHandler( 'expel_harm', function ()
            if spec.brewmaster and set_bonus.tier20_4pc == 1 then stagger.amount = stagger.amount * ( 1 - ( 0.05 * healing_sphere.count ) ) end
            healing_sphere.count = 0
        end )


        addAbility( 'exploding_keg', {
            id = 214326,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 75,
            known = function () return equipped.fu_zan_the_wanderers_companion and ( toggle.artifact_ability or ( toggle.cooldowns and settings.artifact_cooldown ) ) end,
        } )


        addAbility( 'fists_of_fury', {
            id = 113656,
            spend = 3,
            spend_type = 'chi',
            cast = 4,
            channeled = true,
            gcdType = 'spell',
            cooldown = 24,
        } )

        modifyAbility( 'fists_of_fury', 'cast', function( x )
            return x * haste
        end )

        modifyAbility( 'fists_of_fury', 'spend', function( x )
            if buff.serenity.up then return 0
            elseif equipped.katsuos_eclipse then return max( 0, x - 1 ) end
            return x
        end )

        modifyAbility( 'fists_of_fury', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end

            if set_bonus.tier20_4pc == 1 then applyBuff( 'pressure_point', 5 + action.fists_of_fury.cast ) end
            return x * haste
        end )

        -- By having the ability's handler set the global cooldown to 4 seconds (reduced by haste),
        -- the addon's next prediction will wait until the global cooldown ends.
        -- We should watch this for unintended consequences.
        addHandler( 'fists_of_fury', function ()
            -- applyBuff( 'fists_of_fury', 4 * haste ) -- now set as channeled, watch this.
            if talent.hit_combo.enabled then
                if prev_gcd.fists_of_fury then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
            -- NYI: T20 buff after Fists of Fury to increase RSK crit.
        end )


        addAbility( 'fortifying_brew', {
            id = 115203,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 420,
        } )

        addHandler( 'fortifying_brew', function ()
            applyBuff( 'fortifying_brew', 15 )
            if artifact.fortification.enabled then applyBuff( 'fortification', 21 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            health.max = health.max * 1.2
            health.actual = health.actual * 1.2
        end )


        addAbility( 'healing_elixir', {
            id = 122281,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 30,
            charges = 2,
            recharge = 30,
            talent = 'healing_elixir'
        } )

        addHandler( 'healing_elixir', function ()
            gain( 0.15 * health.max, 'health' )
        end )


        addAbility( 'ironskin_brew', {
            id = 115308,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 21,
            charges = 3,
            recharge = 21,
        } )

        modifyAbility( 'ironskin_brew', 'cooldown', function( x )
            return x * haste
        end )

        modifyAbility( 'ironskin_brew', 'recharge', function( x )
            return x * haste
        end )

        modifyAbility( 'ironskin_brew', 'charges', function( x )
            return x + ( talent.light_brewing.enabled and 1 or 0 )
        end )

        addHandler( 'ironskin_brew', function ()
            applyBuff( 'ironskin_brew', buff.ironskin_brew.remains + 6 + ( artifact.potent_kick.rank * 0.5 ) )
            spendCharges( 'purifying_brew', 1 )
            
            if set_bonus.tier20_2pc == 1 then healing_sphere.count = healing_sphere.count + 1 end

            if artifact.quick_sip.enabled then
                stagger.amount = stagger.amount * 0.95
                stagger.tick = stagger.tick * 0.95
            end
            if artifact.brewstache.enabled then applyBuff( 'brewstache', 4.5 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'invoke_xuen', {
            id = 123904,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 180,
            known = function() return talent.invoke_xuen.enabled end,
            toggle = 'cooldowns'
        } )
        class.abilities.invoke_xuen_the_white_tiger = class.abilities.invoke_xuen

        addHandler( 'invoke_xuen', function ()
            summonPet( 'xuen', 45 )
        end )


        addAbility( 'keg_smash', {
            id = 121253,
            spend = 40,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 8,
            charges = 1,
            recharge = 8,
            cycle = 'keg_smash',
            velocity = 30
        } )

        modifyAbility( 'keg_smash', 'cooldown', function( x )
            return x * haste
        end )

        modifyAbility( 'keg_smash', 'charges', function( x )
            if equipped.stormstouts_last_gasp then
                return x + 1
            end
            return x
        end )

        addHandler( 'keg_smash', function ()
            applyDebuff( 'target', 'keg_smash', 15 )
            active_dot.keg_smash = min( active_enemies, active_dot.keg_smash + 7 )
            gainChargeTime( 'ironskin_brew', 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            gainChargeTime( 'purifying_brew', 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            cooldown.fortifying_brew.expires = max( state.time, cooldown.fortifying_brew.expires - 4 + ( buff.blackout_combo.up and 2 or 0 ) )
            if equipped.salsalabims_lost_tunic then setCooldown( 'breath_of_fire', 0 ) end
            removeBuff( 'blackout_combo' )
        end )


        addAbility( 'leg_sweep', {
            id = 119381,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 45,
            known = function () return talent.leg_sweep.enabled end,
        } )

        addHandler( 'leg_sweep', function ()
            applyDebuff( 'target', 'leg_sweep', 5 )
            active_dot.leg_sweep = min( active_enemies )
            interrupt()
        end )


        addAbility( 'paralysis', {
            id = 115078,
            spend = 20,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 15,
        } )

        addHandler( 'paralysis', function ()
            applyDebuff( 'target', 'paralysis', 60 )
        end )


        addAbility( 'provoke', {
            id = 115546,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 8,
        } )

        addHandler( 'provoke', function ()
            applyDebuff( 'target', 'provoke', 8 )
        end )


        addAbility( 'purifying_brew', {
            id = 119582,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 21,
            charges = 3,
            recharge = 21,
            usable = function ()
                if stagger.percent_max_hp > 30 and stagger.percent_max_hp <= 60 and stagger.percent_remains > settings.purify_light then return true -- Light
                elseif stagger.percent_max_hp > 60 and stagger.percent_max_hp <= 100 and stagger.percent_remains > settings.purify_moderate then return true -- Moderate
                elseif stagger.percent_max_hp > 100 and stagger.percent_max_hp <= 200 and stagger.percent_remains > settings.purify_heavy then return true -- Heavy
                elseif stagger.percent_max_hp > 200 and stagger.percent_remains > settings.purify_extreme then return true end -- Extreme
                return false
            end
        } )

        modifyAbility( 'purifying_brew', 'cooldown', function( x )
            return x * haste
        end )

        modifyAbility( 'purifying_brew', 'recharge', function( x )
            return x * haste
        end )

        modifyAbility( 'purifying_brew', 'charges', function( x )
            return x + ( talent.light_brewing.enabled and 1 or 0 )
        end )

        addHandler( 'purifying_brew', function ()
            spendCharges( 'ironskin_brew', 1 )
            if set_bonus.tier20_2pc == 1 then healing_sphere.count = healing_sphere.count + 1 end

            if buff.blackout_combo.up then
                addStack( 'elusive_brawler', 10, 1 )
                removeBuff( 'blackout_combo' )
            end
            if artifact.brewstache.enabled then applyBuff( 'brewstache', 4.5 ) end
            if artifact.swift_as_a_coursing_river.enabled then addStack( 'swift_as_a_coursing_river', 15, 1 ) end
            if artifact.quick_sip.enabled then
                applyBuff( 'ironskin_brew', buff.ironskin_brew.remains + 1 )
            end

            local reduction = 0.4
            reduction = reduction + ( artifact.staggering_around.rank / 100 )
            reduction = reduction * ( talent.elusive_dance.enabled and 1.2 or 1 )

            stagger.amount = stagger.amount * ( 1 - reduction )
            stagger.tick = stagger.tick * ( 1 - reduction )
            if equipped.gai_plins_soothing_sash then gain( stagger.amount * 0.25, 'health' ) end -- LegionFix: Purify doesn't always purify 50% stagger, resolve this later.
        end )


        addAbility( 'ring_of_peace', {
            id = 116844,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 45,
            known = function () return talent.ring_of_peace.enabled end,
        } )


        addAbility( 'rising_sun_kick', {
            id = 107428,
            spend = 2,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 10,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'rising_sun_kick', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x * haste
        end )

        modifyAbility( 'rising_sun_kick', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'rising_sun_kick', function ()
            applyDebuff( 'target', 'mark_of_the_crane', 15 )
            removeBuff( 'pressure_point' )

            if talent.hit_combo.enabled then
                if prev_gcd.rising_sun_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'roll', {
            id = 109132,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 20,
            charges = 2,
            recharge = 20,
            known = function () return not talent.chi_torpedo.enabled end
        } )

        modifyAbility( 'roll', 'charges', function( x )
            return x + ( talent.celerity.enabled and 1 or 0 )
        end )

        modifyAbility( 'roll', 'cooldown', function( x )
            return x - ( talent.celerity.enabled and 5 or 0 )
        end )

        modifyAbility( 'roll', 'recharge', function( x )
            return x - ( talent.celerity.enabled and 5 or 0 )
        end )


        addAbility( 'rushing_jade_wind', {
            id = 116847,
            spend = 1,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'spell',
            cooldown = 6,
            talent = 'rushing_jade_wind',
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'rushing_jade_wind', 'cooldown', function( x )
            if buff.serenity.up then
                x = max( 0, x - ( buff.serenity.remains / 2 ) )
            end
            return x * haste
        end )

        modifyAbility( 'rushing_jade_wind', 'spend', function( x )
            if buff.serenity.up or spec.brewmaster then return 0 end
            return x
        end )

        addHandler( 'rushing_jade_wind', function ()
            if spec.brewmaster then
                applyBuff( 'rushing_jade_wind', 6 * 1.5 * haste )
            elseif spec.windwalker then
                applyBuff( 'rushing_jade_wind', 6 * haste )
                active_dot.mark_of_the_crane = min( active_enemies, active_dot.mark_of_the_crane + 2 )
                applyDebuff( 'target', 'mark_of_the_crane', 15 )
            end

            if talent.hit_combo.enabled then
                if prev_gcd.rushing_jade_wind then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'serenity', {
            id = 152173,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            known = function () return talent.serenity.enabled end,
            toggle = 'cooldowns'
        } )

        local sp_cdr = { 5, 10, 15, 20, 24, 28, 31, 34 }

        modifyAbility( 'serenity', 'cooldown', function( x )
            if artifact.split_personality.enabled then
                return x - sp_cdr[ artifact.split_personality.rank ]
            end

            return x
        end )

        addHandler( 'serenity', function ()
            applyBuff( 'serenity', 8 )
            setCooldown( 'strike_of_the_windlord', cooldown.strike_of_the_windlord.remains - ( max( 8, cooldown.strike_of_the_windlord.remains / 2 ) ) )
            setCooldown( 'fists_of_fury', cooldown.fists_of_fury.remains - ( max( 8, cooldown.fists_of_fury.remains / 2 ) ) )
            setCooldown( 'rising_sun_kick', cooldown.rising_sun_kick.remains - ( max( 8, cooldown.rising_sun_kick.remains / 2 ) ) )
            setCooldown( 'rushing_jade_wind', cooldown.rushing_jade_wind.remains - ( max( 8, cooldown.rushing_jade_wind.remains / 2 ) ) )            
        end )

        addCastExclusion( 'serenity' )


        addAbility( 'spear_hand_strike', {
            id = 116705,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 15,
            usable = function () return target.casting end,
            toggle = 'interrupts'
        } )

        addHandler( 'spear_hand_strike', function ()
            interrupt()
        end )

        registerInterrupt( 'spear_hand_strike' )


        addAbility( 'spinning_crane_kick', {
            id = 101546,
            spend = 3,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
        } )

        modifyAbility( 'spinning_crane_kick', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'spinning_crane_kick', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.spinning_crane_kick then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'storm_earth_and_fire', {
            id = 137639,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
            charges = 2,
            recharge = 90,
            known = function () return not talent.serenity.enabled end,
            usable = function () return not buff.storm_earth_and_fire.up end,
            toggle = 'cooldowns'
        } )

        modifyAbility( 'storm_earth_and_fire', 'cooldown', function( x )
            if artifact.split_personality.enabled then
                return x - sp_cdr[ artifact.split_personality.rank ]
            end

            return x
        end )

        modifyAbility( 'storm_earth_and_fire', 'recharge', function( x )
            if artifact.split_personality.enabled then
                return x - sp_cdr[ artifact.split_personality.rank ]
            end

            return x
        end )

        addHandler( 'storm_earth_and_fire', function ()
            applyBuff( 'storm_earth_and_fire', 15 )
        end )

        addCastExclusion( 'storm_earth_and_fire' )


        addAbility( 'strike_of_the_windlord', {
            id = 205320,
            spend = 2,
            spend_type = 'chi',
            cast = 0,
            gcdType = 'melee',
            cooldown = 40,
            known = function () return equipped.fists_of_the_heavens and ( toggle.strike_of_the_windlord or ( toggle.cooldowns and settings.strike_cooldown ) ) end,
        } )

        modifyAbility( 'strike_of_the_windlord', 'cooldown', function( x )
            x = equipped.the_wind_blows and ( x * 0.8 ) or x
            x = buff.serenity.up and max( 0, x - ( buff.serenity.remains / 2 ) ) or x
            return x
        end )

        modifyAbility( 'strike_of_the_windlord', 'spend', function( x )
            if buff.serenity.up then return 0 end
            return x
        end )

        addHandler( 'strike_of_the_windlord', function ()
            applyDebuff( 'target', 'strike_of_the_windlord', 6 )
            active_dot.strike_of_the_windlord = active_enemies
            if artifact.thunderfist.enabled then
                applyBuff( 'thunderfist', 30, active_enemies )
            end
            if equipped.the_wind_blows then
                applyBuff( 'the_wind_blows', 3600 )
            end
            if talent.hit_combo.enabled then
                if prev_gcd.strike_of_the_windlord then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'summon_black_ox_statue', {
            id = 115315,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 10,
            known = function () return talent.summon_black_ox_statue.enabled end,
        } )

        addHandler( 'summon_black_ox_statue', function ()
            summonTotem( 'black_ox_statue', 'statue', 900 )
        end )


        addAbility( 'tiger_palm', {
            id = 100780,
            spend = 50,
            spend_type = 'energy',
            ready = 50,
            cast = 0,
            gcdType = 'melee',
            cooldown = 0,
            cycle = 'mark_of_the_crane'
        } )

        modifyAbility( 'tiger_palm', 'ready', function( x )
            if spec.brewmaster then return settings.tp_energy end
            return 50
        end )

        modifyAbility( 'tiger_palm', 'spend', function( x )
            if spec.brewmaster then return 25 end
            return x
        end )

        addHandler( 'tiger_palm', function ()
            if talent.eye_of_the_tiger.enabled then
                applyDebuff( 'target', 'eye_of_the_tiger', 8 )
                applyBuff( 'eye_of_the_tiger', 8 )
            end

            if spec.windwalker then
                applyDebuff( 'target', 'mark_of_the_crane', 15 )

                if talent.hit_combo.enabled then
                    if prev_gcd.tiger_palm then removeBuff( 'hit_combo' )
                    else addStack( 'hit_combo', 10, 1 ) end
                end

                gain( buff.power_strikes.up and 3 or 2, 'chi' )
            end

            if spec.brewmaster then
                gainChargeTime( 'ironskin_brew', 1 )
                gainChargeTime( 'purifying_brew', 1 )
                cooldown.fortifying_brew.expires = max( state.time, cooldown.fortifying_brew.expires - 1 )
                removeBuff( 'blackout_combo' )
            end

        end )


        addAbility( 'tigers_lust', {
            id = 116841,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 30,
            talent = 'tigers_lust'
        } )

        addHandler( 'tigers_lust', function ()
            applyBuff( 'tigers_lust', 6 )
        end )


        addAbility( 'touch_of_death', {
            id = 115080,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'spell',
            cooldown = 120,
            toggle = 'cooldowns',
            cycle = 'touch_of_death'
        } )

        modifyAbility( 'touch_of_death', 'cooldown', function( x )
            if equipped.hidden_masters_forbidden_touch and cooldown.touch_of_death.remains == 0 and buff.hidden_masters_forbidden_touch.down then
                return 0
            end
            return x
        end )

        addHandler( 'touch_of_death', function ()

            if equipped.hidden_masters_forbidden_touch and buff.hidden_masters_forbidden_touch.down then
                applyBuff( 'hidden_masters_forbidden_touch', 5 )
            end
            if talent.hit_combo.enabled then
                if prev_gcd.touch_of_death then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
            applyDebuff( 'target', 'touch_of_death', 8 )
        end )


        addAbility( 'touch_of_karma', {
            id = 122470,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'off',
            cooldown = 90,
        } )

        addHandler( 'touch_of_karma', function ()
            applyBuff( 'touch_of_karma', 10 )
            applyDebuff( 'target', 'touch_of_karma', 10 )
        end )


        addAbility( 'whirling_dragon_punch', {
            id = 152175,
            spend = 0,
            spend_type = 'energy',
            cast = 0,
            gcdType = 'melee',
            cooldown = 24,
            known = function () return talent.whirling_dragon_punch.enabled end,
            usable = function () return cooldown.fists_of_fury.remains > 0 and cooldown.rising_sun_kick.remains > 0 end
        } )

        addHandler( 'whirling_dragon_punch', function ()
            if talent.hit_combo.enabled then
                if prev_gcd.whirling_dragon_punch then removeBuff( 'hit_combo' )
                else addStack( 'hit_combo', 10, 1 ) end
            end
        end )


        addAbility( 'zen_meditation', {
            id = 115176,
            spend = 0,
            spend_type = 'energy',
            cast = 8,
            gcdType = 'spell',
            channeled = true,
            cooldown = 300
        } )


        addAbility( 'effuse', {
            id = 116694,
            spend = 30,
            spend_type = 'energy',
            cast = 1.5,
            gcdType = 'spell',
            cooldown = 0,
        } )

        modifyAbility( 'effuse', 'cast', function( x )
            return x * haste
        end )

        addCastExclusion( 'effuse' )

    end


    storeDefault( [[Brewmaster: Default]], 'actionLists', 20170723.103044, [[dWtrgaGEisAtKq7IuTnj0(iPYSHA(qKAzuOFd6BsQomv7Ku2RQDl1(fYpHegMKmosQ68qsdfIGbludNahurDkiI6yu0PbwibTuiyXkSCIEievpf1JfSojWeHenvs0KvY0fDrk4ZqQlJCDjQNtPBRuBMKY2jbpts51sKPbrX8KGYiHiY3jjJwcY4HiXjHq)LqxtcQUNI0IuehcIsJcIqFZR8SH2hyADHNrjPMxgNx4zwafaogGu9ea7RzSO6pJaHj3sxZyLz9kKPYOUzTk1BEMdsGG8855qcGT9kVM5vE2q7dmTUWZCqceKNtiA0ysh0jjLLfK2ZZdagKOE2kGCPyH8EjAtjOeDgXEbcEcLNBytNrGWKBPRzSYSOzD9QAN18nDMfqUmkgj59kkMtjOe98AgVYZgAFGP1fEMdsGG8CcrJgt6bieVGQABuSIrXiXO4rz1utFGHWfUSn1llikgPr6O40LOPupbBsmHIlavytlwffJKpplrBp3(MMcXlrvU888aGbjQNfataSpJyVabpHYZnSPZiqyYT01mwzw0SUEvTZA(MoJeGja2pVwTR8SH2hyA9XzoibcYZP3LanAfdqiEbv16ajSTLaT4qsQ0dfYLOj70aeIxqvToqcBBjqloKKk9qHCjAYkUDKIIGoa3GgT4Y3oAsSMvDvNNhamir9mqcBBjqloKKQZi2lqWtO8CdB6mceMClDnJvMfnRRxv7SMVPZikHTTeOJIfkjvpVgYCLNn0(atRpoZbjqqEUSLexKAuBbkq2ZZs02ZTVPPtekjvB3MKSGOyusQrTfOazNCEEaWGe1ZbhJf9qcGTigyZZi2lqWtO8CdB6mceMClDnJvMfnRRxv7SMVPZOKuJAlqbY(8Af(vE2q7dmTUWZCqceKNr20XuN6dShkblNIb4Ea1P2hyAPOhsGcKi10gqw1zEEwI2EU9nnDIqjPA72KKfefZP3lxUIINrHHjNNhamir9CWXyrpKaylIb28mI9ce8ekp3WMoJaHj3sxZyLzrZ66v1oR5B6mNEVC5kkEgfgEETIx5zdTpW06cpZbjqqEoDm1P(a7HsWYPyaUhqDQ9bMwk6HeOajsnTbKvDMNNLOTNBFttNiusQ2UnjzbrXihUhWO4zuyyY55badsuphCmw0dja2IyGnpJyVabpHYZnSPZiqyYT01mwzw0SUEvTZA(MoJC4EaJINrHHNxR(vE2q7dmTUWZCqceKNr20XuN6dShkblNIb4Ea1P2hyAPOhsGcKi10gq2PMNNLOTNBFttNiusQ2UnjzbrXC69YLROyw5KZZdagKOEo4ySOhsaSfXaBEgXEbcEcLNBytNrGWKBPRzSYSOzD9QAN18nDMtVxUCffZkFEn1FLNn0(atRl8mhKab550XuN6dShkblNIb4Ea1P2hyAPOhsGcKi10gq2PMNNLOTNBFttNiusQ2UnjzbrXihUhWOyw5KZiqyYT01mwzw0SUEvTZi2lqWtO8CdB6SMVPZihUhWOyw555badsuphCmw0dja2IyGnF(8SMVPZcLKQTBtswqumkj18Y485p]] )

    storeDefault( [[Brewmaster: Defensives]], 'actionLists', 20170723.103044, [[dOtweaGEbO2KqvTlL8Asf7ta1SP0ZrYTvkhwXoLI9cTBv2pfgLsvnmvX4eiwMqzOcGgmfnCv1bjeNsPkhtkDEcwiOAPeQfJOLl5HcapLQht06ivktuG0ujvnzqMojxuvQtl6YOUUqwLa1ZafBwqBNuP63atta5Zi8DPAKcq(lsnAsz8kvojO0TeQY1ivs3tOYpjvITri9nvjJTOE0FFdPLHq4O3mBm6WlUVnukU0ndZGYH8rL6otHUlR8Rqh9GYHtKvHWrxmB5HIXMypTVEc0tSvlmpbPfDX8ajOp3y033Wucawiq)w)OkdfYJGMS4(sQnfbtrVn7mmJNHPeaSqG(T(rvgkKhbnzX9LuBkcMIoSgPkb3ynm3ZWmydtjayHa9B9JQmuipcAYI7RILAtrWOlIuLGJc1JnTOE0FFdPLHq4O3mBm6WTJuhdtDzNHj8I7OlMT8qXytSNwrBFTEGbDypOuokqH(bogDxw5xHUeaSqG(T(rvgkKhbnzX9LuBkcMkUh0fHmTPsaDs7i1HgSJMS4oQWMyOE0FFdPLHq4OlMT8qXytSNwrBFTEGbDxw5xHo6Dn(eZdKa6tKcGUiKPnvcO)JQmuipcAYI7Od7bLYrbk0pWXOhaZxLGdD0BMng9amQYqH8immHxChvydmOE0FFdPLHq4O7Yk)k0LaGfc0V1pQYqH8iOjlUVKAtrWuXjbaleOFRFuLHc5rqtwCFj1MIGPO3MDOlczAtLa6zbokDYJMS4o6WEqPCuGc9dCm6USYVsVWNrxLBm6nZgJoSf4O0jpdt4f3rxmB5HIXMypTI2(A9ad6I5bsqFUXOVVHPeaSqG(T(rvgkKhbnzX9LuBkcMIEB2zygpdtjayHa9B9JQmuipcAYI7lP2uemfDynsvcUXAyUNHzWgMsaWcb636hvzOqEe0Kf3xfl1MIGrVRXNyEGeqNsw5xHkSjqOE0FFdPLHq4O3mBm6V39zRHzan1g6Izlpum2e7Pv02xRhyqxeY0Mkb05DF2sRn1g6WEqPCuGc9dCm6USYVcDnES5rqt914Ixsq0PcCCTXFFnESkTfehMYuf44OuJAnk1i1H(d6Cf8RLUgSgp28iOP(ACXlji6u7HExJpX8ajG(ePaOcvO7FwMJnd4rLGdBIjAqqfIa]] )

    storeDefault( [[Brewmaster: Combo ST]], 'actionLists', 20170723.103044, [[dOZTdaGAcPA9Oi6Lek2LaBJiTpuuz2K62q1JLyNGAVu7gv7hOgfHqdJGFl0HfnucjgmigUcDqb1Pie5yO0QqrYcvulfkTyiwojpKqupv1YqH1riLjsiPPkjtgW0L6IcYRvKNrexhK2iHGtR0MLu9nIQVtO0xrrXNHI5HIuphs)vbJMOSjuu1jLuMgkcxJqvNhiRefLUmY4iuzZ6k)q8ertaE2hoXj)zfjw8eTjLObgIihXrIGH8k)psLn1ltM9g5gMHuX5lQu9eQU9SpwstjkzygcSYfycbgbSseehRpwkbavT4KVF4sVroQRmmRR8dXtenb4zF4eN8N1zzkcTbd5TANiWqerXCrY)f1o2(DQjEhGOZYueApuI4iXaINiAcG5ZsVrEWeHzafprLfOOea0qV4etJPaWuSbI3Vghylzhv(8iN8XsAkrjdZqGvkR8abj(yPeau1It((Hrw92G8r0zzkcThqB1or(VO2XUc0i5JU4f3gMHR8dXtenb4zF4eN8fdHbmKJNOY8XsAkrjdZqGvkR8abj(14aBj7OYNh5KFyKvVni)jcZakEIkZ)f1o2(UnSex5hINiAcWZ(Wjo5pRZYueAdgYB1or(yjnLOKHziWkLvEGGe)ACGTKDu5ZJCYpmYQ3gKpIoltrO9aAR2jY)f1o2(Unmt4k)q8ertaE2)f1o2((yjnLOKHziWkLvEGGe)ACGTKDu5ZJCYhoXjFSqrLTCmGHWSjabgcZSCa)WiREBq(kOOYwoMbrpbObXUCa3gw8UYpepr0eGN9FrTJTpaHaTE9GjcZakEIkla6OpwstjkzygcSszLhiiXVghylzhv(8iN8HtCYFwrzldmKyDWqeHvr(Hrw92G8ruu2YgI1hQVkYTHL6k)q8ertaE2hoXj)QfdPadrusnUpwstjkzygcSszLhiiXVghylzhv(8iN8dJS6Tb53lgsnmMAC)xu7y7tCsHbuqbQsr8M5eC72)f1o2(UTb]] )

    storeDefault( [[Brewmaster: Combo AOE]], 'actionLists', 20170723.103044, [[dCdQdaGAIGwVaQxka2LIABeY(iuy2KCBIANISxQDd1(bYpjuYWq0Vf1qjuLbRqdxOoibDmKSocfTqHSueAXqA5K6Her9uvpgKNdXejuvtfunzatxPlcuhwQlJ66GYgjc8AbzZcQPjaDAjFLqP(Sc(orKNrGXreA0iLXlGCsb6BivxJqLoprALeQyzkYFrWMYW9bJBufd4i)ulZ(rAwsYnYYAXe0OKZYOzqJcflW(hsxXRVprwXnc70ejfDYasontjGuIu(pMHQwvbU3kJDAsKe9fcTvgJy4orz4(GXnQIbCKFQLzFWbkwLbk8aOXaWd(ezf3iSttKuIOOptkWpigOG6nR9Xzm7leTu1k1NduSkdu4bcH4b)dPR413RttgUpyCJQyah5NAz2pa8aOXl3i08jYkUryNMiPerrFMuGFqmqb1Bw7JZy2xiAPQvQFiEGaICJqZ)q6kE996Kad3hmUrvmGJ8tTm7lzAfOXiyAK1NiR4gHDAIKsef9zsb(bXafuVzTpoJzFHOLQwP(q0kcOW0iR)H0v8671PaA4(GXnQIbCKFQLz)in3lnqJ5WGgLGsZ(ezf3iSttKuIOOptkWpigOG6nR9Xzm7leTu1k1hvZ9sJqomHWLM9pKUIxFagfw4WZH4bciYncTzyXEDsCnCFW4gvXaoY)q6kE99jYkUryNMiPerrFMuGFqmqb1Bw7JZy2p1YSpryi0k8aOrXPbyqJIDHb8fIwQAL6RHHqRWdeKWgGjiPcd41jrgUpyCJQyah5FiDfV(mM1dsNHGP1mEfdsFISIBe2Pjskru0Njf4heduq9M1(4mM9tTm7dVgynOrXRvY(crlvTs93AG1eIBLSxNOB4(GXnQIbCK)H0v867tKvCJWonrsjII(mPa)GyGcQ3S2hNXSFQLz)ivdfkdBbn(vxHyFHOLQwP(OQgkug2saz1vi2RxFXNd3WuRJ8Ad]] )

    storeDefault( [[Brewmaster: Standard ST]], 'actionLists', 20170723.103044, [[d0Z8eaGAfbTEKs5LkISlHABeP9PsuZMK5RsW6eryCifDBHCyj7uf7LA3qTFimkrenms53I6VI0qveAWq0Wf4GKQoLiQ6yi5CkcSqf1sjklgrlNWdve1tbpwPEoKMOiknvvQjRW0v1fjvoTuxg11vsBueP(gs1MjQ2osHVRs6RQe6ZcAEIOyzi4zeXOvIXJuYjfHPPsKRHuQopcTsrKSjru51ksBkFBqhUiv8WZgoveBywWxJk0NfjbcKWx4rjgiqc3gGaE3LQPT67m2hcsPPbzSIlu2hcAu01UKgHykjA0KYaSfDWBWG(93zmQV9HY3g0Hlsfp8SHtfXgMehIajevOlgKXkUqzFiOrjLIESMedjWJExFwyaNXSbyl6G3Gb9KTQFIgMYHPOrf6IFFi4Bd6WfPIhE2aSfDWByWKRYLhpLdtrJk0L41GlCHbtUkxEmAaV7sLoyvtdwqmEnWGmwXfk7dbnkPu0J1KyibE076Zcd4mMnONSv9t0aPGRFjnlpvElydNkInml46xqGmlhbYKUfSFFK4Bd6WfPIhE2aSfDWBWGmwXfk7dbnkPu0J1KyibE076Zcd4mMnONSv9t0aPQ2tZRFk6l6PSHtfXgMv1EAE9rGeErpL97ZL8TbD4IuXdpBa2Io4nSZz1iFfhhSkA5eBCykPGVgVxkriJMm7CwnYxXXbRIwoXghMsk4RX7LseYOPrfTmONSv9t0W3HSinOurgsGh9U(SWaoJzdNkInC3HSabYjwQidYyfxOSpe0OKsrpwtIFFODFBqhUiv8WZgGTOdEdFHN24WKd9RWqwexr5v8F5GvrlNy6Viy0LSAyqpzR6NObMwbQ8OXHPt5qdjWJExFwyaNXSHtfXg0rRavE04qeiNehAqgR4cL9HGgLuk6XAs87JuFBqhUiv8WZgGTOdEdgKXkUqzFiOrjLIESMedjWJExFwyaNXSb9KTQFIgeROlnomDcRbNETXddNkIniBfDPXHiqMu1GrG8InE43h6(2GoCrQ4HNnaBrh8gmONSv9t0WEPtjxfOVHe4rVRplmGZy2WPIydtEPrGCEvG(gKXkUqzFiOrjLIESMe)(qtFBqhUiv8WZgGTOdEdgKXkUqzFiOrjLIESMedjWJExFwyaNXSb9KTQFIg2lD61IgSHtfXgM8sJa5flAW(9zc8TbD4IuXdpBa2Io4nyqgR4cL9HGgLuk6XAsmKap6D9zHbCgZg0t2Q(jA47qwKguQidNkInC3HSabYjwQieitsQK3VFdjllVwvVN9Bd]] )

    storeDefault( [[Brewmaster: Standard AOE]], 'actionLists', 20170723.103044, [[dOtieaGAssA9iP0ljPyxQuBJaZMO5tsQVrqpgKDkQ9sTBe7xL8tsIAye63aDyjdLKidwfnCs1brkNIKehdsRJKqluOwkjSyOA5cEijvEQYYa45qzIQqAQiXKfz6Q6Iq4Va6YOUoOAJiP40sTzsPTJKyCQq9vsknnvi(ossFgIETky0GY4jPQtskEgs11ij48KOvIKk3wiJcjvTrnfpeKcxYjh7nOqR)EEhL1wWLVJ9uWsUWyNbiIku8iIaUrPlEmQ30zOUKn1wFdsCgGGJ9Ob9nibZuCg1u8qqkCjNCS3GcT(75rdVL9R0JvVUem1eKapWi90qsnu9GbpciH9Yve7Hq96sWutqEDQggPNcwYfg7marubOcVfP73zaMIhcsHl5KJ9guO1FppfSKlm2zaIOcqfEls3tdj1q1dg8iGe2JgEl7xP3bgjqSOcdMxUIyp1WiVoxuHbZVZ0nfpeKcxYjh7nOqR)EjghUwT3hyKaXIkmy3W1vTQtmoCTAVX0zOUKatSSPchuEdx3tbl5cJDgGiQauH3I090qsnu9GbpciH9Yve7fh46HDDcQ96KA6a7rdVL9R0dpW1ddiOwGA7a735JykEiifUKto2BqHw)98uWsUWyNbiIkav4TiDpnKudvpyWJasyVCfXEXYc6ai8)6CFOpWE0WBz)k9WLf0bq4pqSp0hy)oRcMIhcsHl5KJ9guO1FppfSKlm2zaIOcqfEls3tdj1q1dg8iGe2lxrSNc4yWAcYRtQRs81PABsYJgEl7xPxaogSMGeOQwjgivBsYVZcmfpeKcxYjh7nOqR)EE0WBz)k9GG1aXHhWEpnKudvpyWJasypfSKlm2zaIOcqfEls3lxrSN6G1xNXWdyVFNfAkEiifUKto2BqHw)98uWsUWyNbiIkav4TiDpnKudvpyWJasyVCfXEQdwFDQ2IkShn8w2VspiynqQwuH978XMIhcsHl5KJ9guO1FppfSKlm2zaIOcqfEls3tdj1q1dg8iGe2lxrShLgjhUovPsgDDs9OQIhn8w2VsVVrYbG6LmYVFVCfXEXbMQrf2Zbv86CFrsviDDstLr43g]] )

    storeDefault( [[IV Brewmaster: ST]], 'actionLists', 20170905.122749, [[dytfdaGAqH1lPsVusf7cuABGuTpqcZwOBlIDc0Ej7gL9lOHrj)wIHkjYGfPHdQoivLJrHNtLfcOLkWIPOLJyCGK8uvldG1bsPjcsXurvtgPMUuxus5XI6zufDDk1gbj1wLuvBgvCEQQoTsFvsvMgvHVlj8nuPxljnAK4WkojvPpJKUgOO7bs0kLe1LH(liwgIxhCsqDV1pmfibRizCnsG2W0ZRF4yEN4w3P3ctGaGouPhGrCCOabyzW1IlapH1WYtlp8q)zYcV119L7TWCIxGgIxVgBmJiTaQ)mzH366Ez0BE6crNvyOUpZnUTF9QiviUKXrrpaDfBsgDIxTEagXXHceGLbxdlDWjb1Rdsnm9jJJIAbcq861yJzePfq9Njl8wx3lJEZtxi6Scd19zUXT9RBgNC1IDdX1KTkQhGUInjJoXRwpaJ44qbcWYGRHLo4KG6aJtUAXUdtFt2QOAb6P41RXgZislG6ptw4TUUxg9MNUq0zfgQ7ZCJB7x3KGttbsHdeolb1dqxXMKrN4vRhGrCCOabyzW1WshCsqDGeCAkHPfoHPq9sq1c0dXRxJnMrKwa1FMSWBDtBoCGLy7OSmQqGXqJqQyz0Wsqoe0rzmJOUxg9MNUq0zfgQ7ZCJB7xNy7OSmQqGXqJqQyz06bORytYOt8Q1dWioouGaSm4AyPdojOEGTJYYOgMw5HgdtR3YOvlqykE9ASXmI0cO(ZKfERJmKq1pSzBcbzDykuaLHPqhM6Ez0BE6crNvyOUpZnUTF9EPIeiWNyIEa6k2Km6eVA9amIJdfialdUgw6GtcQZVursyALMyIA16qdYzSJTaQwca]] )

    storeDefault( [[IV Brewmaster: AOE]], 'actionLists', 20170905.122749, [[dOt6daGAkkA9ue6LuuAxQuzBsLAFucnBrUTu6Wa7uf7LSBu2pv6NuK0Wqv)wOhlQHsrQgSGgUu1bPKEovDmeDEbAHQKLsPwmvSCKEOuHEQYYaX6uPktKIitLctgHPl5IOItRQldDDPyJueSvkIAZQu2ofP8nq1xPiX0Kk57uu5ZG0ZKkA0OsJxQGtkGxtj6Auu19OOWkPe8xqzCQuvlszODaTOwat2n8IIMRf4lKEp3qRMkhT1J5hKEteuFKPdKUVVMnMqGh1bcpjCE4q68os(o57QlTLPFFPPznxFK5LHoKYqJdd4KqcDPTm97lnTamIpdQivJfzOMvNp9vqnSd9PiXZGcZseQMn6Jn0m6LHknBmHapQdeEs4K8AhqlQXPd9PiXZG6gAweQkDGidnomGtcj0L2Y0VV00cWi(mOIunwKHAwD(0xb1SeHcZ3c8C1SrFSHMrVmuPzJje4rDGWtcNKx7aArnZIqDdxlWZvLoDkdnomGtcj0L2Y0VV00cWi(mOIunwKHAwD(0xb1YCFyonuFPzJ(ydnJEzOsZgtiWJ6aHNeojV2b0IADK77gE1q9LkD6sgACyaNesOlTLPFFPbY1BAimIyDNdfbfxyXBWU9u0n0IUHKAbyeFgurQglYqnRoF6RGAoueuCHfVb72trnB0hBOz0ldvA2ycbEuhi8KWj51oGwu7IIGIRBy8MBOj8uuLoMxgACyaNesOlTLPFFPPfGr8zqfPASid1S68PVcQrB8CFguyMjGaHzUNrOzJ(ydnJEzOsZgtiWJ6aHNeojV2b0IA2nEUpdQBOfaeOBOP8mcv60Tm04WaojKqxAlt)(sdzifAW7YnukYk3qlAgUHDBExlOfGr8zqfPASid1S68PVcQvpuKcRhKA1SrFSHMrVmuPzJje4rDGWtcNKx7aArnJhksDdnDqQvLoWLHghgWjHe6sBz63xAA2ycbEuhi8KWj51cWi(mOIunwKHA2Op2qZOxgQ0oGwu7kbYwgBk3Wv03suLkntcVbAsLUujb]] )

    storeDefault( [[IV Brewmaster: Combo]], 'actionLists', 20170905.122749, [[dWtRfaGALc16vIKxcQIDrrBtPi7tKmBHMVsrDyvUnu9Ci7uG9kTBu2prhcuvnmc(nWYOqdvjknysgouCqLsNwXXeX3uclKcwkOSys1Yr1dbvPNs1JP06uIktuPatvjnzqMUQUOsvJtjIEgPixxu2OsbTvLOyZIuTDrkFNu6RkrQPrkQ5PuiFwu9xcnAO04bvLtQu5YixtjQ68GkRujcBIu41c6M016bhovF3Yivg4Kw8d9eF5Kk4fGRdQ7yi7CXzPUFaSgyCtlzDyuKoe1aJcjlewyutMjcAsqZAUUB5dMVE9T2FamuxBqsxRVND6rcQgQ7w(G5Rd)sfgoLMyUfYmXupE2qq2lIE(ess1M3SuzbGieqlZetgFshUHLlQZjTMwShpNqs1gjvgRVJbn27b86maJQVvFIZdx9qkxeHFiS1Hriqg3sOU2VomkshIAGrHKfjc1doCQo8q5sLJFiS9BGXUwFp70Jeunu3T8bZxV(og0yVhWRZamQ(w9jopC11JNneK9IONpHuDyecKXTeQR9RdJI0HOgyuizrIq9GdNQBiE2qq2lv(ZNqQFd0uxRVND6rcQgQ7w(G5RJHtPjMBHmtm1JNneK9IONpHu9DmOXEpGxNbyu9T6tCE4Q)toXfXCr86WieiJBjux7xhgfPdrnWOqYIeH6bhovFDYjUuTSxeVFd0CxRVND6rcQgQ7w(G5RF2FsJejgHpesQsjvjsLgsLfaIqaTmt94zdbzVi65tizYj8ByiPkLujivAivwaicb0YmdPCre(HWAYj8ByiPkLujuFhdAS3d41zagvFR(eNhU6e8HjcGgwUyiLxhgHazClH6A)6WOiDiQbgfswKiup4WP67Hpmra0WYLk4HY73GLVR13Zo9ibvd1DlFW81p7pPrIeJWhcjvPKQePsdPYcariGwMPE8SHGSxe98jKm5e(nmKuLsQeKknKklaeHaAzMHuUic)qyn5e(nmKuLsQeQVJbn27b86maJQVvFIZdxDl2rupJJ(6WieiJBjux7xhgfPdrnWOqYIeH6bhovhEXosLHmo673Gn1167zNEKGQH6ULpy(6N9N0iriWBgs5Ii8dHvQsjvcsLgsLfaIqaTmt94zdbzVi65tizYj8ByiPkLujivAivwaicb0YmdPCre(HWAYj8ByiPkLujuFhdAS3d41zagvFR(eNhU66C6ESIG0ftF4uDyecKXTeQR9RdJI0HOgyuizrIq9GdNQBGt3JvQaPlvB4WP(nyrxRVND6rcQgQ7w(G5RBbGieqlZupE2qq2lIE(esMCc)ggsQsjvcsLgsLfaIqaTmZqkxeHFiSMCc)ggsQsjvc13XGg79aEDgGr13QpX5HRopdHDy5IB8brIAhguDyecKXTeQR9RdJI0HOgyuizrIq9GdNQdldHDy5s1sCqKuT0ddQF)6BaL(Lf)AOFla]] )

    storeDefault( [[IV Brewmaster: Defensives]], 'actionLists', 20170905.122749, [[dOtHeaGEQQOnrvv2fqBJQc2hGy2cwgPQBlv9Bq7uQSxKDRQ9tXOeQAykX4OQKoSkdLQsmyknCO6GKIofG0Xa48uPfsQSuiAXe1YLCAfpv0Jj8CPmrQQQPcHjtKPtYfjLSkHkxg11PIVPKSvQQWMfY2PQqptjL1rvPAAkP67k1iPQiFgsJMQmEHYjbu3IQkDnQkL7rk8xO8AsP(jvf1eacbL(NJoNGI0rzIZI5cJFEQb(uNEFWxPS76zkb2pmwDfV7VMIlF3y9phXFB8rUrjsoWxJPo9lawTSs)AGawwBz91PejFsUiMEMY4nwbegKG7he3PMi35rXKlEdk8UcLBy9xmJ1VgRacdsW9dI7utK78OyYfVbfExHYnSO6eQb(xWybQXgNXkGWGeC)G4o1e5opkMCXBWIfExHYuQPqnWVriOoaeck16p5alr6Omf1GROuaHbj4(bXDQjYDEum5I3GcVRq5MXQHXUyS(ZyBQdfLlqCUe8RW6VyyE4glq0Wy1VqjWV0iofSO8HptPMYtyuUukhoH2yWyyYfVPej3GoLGBecsrjsoWxJPo9lawbyHYURNPux4eABS(CmJvxXBsrD6jeuQ1FYbwI0rzkQbxrjLa)sJ4uWIYh(mLAkpHr5sjUtnrUZJIjx8MsKCd6ucUriifLi5aFnM60VayfGfk7UEMsFXPMi35rnwDfVjf1TgHGsT(toWsKoktrn4kkfqyqcUFqCNAICNhftU4nOW7kuUzSAyScimib3piUtnrUZJIjx8gu4Dfk3W6VyuU94hjFsUu2e1GROe4xAeNcwu(WNPS76zkbUGFt75nwDfVPejh4RXuN(faRaSqjsUbDkb3ieKIsK8j5Iy6zkJ3yfqyqcUFqCNAICNhftU4nOW7kuUH1FXmw)AScimib3piUtnrUZJIjx8gu4Dfk3WIQtOg4FbJfOgBCgRacdsW9dI7utK78OyYfVblw4DfktPMYtyuUuof8BAppMCXBsrDRtiOuR)KdSePJYuudUIsp(cZJI1W94IbfqNxzSardJfG)m24nwp(ckpqjoAeJYybIggBtDkWtPoH2y4WnxgBCg7kqFZyJZy94lmpkwd3JlguaDELXcukb(LgXPGfLp8zk1uEcJYLsogohW8UQNsKCd6ucUriifLi5aFnM60VayfGfk7UEMsTIHZbJ1NUQNuKIYuudUIssrea]] )

    storeDefault( [[IV Brewmaster: Default]], 'actionLists', 20170905.122749, [[d0tTfaGEkiAtuuTlr12aj7Jcs)MWSj6XsCtvQ6quiDBjDEqQDIu7vz3a7xk)KcQHPsgNkvQtJyOuqyWQy4iXbbXPuPIoMi9nkvluvSuPklgulNKhQkXtrTmkP1jv1eLkmvK0Kvvtx4IIsxvQO6YqxNsCyQ2QQK2mfLTtbEMuPPrH4ZukFxumsPI0Zj1OvPcVwLYjPilsvQRjvuUhfQvkveJsLk5VI4LoQJzkyH4sIH0dIamARqD3JP9ko20RTZJcZuDDGQ(TthOzUfzmUhkrxJJ26vQ9l7w7MNE19YigzmxuekX4Xqkbra0J6Oth1XzboSe)7zmxuekX4qyZMeZjGavkluc9yiWejjGESMc6QK7Wb)eDOi3WXMaFsXdHAmqaWX0EfhZuqx1oDQd(TdhkYnCCpuIUghT1RuOsTNF1DXOToQJZcCyj(3ZyUOiuIXHWMnjMtreebq36KXqu20JbEfnwi)jzC1yiWejjGEmfrqeGXMaFsXdHAmqaWX0EfhBiebrag3dLORXrB9kfQu75xDxm6UJ64SahwI)9mMlkcLyC4GBeGT2X82XIgt(Oziqtma1TJ5TJrBN7QDcxIGihw6LBclrsruHf5iWHL4VDmVDOOqdsSv(5P5WsVCtyjs0HICdBN7CmTxXXDGMHanXaupgIYMEmWROXVFuyMQRdu1VD6andbAIbO(9yiWejjGECXLYeVeebirs0XytGpP4Hqngia44EOeDnoARxPqLAp)Q747fFAVIJFuyMQRdu1VD6andbAIbOEXOnYOoolWHL4FpJ5IIqjgp2e4tkEiuJbcaogcmrscOhBrJjKaR6X9qTWIQG6rDX4EOeDnoARxP2tVgt7vCCNRX2XuGv9Ir3zJ64SahwI)9mUhkrxJJ26vkuP2ZV6oMlkcLyC4see5WsVCtyjskIkSihboSe)JHOSPhd8kA87hfMP66av9BNxevyr7aXWzFpgcmrscOhxCPmXlbrasKeDm2e4tkEiuJbcaoM2R44xevyX47fFAVIJn9A78OWmvxhOQF78IOclwmAOg1XzboSe)7zCpuIUghT1RuOsTNF1DmxuekXyJgUebroS0l3ewIKIOclYrGdlXF7yE74LGyaMGaSsqTXPJHOSPhd8kA87hfMP66av9BhoCW3v)2HP(EmeyIKeqpU4szIxcIaKij6ySjWNu8qOgdeaCmTxXXC4GVR(TdtD89IpTxXXMETDEuyMQRdu1VDyQlgT9rDCwGdlX)Egt7vCmho47QF7aXWzhZffHsm2OHlrqKdl9YnHLiPiQWICe4Ws83oM3oEjigGjiaReu3ogA7KogIYMEmWROXVFuyMQRdu1VDEruHfTdt994EOeDnoARxPqLAp)Q7ytGpP4Hqngia4yiWejjGECXLYeVeebirs0X47fFAVIJn9A78OWmvxhOQF7aXWzxSyChOzUfzSNfBa]] )
    
    storeDefault( [[SimC Windwalker: default]], 'actionLists', 20171010.191005, [[dieeqaqiIQArQkztuQgLQQoLQkZIOcAximmc6yiQLrP8mIkAAQkvxtjvTnIk13KkzCQkfohrvwNskZJs4Ekr7Ja1bvvSqOIhsuMirf6IeqJuvPOtsG8sIkWmvsLBsK2Pu1qvvk1sHk9ujtvjSvcWxLk1Ej9xcnyQomKfRkESOMSuUmQnRk9zPIrRuDAvEnImBrUnu2nOFdmCOQJtujlhPNtX0vCDLY2Pe9DI48usRxvPK5RKSFHvY6cTk8C(qP7BHMda1EBYT80soYVOT0O4OfUCIrgw7TjKCxcLNTUiSjKS8SPvLPh(rlT(KNdan6cTNSUqlbcrpjUP4OvLPh(rRb0PtIjo4Wu6g(XeU9W)h(GOD4HOXpBVVezKzoyhIn8H)tRppx6gRAzWZiQ4oc2end9iXAjiy7YObq1ccGSwsbnbGO9imwlT6rySwfEgrd)BIGTWRHEKyTWLtmYWAVnHK7ISqTWLnGnAMn6cD0s2oNjjfyjJXWrF0skO1JWyT0r7TPl0sGq0tIBkoAvz6HF0ANrPzNaFEc3IWfsSET(8CPBSQ1a2Y7IGxrsikgslz7CMKuGLmgdh9rlPGMaq0EegRLw9imwRfGT8E4G3WLdqumKwFODmADWHPwIslLNq5q85rCNrPzFPqI1RfUCIrgw7TjKCxKfQfUSbSrZSrxOJwcc2UmAauTGaiRLuqRhHXAPJ2lN6cTeie9K4MIJwvME4hTgqNojMapyoa0eU9W)h(Z27lHHPm8gReB4dF1QWF2EFjmdGIjYi6SlIGnX3JYeB4dF1QW)hU8dFqjgoegMYWBSsWq0tIBHBp8HEqs8qGNcYeOox6gReB4d)x4Rwf(Z27lXtcaAPnZqSHp8vRcFq0o8qmhgloaX2XHBXYWLBHH)tRppx6gRAHhmhaQLGGTlJgavliaYAjf0eaI2JWyT0QhHXA9TbZbGAHlNyKH1EBcj3fzHAHlBaB0mB0f6OLSDotskWsgJHJ(OLuqRhHXAPJ2)DDHwceIEsCtXrRktp8JwdOtNetKbGudibAc3E4)dFq0o8qmhgloaX2XHBXYWLx4)06ZZLUXQwdylVlcEfBmA21sqW2LrdGQfeazTKcAcar7rySwA1JWyTwa2Y7HdEdxoYOzxlC5eJmS2Bti5UilulCzdyJMzJUqhTKTZzssbwYymC0hTKcA9imwlD0(1Rl0sGq0tIBkoAvz6HF06F4)dFqjgoegMYWBSsWq0tIBHBp8maKAajqcdtz4nwjOmg6GMWTyz4cd)x4Rwf(Z27lHHPm8gReB4d)x42dhLNZswKHm2XMWTiCBHBpCdpIpa4MHyoMAtO43XNdxWHlmC7HB4r8ba3meZXuYYt0g(C4coCHHBpCwU2o845grJEqshSJ4oGcfZalzA42dFomoClc3MqT(8CPBSQvgLsIO8CaOy6mJwcc2UmAauTGaiRLuqRhHXAvhMSW7(GnjOejMUw4gMYWBSgoapdzQwsbnbGO9imwlTWLnGnAMn6cD0QhHXAjdLsH)jphag(6oZO1hAhJwqegV8R6WKfE3hSjbLiX01c3WugEJ1Wb4zit)slC5eJmS2Bti5UiluRAhirkODVhtnkoAjBNZKKcSKXy4OpAvd9YJSDotsXrhTxU1fAjqi6jXnfhTQm9WpA9p8)H)p8bLy4qyykdVXkbdrpjUfU9WZaqQbKajmmLH3yLGYyOdAc3ILHlm8FHVAv4pBVVegMYWBSsSHp8FHBp8)Hl)Wn8i(aGBgI5yQnHIFhFoCbhUWWThU8d3WJ4daUziMJPKLNOn85WfC4cd3E4YpCwU2o845grJEqshSJ4oGcfZalzA4)c)x4Rwf()W)h()WhuIHdHHPm8gReme9K4w42dpdaPgqcKWWugEJvckJHoOjClwgUWW)f(QvH)S9(syykdVXkXg(W)fU9WNdJdxWHBty4)06ZZLUXQwzukjIYZbGIPZmAjiy7YObq1ccGSwsbTEegRvDyYcV7d2KGsKy6AHBykdVXQwsbnbGO9imwlTWLnGnAMn6cD0QhHXAjdLsH)jphag(6oZe(FY)06dTJrlicJx(vDyYcV7d2KGsKy6AHBykdVX6xAHlNyKH1EBcj3fzHAv7ajsbT79yQrXrlz7CMKuGLmgdh9rRAOxEKTZzsko6O9DPl0sGq0tIBkoAvz6HF0s(HpOedhcdtz4nwjyi6jXTWTh()WF2EFjmdGIjYi6SlIGnX3JYeB4dF1QWZaqQbKajmdGIjYi6SlIGnX3JYe5DeTdBcFz42c)NwFEU0nw1kJsjruEoaumDMrlbbBxgnaQwqaK1skO1JWyTQdtw4DFWMeuIetxlCd)QLuqtaiApcJ1slCzdyJMzJUqhT6rySwYqPu4FYZbGHVUZmH)32pT(q7y0cIW4LFvhMSW7(GnjOejMUw4g(9lTWLtmYWAVnHK7ISqTQDGePG29Em1O4OLSDotskWsgJHJ(Ovn0lpY25mjfhD0(VHUqlbcrpjUP4OvLPh(rl5h(GsmCimmLH3yLGHONe3c3E4SCTD4XZnIg9GKoyhXDafkMbwY0WTh()WZaqQbKajmd9iXIGxXzNfLCWwcqBeugdDqt4wSmCYFJWThEgasnGeiX7zgJi4v8DJALGYyOdAc3ILHt2w42dpVFe5nkLHt4cEz4Yz42dpdaPgqcKGEMd2r0SbfjDzseugdDqt4wSmCYHVAv4dI2HhI5WyXbi2ooClwgUT1h(QvHNbGudibsmGT8Ui4vSXOzNGYyOdAcxWHtMSTW)fU9WZaqQbKajmdGIjYi6SlIGnX3JYe5DeTdBcFz4K16ZZLUXQwzukjIYZbGIPZmAjiy7YObq1ccGSwsbTEegRvDyYcV7d2KGsKy6AHB4xTKcAcar7rySwAHlBaB0mB0f6OvpcJ1sgkLc)tEoam81DMj8)Y5pT(q7y0cIW4LFvhMSW7(GnjOejMUw4g(9lTWLtmYWAVnHK7ISqTQDGePG29Em1O4OLSDotskWsgJHJ(Ovn0lpY25mjfhD0E5Pl0sGq0tIBkoAvz6HF0s(HpOedhcdtz4nwjyi6jXTWThU8dNLRTdpEUr0OhK0b7iUdOqXmWsMgU9W)hEgasnGeiHzOhjwe8ko7SOKd2saAJGYyOdAc3ILHt(7HBp8maKAajqI3ZmgrWR47g1kbLXqh0eUfldxUd3E459JiVrPmCcxWldxod3E4zai1asGe0ZCWoIMnOiPltIGYyOdAc3ILHto8vRcFq0o8qmhgloaX2XHBXYWjV(WxTk8maKAajqIbSL3fbVIngn7eugdDqt4coCYKTf(VWThEgasnGeiHzaumrgrNDreSj(EuMiVJODyt4ldNSwFEU0nw1kJsjruEoaumDMrlbbBxgnaQwqaK1skO1JWyTQdtw4DFWMeuIetxlCd)QLuqtaiApcJ1slCzdyJMzJUqhT6rySwYqPu4FYZbGHVUZmH))7)06dTJrlicJx(vDyYcV7d2KGsKy6AHB43V0cxoXidR92esUlYc1Q2bsKcA37XuJIJwY25mjPalzmgo6Jw1qV8iBNZKuC0r7jluxOLaHONe3uC06ZZLUXQwzukjIYZbGIPZmAjiy7YObq1ccGSwsbnbGO9imwlT6rySwYqPu4FYZbGHVUZmH)F9)06dTJrlicJx(vDyYcV7d2KGsKy6AHxl(slC5eJmS2Bti5UilulCzdyJMzJUqhTKTZzssbwYymC0hTKcA9imwR6WKfE3hSjbLiX01cVwOJoA1JWyTQdtw4DFWMeuIetxl8g)I2sJoQc]] )

    storeDefault( [[SimC Windwalker: precombat]], 'actionLists', 20171010.191005, [[dedrcaGEQIAxuLSnfuZwr3KI(gQYoPYEj7gL9tv1WOKFR0qPkyWcy4iXbfOJrHZbkTquvlvHwmsTCrEis6PQwgL65aMiQOMQGMmitxQlckUm01bvBfvyZufA7OsFLQsFwb57uv8yHoSKrdKBlQtcuETcCAeNhO6VuL6zufzDOISmuO(PGrsnjEUAYYKZEyy15m6Xc(SfF9rCIfakNTLbplyT55LTLbS26pMiuAD9GXMSmafkNHc1HHv0tes81FmrO069o0qt0lkBtwgGEqAYK0GRtzBYY0bJbrIvVjD2YqDZfIJk5QmQR7QmQ7HTjltFeNybGYzBzWZWsFebw4PicOq16ubHXbMlxmJSw06MlKRYOUA5SvOomSIEIqIVEqAYK0GRhbr8MgEcO1bJbrIvVjD2YqDZfIJk5QmQR7QmQtfeXFa(WtaT(ioXcaLZ2YGNHL(icSWtreqHQ1PccJdmxUygzTO1nxixLrD1Y5jfQddRONiK4RhKMmjn46rqeV9P4I6GXGiXQ3KoBzOU5cXrLCvg11Dvg1PcI4pGVfxuFeNybGYzBzWZWsFebw4PicOq16ubHXbMlxmJSw06MlKRYOUA16UkJ6NKP6pGVegKp1CaM4K)ausyCZ0vRwc]] )

    storeDefault( [[SimC Windwalker: sef]], 'actionLists', 20171010.191005, [[dauhfaqifLSifv2KIQgLcQoLckZsbPBjqLDrGHbshtqlJe9mfeMMavDnfLABcu6BQQ6CusSokLMNaf3JqSpffoijSqvvEOkAIeexKGAJusQtkqMPIIUPQYob1qvq0sjjpfzQkYwPu8vkP2R0FvObtQdlAXQWJPQjRkxgAZekFgeJMK60O61cy2u52cTBu(nrdxbwoWZvPPR01PeBNq67eQgpbPZtPA9usY(P4g2Ps0a0Zth3QYLlzfwzWALscbflT42(RKk0H5flSsOH)HAfL)fOeAOvuwI8a(GTujf(Llz3ov4WovsywE4Wx)vI8a(GT0Sm6bau0ri(NGqblhccghKUOrpVrJmeaXUaVfaazRrlIrJmeaXUGykuJEEJ2RMlWBbaq2A0bJrhwsXb3Xx7LwoeemoiDXsNQrFGpPOyezBpk9jF2Ka4mILkfe7X95kbLysgwcoJyPjoeey0dz6ILuaGCl5T7D44Mai4EfjSKk0H5flSsOH)dHwsfELwaE82PULoT7D4ucGG7T)k9jFWzel1TWk7ujHz5HdF9xjYd4d2sE1CbXuOgDWz0E1CbElaaYwJEgIy0Hg98gnYqae7cwEehx5ymfQrpdrmAOcMDjfhChFTxkb(KHJReaq2wki2J7ZvckXKmS0N8ztcGZiwQeCgXska(KHg9Keaq2wsf6W8Ifwj0W)HqlPcVslapE7u3sNQrFGpPOyezBpk9jFWzel1TWdrNkjmlpC4R)kP4G74R9s(05gt)YLSrh)ULcI94(CLGsmjdl9jF2Ka4mILkbNrS0z6CgTc)YLmJEM87wsbaYTelJOiZr84PrBnN9epDbqGTg9PqMRKk0H5flSsOH)dHwsfELwaE82PULovJ(aFsrXiY2Eu6t(GZiwI4XtJ2Ao7jE6cGaBn6tH0TWbFNkjmlpC4R)krEaFWwALqG4qbEP09KIZUg98g9Wn6zz0hwetmb3vcIJycw1Jj7nkghGcSmWOhwjfhChFTx6UsqCetWQEmzVrX4aSuqSh3NReuIjzyPp5ZMeaNrSuj4mILOvcId1OfobR6HA0j7z0wnhGLuHomVyHvcn8Fi0sQWR0cWJ3o1T0PA0h4tkkgr22JsFYhCgXsDl8S7ujHz5HdF9xjfhChFTxYNo3y6xUKn643TuqSh3NReuIjzyPp5ZMeaNrSuj4mILotNZOv4xUKz0ZKFxJE4HdRKcaKBjwgrrMJ4XtJ2Ao7jE6cGaBnAAAUsQqhMxSWkHg(peAjv4vAb4XBN6w6un6d8jffJiB7rPp5doJyjIhpnAR5SN4PlacS1OPPUDlbNrSeXJNgT1C2t80fab2A0xuSUTa]] )

    storeDefault( [[SimC Windwalker: serenity]], 'actionLists', 20171010.191005, [[dqKQoaqiujTiscAtcfJsuPtjQyxkQHHQCmsSmrvptrQMgjrUgiQQTrsiFdvQXPiL6CIsyDksX8ar5EIsTpujoOIyHGWdfftuuIUOqYgjjQtkKALKeQxkkPzcIkDtvXorQHcIQSuuvpLyQOITku6RksAVs)fjdMuhgyXI0JPyYkCzOnleFweJwO60kTAfjETGMTQ62GA3Q8BQmCvPJtsGLJYZPQPJ46cSDsQVtsA8ksjNhKwpiQy(Gi7NsxLYPI8IMf8xihazDxPZRIYIkzjgbe8jfIk8Xpc8yPZZtHBEzrEUNZZtjlYxrmS9LuPYedzDNVCkTs5ujQdK(XrHOIyy7lPcxT6xgQMkXmMvMjBcYOEbFyRogRgpKLaD2eWy4rS6STA8qwc0zyW0YQJXQnX3ztaJHhXQHmRwXQJXQ5QvNgejYShz4TeOZbVvMKU)LaTcztqg1l4dxjtC0e(4uJW4rAALh3iwaJgaJvQe9nwdG4yvo3HvObWyfoBcYSAipWhUYewIVIbQ5Juealbj(SvQWh)iWJLoppfUv4vHp6Dbmd6lNsQKbQ5JCaSeK4levECdAamwPKsNVCQe1bs)4Oquzs6(xc0kgW)tbmK1Du)1tQe9nwdG4yvo3HvECJybmAamwPcnagRKb8)w9edzDNvd5UEsLjSeFLdaJzRcLfoJvp19gQc(HiBAS6mzPkScF8Japw688u4wHxf(O3fWmOVCkPsM4Oj8XPgHXJ00kpUbnagRilCgREQ7nuf8dr20y1zYYsk90lNkrDG0pokevedBFjviUKKpoBCU)WP65RmjD)lbAfpYWBjqRe9nwdG4yvo3HvECJybmAamwPcnagRiidVLaTcF8Japw688u4wHxf(O3fWmOVCkPsM4Oj8XPgHXJ00kpUbnagRusPvPYPsuhi9JJcrfXW2xsfGHSQrk8q4f9wnKz1tVYK09VeOvyRFVekFWrfUMWkzIJMWhNAegpstR84gXcy0aySsLOVXAaehRY5oScnagRWF97Ly1sWz1zDnHvMWs8vmqnFKIayjiXNTsf(4hbES055PWTcVk8rVlGzqF5usLmqnFKdGLGeFHOYJBqdGXkLuAi)YPsuhi9JJcrLjP7FjqR4jSnePCrOiXrkv3B8DSrLOVXAaehRY5oSYJBelGrdGXkvObWyfHW2q0QDrSAsC0QN6EJVJnQWh)iWJLoppfUv4vHp6Dbmd6lNsQKjoAcFCQry8inTYJBqdGXkLuAvu5ujQdK(XrHOIyy7lPsUwnxT6xgQMkXmMvMt)atOlGqfUMqRohRogRoxR(LHQPsmJzLzpHTHiLlcfjosP6EJVJnSAibjR(LHQPsmJzL5iRN4PCrOIeWGA15y1Xy1adzvJu4HWl6TAiZQZxzs6(xc0kPFGj0fqOcxtyLmXrt4JtncJhPPvECJybmAamwPs03ynaIJv5ChwHgaJvG4dmHUaIvN11ewzclXxXa18rkcGLGeF2kv4JFe4XsNNNc3k8QWh9UaMb9LtjvYa18roawcs8fIkpUbnagRusP5UCQe1bs)4OqurmS9LujxRoxRgvbb77loMhS9c3lHkUJDugNAKz1Xy1PbrIm)YqVpGHuVU9iZmegSN3QHSST68wDmwThjuPUlWptwKLNhLk9ASAUy18S6CS6yS6CTAJZ9hovVz263lHYhCuHRjCMHWG98wnxSAfRgsqYQbgYQgPWdHx0B1CXQvS6CS6CQmjD)lbALiRN4PCrOIeWGwjtC0e(4uJW4rAALh3iwaJgaJvQqdGXkQ86jER2fXQv5ag0ktyj(k7rqgl4LKTsf(4hbES055PWTcVk8rVlGzqF5usLOVXAaehRY5oSYJBqdGXkLu6PD5ujQdK(XrHOIyy7lPsUwDUwnxTAufeSVV4yEW2lCVeQ4o2rzCQrMvdjiz1PbrImN(DUXpWtMdETAibjRonisKzpYWBjqNzimypVvdzwTIvNJvhJvNRvBCU)WP6nZw)Eju(GJkCnHZmegSN3Q5IvRy1qcswnWqw1ifEi8IERMlwTIvNJvNtLjP7FjqRez9epLlcvKag0kzIJMWhNAegpstR84gXcy0aySsfAamwrLxpXB1UiwTkhWGA15QKtLjSeFL9iiJf8sYwPcF8Japw688u4wHxf(O3fWmOVCkPs03ynaIJv5Chw5XnObWyLskDwuovI6aPFCuiQig2(sQamKvnsHhcVO3Q5s2w90T6ySAUA1VmunvIzmRm7F372lHYWahsfUMWkts3)sGwX)U3TxcLHboKkCnHvI(gRbqCSkN7WkpUrSagnagRuHgaJvK39U9sS6mmWHwDwxtyf(4hbES055PWTcVk8rVlGzqF5usLmXrt4JtncJhPPvECdAamwPKsRWRCQe1bs)4OqurmS9LuHRw9ldvtLygZkZSaF89sOMcyGuQU3WQJXQtdIezMf4JVxc1uadKs19gZdNQNvhJvNgejYShz4TeOZmegSN3Q5s2wTkvzs6(xc0kSaF89sOMcyGuQU3Os03ynaIJv5Chw5XnIfWObWyLk0aySc)aF89sSAvmyGw9u3BuHp(rGhlDEEkCRWRcF07cyg0xoLujtC0e(4uJW4rAALh3GgaJvkP0kkLtLOoq6hhfIkIHTVKkadzvJu4HWl6TAUKTvp9kts3)sGwHT(9sO8bhv4AcRKjoAcFCQry8inTYJBelGrdGXkvI(gRbqCSkN7Wk0aySc)1VxIvlbNvN11eA15QKtLjSeFfduZhPiawcs8zRuHp(rGhlDEEkCRWRcF07cyg0xoLujduZh5ayjiXxiQ84g0aySsjLwjF5ujQdK(XrHOIyy7lPcxT6xgQMkXmMvMzb(47LqnfWaPuDVHvhJvNgejYmlWhFVeQPagiLQ7nMhovpRogRgyiRAKcpeErVvZfRwPYK09VeOvyb(47LqnfWaPuDVrLOVXAaehRY5oSYJBelGrdGXkvObWyf(b(47Ly1QyWaT6PU3WQZvjNk8Xpc8yPZZtHBfEv4JExaZG(YPKkzIJMWhNAegpstR84g0aySsjLwz6LtLOoq6hhfIkIHTVKkC1QFzOAQeZywz2)U3TxcLHboKkCnHvMKU)LaTI)DVBVekddCiv4AcRe9nwdG4yvo3HvECJybmAamwPcnagRiV7D7Ly1zyGdT6SUMqRoxLCQWh)iWJLoppfUv4vHp6Dbmd6lNsQKjoAcFCQry8inTYJBqdGXkLuAfvQCQe1bs)4OqurmS9LuHRw9ldvtLygZkZPFGj0fqOcxtyLjP7FjqRK(bMqxaHkCnHvYehnHpo1imEKMw5XnIfWObWyLkrFJ1aiowLZDyfAamwbIpWe6ciwDwxtOvNRsovMWs8vmqnFKIayjiXNTsf(4hbES055PWTcVk8rVlGzqF5usLmqnFKdGLGeFHOYJBqdGXkLusfAamwrw4mw9u3BOk4hISPXQ9idVLaTKwa]] )

    storeDefault( [[SimC Windwalker: ST]], 'actionLists', 20171010.191005, [[du0bAaqikblcHOSjcYOeqNIsQBje0UivdJqDmk1YespdHW0OeY1qizBef03OKmoeIQZruK1rjunpII6EeL2hc1bjOwib6HIstKOaxua2OqOoPOWkfc0lfczMucLBIO2jPmuHawQa9uQMkr1wfI(krH2l4VezWQCyOwSGEmftwsxg1MLs9zHA0i40QA1iKYRLIzlXTLQDR43KmCc54iKQLJ0Zfz6qUUOA7sjFNs04ffDEez9iez(eW(vAWgKdUgUZG7Fp7EY4pvlXLgMAX3ZLdUBOVie4GhKlmoXGwuX2wjwMIALEuX2YuuWDrS5XLNiHrVAaTOYqzcCHnOxnjqoOzdYbpGbhw4kii4ch(LhrcCdUuKWg0RgPYNqGNXuFdgPOGpQHbNSQgjMQH7m4GRH7m4zXLYEcBqVA2ZI9je4ctJtGp4ollrM)9S7jJ)uTexAyQfFVSYaImWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjWMgYQwCNheecozvvd3zW9VNDpz8NQL4sdtT47Lvgaiqlkih8agCyHRGGG7g6lcbUHWRBYPuEq7jZYUN9EcTxG7zuQsvz5Ot)0pXsP8rQ5nn6uUJ)jTNS7jEpbeyVa3dtrFBSbPNq0VHLuTLqeyjl)Pwu0Qop4Wcx3tO9mkvPQSC0ti63WsQ2sicSKL)ulkAvNYD8pP9KDpX7z9EciWE8W0ys6MCkLh0EY8EeL49SgCHd)YJibopmn(js)elXLpZNcEgt9nyKIc(OggCYQAKyQgUZGdUgUZGhWW04Ni9t8Ebu(mFk4b5cJtmOfvSTv2IbpiNu5udNa5ac8SeytdzvlUZdccbNSQQH7m4ac0icqo4bm4Wcxbbb3n0xecCdHxVJZCViCpdHx3KtP8G2Jyz3ZEpH2JhMgtsh9DwcPK64m3Jyz3tSorbUWHF5rKahtn4HLqkkLhe4zm13Grkk4JAyWjRQrIPA4odo4A4odUWudE49KROuEqGhKlmoXGwuX2wzlg8GCsLtnCcKdiWZsGnnKvT4opiieCYQQgUZGdiqZIa5GhWGdlCfeeC3qFriWTWEIOClPytv3wh9XmvseU03tO94HPXK0rFNLqkPooZ9Kzz3tSorTNq7zi86DCM7fH7zi86MCkLh0Eel7Erbx4WV8isGJ(yMkjcx6GNLaBAiRAXDEqqi4Kv1iXunCNbh8mM6BWiff8rnm4A4odU8pMP7fbWLo4ctJtGBizkSectJzuswBWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjzkSCmnMrjqqWjRQA4odoGanIcKdEadoSWvqqWDd9fHa3c7HWfEq6jMYZJiPZdoSW19eqG9mkvPQSC0tmLNhrsNYD8pP9iw29SfdUWHF5rKapHOFdlPAlHiWsw(tTOOvWZyQVbJuuWh1WGtwvJet1WDgCW1WDgChr)gEpv79qe49KXFQffTcEqUW4edArfBBLTyWdYjvo1WjqoGaplb20qw1I78GGqWjRQA4odoGanziih8agCyHRGGG7g6lcbEG7f4EgcVUjNs5bThXYUhrSNq7XdtJjPBYPuEq7rSS7zrI3Z69eqG9meEDtoLYdApILDpIApR3tO9cCplShcx4bPNykppIKop4Wcx3tab2ZOuLQYYrpXuEEejDk3X)K2Jyz3tgUN1GlC4xEejWPF6NyPu(i18MgWZsGnnKvT4opiieCYQAKyQgUZGdEgt9nyKIc(OggCnCNbp4N(jEppF2lIEtd4ctJtGBizkSectJzuswBWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjzkSCmnMrjqqWjRQA4odoGanRa5GhWGdlCfeeC3qFriWr4cpi9et55rK05bhw46EcTNf2Jj65VirCvVs)P5Nyjck6izuTy6EcTNrPkvLLJEIP88is6uUJ)jThXYUhrTNq7XdtJjPJ(olHusDCM7r8Erbx4WV8isG3(tOKKQTu7CkjWZyQVbJuuWh1WGtwvJet1WDgCW1WDg8i(tO0EQ27fX5usGhKlmoXGwuX2wzlg8GCsLtnCcKdiWZsGnnKvT4opiieCYQQgUZGdiqJihKdEadoSWvqqWDd9fHahHl8G0tmLNhrsNhCyHR7j0Emrp)fjIR6v6pn)elrqrhjJQft3tO9cCpJsvQklh9et55rK0PCh)tApILDpBIApbeypJsvQklh9et55rK0PCh)tApzw29SO9SEpH2JhMgtsh9DwcPK64m3J49IcUWHF5rKaV9NqjjvBP25usGNXuFdgPOGpQHbNSQgjMQH7m4GRH7m4r8NqP9uT3lIZPK2lqBRbpixyCIbTOITTYwm4b5KkNA4eihqGNLaBAiRAXDEqqi4KvvnCNbhqGMmbYbpGbhw4kii4UH(IqGBH9q4cpi9et55rK05bhw46EcThpmnMKo67Sesj1XzUhX7ffCHd)YJibE7pHssQ2sTZPKapJP(gmsrbFuddozvnsmvd3zWbxd3zWJ4pHs7PAVxeNtjTxGrTg8GCHXjg0Ik22kBXGhKtQCQHtGCabEwcSPHSQf35bbHGtwv1WDgCabA2Ib5GhWGdlCfeeC3qFriWTWEiCHhKEIP88is68GdlCDpbeypJsvQklh9et55rK0PCh)tApILDpIcCHd)YJibo9t)elLYhPM30aEwcSPHSQf35bbHGtwvJet1WDgCWZyQVbJuuWh1WGRH7m4b)0pX755ZEr0BA2lqBRbxyACcCdjtHLqyAmJsYAdEqUW4edArfBBLTyWdYjvo1WjqoGapljtHLJPXmkbccozvvd3zWbeOzBdYbpGbhw4kii4ch(LhrcClj80YpXsvkownsIYhdbWZyQVbJuuWh1WGtwvJet1WDgCW1WDgCzKWtl)eVNmGIJvZErG8Xqa8GCHXjg0Ik22kBXGhKtQCQHtGCabEwcSPHSQf35bbHGtwv1WDgCabA2rb5GhWGdlCfeeC3qFriWTWEIOClPytv3wpSGnnQCKuZBA2tO9meE9ooZ9IW9meEDtoLYdApILDp79eAVeJKcvtEsh9mnQTKfjYShX7jEpH2lW9SWEjgjfQM8Ko6zQTmjfvKzpI3t8EciWEiCHhKEIP88is68GdlCDpbeyVW82T1dvnsIOkJEUO9SgCHd)YJibEybBAu5iPM30aEwcSPHSQf35bbHGtwvJet1WDgCWZyQVbJuuWh1WGRH7m4cwWMgvoAVi6nnGlmnobUHKPWsimnMrjzTbpixyCIbTOITTYwm4b5KkNA4eihqGNLKPWYX0ygLabbNSQQH7m4ac0Sjcqo4bm4Wcxbbb3n0xec8a3dBqFlwIhU)CApILDpIypbeyVa3lmVDB9qvJKiQYONlApH2Zq4174m3lc3Zq41n5ukpO9iw29eVN17z9EcTNf2teLBjfBQ626jr)m)elzO4HLAEtZEcTxIrsHQjpPJEMg1wYIez2J49edUWHF5rKapj6N5NyjdfpSuZBAapJP(gmsrbFuddozvnsmvd3zWbxd3zWDr)m)eVxwkE49IO30aEqUW4edArfBBLTyWdYjvo1WjqoGaplb20qw1I78GGqWjRQA4odoGanBlcKdEadoSWvqqWDd9fHaNj65VirCvhrGL4UiMQOjjdwe28ifDpH2lmVDBDebwI7IyQIMKmyryZJuu9ecBA2Jyz3ZwM2tO94HPXK0rFNLqkPooZ9iEpIaCHd)YJibUHInnLFILiA4klv(ycO5NyWZyQVbJuuWh1WGtwvJet1WDgCW1WDg8SuSPP8t8ErqCL3ZI9XeqZpXGhKlmoXGwuX2wzlg8GCsLtnCcKdiWZsGnnKvT4opiieCYQQgUZGdiqZMOa5GhWGdlCfeeC3qFriWzIE(lsex1reyjUlIPkAsYGfHnpsr3tO9cZB3whrGL4UiMQOjjdwe28ifvpHWMM9iw29STO9eApJsvQklh9et55rK0PCh)tApzEpBIypH2dHl8G0tmLNhrsNhCyHR7j0E8W0ys6OVZsiLuhN5EeVhraUWHF5rKa3qXMMYpXsenCLLkFmb08tm4zm13Grkk4JAyWjRQrIPA4odo4A4odEwk20u(jEViiUY7zX(ycO5N49c02AWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjWMgYQwCNheecozvvd3zWbeOzldb5GhWGdlCfeeC3qFriWXg03IL4H7pN2Jyz3Ji2tO9SWEIOClPytv3wpj6N5NyjdfpSuZBAax4WV8isGNe9Z8tSKHIhwQ5nnGNXuFdgPOGpQHbNSQgjMQH7m4GRH7m4UOFMFI3llfp8Er0BA2lqBRbpixyCIbTOITTYwm4b5KkNA4eihqGNLaBAiRAXDEqqi4KvvnCNbhqGMTvGCWdyWHfUcccUBOVie4gcVEhN5Er4EgcVUjNs5bThX7zVNq7zH9er5wsXMQUTonpr4NyjIgUYsw(tfCHd)YJibonpr4NyjIgUYsw(tf8mM6BWiff8rnm4Kv1iXunCNbhCnCNbpyEIWpX7fbXvEpz8Nk4b5cJtmOfvSTv2IbpiNu5udNa5ac8SeytdzvlUZdccbNSQQH7m4ac0SjYb5GhWGdlCfeeC3qFriWdCpdHx3KtP8G2J49S3tab2lmVDB9qvJKiQYONlApbeyVa3dHl8G05HPXpr6NyjU8z(uDEWHfUUNq7zuQsvz5OZdtJFI0pXsC5Z8P6uUJ)jTNmVNrPkvLLJE7pHssQ2sTZPK0PCh)tApR3Z69eAVa3lW9mkvPQSC0PF6NyPu(i18MgDk3X)K2J49S3tO9cCplShMI(2ydspHOFdlPAlHiWsw(tTOOvDEWHfUUNacSNrPkvLLJEcr)gws1wcrGLS8NArrR6uUJ)jThX7zVN17jGa7zi86MCkLh0EeVx09SEpH2lW9mkvPQSC0B)juss1wQDoLKoL74Fs7r8E27jGa7zi86MCkLh0EeVhrSN17jGa7jIYTKInvDBD0hZujr4sFpR3tO9SWEIOClPytv3wpSGnnQCKuZBAax4WV8isGhwWMgvosQ5nnGNLaBAiRAXDEqqi4Kv1iXunCNbh8mM6BWiff8rnm4A4odUGfSPrLJ2lIEtZEbABn4ctJtGBizkSectJzuswBWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjzkSCmnMrjqqWjRQA4odoGanBzcKdEadoSWvqqWDd9fHaNhMgtsh9DwcPK64m3J49Sbx4WV8isGBi8swIBXGNXuFdgPOGpQHbNSQgjMQH7m4GRH7m4zj87jJ4wm4b5cJtmOfvSTv2IbpiNu5udNa5ac8SeytdzvlUZdccbNSQQH7m4ac0IkgKdEadoSWvqqWDd9fHaNhMgtsh9DwcPK64m3J49Sbx4WV8isGBi8sH50ec8mM6BWiff8rnm4Kv1iXunCNbhCnCNbplHFpbZPje4b5cJtmOfvSTv2IbpiNu5udNa5ac8SeytdzvlUZdccbNSQQH7m4ac0IAdYbpGbhw4kii4UH(IqGBH9er5wsXMQUTo6JzQKiCPVNq7f4EgcVEhN5Er4EgcVUjNs5bThXYUx09eqG94HPXK0rFNLqkPooZ9K59S3ZAWfo8lpIe4OpMPsIWLo4zjWMgYQwCNheecozvnsmvd3zWbpJP(gmsrbFuddUgUZGl)Jz6EraCPVxG2wdUW04e4gsMclHW0ygLK1g8GCHXjg0Ik22kBXGhKtQCQHtGCabEwsMclhtJzuceeCYQQgUZGdiqlAuqo4bm4Wcxbbbx4WV8isGBi8swIBXGNXuFdgPOGpQHbNSQgjMQH7m4GRH7m4zj87jJ4w8EbABn4b5cJtmOfvSTv2IbpiNu5udNa5ac8SeytdzvlUZdccbNSQQH7m4ac0IseGCWdyWHfUcccUWHF5rKa3q4LcZPje4zm13Grkk4JAyWjRQrIPA4odo4A4odEwc)EcMttO9c02AWdYfgNyqlQyBRSfdEqoPYPgobYbe4zjWMgYQwCNheecozvvd3zWbeGaxgWTX5feiiGaa]] )

    storeDefault( [[SimC Windwalker: CD]], 'actionLists', 20171010.191005, [[duKmmaqieOnHQQrrf6uurMfjP6wasyxuyyOIJjHLjcpteLPjIKRjIyBiG(gI04ijLZHQsRdKMhjj3JkyFiaherSqe0djjMOiQUiGyJIivJeqkNKkQBIkTtkAPsKNkmve6Qas0wLO8vuvKXIQI6Tas1DbK0EH(ljgmkhwPftLEmvnzjDzvBgiFgOgnaNMuVgqnBrDBqTBI(TIHJQCCuvy5eEoLMUuxxK2oIY3runEjQopiwVisz(Ku7hPXcKigj)G20CJeIrW7E9M1jTT1JentqG8fJsp)1E0mbNcs5W3eKAKGtbFtGr4fAEngyqIV1J0IerZcKigarUU5xrcXi8cnVgJEadoFd)m56qU0IbjU6SUHGHws2a8vkp9smCww1(ThbgYrEm4o1YwH5cFmWWCHpgoljBa(ugFo9svNYAaNY4ta09PmIAWxGrPN)ApAMGtbPfCWO0TtQWFlseBmubW9aZDi7Wx2OlgCNQ5cFmWgntGeXaiY1n)ksigHxO51y4iL5NjxhYLg2lUu3qmehE1slLrauwbhktTAkZnfeid7fxQBigP8OmNOm1QPmcsz9MVSnSxCPUHyC56MFfdsC1zDdbdlV77lugqkUVflKnJHkaUhyUdzh(YgDXG7ulBfMl8XadZf(yO2dc0MSKLKF1anDFyOfjPOGVCGcfkuOqHcTOGd0eeiFHcfkuOqvdaOh8UVVGYgqugHVflKnduvdqTadseGTyix47GL399fkdif33IfYMXO0ZFThntWPG0coyu62jv4VfjIngolRA)2Jad5ipgCNQ5cFmWgntgsedGix38RiHyeEHMxJHJuMBkiqg2lUu3qms5rz8tzeKYoFKQ5X7vdlV77lugqkUVflKntzorzQvtzoszNps1849QHL399fkdif33IfYMPm(PmhPSwdFktvuwsOm1QPm)m56qU0WEXL6gIH4WRwAPmv5aLPAuMtuMtuMA1ugbPSEZx2g2lUu3qmUCDZVszQvtz9ka)2O1WxPhLQ(uMQCGY8ZKRd5sd7fxQBigIdVAPfdsC1zDdbdY0BwzaP4)AF(wRspLRLwmubW9aZDi7Wx2OlgCNAzRWCHpgyyUWhd1EqG2KLSK8RgOP7ddTiPiLtrbuOqHcfkuOffCGMGa5luOqHcfQAaa9Y0BMYgquMkFTpFRLYioLRLwGQAaQfyqIaSfd5cFhitVzLbKI)R95BTk9uUwAXO0ZFThntWPG0coyu62jv4VfjIngolRA)2Jad5ipgCNQ5cFmWgntkKigarUU5xrcXi8cnVgdmkD7Kk83IeXgdsC1zDdbJu7v09HTy4SSQ9BpcmKJ8yu65V2JMj4uqAbhmmx4JbqP9uMZ9HTyJMjbjIbqKRB(vKqmcVqZRXOhWGZ3WptUoKlTyqIRoRBiy4MNPQakvabdNLvTF7rGHCKhdUtTSvyUWhdmmx4JbH5zQuwspvabJsp)1E0mbNcsl4GrPBNuH)wKi2yOcG7bM7q2HVSrxm4ovZf(yGnAsGirmaICDZVIeIr4fAEng9agC(g(zY1HCPfdsC1zDdbd3lSxaSwcgdNLvTF7rGHCKhdUtTSvyUWhdmmx4JbHxyVayTemgLE(R9OzcofKwWbJs3oPc)TirSXqfa3dm3HSdFzJUyWDQMl8XaB0KuKigarUU5xrcXi8cnVgdpaTb8woLbuqzEaAdFQqCztzeGduwbLXpLD5fGHy0A4R0Jc8woLraoqzCmscgK4QZ6gcgRWVYR0JqCzJHZYQ2V9iWqoYJb3Pw2kmx4JbgMl8XGeHFLNYiocXLngLE(R9OzcofKwWbJs3oPc)TirSXqfa3dm3HSdFzJUyWDQMl8XaB0u1qIyae56MFfjedUB5A4uyIRa8BlgjWi8cnVgJEadoFd)m56qU0sz8tzoszeKYwrRbT(2a8MVIBQW2gxUU5xPm(PSZhPAE8E1aGUwVubET9fwfqJWvxRxQ0tQhaLXpLrqkJN4KPa2xnkm6j1dqzaPu)2aOmNWGexDw3qWONupaLbKs9BdadvaCpWChYo8Ln6Ib3Pw2kmx4JbgolRA)2Jad5ipgMl8XG4K6bqzdikl5FBayqIaSfdpeF(k9ka)26qHQdVLR4H4ZxPxb43whsGrPN)ApAMGtbPfCWO0TtQWFlseBmubIpFIRa8BlsigCNQ5cFmWgn5lsedGix38RiHyeEHMxJrpGbNVHFMCDixAPm(PmhPmcszRO1GwFBaEZxXnvyBJlx38Rug)ugbPSZhPAE8E1aGUwVubET9fwfqJWvxRxQ0tQhaL5egK4QZ6gcg9K6bOmGuQFBay4SSQ9BpcmKJ8yWDQLTcZf(yGH5cFmioPEau2aIYs(3gaL5yHtyu65V2JMj4uqAbhmkD7Kk83IeXgdvaCpWChYo8Ln6Ib3PAUWhdSrZcoirmaICDZVIeIb3TCnCkmXva(TfJeyeEHMxJrpGbNVHFMCDixAPm(PmhPSv0AqRVnaV5R4MkSTXLRB(vkJFkZrkZrkR38LTH9Il1neJlx38Rug)uMFMCDixAyV4sDdXqC4vlTuMQCGYkOmNOm1QPmpaTHpviUSPmcWbklbL5eLXpL5iL5NjxhYLg2wOb(kdiLgWvixlR5runehE1slLPkkt1Om1QPm)m56qU0aK22wLbKcOubedXHxT0szQYbklPOmNOm(Pm)m56qU0qOTAjyfBQubyThydXHxT0szQIYiLY4NYiiLXtCYua7Rgfg9K6bOmGuQFBauMtyqIRoRBiy0tQhGYasP(TbGHkaUhyUdzh(YgDXG7ulBfMl8XadNLvTF7rGHCKhdZf(yqCs9aOSbeLL8VnakZXeoHbjcWwm8q85R0Ra8BRdfQo8wUIhIpFLEfGFBDibgLE(R9OzcofKwWbJs3oPc)TirSXqfi(8jUcWVTiHyWDQMl8XaBSXWCHpgHgwfkJpPLvY3mWxaLYuj5yJia]] )

    storeDefault( [[SimC Windwalker: serenity opener]], 'actionLists', 20171010.191005, [[diKLkaqisrArkQuBIuXOOO0POOQBPOc2LqnmK4yuyzkkptrvmnGu6AkQQ2MIQ03ifgNIkQZbKyDKIyEuuCpGY(OOYbfOfQapKImrsr5IKkTrGuCsb0ljfvZurf6MaStKAOkQklLu1tjMkG2Qa8vGK2R0Ff0GPYHbTyH8ysMSkUm0MrsFwHgTc60iETImBrDBvA3O8BunCsPLRQNtPPR01fX2bIVdunEGuDErA9kQiZxrLSFQ6AuGv0LbJY4PrveTOIaZK5eCjCwPNnVGsfA4fRiKRjVdujSd4W8e(AI3zXhzKn174Arg(v0JzeAXspJIHguaLzAepJIbOmRIOEI2TsLGQLWz2cS0gfyfDzWOmE6GkI6jA3kAQ3P9rqchvNyJ4LmIFOwy(6D64Did)X0yvY)iB9oW8oKH)yA8fc6ENoENAijwL8pYwVZmENH3PJ3PPExucvQXw8rgztJt06D64DkopF4GZIPsSRnKtnKAYNg)4fsywVZmG5DuQemIKjBALLmIFOwy(wX0qunbGdcEr22Oka4NaGpn8IvQei7quWL)vyCgwHgEXkajJ47DZhmFRe8hTvuPQmgUWFexlygv0JzeAXspJIHgguQOhT8KxH2cSBftPQmce(J4A7Gka4hA4fR0T0ZkWk6YGrz80bve1t0UvudjXxiO7DZbVtnKeRs(hzR3zoW8odVthVdz4pMgVKlgU8Wle09oZbM3rjE(RemIKjBAf4RGmmC5)JSTsGSdrbx(xHXzyfa8taWNgEXkvOHxSsWxbzO3bK)pY2k6XmcTyPNrXqddkv0JwEYRqBb2TIPHOAcahe8ISTrvaWp0WlwPBPNNcSIUmyugpDqfr9eTBffNNpCWzXuj21gYPgsn5tJF8cjmR3zoVZOsWisMSPvuWCoeQwcNfMj2TIPHOAcahe8ISTrvaWpbaFA4fRuHgEXkMG5S3fuTeoZ7MJe7wj4pARWGxeS5wixtEhOsyhWH5j81eVZKMn3v0JzeAXspJIHgguQOhT8KxH2cSBLazhIcU8VcJZWka4hA4fRiKRjVdujSd4W8e(AI3zsZ6wAqBbwrxgmkJNoOIOEI2TYYhhZySIZZho4mR3PJ3zwVtX55dhCwmvIDTHCQHut(04hVqcZ6DMZ7m8oZxjyejt20kw8rgztRei7quWL)vyCgwba)ea8PHxSsfA4fRi4JmYMwrpMrOfl9mkgAyqPIE0YtEfAlWUvmnevta4GGxKTnQca(HgEXkDl98xGv0LbJY4PdQiQNODRavlbemez4LGwVZmE384D64DrjuPgBXhzKnnorBLGrKmztR8elHngAtyHte1uftdr1eaoi4fzBJQaGFca(0WlwPsGSdrbx(xHXzyfA4fRONyjSrVtsyENMtutvc(J2kQuvgdx4pIRfmJk6XmcTyPNrXqddkv0JwEYRqBb2TIPuvgbc)rCTDqfa8dn8Iv6w65TaROldgLXthurupr7wjkHk1yl(iJSPXjARemIKjBAf7(KjmKtnChIHGtyNm)pvcKDik4Y)kmodRaGFca(0WlwPcn8IvK9jtO3XP6D7q07avc7K5)PIEmJqlw6zum0WGsf9OLN8k0wGDRyAiQMaWbbViBBufa8dn8Iv6wAnkWk6YGrz80bve1t0UvmR3PPEN2hbjCuDInIJYq1epzdNiQjVZ8ENoENz9oTpcs4O6eBeB3NmHHCQH7qmeCc7K5)X7mFLGrKmztReLHQjEYgorutvmnevta4GGxKTnQca(ja4tdVyLkbYoefC5FfgNHvOHxSYGmunXtwVtZjQPkb)rBfvQkJHl8hX1cMrf9ygHwS0ZOyOHbLk6rlp5vOTa7wXuQkJaH)iU2oOca(HgEXkDl9CUaROldgLXthurupr7wrX55dhCw8tSe2yOnHforutXpEHeM17mN3z4DZ1C5DrjuPgBXhzKnn(WbNvjyejt20kuj21gYPgsn5tRyAiQMaWbbViBBufa8taWNgEXkvOHxScOHyxR3XP6DGMKpTsWF0wHWw8)eTlygv0JzeAXspJIHgguQOhT8KxH2cSBLazhIcU8VcJZWka4hA4fR0T0GsbwrxgmkJNoOIOEI2TsucvQXw8rgztJpCWzENoENAijwL8pYwVZmG5DZ8oD8ofNNpCWzXw8rgztJF8cjmR3zgW8okENoEN2hbjCuDInIxYi(HAH5BLGrKmztReLHQjEYgorutvmnevta4GGxKTnQca(ja4tdVyLkbYoefC5FfgNHvOHxSYGmunXtwVtZjQjVZSgMVsWF0wrLQYy4c)rCTGzurpMrOfl9mkgAyqPIE0YtEfAlWUvmLQYiq4pIRTdQaGFOHxSs3sBqPaROldgLXthurupr7wrnKeRs(hzR3bM3zujyejt20klze)qTW8TIPHOAcahe8ISTrvaWpbaFA4fRujq2HOGl)RW4mScn8IvasgX37Mpy(6DM1W8vc(J2kQuvgdx4pIRfmJk6XmcTyPNrXqddkv0JwEYRqBb2TIPuvgbc)rCTDqfa8dn8Iv62TIMHuHj5Td62c]] )
    

    storeDefault( [[Windwalker Primary]], 'displays', 20170723.095210, [[da0iiaqlsLyxqrQHjvoMuAzsrpdkQPrQKUgPQABKQY3ivKXrQOohPczDKk19ivqhuQAHkYdjKjcfXfvHnQO8rfvgjPkojb9scWmLcUjb0oP0pHOHsshLubwkb6PGPcvxLuL2kPc1xvu1AHIK9kgSk1HLSyk8yuAYQKlR0MPsFgknAQ40i9Aiy2kCBsz3O63igoKoUuOLt0ZPQPRQRJITtO(ofnEOW5jX6Hq7xfDAdEa2c9Pe(mc)HxzSbqQx8geApc8Le7(QIvJrazXXUICwweYuGgzwMTFqXY1w(hGnGcsxx)(Ik0Ns4(y7cGbsxx)(Ik0Ns4(y7cGkPALurilHdue3y1FxankV)iwmhOrMLzVevOpLW9zkGcsxx)(4Le7((y7cOdywM1h8yBdEGdEzm2RmfON9Pe(5Ddu)hRohWwABaGQj68EEk)YSgiSsDFEJkxwIMr9beChB53yB21QV2UomhayLu0pWt1wDyx(yBg8ah8YySxzkqp7tj8Z7gO(pwDkGT02aavt0598u(LznqyL6(8(ADlMXhqWDSLFJTzxR(A76WC(8b8oetWK(So9hzkagiDD97JxsS77JTlG3HycM0N1PN5jzkWxsS73ZzDiYatiXXrkqbfoNEWdOeRU0uFDbWi2UacyvmO8lkh75n8kJn2MbqWONZ6qKbWrQkOW50dEawIMr9QIpIra2c9PeEpN1HidmHehhPadiIGQCEJtcmpLFzwdew55DpYJaEhIjGNPanYSmlMqLl7tj8ackCo9GhGZOjKLW9XQRb8O7ymBuEhrKbrg8avSTbKX2gaBSTbmITnFaVdXuuH(uc3NPayG011VFpJSITlqXilCf0nGbJRBaTcJEMNeBxGAG6u9dZsXRk(i22a1a1PahIPQ4JyBduduNserZOEvXhX2gWwABG5P8lZAGWkpVvLuTsQeOrgklc6yQhELXgOcudZsXRkwntbet9ud6G(k4kOBaJaSf6tj8(bflpGOdl(HGbUOE0rPGRGUbQayY6wmJptbKfh7IRGUbkd6G(kbkgzjqkFZuaaDzP1GIy9ucp2M6thfabJze(due3yBBgqbPRRFFH8lkB9ePp2Ua1a1PWlj29vfRgBBaJbfreNBqm7hJyeqUJaIoS4hcgWJUJXSr5DIrGAG6u4Le7(QIpITnaLLWXueIwST6pqJmlZEjKFrzRNi9zkGlH)boWavUEVzPeOyKLqUlbxbDdyW46g4lj29Nr4p8kJnas9I3Gq7rabwyq1y0oVXPABSyUlaLLWb0ILYXgR(daSsk6hiqnqDQ(HzP4vfRgBBGgzwM9silHdue3y1FxaujvRKkZi8hOiUX22maQCzjAg13R2qaGQj68EEk)YSgiSsDFEJkxwIMr9bmguerCUbXmgb0km6pITlaEnw(FEpNKWGgBxGVKy3xv8rmci4o2YVX2SRvN601UMy6wm3PZTb8oetbSkgu(fLJ1NPaAfgaESTbO8lkB9ezpN1HidiOW50dEavjvRKkN3Ik0Ns4N39mYkqa2c9Pe(mc)bkIBSTnduduNserZOEvXQX2gW7qmfYVOS1tK(mfOgOof4qmvfRgBBGAywkEvXhzkG3Hy2FKPaEhIPQ4JmfGLOzuVQy1yeabJze(hqf)8gkU)82wsjXmGcsxx)(cyYhRU0gabJze(dVYydGuV4ni0EeqJYb8y7c8Le7(Zi8hOiUX22mG3HyQkwntbyl0Ns4Zi8pGk(5nuC)5TTKsIzGIrwa6ogcXKy7cCWlJXELPaEQg6y7rEeBZakiDD973ZiRy7cGbsxx)(cyYhBBavjvRKkN3Ik0Ns4b(sIDFFGVKy3FgH)buXpVHI7pVTLusmdCTUfZ47vBiaq1eDEppLFzwdewPUpVVw3Iz8b8oeZEgzjK7sIraVdXSN5jzkG3HyIxsS77ZuGIrw9CwhImWesCCKcSHJz4bAKzz2Rze(due3yBBgadKUU(9fYVOS1tK(y7c0iZYSxcyYNPaAuEpZtITlqXil9YPFa0rPSY8ja]] )

    storeDefault( [[Windwalker AOE]], 'displays', 20170723.095210, [[da0diaqlssSlir1WKQoMuAzQipJQstJKKUgbyBuvPVrsKXrsuNJKqwhjPUhjbDqPYcvHhsqtesKlQiBur5Juv1ijP4KeQxsvfZKKQBsaTtQ8tiAOKYrjjWsjqpfmvO6QKuARKeQVcjSwirzVIbdHdlzXK4XO0KvPUSsBMQ8zi1OPOtJ0RvunBfUnPA3O63igouoovflNONtPPRQRJITtiFNcJhs68sX6vrTFvYPn4bylSNs4Zi8h(MXgaPAXvxSBkWxs07RjslkbKfh9k0CzNNJa(WSmB3GIMRV8paBGgKEE29fwypLWTX1havKEE29fwypLWTX1hWhMLzVfZs4a98gNa6dynjgDmYsm3JeLa(WSm7TWc7PeUnhbAq65z3hVKO33gxFavaZYS2GhxBWdmXlLXENJaDSpLWVqOo1(XPYbCL(gaO6cVqGck)2OgZxPQVqGjxwIUs9beChBz34o13632(EFdaSsk2h4P6RkSpFCNcEGjEPm27CeOJ9Pe(fc1P2povkGR03aavx4fcuq53g1y(kv9fI71RygFab3Xw2nUt9T(TTV3385dynjgGb9zn7MYraur65z3hVKO33gxFaRjXamOpRzhZtYrGIrwI5Ee8gSnGcJNxGM4uLt9ciGhH)bMqftUwRr1eWAsmWlj69T5iWCLooRjrgahPMGI9xn4byj6k1RjAkkbylSNs4DCwtImWbsCCKcmaGTS0AqpxpLWJ7KFvrbSMedaphb8HzzwuIkx2Ns4beuS)QbpaNrxmlHBJtvdyX2Xy2OSMcjdIm4bQ4AdOexBa0X1gqgxB(awtIHWc7PeUnhbqfPNND)ogzfxFGIrw4nyBafgpVa6fQDmpjU(a1aZS6ggvJvt0uCTbQbMzbMednrtX1gOgyMLqIUs9AIMIRnGR03aOGYVnQX8vEHOd5uGAyunwnrA5iGiQLQqh0VbVbBdOeGTWEkH3nOO5beo5WNemGpmu25QyQf(MXgOcCtTyJQbVbBdWgqwC0lEd2gOuOd63eOyKLaP8nhbqP1RygFocmxzgH)a98gx7Pani98S7lMFtzRNiTX1hqts1lzZfcHf2tj8leDmYkqaur65z3xm)MYwprAJRpGChbeo5WNemGfBhJzJYAgLa1aZSWlj691enfxBauJRpGpmlZElMFtzRNiT5iaLLWrzeIECTciGEHkGhxFGVKO3FgH)W3m2aivlU6IDtbeyHkvNr)cbovFJZ3(awtIrhZtIsaGvsX(awkh9ydudmZQByunwnrAX1gats1lzJywchON34eqFamjvVKnZi8hON34ApfatUSeDL670upaq1fEHafu(TrnMVsvFHatUSeDL6dqzjCaRyPC0XjGa6fQDtX1haVgl)Vq4VKWGfxFGVKO3xt0uucOjP6LS5cHWc7PeEGVKO33gqWDSLDJ7uFRk1RQ9Nq5T(2RYTbQbMzHxs07RjslU2a6uEhZtIZ3aSf2tj8ze(d0ZBCTNcOmONp7)Gy0ngrjW96vmJVtt9aavx4fcuq53g1y(kv9fI71RygFaRjXqm)MYwprAZrGAGzwcj6k1RjslU2a1WOASAIMYraRjXOBkkbSMednrt5ialrxPEnrArjqnWmlWKyOjslU2awtIHF2gfk)MYrBZrG5kZi8h(MXgaPAXvxSBkGoLd4X5BGVKO3FgH)a98gx7PaZvMr4Fan8leqXTxiCLusmcWwypLWNr4Fan8leqXTxiCLusmcumYcW2XqmkfxFGjEPm27CeWs1XgBhYP48nqdspp7(DmYkU(awtIHMiTCe4lj69Nr4Fan8leqXTxiCLusmcGkspp7((5WgxBGgKEE299ZHnovPnGYGE(S)dIrucOt5DtX5BGVKO3VJZAsKboqIJJuGck2F1GhOyKvhN1KidCGehhPavFAgEaFywM9EgH)a98gx7Pau(nLTEISJZAsKbeuS)QbpGpmlZE7NdBociKG1CHaNeafu(TrnMVYleDiNcumYsTC6haBunRmFca]] )

    storeDefault( [[Brewmaster Primary]], 'displays', 20170723.095210, [[d0ZGhaGEvHxsqSlej9AvrMjvLEmsnBf9BOUjKuxds4BQIkpNIDsQ9k2nj7hj9tvPHPGXHivBtvugkHgmsmCeoOu5Ois0XOshNsyHuXsjOwSuSCuEOuvpfSmPkRJsunrijtfIjtjnDLUOcDvcsxwLRRQ2ivvBfrkBMO2ob(ivfFgsnnvrvFNQmskrEgKOrtKXJiojI6wuIYPr15PuhwYArKWTLsh3GeGUiwow5hRwyTNxGxHI4lz9ya6Iy5yLFSAb(JlA3EbyLc91x6OFkobS4F)RBYrRAp1gGoG9RSS52(fXYXkt0dbi5vw2CB)Iy5yLj6Haw8V)zLmnwb8hx0OyiGrc719zfzLmonbS4F)ZA)Iy5yLjobSFLLn3Ium03AIEiaP8F)ZeKODdsGrv1mpRXjqh9YXkQu8LB2ODdOR2laQo56p3acFZRmx09gCFM7Wakda0moXgiB2agjSh4XxAPUX4eWiH96(loobmsypWJV0sD)fhNa1NvKvYyeBIlqZxwoGD0wwVNneqgR2aDmEnPsrxmg2lGrc7Hum03AItGNA6u0sywaKxrHj7JLqcqJBBQvuWyAcqxelhR6u0sywaNxeKxuhOpMWMkfeCah251wM9yuP09ogWiH9aK4eWI)9puXzh9YXQact2hlHeq9BjtJvMOrzadXnN(NLrQpEIzbjqfTBGMODdGoA3aSODZgWiH96xelhRmXjajVYYMB7(Sk6Ha1Nvi2exGMVSCG2IKU)IJEiqnjKQUPxzBefmgTBGAsivGe2tuWy0UbQjHu1h32uROGXODdGQtU(ZnobQPxzBefigNac4gEdFYxBeBIlqta6Iy5yv3KJwfO)Ogzu4aw850prACdS2ZlqfWk3qmlBeBIlqfGvk0hInXfOA4t(AhO(Sc1C1fNa6Q9c4WoV2YShJkfrgVTy2bEQXpwTa)XfTBVaK8klBULSYkNUwmZe9qargVTy2uP0ViwowrLs3Nvbcy)klBULSYkNUwmZe9qa2nd0FuJmkCGTyOV1pwTberOsbkLHkfDXyyVa1KqQqkg6BffmgTBaRNC9NBNOVbitAuP4WoV2YShZYPsbvNC9NBal(3)SswzLtxlMzItaonwrkW42ODrrGTyOVTtrlHzbCErqErTWK9Xsib2IH(w)y1cR98c8kueFjRhdG6IeE7VLkfeE7fnkhcWPXkGOO5k0rJIaanJtSbcutcPQB6v2grbIr7gGGXBlMnzASc4pUOrXqacgVTy2(XQf4pUOD7fGGD042MA7e9n6HaCLvoDTywNIwcZcimzFSesG2IKUXOhcGuZtTuP4dd)jIEiWwm03kkymnbe(MxzUO7n4(Cdp)qps1fLdKUBargVTy2uP0Viwowfylg6BnbAlsaKODdutcPcPyOVvuGy0UbA5QU)IJEiWwm03kkqmnbAM8hp8zI96MZ0eWiH9iRSYPRfZmXjqnjKQ(42MAffigTBGA6v2grbJXjGrc71ngNagjSNOGX4eGg32uROaX0eWiH9eYz3Wvw5k0M4e4Pg)y1gqeHkfOugQu0fJH9cqYRSS5wH4yI2nqlxbirpeylg6B9JvlWFCr72lGrc7jkqmobOlILJv(XQnGicvkqPmuPOlgd7fO(SciU5KmQIEiWOQAMN14eWWBjMx37y09cutcPcKWEIceJ2nG9RSS52UpRIEiWtn(XQfw75f4vOi(swpgGKxzzZTifd9TMOhcy)klBUvioMOTm3ant(Jh(mXEPjqlx1ngnkdqs096rQOiq9zvNIwcZc48IG8IAFh9JeWI)9pR(XQf4pUOD7fWqCZP)zzKstal(3)SkehtCcaehnVM8h1YXQO79mspq9zLqv8naXSSpw2e]] )

    storeDefault( [[Brewmaster AOE]], 'displays', 20170723.095210, [[d0tHhaGEvHxsqSlKu61QkmtQk9yKA2k8BOUjsIRjvPBlvEoP2jL2Ry3eTFe5NQsdtrnoKuSnKuzOeAWiQHJWbPshfjP6ysPJtsAHsXsjjwmfTCu9qPQEkyzQIwhvf1evv0uHyYKutxPlQixLQcxwLRdPnsv1wrsvBMcBNaFuQIpRQAAijX3PkJKG0ZiOgnjgVQsNejUfvf50OCEQ4Wswlss6BijLtBqcqxeldl9JLlSoJlWRpq8LIDkaDrSmS0pwUa7XfB7Za8s(F9vo6pstavrp0ZDW(LDNCdqhW51WqFB)IyzyPo25aFFnm032ViwgwQJDoGQOh6PMcnwcShxS9ohqRG9Cr5ffPboMbuf9qp19lILHL60eW51WqFlsX)Vvh7CaQo6HE6GeBBqcmjlZXPonbCPxgwsISVm9gBBaB1Db(8mk0XgqLBCL(I95Cl11oplCaGMZi2azZgqRG9ap2sR4oLMaAfSNl6IJzaTc2d8ylTIl6IttGT4)36kPvW8anViiVurfk9iuKaoX6tpN7nGbwUbC5SAqIST4CSxaTc2dP4)3QttGpmDL0kyEaKxrvO0JqrcqJ7mRvuWumdqxeldlDL0kyEGMxeKxQeOpMWHezeCGg(51v694Ki7(ofqRG9aK0eqv0d9(KXp6LHLbuHspcfjGeTJcnwQJv4aAIBm8pkTsF8aZdsGk22a8yBd8hBBaZyBZgqRG96xeldl1PjW3xdd9TUO8k25afkVqCiUaMOggb6QVUOlo25a1GqPChELJwuWuSTbQbHsbkyprbtX2gOgekvFCNzTIcMITnWNNrHo20eOgELJwuGyAciGPzMSbBDqCiUaMbOlILHLUd2Vmq)jlYKkbufLr)b1Z0W6mUava1mnXOCqCiUa0b4L8)qCiUaLjBWwNafkVOctEPjqht6IU4yfoWhM(XYfypUyBFgaioAwnypQLHLX(K6OMa1GqPqk()TIceJTnGZRHH(wks1m6AXCDSZb43iq)jlYKkb2I)FRFSCdiIqImusnjY2IZXEbQbHsHu8)BffmfBBa1NrHowxrFdqH6jrUHFEDLEpUptI8NNrHo2aQIEONAks1m6AXCDAcWOXsQkg3fBBVby0yjqu0m5FS9gyl()T(XYfwNXf41hi(sXofGk1xwhAhjYiSUlwHNd0vFbKyNda0CgXgqZK)Jlqniuk3Hx5OffigBBaMunJUwm3vsRG5buHspcfjabN1vCh)y5cShxSTpdqWpACNzTUI(g7CGVX(8j12BGU6R7uSZbqQXjxsK7HJrjIDoWw8)BffmfZaQCJR0xSpNBPAZuL5NuBRWZutBaroRR4oKi3Viwgwgyl()T6aeCwxXDOqJLa7XfBVZbe5SUI7qIC)IyzyjjYUO8kqGT4)3kkqmMbSv3fOHFEDLEpojYUVtbmhShp6zG9ChJygqRG9OivZORfZ1PjqniuQ(4oZAffigBBGA4voArbtPjGwb75ofZaAfSNOGP0eGg3zwROaXygqRG9eY5yYKQzYFDAc8HPFSCdiIqImusnjY2IZXEb((AyOVvin6yBd0XKasSchyl()T(XYfypUyBFgqRG9efiMMa0fXYWs)y5gqeHezOKAsKTfNJ9cuO8ciUXGYNXohyswMJtDAcOzDeJZ9DkwHdudcLcuWEIceJTnGZRHH(wxuEf7CGpm9JLlSoJlWRpq8LIDkW3xdd9Tif))wDSZbCEnm03kKgDS(uBaZb7XJEgyVygOJjDNIv4afkVOinWioexatudJafkVCL0kyEGMxeKxQ47KFKaQIEONA)y5cShxSTpdOjUXW)O0kXmGQOh6Pwin60e47RHH(wks1m6AXCDSZbkuE5djBdqmkNJNnba]] )

    storeDefault( [[Brewmaster Defensives]], 'displays', 20170723.095210, [[d0JChaGEfYlPKYUqK0RvqntQGdlz2k6Xi1nvLY1uq62svxwPDsXEf7gv7Nq9tvLHjL(nuJtvsgkjnykXWr4GsLJIirhJQCCcPfsPwkLKftLwoPEOc1tbltbwNQKYevLyQqAYiPPRYfvfxLq0ZuLQRdXgPI2kIu2mbBxv1hPc9ze10qKQVtvnscHTrjvJMeJhrCsK4wkionkNxkEorRfrcFtvs1XlObOlIJH5oX8dUM5g4tKOoqX8e4kn59u)vJBaDXjVJvw6HJDa3jB0ihNy)4gO5tqqU34I4yyUmM2aK8jii3BCrCmmxgtBarrwKLkfAmhyJ2ygm0a9mE3tmVhquKfzPoUiogMlJDGMpbb5EOLM8EYyAdqkrwKvg0y8cAGhE5oxQXoqh9XWCXwCGjVygeWu9BGxwHLlz)RmGv7Cl5gZGwpR712(EaGwZiUa5YfqQG9bF2rR09e7aK8jii3dT0K3tgtBaPc2h8zhTshYHJDGcrxu4cy0gInGlIGqGMygYaR3gGKygYRgqQdnGub7JwAY7jJDGHD740kyDa0pvRO4OiqdqJ7DRt9)jUbOlIJH5DCAfSoG9hk63BbaILMvt2O6yyEmdS(RcivW(aASdikYISVW0l9XW8awrXrrGgGJ0tHgZLX4fqsSZPZzjvgJNyDqduX4fqhJxaYX4fWngVCbKky)XfXXWCzSdqYNGGCVoeDftBGcrxOneBaxebHa9fjDihoM2a1KqP6M(vJu9)jgVa1KqPafSV6)tmEbQjHsng37wN6)tmEbmv)gWwV(9L8wTylVSclxY(xzGA6xns1F1yh4NjzUSj7AqBi2aUbOlIJH5DtgzEGXpg0hRcqLjjMvdAdXgGAaDXjVOneBGYLnzxtGcrxVX4BSdikcJEysJjHRzUbQad76eZpGnAJXRnWlRqHmVyhOMekfAPjVN6VAmEbA(eeK7rHtLrxhwlJPnGENbg)yqFSkGKyNtNZsQe3a1KqPqln59u)FIXlWvAY75eZVaQOITafxk2IP0ASFarrwKLkfovgDDyTm2b6lsa0y8cWOXCsbg3hZ7TbUstEpNy(bxZCd8jsuhOyEc8wrcRhPxSfuw)gZ7Tby0yoqu0mo5ygAaGwZiUabQjHs1n9RgP6VAmEbUstEVooTcwhW(df97nRO4OiqdqOz9LUXjMFaB0gJ3Gae6Lg37wxNQdX0gquKfz7MmY8(LFbOd0xK09etBa0AU8tSfh1yeIyAdCLM8EQ)pXnaJtLrxhw3XPvW6awrXrrGgWQDULCJzqR3R3s6TdivV3BFLxacnRV0nuOXCGnAJH0BdOQz9LUrSLXfXXWCXw6q0vGa9mEhYHJPnaDrCmm3jMFaB0gJ3GaUt2OrooX(DZzCdivW(u4uz01H1YyhG6kuiZRt1HauinXwS1RFFjVv)AIT8YkSCj7FLbQPF1iv)FIDGAsOuJX9U1P(RgJxaPc2x9)j2bOX9U1P(Rg3asfSV12gxgNkJtwg7asfSF3tSdmSRtm)cOIk2cuCPylMsRX(b6zCanM2axPjVNtm)a2OngVbbg21jMFW1m3aFIe1bkMNa0fXXWCNy(fqfvSfO4sXwmLwJ9dui6ci25KYlX0g4HxUZLASdiz9eZT77jMbbQjHsbkyF1F1y8c08jii3RdrxX0gqQG9v)vJDaPc2Vdrxu4c44gqvZ6lDJylJlIJH5bOUcfY8cqYNGGCpRzlJXlqZNGGCpRzlJziEbKky)oKdh7afIU640kyDa7pu0V3C4XjAarrwKLQtm)a2OngVbbeW8lqNMvtXwmLwJ9dikYISuTMTm2bi5tqqUhfovgDDyTmM2afIUejNDbiMvZQZLa]] )



    ns.initializeClassModule = MonkInit

end
