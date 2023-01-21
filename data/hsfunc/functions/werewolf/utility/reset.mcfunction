#各種ループ停止(endless以外)
schedule clear hsfunc:werewolf/utility/update_countdown
schedule clear hsfunc:werewolf/utility/update_day
schedule clear hsfunc:werewolf/utility/update_setting
schedule clear hsfunc:werewolf/utility/update_time
schedule clear hsfunc:werewolf/utility/summon_ske

#scoreboard初期化（初期値代入・コメントアウトは他所で初期化）
###プレイヤー関係
scoreboard players set @e p_id 0
scoreboard players set @a seer_id 0
scoreboard players set @a thie_id 0
scoreboard players set @a death_count 0
scoreboard players set @a damage_give 0
scoreboard players set @a damage_taken 0
scoreboard players set @a damage_resis 0
scoreboard players set @a shop_rightClick 0
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

#bossbar削除
bossbar set hsfunc:werewolf/time_bar players
bossbar remove hsfunc:werewolf/time_bar

#占い看板削除
execute if entity @e[tag=game] at @e[tag=game,limit=1] run fill ~-10 ~ ~-10 ~10 ~ ~10 air replace acacia_sign

#モブ削除
##ske
execute if entity @e[tag=ske] run kill @e[tag=ske]
##shop
execute if entity @e[tag=shop_position] run function hsfunc:werewolf/shop/remove_shop

#タグ初期化
execute if entity @e[tag=wolf] run tag @e[tag=wolf] remove wolf
execute if entity @e[tag=mani] run tag @e[tag=mani] remove mani
execute if entity @e[tag=drac] run tag @e[tag=drac] remove drac
execute if entity @e[tag=thie] run tag @e[tag=thie] remove thie
execute if entity @e[tag=thie_done] run tag @e[tag=thie] remove thie_done
#execute if entity @e[tag=vill] run tag @e[tag=vill] remove vill

time set day

#tag=gameへtp
tp @a[tag=wwp] @e[tag=ww,tag=game,limit=1]

#gamemode変更
gamemode adventure @a[tag=wwp]