#say @a[tag=gm] seer_run
#アイテム所持判定>あればseer_setタグ付与
#give @p minecraft:blaze_rod{display:{Name:'{"text":"占い"}'}} 1
#give @p minecraft:blaze_rod{display:{Name:'{"text":"占い","color":"dark_purple","bold":true}'}} 64
#execute if entity @s[scores={seer_id=0..},nbt={Inventory:[{id:"minecraft:blaze_rod",tag:{display:{Name:'{"text":"占い"}'}}}]}] run tag @s add seer_set
execute if entity @s[scores={seer_id=0..},nbt={Inventory:[{id:"minecraft:blaze_rod"}]}] run tag @s add seer_set
#占い先のIDを持つプレイヤーにseer_targetタグ付与(プレイ人数分必要)
execute if entity @s[tag=seer_set,scores={seer_id=1}] run tag @p[scores={p_id=1}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=2}] run tag @p[scores={p_id=2}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=3}] run tag @p[scores={p_id=3}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=4}] run tag @p[scores={p_id=4}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=5}] run tag @p[scores={p_id=5}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=6}] run tag @p[scores={p_id=6}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=7}] run tag @p[scores={p_id=7}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=8}] run tag @p[scores={p_id=8}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=9}] run tag @p[scores={p_id=9}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=10}] run tag @p[scores={p_id=10}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=11}] run tag @p[scores={p_id=11}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=12}] run tag @p[scores={p_id=12}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=13}] run tag @p[scores={p_id=13}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=14}] run tag @p[scores={p_id=14}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=15}] run tag @p[scores={p_id=15}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=16}] run tag @p[scores={p_id=16}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=17}] run tag @p[scores={p_id=17}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=18}] run tag @p[scores={p_id=18}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=19}] run tag @p[scores={p_id=19}] add seer_target
execute if entity @s[tag=seer_set,scores={seer_id=20}] run tag @p[scores={p_id=20}] add seer_target
#占い対象が実行する形でセレクトし占い実行者へ通知
execute if entity @s[tag=seer_set] if entity @a[tag=seer_target,tag=wolf] run tellraw @s [{"text":" [Seer]: ","color": "dark_purple"},{"selector":"@p[tag=seer_target]"},{"text":"は"},{"text":"人狼","color":"red"},{"text":"です。","color":"white"}]
execute if entity @s[tag=seer_set] if entity @a[tag=seer_target,tag=!wolf] run tellraw @s [{"text":" [Seer]: ","color": "dark_purple"},{"selector":"@p[tag=seer_target]"},{"text":"は"},{"text":"村人","color":"green"},{"text":"です。","color":"white"}]
#占い実行確認
#execute if entity @a[tag=seer_set] as @e[tag=Seer] run say 占い実行!
#execute as @e[tag=Seer] run tell @a[tag=seer_target] 占い対象!
#execute as @p[scores={seer_id=0..},tag=!seer_set] run title @s actionbar {"text":"占いアイテムがありません。","color":"blue"}
#タグ、スコア初期化
#タグがある場合、対象から占いアイテム-1
execute if entity @a[tag=seer_set] if entity @a[tag=seer_target] run clear @s minecraft:blaze_rod 1
tag @a remove seer_set
tag @a remove seer_target
scoreboard players set @s seer_id 0