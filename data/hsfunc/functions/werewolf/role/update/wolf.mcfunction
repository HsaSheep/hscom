execute if score @e[tag=Role,limit=1] role_wolf matches 0.. run tag @r[tag=wPlayer,tag=!wolf,tag=!mani] add wolf
execute if score @e[tag=Role,limit=1] role_wolf matches 0.. run scoreboard players remove @e[tag=Role,limit=1] role_wolf 1
execute if score @e[tag=Role,limit=1] role_wolf matches 1.. run function hsfunc:werewolf/role/update/wolf