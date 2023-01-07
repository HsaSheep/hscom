#仮DP削除
execute if entity @e[tag=ww] run kill @e[tag=ww]
#DP召喚
summon armor_stand ~ ~ ~ {Tags:["dummy","ww","game"],CustomName:'{"text":"人狼ゲーム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
execute as @e[tag=game,limit=1] run tell @a[tag=gm] ゲーム地点を設定しました

#scoreboard初期化（宣言）
###プレイヤー関係
scoreboard objectives add p_id dummy
scoreboard objectives add seer_id dummy
scoreboard objectives add death_count deathCount
###ゲーム関係
scoreboard objectives add p_count dummy
scoreboard objectives add r_wolf dummy
scoreboard objectives add r_mani dummy
scoreboard objectives add day dummy
scoreboard objectives add night dummy
scoreboard objectives add night_swap dummy
scoreboard objectives add update dummy
scoreboard objectives add setting_done dummy
scoreboard objectives add num dummy
###時間関係
scoreboard objectives add time dummy
scoreboard objectives add time_total dummy
scoreboard objectives add countdown dummy
scoreboard objectives add 60 dummy
scoreboard objectives add time_day dummy
scoreboard objectives add time_night dummy
scoreboard objectives add time_day_first dummy
scoreboard objectives add time_night_first dummy
###時間関係(分)
scoreboard objectives add time_m dummy
scoreboard objectives add time_total_m dummy
scoreboard objectives add time_day_m dummy
scoreboard objectives add time_night_m dummy
scoreboard objectives add time_day_first_m dummy
scoreboard objectives add time_night_first_m dummy
###時間関係(秒)
scoreboard objectives add time_s dummy
scoreboard objectives add time_total_s dummy
scoreboard objectives add time_day_s dummy
scoreboard objectives add time_night_s dummy
scoreboard objectives add time_day_first_s dummy
scoreboard objectives add time_night_first_s dummy

#scoreboard初期化（初期値代入・コメントアウトはresetで初期化）
###プレイヤー関係
#scoreboard players reset @e p_id 
#scoreboard players reset @e seer_id
#scoreboard players reset @e death_count
###ゲーム関係
#scoreboard players reset @e p_count
scoreboard players set @e[tag=game] r_wolf 2
scoreboard players set @e[tag=game] r_mani 1
#scoreboard players reset @e day
#scoreboard players reset @e night
#scoreboard players reset @e night_swap
#scoreboard players reset @e update
#scoreboard players reset @e setting_done
#scoreboard players reset @e num
###時間関係
#scoreboard players set @e[tag=game] time 0
#scoreboard players reset @e[tag=game] time_total
#scoreboard players set @e[tag=game] countdown 3
scoreboard players set @e[tag=game] 60 60
scoreboard players set @e[tag=game] time_day 180
scoreboard players set @e[tag=game] time_night 180
scoreboard players set @e[tag=game] time_day_first 60
scoreboard players set @e[tag=game] time_night_first 180
###時間関係(分)
#scoreboard players reset @e time_total_m
scoreboard players reset @e time_m
scoreboard players reset @e time_day_m
scoreboard players reset @e time_night_m
scoreboard players reset @e time_day_first_m
scoreboard players reset @e time_night_first_m
###時間関係(秒)
#scoreboard players reset @e time_total_s
scoreboard players reset @e time_s
scoreboard players reset @e time_day_s
scoreboard players reset @e time_night_s
scoreboard players reset @e time_day_first_s
scoreboard players reset @e time_night_first_s

#reset呼出
function hsfunc:werewolf/utility/reset

#設定表示(時間以外)初期化
scoreboard objectives add wwlist dummy "---人狼ゲーム設定---"
scoreboard objectives setdisplay sidebar wwlist
scoreboard players reset @e wwlist

#設定中のループを呼出
function hsfunc:werewolf/utility/update_setting
#設定呼出
function hsfunc:werewolf/utility/setting