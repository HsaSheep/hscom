#タイマーの時間の設定
#変数の準備
scoreboard objectives add time dummy
scoreboard objectives add list dummy "--- タイマー設定 ---"
scoreboard objectives add 60 dummy
scoreboard objectives add timeM dummy
scoreboard objectives add timeS dummy
#変数を保持するエンティティ準備
summon armor_stand ~2 ~ ~2 {Tags:["DummyPlayer","Timer"],CustomName:'{"text":"Timer"}',CustomNameVisible:false,Marker:true,Invisible:false,NoGravity:true}
scoreboard players set @e[tag=DummyPlayer,tag=Timer] time 150
scoreboard players set @e[tag=DummyPlayer,tag=Timer] 60 60
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timeM 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timeS 0
#表示の設定
scoreboard objectives setdisplay sidebar list
scoreboard players add "秒：" list 0
scoreboard players add "分：" list 0
#計算
function hsfunc:timer/update/update_calculation
#タイマー設定を表示
give @s written_book{title:"タイマー設定",author:"",pages:['[{"text":"-----タイマー開始-----\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/start"}},{"text":"\\n+ 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/add_60"}},{"text":"+30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/add_30"}},{"text":"-30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/rem_30"}},{"text":"- 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/rem_60"}},{"text":"\\n----Debug:3秒設定----\\n","color":"light_purple","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/set_3"}},{"text":"\\n-----タイマー再開-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/resume"}},{"text":"-----タイマー停止-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/stop"}},{"text":"\\n-----タイマー削除-----","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/setting_remove"}}]']}