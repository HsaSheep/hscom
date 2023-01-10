#スコアボード初期化(中断からの復帰考慮)
#scoreboard players set @e seer_id 0
scoreboard players set @e[tag=game] num 0
scoreboard players set @e[tag=game] setting_done 1
#サイドバー削除
scoreboard objectives setdisplay sidebar 
#update_countdownを呼出
function hsfunc:werewolf/utility/update_countdown