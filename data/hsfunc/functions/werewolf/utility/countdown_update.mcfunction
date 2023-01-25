#カウントダウン秒数>numへ
execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game] num = @e[tag=game] countdown

#画面表示
title @a[tag=wwps] actionbar ["",{"text": "--- "},{"score":{"name": "@e[tag=game,limit=1]","objective": "num"}},{"text": " ---"}]
#サウンド再生
stopsound @a[tag=wwps]
#execute as @a[tag=wwps] run playsound minecraft:block.anvil.place master @s ~ ~ ~ 0.4 1 0.4
#bit(電子音)ド
execute as @a run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 1.0 0.7 1.0

#減算
scoreboard players remove @e[tag=game] num 1

#1秒後にもう次回呼出
schedule function hsfunc:werewolf/utility/update_countdown 1s replace
#1以下の場合、次回呼出をクリアし、1秒後にgamestartを呼出し、numを初期化
execute if score @e[tag=game,limit=1] num matches ..0 run schedule clear hsfunc:werewolf/utility/update_countdown
execute if score @e[tag=game,limit=1] num matches ..0 run schedule function hsfunc:werewolf/utility/gamestart 1s replace
execute if score @e[tag=game,limit=1] num matches ..0 run scoreboard players reset @e[tag=game] num