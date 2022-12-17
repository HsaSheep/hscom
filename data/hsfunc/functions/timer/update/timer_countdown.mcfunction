#減算・計算
scoreboard players remove @e[tag=DummyPlayer,tag=Timer] timer_countdown 1
#scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown_odd = @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown
#scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown_odd %= @e[tag=DummyPlayer,tag=Timer,limit=1] 2

#表示更新
title @a title ["",{"text":"--- "},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timer_countdown"}},{"text":" ---"}]
#サウンド再生
stopsound @a
playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.5 1 0.5
#奇数時
#execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown_odd matches 1.. run playsound minecraft:block.anvil.place master @a ~ ~ ~ 0.5 1 0.5
#偶数時
#execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdownodd matches 1.. run playsound minecraft:entity.cat.ambient master @a ~ ~ ~ 0.5 1 0.5

#更新、終了判定
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_running matches 1 run execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run schedule function hsfunc:timer/update/timer_countdown 1s append
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_running matches 1 run execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run schedule function hsfunc:timer/update/timer_countdown_end 1s append