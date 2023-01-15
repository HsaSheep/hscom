#tellraw @a[tag=gm] ["",{"text":"--- [ROLE設定:"},{"score":{"name": "@e[tag=game,limit=1]","objective": "r_set"},"color": "gold"},{"text":"/"},{"score":{"name": "@e[tag=game,limit=1]","objective": "num"},"color": "gold"},{"text":"] ---"}]
#r_setが0の時、numを0に
execute if score @e[tag=game,limit=1] r_set matches 0 run scoreboard players set @e[tag=game,limit=1] num 0
#r_setが0の時、タグ初期化（途中抜け終了した場合のため）
execute if score @e[tag=game,limit=1] r_set matches 0 run tag @a[tag=wwp] remove wolf
execute if score @e[tag=game,limit=1] r_set matches 0 run tag @a[tag=wwp] remove mani
execute if score @e[tag=game,limit=1] r_set matches 0 run tag @a[tag=wwp] remove drac
#numが0の時、r_setに+1する。
execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players add @e[tag=game,limit=1] r_set 1

#人狼処理
##r_setが1でnumが0の時、r_wolfを代入
execute if score @e[tag=game,limit=1] r_set matches 1 if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_wolf
##r_setが1かつnum>1の時、tag=wolfをランダムに与える。
execute if score @e[tag=game,limit=1] r_set matches 1 if score @e[tag=game,limit=1] num matches 1.. run tag @a[tag=wwp,tag=!wolf,sort=random,limit=1] add wolf

#狂人処理
##r_setが2でnumが0の時、r_maniを代入
execute if score @e[tag=game,limit=1] r_set matches 2 if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_mani
##r_setが2かつnum>1の時、tag=maniをランダムに与える。
execute if score @e[tag=game,limit=1] r_set matches 2 if score @e[tag=game,limit=1] num matches 1.. run tag @a[tag=wwp,tag=!wolf,tag=!mani,sort=random,limit=1] add mani

#吸血処理
##r_setが3でnumが0の時、r_dracを代入
execute if score @e[tag=game,limit=1] r_set matches 3 if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_drac
##r_setが3かつnum>1の時、tag=dracをランダムに与える。
execute if score @e[tag=game,limit=1] r_set matches 3 if score @e[tag=game,limit=1] num matches 1.. run tag @a[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,sort=random,limit=1] add drac

#役職付けが終了していない場合、numを-1し、もう一度呼出。
execute unless score @e[tag=game,limit=1] r_set matches 4 unless score @e[tag=game,limit=1] num matches 0 run scoreboard players remove @e[tag=game,limit=1] num 1
execute unless score @e[tag=game,limit=1] r_set matches 4 run function hsfunc:werewolf/utility/role
#すべて終了したらnumを0にし、scheduleのreplaceで次の処理を呼出
execute if score @e[tag=game,limit=1] r_set matches 4 run scoreboard players set @e[tag=game,limit=1] num 0
execute if score @e[tag=game,limit=1] r_set matches 4 run title @a[tag=wwps] actionbar ["",{"text":"--- [ROLE設定完了] ---","color":"gold"}]
execute if score @e[tag=game,limit=1] r_set matches 4 run schedule function hsfunc:werewolf/utility/seer_set 3s replace