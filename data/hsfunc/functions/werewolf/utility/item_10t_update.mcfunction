execute if score @e[tag=ww,tag=game,limit=1] update matches 1 run function hsfunc:werewolf/utility/item_10t_run

#item関係score初期化
##アイテム使用回数初期化（待機中の使用対応用）
scoreboard players set @a[tag=wwp] carrot_on_a_stick_rightClick 0
scoreboard players set @a[tag=wwp] warped_fungus_on_a_stick_rightClick 0
scoreboard players set @a[tag=wwp] use_axe 0
##与、受、防ダメージ初期化
scoreboard players set @a[tag=wwp] damage_give 0
scoreboard players set @a[tag=wwp] damage_taken 0
scoreboard players set @a[tag=wwp] damage_resis 0

#次回呼出
schedule function hsfunc:werewolf/utility/item_10t_update 10t replace