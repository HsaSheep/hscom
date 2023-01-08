#設定用スコア設定
scoreboard players set @e[tag=game] setting_done 0
scoreboard players set @e[tag=game] update 1

#設定中のサイドバーを設定
scoreboard objectives setdisplay sidebar wwlist

#GMへ設定項目を通知


#設定中のループを呼出
function hsfunc:werewolf/utility/update_setting