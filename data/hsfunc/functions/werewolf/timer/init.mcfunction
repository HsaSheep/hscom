#タイマーの時間の設定
#変数の準備
scoreboard objectives add time dummy
scoreboard objectives add list dummy "--- タイマー設定 ---"
scoreboard objectives add 2 dummy
scoreboard objectives add 60 dummy
scoreboard objectives add timeM dummy
scoreboard objectives add timeS dummy
scoreboard objectives add time_day dummy
scoreboard objectives add time_night dummy
scoreboard objectives add time_day_first dummy
scoreboard objectives add time_night_first dummy
scoreboard objectives add night_now dummy
scoreboard objectives add night_now_swap dummy
scoreboard objectives add day_count dummy
scoreboard objectives add time_count dummy
#変数を保持するエンティティ準備
summon armor_stand ~ ~3 ~ {Tags:["DummyPlayer","Timer"],CustomName:'{"text":"Timer"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
#時間の初期設定
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] time 150
scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time_day = @e[tag=DummyPlayer,tag=Timer,limit=1] time
scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time_night = @e[tag=DummyPlayer,tag=Timer,limit=1] time
#初日の時間設定(0で通常通り)
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] time_day_first 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] time_night_first 0
#その他数値の初期化
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] 2 2
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] 60 60
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] timeM 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] timeS 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] night_now 0
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 0 run scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] night_now_swap 1
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] night_now matches 1 run scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] night_now_swap 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] day_count 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer,limit=1] time_count 0

#time_~_firstが0の時、time_~の値を代入
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] time_day_first matches 0 run scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time_day_first = @e[tag=DummyPlayer,tag=Timer,limit=1] time_day
execute if score @e[tag=DummyPlayer,tag=Timer,limit=1] time_night_first matches 0 run scoreboard players operation @e[tag=DummyPlayer,tag=Timer,limit=1] time_night_first = @e[tag=DummyPlayer,tag=Timer,limit=1] time_night
