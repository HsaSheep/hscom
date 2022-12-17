#タイマーの時間の設定
#変数の準備
scoreboard objectives add timer_running dummy
scoreboard objectives add time_backup dummy
scoreboard objectives add timer_countdown dummy
scoreboard objectives add timer_countdown_odd dummy
scoreboard objectives add 2 dummy
#画面表示
scoreboard objectives setdisplay sidebar
tellraw @s ["",{"text":"---タイマー停止---","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/timer_done"}}]
#タイマー開始
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] time_backup 0
scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time_backup = @e[tag=DummyPlayer,tag=Timer,limit=1] time
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_running 1
#タイマー開始カウントダウン設定（カウントダウン秒数+1を記入、1で即開始）
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_countdown 4
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_countdown_odd 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer] 2 2
function hsfunc:timer/update/timer_countdown
