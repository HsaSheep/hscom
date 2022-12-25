#night_now更新
scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] night_now >< @e[tag=DummyPlayer,tag=Timer,limit=1] night_now_swap

#day_count更新
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 0 run scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] day_count 1

#timer更新
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 0 run scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time = @e[tag=DummyPlayer,tag=Timer,limit=1] time_day
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 1 run scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time = @e[tag=DummyPlayer,tag=Timer,limit=1] time_night
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 1 run execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] day_count matches 1 run scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time = @e[tag=DummyPlayer,tag=Timer,limit=1] time_night_first

#分秒計算
function hsfunc:werewolf/timer/update/calculation

#bossbar設定
function hsfunc:werewolf/timer/bossbar/remove
schedule function hsfunc:werewolf/timer/bossbar/set 1t append

#update呼出
schedule function hsfunc:werewolf/timer/update/update 1s append