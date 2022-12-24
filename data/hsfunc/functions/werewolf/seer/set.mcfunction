execute if entity @a[scores={player_id=1}] as @e[tag=DummyPlayer,tag=Seer,limit=1] run setblock ~1 ~ ~ acacia_sign destroy
execute if entity @a[scores={player_id=1}] as @e[tag=DummyPlayer,tag=Seer,limit=1] run data modify block ~1 ~ ~ Text2 set value '{"selector":"@a[scores={player_id=1}]","clickEvent":{"action":"run_command","value":""}}'
#execute if entity @e[tag=DummyPlayer,tag=Seer] as @e[tag=DummyPlayer,tag=Seer,limit=1] run tag @s add seerset
