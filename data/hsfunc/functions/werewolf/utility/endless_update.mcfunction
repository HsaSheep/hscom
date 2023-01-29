#エンティティ関係
##関係ないMOB(点火したTNT等)をキル
kill @e[type=!minecraft:player,type=!minecraft:arrow,type=!minecraft:snowball,type=!item,tag=]
##着弾した矢を削除
kill @e[type=minecraft:arrow,nbt={inGround:true}]
##バリアーブロックが落ちていたら削除
kill @e[nbt={"Item":{"tag":{"name":{"text":"no_use"},"can_place_on":{"blocks":["air"]},display:{Name:'{"text":"使用禁止","color":"red","bold":true}'}}}}]

#禁止領域以外に移動された場合の対応
#いらない？？

#Hotbarの禁止領域設定
item replace entity @a[tag=wwp,nbt=!{Inventory:[{Slot:7b,id:"minecraft:written_book"}]}] hotbar.7 with minecraft:barrier{"name":{"text":"no_use"},"can_place_on":{"blocks":["air"]},display:{Name:'{"text":"使用禁止","color":"red","bold":true}'}}
item replace entity @a[tag=wwp,nbt=!{Inventory:[{Slot:8b,id:"minecraft:written_book"}]}] hotbar.8 with minecraft:barrier{"name":{"text":"no_use"},"can_place_on":{"blocks":["air"]},display:{Name:'{"text":"使用禁止","color":"red","bold":true}'}}

#設定のエラー対応
##r_wolfが0の場合、1を代入
execute as @e[tag=game,limit=1] run execute if score @s r_wolf matches ..0 run scoreboard players set @s r_wolf 1
##r_maniが-1の場合、0を代入
execute as @e[tag=game,limit=1] run execute if score @s r_mani matches ..-1 run scoreboard players set @s r_mani 0
##r_dracが-1の場合、0を代入
execute as @e[tag=game,limit=1] run execute if score @s r_drac matches ..-1 run scoreboard players set @s r_drac 0
##r_thieが-1の場合、0を代入
execute as @e[tag=game,limit=1] run execute if score @s r_thie matches ..-1 run scoreboard players set @s r_thie 0
##time_dayが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_day matches ..0 run scoreboard players set @s time_day 30
##time_nightが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_night matches ..0 run scoreboard players set @s time_night 30
##time_day_firstが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_day_first matches ..0 run scoreboard players set @s time_day_first 30
##time_night_firstが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_night_first matches ..0 run scoreboard players set @s time_night_first 30

#次回呼出
schedule function hsfunc:werewolf/utility/endless_update 0.5s