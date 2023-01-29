execute if score @e[tag=ww,tag=game,limit=1] update matches 1 run function hsfunc:werewolf/utility/item_1t_run

#数値初期化
scoreboard players set @a[tag=wwp] snowball_rightClick 0

#次回呼出
schedule function hsfunc:werewolf/utility/item_1t_update 1t replace