#減算
scoreboard players remove @e[tag=DummyPlayer,tag=Timer] time 1

#表示更新
function hsfunc:timer/timer_update_calculation
#title @a actionbar ["",{"score":{"name":"秒：","objective":"list"}},{"text":":"},{"score":{"name":"秒：","objective":"list"}}]
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run title @a actionbar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run title @a actionbar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":0"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]

#デバック表示
#tellraw @a ["",{"text":"TimerRunning:"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timer_running"}},{"text":", Timer:"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"time"}},{"text":", TimeM:"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":", TimeS:"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]

#終了判定
##runningフラグ確認-0判定
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_running matches 1 run execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run schedule function hsfunc:timer/timer_update 1s append
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] time matches 1.. run function hsfunc:timer/timer_done