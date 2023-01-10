#召喚
execute unless score @e[tag=game,limit=1] num matches 0 at @e[tag=game,limit=1] run summon skeleton ~ ~ ~ {DeathLootTable:"hsfunc:s_emerald",NoAI:0b,CanPickUpLoot:0b,Health:6f,Tags:["ww","ske"],Attributes:[{Name:"generic.attack_damage",Base:1}]}
#減算
scoreboard players remove @e[tag=game,limit=1] num 1

#num=0の時、s_multiを1減算
execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players remove @e[tag=game] s_count 1
#num=0かつs_multi=!0の時、numにp_countを代入
execute if score @e[tag=game,limit=1] num matches 0 unless score @e[tag=game,limit=1] s_count matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count
#numがp_countより小さい時、次回呼出
execute if score @e[tag=game,limit=1] num < @e[tag=game,limit=1] p_count run function hsfunc:werewolf/utility/summon_ske
#num=p_countの時、指定(gameの周囲50x50)エリア内で拡散(最低1.0m間隔)させ、scheduleで次回呼出
execute if score @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count at @e[tag=game,limit=1] run spreadplayers ~ ~ 1.0 25.0 false @e[tag=ske]
execute if score @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count run schedule function hsfunc:werewolf/utility/summon_ske 15s replace