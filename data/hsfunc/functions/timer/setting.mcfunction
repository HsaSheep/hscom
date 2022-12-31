#タイマーの時間の設定
#変数の準備
scoreboard objectives add time dummy
scoreboard objectives add list dummy "--- タイマー設定 ---"
scoreboard objectives add 60 dummy
scoreboard objectives add timeM dummy
scoreboard objectives add timeS dummy
#変数を保持するエンティティ準備
summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Timer"],CustomName:'{"text":"Timer"}',CustomNameVisible:false,Marker:true,Invisible:false,NoGravity:true}
scoreboard players set @e[tag=DummyPlayer,tag=Timer] time 150
scoreboard players set @e[tag=DummyPlayer,tag=Timer] 60 60
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timeM 0
scoreboard players set @e[tag=DummyPlayer,tag=Timer] timeS 0

#表示の設定
#sidebar表示
#function hsfunc:timer/update/calculation
#scoreboard objectives setdisplay sidebar list
#scoreboard players add "秒：" list 0
#scoreboard players add "分：" list 0
#actionbar表示
function hsfunc:timer/update/display
#タイマー設定を表示
#give @s written_book{title:"タイマー設定",author:"",pages:['[{"text":"-----タイマー開始-----\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/start"}},{"text":"\\n+ 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/add_60"}},{"text":"+30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/add_30"}},{"text":"-30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/rem_30"}},{"text":"- 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/rem_60"}},{"text":"\\n----Debug:3秒設定----\\n","color":"light_purple","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/set_3"}},{"text":"\\n-----タイマー再開-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/resume"}},{"text":"-----タイマー停止-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/stop"}},{"text":"\\n-----タイマー削除-----","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/remove"}}]']}
tellraw @a[tag=GM] "-----------タイマー設定-----------"
tellraw @a[tag=GM] ["",{"text":"   分: "},{"text":" +05 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 300"}},{"text":" +01 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 60"}},{"text":" -01 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 60"}},{"text":" -05 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 300"}}]
tellraw @a[tag=GM] ["",{"text":"   秒: "},{"text":" +30 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 30"}},{"text":" +01 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 1"}},{"text":" -01 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 1"}},{"text":" -30 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 30"}}]
tellraw @a[tag=GM] ["",{"text":" ---Debug:3秒設定---  ","color":"light_purple","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/chenge/set_3"}}]
#tellraw @a[tag=GM] ["",{"text":" ---タイマー開始---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/start"}},{"text":"---タイマー削除---  ","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/remove"}}]
#tellraw @a[tag=GM] ["",{"text":" ---タイマー再開---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/resume"}},{"text":"---タイマー停止---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:timer/update/stop"}}]