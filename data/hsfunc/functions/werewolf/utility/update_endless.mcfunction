#エンティティ関係
##関係ないMOB(点火したTNT等)をキル
kill @e[type=!minecraft:player,type=!minecraft:arrow,type=!item,tag=!dummy,tag=!ww]
##着弾した矢を削除
kill @e[type=minecraft:arrow,nbt={inGround:true}]

#設定のエラー対応
##r_wolfが0の場合、1を代入
execute as @e[tag=game,limit=1] run execute if score @s r_wolf matches ..0 run scoreboard players set @s r_wolf 1
##r_maniが-1の場合、0を代入
execute as @e[tag=game,limit=1] run execute if score @s r_mani matches ..-1 run scoreboard players set @s r_mani 0
##r_dracが-1の場合、0を代入
#execute as @e[tag=game,limit=1] run execute if score @s r_drac matches ..-1 run scoreboard players set @s r_drac 0
##time_dayが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_day matches ..0 run scoreboard players set @s time_day 30
##time_nightが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_night matches ..0 run scoreboard players set @s time_night 30
##time_day_firstが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_day_first matches ..0 run scoreboard players set @s time_day_first 30
##time_night_firstが1以下の時、最低値を代入
execute as @e[tag=game,limit=1] run execute if score @s time_night_first matches ..0 run scoreboard players set @s time_night_first 30

#次回呼出
schedule function hsfunc:werewolf/utility/update_endless 1s