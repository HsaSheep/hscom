execute unless entity @e[tag=debug] at @e[tag=game,limit=1] run summon armor_stand ~ ~3 ~ {Tags:["debug"],NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,CustomName:'{"text":"デバッグ","color":"gold","bold":true}'}
execute if entity @e[tag=debug,tag=kill] run kill @e[tag=debug,tag=kill]
execute if entity @e[tag=debug] run tag @e[tag=debug] add kill