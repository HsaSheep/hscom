#gamerule commandBlockOutput false
scoreboard objectives add timer dummy
scoreboard objectives add timerT dummy
summon armor_stand ~ ~ ~ {Tags:[timer],Marker:1b}
scoreboard objectives add 20 dummy
scoreboard players set @e[tag=timer] 20 20
#kill @e[tag=timer]

scoreboard players set @e[tag=timer] timerT 1200
scoreboard players operation @e[tag=timer] timer = @e[tag=timer] timerT
scoreboard players operation @e[tag=timer] timer /= @e[tag=timer] 20
title @a actionbar ["",{"score":{"name":"@e[tag=timer]","objective":"timer"}}]
scoreboard players remove @e[tag=timer,scores={timerT=0..}] timerT 1