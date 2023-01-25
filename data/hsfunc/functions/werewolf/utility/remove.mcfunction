#ループ停止
function hsfunc:werewolf/utility/remove_update

#reset呼出
function hsfunc:werewolf/utility/reset

#スコアボード削除
###プレイヤー関係
scoreboard objectives remove p_id
scoreboard objectives remove seer_id
scoreboard objectives remove thie_id
scoreboard objectives remove death_count
scoreboard objectives remove damage_give
scoreboard objectives remove damage_taken
scoreboard objectives remove damage_resis
scoreboard objectives remove shop_rightClick
###アイテム関係
scoreboard objectives remove carrot_on_a_stick_rightClick
scoreboard objectives remove warped_fungus_on_a_stick_rightClick
###ゲーム関係
scoreboard objectives remove p_count
scoreboard objectives remove r_wolf
scoreboard objectives remove r_mani
scoreboard objectives remove r_drac
scoreboard objectives remove r_thie
scoreboard objectives remove r_vill
scoreboard objectives remove r_set
scoreboard objectives remove s_multi
scoreboard objectives remove s_count
scoreboard objectives remove s_posy
scoreboard objectives remove enable_vc
scoreboard objectives remove day
scoreboard objectives remove night
scoreboard objectives remove night_swap
#0/etc... 0…タイマー停止(ゲーム停止)、1…タイマー動作(ゲーム実行中)、2…ゲーム終了(gameset呼出、初期化へ)
scoreboard objectives remove update
#0/etc... 0…設定未完了、1…設定完了(ゲーム開始)
scoreboard objectives remove setting_done
scoreboard objectives remove num
###時間関係
scoreboard objectives remove 2
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

#アイテム削除
clear @a[tag=wwp]

#ゲームルール変更
gamemode survival @a[tag=!gm,tag=wwps]
gamemode creative @a[tag=gm]

#リセット通知
title @a[tag=wwps] actionbar ["",{"text": "-- ゲームを削除しました --"}]

#チーム削除
team remove wwt

#debugタグのエンティティがいる場合、debug/setting_giveを実行
execute as @a[tag=gm] run function hsfunc:werewolf/debug/setting_give

#タグ削除
execute as @e[tag=voice] run tag @s remove voice
execute as @e[tag=gm] run tag @s remove gm
execute as @e[tag=wwp] run tag @s remove wwp
execute as @e[tag=wws] run tag @s remove wws
execute as @e[tag=wwps] run tag @s remove wwps
execute as @e[tag=first] run tag @s remove first
execute as @e[tag=wwfirst] run tag @s remove wwfirst
execute as @e[tag=setting_first] run tag @s remove setting_first