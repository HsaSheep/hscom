#say @a[tag=gm] seer_set
execute if entity @a[tag=wwp,scores={p_id=1}] at @e[tag=game,limit=1] run setblock ~ ~ ~-6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=1}] at @e[tag=game,limit=1] run data modify block ~ ~ ~-6 Text2 set value '{"selector":"@a[scores={p_id=1}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=1}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=1}] at @e[tag=game,limit=1] run data modify block ~ ~ ~-6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=2}] at @e[tag=game,limit=1] run setblock ~2 ~ ~-6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=2}] at @e[tag=game,limit=1] run data modify block ~2 ~ ~-6 Text2 set value '{"selector":"@a[scores={p_id=2}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=2}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=2}] at @e[tag=game,limit=1] run data modify block ~2 ~ ~-6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=3}] at @e[tag=game,limit=1] run setblock ~4 ~ ~-6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=3}] at @e[tag=game,limit=1] run data modify block ~4 ~ ~-6 Text2 set value '{"selector":"@a[scores={p_id=3}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=3}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=3}] at @e[tag=game,limit=1] run data modify block ~4 ~ ~-6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=4}] at @e[tag=game,limit=1] run setblock ~6 ~ ~-4 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=4}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~-4 Text2 set value '{"selector":"@a[scores={p_id=4}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=4}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=4}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~-4 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=5}] at @e[tag=game,limit=1] run setblock ~6 ~ ~-2 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=5}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~-2 Text2 set value '{"selector":"@a[scores={p_id=5}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=5}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=5}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~-2 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=6}] at @e[tag=game,limit=1] run setblock ~6 ~ ~ acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=6}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~ Text2 set value '{"selector":"@a[scores={p_id=6}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=6}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=6}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~ Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=7}] at @e[tag=game,limit=1] run setblock ~6 ~ ~2 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=7}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~2 Text2 set value '{"selector":"@a[scores={p_id=7}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=7}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=7}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~2 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=8}] at @e[tag=game,limit=1] run setblock ~6 ~ ~4 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=8}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~4 Text2 set value '{"selector":"@a[scores={p_id=8}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=8}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=8}] at @e[tag=game,limit=1] run data modify block ~6 ~ ~4 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=9}] at @e[tag=game,limit=1] run setblock ~4 ~ ~6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=9}] at @e[tag=game,limit=1] run data modify block ~4 ~ ~6 Text2 set value '{"selector":"@a[scores={p_id=9}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=9}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=9}] at @e[tag=game,limit=1] run data modify block ~4 ~ ~6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=10}] at @e[tag=game,limit=1] run setblock ~2 ~ ~6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=10}] at @e[tag=game,limit=1] run data modify block ~2 ~ ~6 Text2 set value '{"selector":"@a[scores={p_id=10}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=10}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=10}] at @e[tag=game,limit=1] run data modify block ~2 ~ ~6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=11}] at @e[tag=game,limit=1] run setblock ~ ~ ~6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=11}] at @e[tag=game,limit=1] run data modify block ~ ~ ~6 Text2 set value '{"selector":"@a[scores={p_id=11}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=11}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=11}] at @e[tag=game,limit=1] run data modify block ~ ~ ~6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=12}] at @e[tag=game,limit=1] run setblock ~-2 ~ ~6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=12}] at @e[tag=game,limit=1] run data modify block ~-2 ~ ~6 Text2 set value '{"selector":"@a[scores={p_id=12}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=12}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=12}] at @e[tag=game,limit=1] run data modify block ~-2 ~ ~6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=13}] at @e[tag=game,limit=1] run setblock ~-4 ~ ~6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=13}] at @e[tag=game,limit=1] run data modify block ~-4 ~ ~6 Text2 set value '{"selector":"@a[scores={p_id=13}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=13}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=13}] at @e[tag=game,limit=1] run data modify block ~-4 ~ ~6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=14}] at @e[tag=game,limit=1] run setblock ~-6 ~ ~4 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=14}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~4 Text2 set value '{"selector":"@a[scores={p_id=14}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=14}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=14}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~4 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=15}] at @e[tag=game,limit=1] run setblock ~-6 ~ ~2 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=15}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~2 Text2 set value '{"selector":"@a[scores={p_id=15}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=15}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=15}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~2 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=16}] at @e[tag=game,limit=1] run setblock ~-6 ~ ~ acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=16}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~ Text2 set value '{"selector":"@a[scores={p_id=16}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=16}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=16}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~ Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=17}] at @e[tag=game,limit=1] run setblock ~-6 ~ ~-2 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=17}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~-2 Text2 set value '{"selector":"@a[scores={p_id=17}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=17}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=17}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~-2 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=18}] at @e[tag=game,limit=1] run setblock ~-6 ~ ~-4 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=18}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~-4 Text2 set value '{"selector":"@a[scores={p_id=18}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=18}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=18}] at @e[tag=game,limit=1] run data modify block ~-6 ~ ~-4 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=19}] at @e[tag=game,limit=1] run setblock ~-4 ~ ~-6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=19}] at @e[tag=game,limit=1] run data modify block ~-4 ~ ~-6 Text2 set value '{"selector":"@a[scores={p_id=19}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=19}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=19}] at @e[tag=game,limit=1] run data modify block ~-4 ~ ~-6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

execute if entity @a[tag=wwp,scores={p_id=20}] at @e[tag=game,limit=1] run setblock ~-2 ~ ~-6 acacia_sign destroy
execute if entity @a[tag=wwp,scores={p_id=20}] at @e[tag=game,limit=1] run data modify block ~-2 ~ ~-6 Text2 set value '{"selector":"@a[scores={p_id=20}]","clickEvent":{"action":"run_command","value":"/scoreboard players operation @s seer_id = @a[scores={p_id=20}] p_id"}}'
execute if entity @a[tag=wwp,scores={p_id=20}] at @e[tag=game,limit=1] run data modify block ~-2 ~ ~-6 Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/seer_run"}}'

title @a[tag=wwps] actionbar ["",{"text":"--- [初期化完了] ---","color":"gold"}]
tellraw @a[tag=gm] ["",{"text":"--- [初期化完了"},{"text":"] ---"}]

#ゲームスタート時のみの初期化
#スコア関係
##death_countを0に
scoreboard players set @a death_count 0
##dayを0に
scoreboard players set @e[tag=game,limit=1] day 0
##timeを0に
scoreboard players set @e[tag=game,limit=1] time 0
##nightとnight_swapを入替(1日目昼をセットさせるupdate_day呼出のため)
scoreboard players operation @e[tag=game,limit=1] night >< @e[tag=game,limit=1] night_swap

#即時回復
effect give @a[tag=wwp] minecraft:instant_health 1 250 true

#アイテム初期化
clear @a[tag=wwp]
#テスト用アイテム
give @a[tag=wwp] minecraft:stick{display:{Name:'{"text":"木の棒","color":"dark_purple","bold":true}'},Unbreakable:1b,Enchantments:[{id:"minecraft:smite",lvl:1s},{id:"minecraft:knockback",lvl:1s}]} 1
give @a[tag=wwp] minecraft:blaze_rod{display:{Name:'{"text":"占い","color":"dark_purple","bold":true}'}} 64
##ちょっと強い弓
#give @a[tag=wwp] bow{display:{Name:'{"text":"弓","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の弓","color":"dark_purple"}','{"text":"※1発で壊れる","color":"dark_red"}']},Damage:384,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]} 10
##1撃の弓
give @a[tag=wwp] bow{display:{Name:'{"text":"弓","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の弓","color":"dark_purple"}','{"text":"※1発で壊れる","color":"dark_red"}']},Damage:384,Enchantments:[{id:"minecraft:sharpness",lvl:255s},{id:"minecraft:power",lvl:255s}]} 3
give @a[tag=wwp] arrow{display:{Name:'{"text":"矢","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の矢","color":"dark_purple"}','{"text":"弓がないと意味がない","color":"dark_purple"}']},PickupDelay:10000} 64
give @a[tag=wwp] netherite_axe{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"dark_red"}']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s},{id:"minecraft:power",lvl:255s}]} 3

#カウントダウン呼出
function hsfunc:werewolf/utility/countdown