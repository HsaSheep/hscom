#carrot_on_a_stick
execute as @a[tag=wwp,scores={death_count=0}] if score @s carrot_on_a_stick_rightClick matches 1.. run tag @s add using_carrot_on_a_stick
#execute if entity @a[tag=using_carrot_on_a_stick] as @a[tag=using_carrot_on_a_stick] run tell @s carrot_on_a_stick
execute if entity @a[tag=using_carrot_on_a_stick] as @a[tag=using_carrot_on_a_stick] run scoreboard players set @s carrot_on_a_stick_rightClick 0
execute if entity @a[tag=using_carrot_on_a_stick] as @a[tag=using_carrot_on_a_stick] run clear @s carrot_on_a_stick 1
execute if entity @a[tag=using_carrot_on_a_stick] as @a[tag=using_carrot_on_a_stick] run effect give @a[tag=wwp,tag=!using_carrot_on_a_stick] minecraft:glowing 60 255 true
execute if entity @a[tag=using_carrot_on_a_stick] as @a[tag=using_carrot_on_a_stick] run tag @s remove using_carrot_on_a_stick

#carrot_on_a_stick
execute as @a[tag=wwp,scores={death_count=0}] if score @s warped_fungus_on_a_stick_rightClick matches 1.. run tag @s add using_warped_fungus_on_a_stick
#execute if entity @a[tag=using_warped_fungus_on_a_stick] as @a[tag=using_warped_fungus_on_a_stick] run tell @s warped_fungus_on_a_stick
execute if entity @a[tag=using_warped_fungus_on_a_stick] as @a[tag=using_warped_fungus_on_a_stick] run scoreboard players set @s warped_fungus_on_a_stick_rightClick 0
execute if entity @a[tag=using_warped_fungus_on_a_stick] as @a[tag=using_warped_fungus_on_a_stick] run clear @s warped_fungus_on_a_stick 1
execute if entity @a[tag=using_warped_fungus_on_a_stick] as @a[tag=using_warped_fungus_on_a_stick] at @a[tag=using_warped_fungus_on_a_stick] run kill @p[tag=drac,distance=..7]
execute if entity @a[tag=using_warped_fungus_on_a_stick] as @a[tag=using_warped_fungus_on_a_stick] run tag @s remove using_warped_fungus_on_a_stick

#次回呼出
schedule function hsfunc:werewolf/utility/update_item 10t replace