execute if entity @e[tag=DummyPlayer,tag=Seer] run tag @e[tag=DummyPlayer,tag=Seer,limit=1] add seerreset
execute if entity @e[tag=seerreset] as @e[tag=seerreset,limit=1] run fill ~-10 ~ ~-10 ~10 ~ ~10 air replace acacia_sign
#execute if entity @e[tag=seerreset] as @e[tag=seerreset,limit=1] run say @s Test
execute if entity @e[tag=seerreset] as @e[tag=seerreset,limit=1] run kill @s