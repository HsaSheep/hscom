#計算
scoreboard players operation "秒：" list = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation "秒：" list %= @e[tag=DummyPlayer,tag=Timer] 60
scoreboard players operation "分：" list = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation "分：" list /= @e[tag=DummyPlayer,tag=Timer] 60
#リスト更新
