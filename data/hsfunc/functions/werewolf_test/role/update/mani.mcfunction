execute if score @e[tag=Role,limit=1] role_mani matches 1.. run tag @r[tag=wPlayer,tag=!wolf,tag=!mani] add mani
execute if score @e[tag=Role,limit=1] role_mani matches 1.. run scoreboard players remove @e[tag=Role,limit=1] role_mani 1
execute if score @e[tag=Role,limit=1] role_mani matches 1.. run function hsfunc:werewolf_test/role/update/mani