tag @a remove GM
tag @s add GM
tell @a[tag=GM] ゲームマスターに設定しました。

scoreboard objectives add wwsetting dummy "人狼ゲーム設定"
scoreboard objectives setdisplay sidebar wwsetting
scoreboard players set "参加者数：" wwsetting 0
scoreboard players set "人狼：" wwsetting 0
scoreboard players set "狂人：" wwsetting 0
scoreboard players set "昼時間：" wwsetting 0
scoreboard players set "夜時間：" wwsetting 0
scoreboard players set "初日昼時間：" wwsetting 0
scoreboard players set "初日夜時間：" wwsetting 0
scoreboard players set "---占い座標セット：" wwsetting 0
scoreboard players set "---役職座標セット：" wwsetting 0
scoreboard players set "---人数座標セット：" wwsetting 0
scoreboard players set "---時間座標セット：" wwsetting 0

#死亡判定用
scoreboard objectives add death_count deathCount "死亡回数"

#function hsfunc:werewolf/setting
tell @a[tag=GM] ゲーム地点（占い看板設置の中心点）に移動し、設定開始をクリックしてください。
tellraw @a[tag=GM] ["",{"text":" 設定開始: "},{"text":" 開始 ","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/game/update/set_place"}}]