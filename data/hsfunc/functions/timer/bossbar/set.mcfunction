execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:timer_bar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:timer_bar ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":0"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
#BossBarのセグメント数(Progressは1セグ)
#bossbar set hsfunc:timer style progress
bossbar set hsfunc:timer_bar style notched_6
#BossBar色および文字色(JSON指定しない場合用)
bossbar set hsfunc:timer_bar color white
#最大値設定
execute store result bossbar hsfunc:timer_bar max run scoreboard players get @e[tag=DummyPlayer,tag=Timer,limit=1] time
#BossBarの可視化、対象者設定
bossbar set hsfunc:timer_bar visible true
bossbar set hsfunc:timer_bar players @a
#名称、Barの値設定
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar set hsfunc:timer_bar name ["",{"text":"--- 残り ","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"},"color":"white"},{"text":" ---","color":"white"}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar set hsfunc:timer_bar name ["",{"text":"--- 残り ","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"},"color":"white"},{"text":" ---","color":"white"}]
execute store result bossbar hsfunc:timer_bar value run scoreboard players get @e[tag=DummyPlayer,tag=Timer,limit=1] time