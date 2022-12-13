#タイマーの時間の設定
#変数の準備
scoreboard objectives add time dummy
scoreboard objectives add list dummy "---タイマー設定---"
scoreboard objectives add 60 dummy
#変数を保持するエンティティ準備
summon armor_stand ~ ~ ~ {Tags:["DummyPlayer","Timer"],CustomName:Timer}
scoreboard players set @e[tag=DummyPlayer,tag=Timer] time 150
scoreboard players set @e[tag=DummyPlayer,tag=Timer] 60 60
#表示の設定
scoreboard objectives setdisplay sidebar list
scoreboard players add "分：" list 0
scoreboard players add "秒：" list 0
#計算
scoreboard players operation "分：" list = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation "分：" list /= @e[tag=DummyPlayer,tag=Timer] 60
scoreboard players operation "秒：" list = @e[tag=DummyPlayer,tag=Timer] time
scoreboard players operation "秒：" list %= @e[tag=DummyPlayer,tag=Timer] 60

#タイマーをセットさせる
tellraw @s ["",{"text":"--- タイマー設定 ---","color":"green"}]
tellraw @s ["",{"text":"+ 1分","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer] time 60"}}]
tellraw @s ["",{"text":"+30秒","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer] time 30"}}]
tellraw @s ["",{"text":"-30秒","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer] time 30"}}]
tellraw @s ["",{"text":"- 1分","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer] time 60"}}]