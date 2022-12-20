#

#次回の実行予約判定
schedule function hsfunc:timer/update 5t append
#execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_running matches 1 run execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run schedule function hsfunc:timer/update 1s append