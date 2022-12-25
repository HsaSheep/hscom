#計算
#Seconds
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeS = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeS %= @e[tag=DummyPlayer,tag=Timer] 60

#Mimutes
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeM = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeM /= @e[tag=DummyPlayer,tag=Timer] 60

#リスト更新
#sidebar表示
#scoreboard players operation "秒：" list = @e[tag=DummyPlayer,tag=Timer] timeS
#scoreboard players operation "分：" list = @e[tag=DummyPlayer,tag=Timer] timeM