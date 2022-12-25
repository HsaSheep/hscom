#actionbar表示の停止
schedule clear hsfunc:werewolf/timer/update/display
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_running 1
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run function hsfunc:werewolf/timer/update/countdown
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run function hsfunc:werewolf/timer/update/countdown_end