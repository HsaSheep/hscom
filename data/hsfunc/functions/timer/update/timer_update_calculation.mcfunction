#計算
#Seconds
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeS = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeS %= @e[tag=DummyPlayer,tag=Timer] 60
scoreboard players operation "秒：" list = @e[tag=DummyPlayer,tag=Timer] timeS

#Mimutes
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeM = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation @e[tag=DummyPlayer,tag=Timer] timeM /= @e[tag=DummyPlayer,tag=Timer] 60
scoreboard players operation "分：" list = @e[tag=DummyPlayer,tag=Timer] timeM

#リスト更新
