scoreboard players operation @s thie_id = @s seer_id
scoreboard players set @s seer_id 0

#怪盗が怪盗先のIDを持つ場合、thie_setタグ付与
execute if score @s[tag=thie,tag=!wolf,tag=!mani,tag=!drac] thie_id matches 1.. run tag @s add thie_set
#怪盗先のIDを持つプレイヤーにthie_targetタグ付与
execute if entity @s[tag=thie_set] as @a[tag=wwp,tag=!thie_set] if score @s p_id = @a[tag=thie_set,limit=1] thie_id run tag @s add thie_target
#怪盗先のプレイヤーにthie_doneタグ付与（役職表示用）
execute if entity @a[tag=thie_target] run tag @a[tag=thie_target] add thie_done

#thie_targetの役職ごとにタグを付与
execute if entity @a[tag=thie_target,tag=wolf,limit=1] run tag @s[tag=thie_set] add wolf
execute if entity @a[tag=thie_target,tag=mani,limit=1] run tag @s[tag=thie_set] add mani
execute if entity @a[tag=thie_target,tag=drac,limit=1] run tag @s[tag=thie_set] add drac

#thie_targetの役職を削除
execute if entity @a[tag=thie_target,tag=wolf,limit=1] run tag @a[tag=thie_target] remove wolf
execute if entity @a[tag=thie_target,tag=mani,limit=1] run tag @a[tag=thie_target] remove mani
execute if entity @a[tag=thie_target,tag=drac,limit=1] run tag @a[tag=thie_target] remove drac

#thie_setに役職を表示
execute if entity @a[tag=thie_target] as @s[tag=thie_set] run function hsfunc:werewolf/utility/role_tellraw

#thie_setを削除
execute if entity @s[tag=thie_set] run tag @s remove thie_set
execute if entity @a[tag=thie_target] run tag @a[tag=thie_target,limit=1] remove thie_target