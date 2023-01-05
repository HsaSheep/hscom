function hsfunc:werewolf_test/role/remove

scoreboard objectives add role_wolf dummy "人狼の数"
scoreboard objectives add role_mani dummy "狂人の数"

summon armor_stand ~ ~2 ~ {Tags:["DummyPlayer","Role"],CustomName:'{"text":"Role"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}

scoreboard players set @e[tag=Role] role_wolf 2
scoreboard players set @e[tag=Role] role_mani 1

#function hsfunc:werewolf_test/role/reset

#scoreboard players set @e[tag=DummyPlayer,tag=Id] player_count 0