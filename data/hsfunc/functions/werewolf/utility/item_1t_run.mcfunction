##snowball
#投げた本人に当たらないよう設定
#execute as @a[tag=wwp,scores={death_count=0,snowball_rightClick=1..}] run tag @s add use_snowball
#execute as @e[type=minecraft:snowball] unless entity @s[scores={p_id=1..}] run scoreboard players operation @s p_id = @a[tag=wwp,tag=use_snowball,sort=nearest,limit=1] p_id
#execute as @a[tag=use_snowball] run tag @s remove use_snowball
#hit判定
#execute as @e[type=minecraft:snowball,scores={p_id=1..}] at @s run tag @a[tag=wwp,scores={death_count=0},distance=..1] add hit_sb
execute as @e[type=minecraft:snowball] at @s run tag @a[tag=wwp,scores={death_count=0},distance=..1] add hit_sb
#当たった人処理
#execute as @e[type=snowball,scores={p_id=1..}] run tell @a use_snowball!
execute as @a[tag=hit_sb] run tell @a hit_sb!
#execute as @a[tag=hit_sb] at @s unless score @s p_id = @e[type=minecraft:snowball,scores={p_id=1..},distance=..1,limit=1] p_id run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1.0 0.5 0.0
execute as @a[tag=hit_sb] at @s run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1.0 0.5 0.0
#移動速度低下
#execute as @a[tag=hit_sb] at @s unless score @s p_id = @e[type=minecraft:snowball,scores={p_id=1..},distance=..1,limit=1] p_id run effect give @s minecraft:slowness 16 255 true
execute as @a[tag=hit_sb] at @s run effect give @s minecraft:slowness 16 255 true
#ジャンプ禁止
#execute as @a[tag=hit_sb] at @s unless score @s p_id = @e[type=minecraft:snowball,scores={p_id=1..},distance=..1,limit=1] p_id run effect give @s minecraft:jump_boost 16 200 true
execute as @a[tag=hit_sb] at @s run effect give @s minecraft:jump_boost 16 200 true
#暗転付与
#execute as @a[tag=hit_sb] at @s unless score @s p_id = @e[type=minecraft:snowball,scores={p_id=1..},distance=..1,limit=1] p_id run effect give @s minecraft:darkness 16 255 true
execute as @a[tag=hit_sb] at @s run effect give @s minecraft:darkness 16 255 true
#盲目付与
#execute as @a[tag=hit_sb] at @s unless score @s p_id = @e[type=minecraft:snowball,scores={p_id=1..},distance=..1,limit=1] p_id run effect give @s minecraft:blindness 16 255 true
execute as @a[tag=hit_sb] at @s run effect give @s minecraft:blindness 16 255 true
execute as @a[tag=hit_sb] run tag @s remove hit_sb
