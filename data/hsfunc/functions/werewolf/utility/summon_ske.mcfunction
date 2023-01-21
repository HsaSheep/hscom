#num=0かつs_countがs_multiと同じだったら初期化
execute if score @e[tag=game,limit=1] num matches 0 if score @e[tag=game,limit=1] s_count = @e[tag=game,limit=1] s_multi run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count

#召喚
execute unless score @e[tag=game,limit=1] num matches 0 at @e[tag=game,limit=1] run summon skeleton ~ ~ ~ {DeathLootTable:"hsfunc:s_emerald2",NoAI:0b,CanPickUpLoot:0b,Health:6f,Tags:["ww","ske","first"],Attributes:[{Name:"generic.attack_damage",Base:1}]}
#tag=firstが付いたskeletonに透明化付与
execute as @e[tag=ske,tag=first] run effect give @s invisibility 1000000 0 true
#減算
execute unless score @e[tag=game,limit=1] num matches 0 run scoreboard players remove @e[tag=game,limit=1] num 1
#高さ座標をs_posyに保存
execute as @e[tag=ske,tag=!first] store result score @s s_posy run data get entity @s Pos[1]
#既定の高さにいない場合、firstタグ付与（再ワープ）
execute as @e[tag=ske,tag=!first] if score @s s_posy > @e[tag=ww,tag=game,limit=1] s_posy run tag @s add first
#スポーンしたskeletonを指定(gameの周囲50x50)エリア内で拡散(最低1.0m間隔)
execute at @e[tag=game,limit=1] run spreadplayers ~11 ~41 1.0 72.5 false @e[tag=ske,tag=first]
#スポーンしたskeletonから初期タグ削除
tag @e[tag=ske,tag=first] remove first
#tag=!firstのskeletonから透明化解除
execute as @e[tag=ske,tag=!first] run effect clear @s


#numが0以外の時、次回呼出
execute if score @e[tag=game,limit=1] num matches 1.. run function hsfunc:werewolf/utility/summon_ske
#num=0の時、s_countを1減算
execute if score @e[tag=game,limit=1] num matches ..0 run scoreboard players remove @e[tag=game] s_count 1
#num=0の時、numにp_countを代入
execute if score @e[tag=game,limit=1] num matches ..0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count
#num=p_countの時、scheduleで次回呼出
execute if score @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count run schedule function hsfunc:werewolf/utility/summon_ske 5s replace
execute if score @e[tag=game,limit=1] s_count matches ..0 run schedule clear hsfunc:werewolf/utility/summon_ske
execute if score @e[tag=game,limit=1] s_count matches ..0 run scoreboard players set @e[tag=ww,tag=game,limit=1] num 0
#デバック用（残り召喚回数表示）
#execute if score @e[tag=game,limit=1] num = @e[tag=game,limit=1] p_count run title @a[tag=wwps] actionbar ["",{"text": "-- SummonWave: "},{"score":{"name": "@e[tag=game,limit=1]","objective": "s_count"}},{"text": " --"}]