scoreboard players set @e[tag=DummyPlayer,tag=Timer] timer_running 1
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run function hsfunc:timer/update/timer_countdown
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timer_countdown matches 2.. run function hsfunc:timer/update/timer_countdown_end