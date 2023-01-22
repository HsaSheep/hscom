scoreboard objectives add check_count dummy "positionカウント用"
tag @s add posi_check_tag

#shop
scoreboard players set @a[tag=posi_check_tag,limit=1] check_count 0
execute as @e[tag=ww_shop_position] run scoreboard players add @a[tag=posi_check_tag,limit=1] check_count 1
execute if entity @e[tag=ww_shop_position] run tellraw @a[tag=posi_check_tag,limit=1] ["",{"text": " ショップ地点は"},{"score":{"name": "@a[tag=posi_check_tag,limit=1]","objective": "check_count"}},{"text": "箇所設定済み"}]
#shop
scoreboard players set @a[tag=posi_check_tag,limit=1] check_count 0
execute as @e[tag=ww_isolate_position] run scoreboard players add @a[tag=posi_check_tag,limit=1] check_count 1
execute if entity @e[tag=ww_isolate_position] run tellraw @a[tag=posi_check_tag,limit=1] ["",{"text": " 隔離地点は"},{"score":{"name": "@a[tag=posi_check_tag,limit=1]","objective": "check_count"}},{"text": "/1箇所設定済み"}]
#shop
scoreboard players set @a[tag=posi_check_tag,limit=1] check_count 0
execute as @e[tag=ww_game_position] run scoreboard players add @a[tag=posi_check_tag,limit=1] check_count 1
execute if entity @e[tag=ww_game_position] run tellraw @a[tag=posi_check_tag,limit=1] ["",{"text": " ゲーム地点は"},{"score":{"name": "@a[tag=posi_check_tag,limit=1]","objective": "check_count"}},{"text": "/1箇所設定済み"}]

scoreboard objectives remove check_count
tag @s remove posi_check_tag