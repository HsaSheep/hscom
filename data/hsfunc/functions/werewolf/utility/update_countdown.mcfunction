#カウントダウン秒数>numへ
execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game] num = @e[tag=game] countdown

#画面表示

#減算
scoreboard players remove @e[tag=game] num 1
#1以上の場合、1秒後にもう一度呼出
execute if score @e[tag=game,limit=1] num matches 1.. run schedule function hsfunc:werewolf/utility/update_countdown 1s
#1以下の場合、1秒後にgamestartを呼出し、numを初期化
execute if score @e[tag=game,limit=1] num matches 1 run schedule function hsfunc:werewolf/utility/gamestart 1s
execute if score @e[tag=game,limit=1] num matches 1 run scoreboard players reset @e[tag=game] num