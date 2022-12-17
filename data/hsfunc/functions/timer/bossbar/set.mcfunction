execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:timer ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar add hsfunc:timer ["",{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"}},{"text":":0"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"}}]
#BossBarのタイプ、色、最大値設定
bossbar set hsfunc:timer style progress
bossbar set hsfunc:timer color white
execute store result bossbar hsfunc:timer max run scoreboard players get "@e[tag=DummyPlayer,tag=Timer]" time
#BossBarの可視化、対象者設定
bossbar set hsfunc:timer visible true
bossbar set hsfunc:timer players @a
#名称、Barの値設定
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar set hsfunc:timer name ["",{"text":"--- 残り ","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"},"color":"white"},{"text":" ---","color":"white"}]
execute unless score @e[tag=DummyPlayer,tag=Timer,limit=1] timeS matches 10.. run bossbar set hsfunc:timer name ["",{"text":"--- 残り ","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeM"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Timer,limit=1]","objective":"timeS"},"color":"white"},{"text":" ---","color":"white"}]
execute store result bossbar hsfunc:timer value run scoreboard players get "@e[tag=DummyPlayer,tag=Timer]" time