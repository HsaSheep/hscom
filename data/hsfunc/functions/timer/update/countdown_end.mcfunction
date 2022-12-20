#減算
scoreboard players remove @e[tag=DummyPlayer,tag=Timer] timer_countdown 1

#表示更新
function hsfunc:timer/update/update_calculation
title @a title ["",{"text":"--- START ---"}]
#サウンド再生
stopsound @a
playsound minecraft:block.anvil.use master @a ~ ~ ~ 0.5 1 0.5

#タイマー更新呼び出し
schedule function hsfunc:timer/update/update 1s append
