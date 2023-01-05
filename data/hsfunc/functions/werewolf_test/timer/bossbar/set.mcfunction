execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:werewolf_test/timer_bar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:werewolf_test/timer_bar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":0"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
#BossBarのセグメント数(Progressは1セグ)
#bossbar set hsfunc:werewolf_test/timer style progress
bossbar set hsfunc:werewolf_test/timer_bar style notched_6
#BossBar色および文字色(JSON指定しない場合用)
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 1 run bossbar set hsfunc:werewolf_test/timer_bar color purple
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 0 run bossbar set hsfunc:werewolf_test/timer_bar color yellow
#BossBar最大値設定
execute store result bossbar hsfunc:werewolf_test/timer_bar max run scoreboard players get @e[tag=DummyPlayer,tag=Timer,limit=1] time
#BossBarの可視化、対象者設定
bossbar set hsfunc:werewolf_test/timer_bar visible true
bossbar set hsfunc:werewolf_test/timer_bar players @a
#名称、Barの値設定
function hsfunc:werewolf_test/timer/bossbar/update
