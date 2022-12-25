execute if entity @e[tag=DummyPlayer,tag=Role] run function hsfunc:werewolf/role/reset
execute if entity @e[tag=DummyPlayer,tag=Role] as @e[tag=DummyPlayer,tag=Role,limit=1] run kill @e[tag=DummyPlayer,tag=Role]
schedule clear hsfunc:werewolf/role/update/display

#scoreboardのobjective削除
scoreboard objectives remove role_wolf
scoreboard objectives remove role_mani