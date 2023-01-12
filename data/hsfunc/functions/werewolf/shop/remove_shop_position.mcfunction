execute as @s at @s run data modify entity @e[tag=shop_position,sort=nearest,limit=1] Invisible set value true
execute as @s at @s run kill @e[tag=shop_position,sort=nearest,limit=1]
