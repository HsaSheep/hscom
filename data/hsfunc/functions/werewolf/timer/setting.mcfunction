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
summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Timer"],CustomName:'{"text":"Timer"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
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

#表示の設定
#sidebar表示
#function hsfunc:werewolf/timer/update/calculation
#scoreboard objectives setdisplay sidebar list
#scoreboard players add "秒：" list 0
#scoreboard players add "分：" list 0
#actionbar表示
function hsfunc:werewolf/timer/update/display
#タイマー設定を表示
#give @s written_book{title:"タイマー設定",author:"",pages:['[{"text":"-----タイマー開始-----\\n","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/start"}},{"text":"\\n+ 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/add_60"}},{"text":"+30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/add_30"}},{"text":"-30秒\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/rem_30"}},{"text":"- 1分\\n","color":"dark_green","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/rem_60"}},{"text":"\\n----Debug:3秒設定----\\n","color":"light_purple","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/set_3"}},{"text":"\\n-----タイマー再開-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/resume"}},{"text":"-----タイマー停止-----\\n","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/stop"}},{"text":"\\n-----タイマー削除-----","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/remove"}}]']}
tellraw @a[tag=GM] "-----------タイマー設定-----------"
tellraw @a[tag=GM] ["",{"text":"   分: "},{"text":" +05 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 300"}},{"text":" +01 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 60"}},{"text":" -01 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 60"}},{"text":" -05 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 300"}}]
tellraw @a[tag=GM] ["",{"text":"   秒: "},{"text":" +30 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 30"}},{"text":" +01 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=DummyPlayer,tag=Timer,limit=1] time 1"}},{"text":" -01 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 1"}},{"text":" -30 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=DummyPlayer,tag=Timer,limit=1] time 30"}}]
tellraw @a[tag=GM] ["",{"text":" ---Debug:3秒設定---  ","color":"light_purple","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/chenge/set_3"}}]
tellraw @a[tag=GM] ["",{"text":" ---タイマー開始---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/start"}},{"text":"---タイマー削除---  ","color":"dark_red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/remove"}}]
tellraw @a[tag=GM] ["",{"text":" ---タイマー再開---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/resume"}},{"text":"---タイマー停止---  ","color":"gold","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/timer/update/stop"}}]