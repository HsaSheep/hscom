#numを0に設定
scoreboard players set @e[tag=game] num 0
#(中断復帰用)
##スコア設定
scoreboard players set @e[tag=game] setting_done 1
scoreboard players set @e[tag=game] update 1
##サイドバー削除
scoreboard objectives setdisplay sidebar 
#update_countdownを呼出
function hsfunc:werewolf/utility/update_countdown