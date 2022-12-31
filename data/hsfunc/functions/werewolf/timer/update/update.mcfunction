#減算
scoreboard players remove @e[tag=DummyPlayer,tag=Timer] time 1

#表示更新
function hsfunc:werewolf/timer/update/calculation
function hsfunc:werewolf/timer/bossbar/update

#終了判定
##ゲーム終了判定
function hsfunc:werewolf/game/update
##runningフラグ確認-0判定
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_running matches 1 run execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run schedule function hsfunc:werewolf/timer/update/update 1s append
#execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run function hsfunc:werewolf/timer/update/done
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run function hsfunc:werewolf/timer/update/next_day
