tag @a remove wolf
tag @a remove mani

tellraw @a[tag=GM] ["",{"text":" 人狼: "},{"text":" +1 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Role,limit=1] role_wolf 1"}},{"text":" -1 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Role,limit=1] role_wolf 1"}}]
tellraw @a[tag=GM] ["",{"text":" 狂人: "},{"text":" +1 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Role,limit=1] role_mani 1"}},{"text":" -1 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Role,limit=1] role_mani 1"}}]

#debug表示
#function hsfunc:werewolf/role/update/display