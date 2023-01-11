#say @a[tag=gm] id
execute if entity @a[tag=wwp,scores={p_id=0}] run scoreboard players add @e[tag=game] p_count 1
execute if entity @a[tag=wwp,scores={p_id=0}] run scoreboard players operation @a[tag=wwp,scores={p_id=0},sort=random,limit=1] p_id = @e[tag=game,limit=1] p_count
execute if entity @a[tag=wwp,scores={p_id=0}] run function hsfunc:werewolf/utility/id
#ID付け終わったらroleを呼出(functionで呼ぶと繰り返した回数だけ呼ばれるので、scheduleのreplaceで)
execute unless entity @a[tag=wwp,scores={p_id=0}] run tellraw @a[tag=gm] ["",{"text":"--- [ID設定完了:"},{"score":{"name": "@e[tag=game,limit=1]","objective": "p_count"},"color":"gold"},{"text":"] ---"}]
execute unless entity @a[tag=wwp,scores={p_id=0}] run title @a[tag=wwps] actionbar ["",{"text":"--- [ROLE設定] ---","color":"gold"}]
execute unless entity @a[tag=wwp,scores={p_id=0}] run schedule function hsfunc:werewolf/utility/role 3s replace