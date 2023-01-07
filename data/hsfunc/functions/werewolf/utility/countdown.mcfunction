#サイドバー表示削除
scoreboard objectives setdisplay sidebar
#参加者以外のチームメンバーをスペクテイターに
gamemode spectator @a[tag=wws]

#numを0に設定
scoreboard players set @e[tag=game] num 0
#update_countdownを呼出
function hsfunc:werewolf/utility/update_countdown