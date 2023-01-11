#reset呼出
function hsfunc:werewolf/utility/reset

#無限ループ削除
schedule clear hsfunc:werewolf/utility/update_endless

#タグ削除
execute if entity @e[tag=gm] run tag @e[tag=gm] remove gm
execute if entity @e[tag=wwp] run tag @e[tag=wwp] remove wwp
execute if entity @e[tag=wws] run tag @e[tag=wws] remove wws
execute if entity @e[tag=wwps] run tag @e[tag=wwps] remove wwps
execute if entity @e[tag=first] run tag @e[tag=first] remove first
execute if entity @e[tag=wwfirst] run tag @e[tag=wwfirst] remove wwfirst

#スコアボード削除
###プレイヤー関係
scoreboard objectives remove p_id
scoreboard objectives remove seer_id
scoreboard objectives remove death_count
###ゲーム関係
scoreboard objectives remove p_count
scoreboard objectives remove r_wolf
scoreboard objectives remove r_mani
scoreboard objectives remove r_set
scoreboard objectives remove s_multi
scoreboard objectives remove s_count
scoreboard objectives remove day
scoreboard objectives remove night
scoreboard objectives remove night_swap
#0/etc... 0…タイマー停止(ゲーム停止)、1…タイマー動作(ゲーム実行中)、2…ゲーム終了(gameset呼出、初期化へ)
scoreboard objectives remove update
#0/etc... 0…設定未完了、1…設定完了(ゲーム開始)
scoreboard objectives remove setting_done
scoreboard objectives remove num
###時間関係
scoreboard objectives remove 60
scoreboard objectives remove 3600
scoreboard objectives remove time
scoreboard objectives remove time_total
scoreboard objectives remove countdown
scoreboard objectives remove time_day
scoreboard objectives remove time_night
scoreboard objectives remove time_day_first
scoreboard objectives remove time_night_first
###時間関係(時)
scoreboard objectives remove time_total_h
###時間関係(分)
scoreboard objectives remove time_m
scoreboard objectives remove time_total_m
scoreboard objectives remove time_day_m
scoreboard objectives remove time_night_m
scoreboard objectives remove time_day_first_m
scoreboard objectives remove time_night_first_m
###時間関係(秒)
scoreboard objectives remove time_s
scoreboard objectives remove time_total_s
scoreboard objectives remove time_day_s
scoreboard objectives remove time_night_s
scoreboard objectives remove time_day_first_s
scoreboard objectives remove time_night_first_s
###リスト削除
scoreboard objectives remove wwlist

#エンティティ削除
kill @e[tag=ww]

#チーム削除
team remove wwt

#ゲームルール変更
