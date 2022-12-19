#画面表示
#tellraw @a ["",{"text":"！タイマー終了！","color":"dark_red"}]
title @a actionbar ["",{"text":"！タイマー終了！","color":"dark_red"}]

#タイマー設定画面の再表示
scoreboard objectives setdisplay sidebar list
#タイマーの時間の復元
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] time = @e[tag=DummyPlayer,tag=Timer] time_backup
function hsfunc:timer/update/timer_update_calculation
#タイマー開始フラグを0に
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_running 0
#効果音再生
function hsfunc:timer/update/timer_done_sound
schedule function hsfunc:timer/update/timer_done_sound 2t append
schedule function hsfunc:timer/update/timer_done_sound 4t append
