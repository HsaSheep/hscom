#Player1
execute if entity @a[scores={player_id=1}] as @e[tag=DummyPlayer,tag=Seer,limit=1] at @e[tag=DummyPlayer,tag=Seer,limit=1] run setblock ~5 ~ ~ acacia_sign destroy
execute if entity @a[scores={player_id=1}] as @e[tag=DummyPlayer,tag=Seer,limit=1] at @e[tag=DummyPlayer,tag=Seer,limit=1] run data modify block ~5 ~ ~ Text2 set value '{"selector":"@a[scores={player_id=1}]","clickEvent":{"action":"run_command","value":"scoreboard players operation @s seer_id = @a[scores={player_id=1}] player_id"}}'
execute if entity @a[scores={player_id=1}] as @e[tag=DummyPlayer,tag=Seer,limit=1] at @e[tag=DummyPlayer,tag=Seer,limit=1] run data modify block ~5 ~ ~ Text4 set value '{"text":"< 右クリックで占う >","clickEvent":{"action":"run_command","value":"function hsfunc:werewolf/seer/run"}}'

#Player2
execute if entity @a[scores={player_id=2}] as @e[tag=DummyPlayer,tag=Seer,limit=1] at @e[tag=DummyPlayer,tag=Seer,limit=1] run setblock ~5 ~ ~1 acacia_sign destroy
execute if entity @a[scores={player_id=2}] as @e[tag=DummyPlayer,tag=Seer,limit=1] at @e[tag=DummyPlayer,tag=Seer,limit=1] run data modify block ~5 ~ ~1 Text2 set value '{"selector":"@a[scores={player_id=2}]","clickEvent":{"action":"run_command","value":"say @p 2clicked."}}'


#execute if entity @e[tag=DummyPlayer,tag=Seer] as @e[tag=DummyPlayer,tag=Seer,limit=1] run tag @s add seerset
