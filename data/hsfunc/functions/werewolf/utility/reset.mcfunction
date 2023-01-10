#各種ループ停止(endless以外)
schedule clear hsfunc:werewolf/utility/update_countdown
schedule clear hsfunc:werewolf/utility/update_day
schedule clear hsfunc:werewolf/utility/update_item
schedule clear hsfunc:werewolf/utility/update_setting
schedule clear hsfunc:werewolf/utility/update_time

#scoreboard初期化（初期値代入・コメントアウトは他所で初期化）
###プレイヤー関係
scoreboard players set @e p_id 0
scoreboard players set @e seer_id 0
scoreboard players set @e death_count 0
###ゲーム関係
scoreboard players set @e[tag=game] p_count 0
scoreboard players set @e[tag=game] r_set 0
scoreboard players set @e[tag=game] day 0
scoreboard players set @e[tag=game] night 0
scoreboard players set @e[tag=game] night_swap 1
scoreboard players set @e[tag=game] update 0
scoreboard players set @e[tag=game] setting_done 0
scoreboard players set @e[tag=game] num 0
###時間関係
scoreboard players set @e[tag=game] time 0
scoreboard players set @e[tag=game] time_total 0

#スコア表示削除
scoreboard objectives setdisplay sidebar 

#占い看板削除
execute if entity @e[tag=game] at @e[tag=game,limit=1] run fill ~-10 ~ ~-10 ~10 ~ ~10 air replace acacia_sign

#タグ初期化
execute if entity @e[tag=wolf] run tag @e[tag=wolf] remove wolf
execute if entity @e[tag=mani] run tag @e[tag=mani] remove mani
execute if entity @e[tag=vill] run tag @e[tag=vill] remove vill