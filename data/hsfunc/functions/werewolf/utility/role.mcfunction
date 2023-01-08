#r_setが0の時、numにr_wolfを代入し、r_setを1にする。
execute if score @e[tag=game,limit=1] r_set matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_wolf
execute if score @e[tag=game,limit=1] r_set matches 0 run scoreboard players set @e[tag=game,limit=1] r_set 1

#r_setが1の時、numが1以上ならtag=wolfをランダムに与え、numを-1する。numが1以下ならnumにr_maniを代入し、r_setを2にする。
execute if score @e[tag=game,limit=1] r_set matches 1 run tag @a[tag=wwp,tag=!wolf,tag=!mani,sort=random,limit=1] add wolf
execute if score @e[tag=game,limit=1] r_set matches 1 run scoreboard players remove @e[tag=game,limit=1] num 1
execute if score @e[tag=game,limit=1] r_set matches 1 run execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_mani
execute if score @e[tag=game,limit=1] r_set matches 1 run execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players set @e[tag=game,limit=1] r_set 2

#r_setが2の時、numが1以上ならtag=maniをランダムに与え、numを-1する。numが1以下ならnumに0を代入し、r_setを3にする。
execute if score @e[tag=game,limit=1] r_set matches 2 run tag @a[tag=wwp,tag=!wolf,tag=!mani,sort=random,limit=1] add mani
execute if score @e[tag=game,limit=1] r_set matches 2 run scoreboard players remove @e[tag=game,limit=1] num 1
#execute if score @e[tag=game,limit=1] r_set matches 2 run execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players operation @e[tag=game,limit=1] num = @e[tag=game,limit=1] r_mani
execute if score @e[tag=game,limit=1] r_set matches 2 run execute if score @e[tag=game,limit=1] num matches 0 run scoreboard players set @e[tag=game,limit=1] r_set 3

#役職付けが終了していない場合、もう一度呼出。
execute unless score @e[tag=game,limit=1] r_set matches 3 run function hsfunc:werewolf/utility/role
#すべて終了したらnumを0にし、scheduleのreplaceで次の処理を呼出
execute if score @e[tag=game,limit=1] r_set matches 3 run scoreboard players set @e[tag=game,limit=1] num 0
execute if score @e[tag=game,limit=1] r_set matches 3 run title @a[tag=wwps] actionbar ["",{"text":"--- [設定完了、SEER設定] ---","color":"gold"}]
execute if score @e[tag=game,limit=1] r_set matches 3 run schedule function hsfunc:werewolf/utility/seer_set 1t replace