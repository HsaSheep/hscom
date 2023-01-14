#num=0かつs_countがs_multiと同じだったら初期化
execute if score @e[tag=game,limit=1] num matches 0 if score @e[tag=game,limit=1] s_count = @e[tag=game,limit=1] s_multi run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count

#召喚
execute unless score @e[tag=game,limit=1] num matches 0 at @e[tag=game,limit=1] run summon skeleton ~ ~ ~ {DeathLootTable:"hsfunc:s_emerald",NoAI:0b,CanPickUpLoot:0b,Health:6f,Tags:["ww","ske","first"],Attributes:[{Name:"generic.attack_damage",Base:1}]}
#減算
execute unless score @e[tag=game,limit=1] num matches 0 run scoreboard players remove @e[tag=game,limit=1] num 1
#スポーンしたskeletonを指定(gameの周囲50x50)エリア内で拡散(最低1.0m間隔)
execute at @e[tag=game,limit=1] run spreadplayers ~11 ~41 1.0 145.0 false @e[tag=ske,tag=first]
#スポーンしたskeletonから初期タグ削除
tag @e[tag=ske,tag=first] remove first

#numが0以外の時、次回呼出
execute if score @e[tag=game,limit=1] num matches 1.. run function hsfunc:werewolf/utility/summon_ske
#num=0の時、s_countを1減算
execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players remove @e[tag=game] s_count 1
#num=0かつs_count=!0の時、numにp_countを代入
execute if score @e[tag=game,limit=1] num matches 0 unless score @e[tag=game,limit=1] s_count matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count
#num=p_countの時、scheduleで次回呼出
execute if score @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count run schedule function hsfunc:werewolf/utility/summon_ske 15s replace