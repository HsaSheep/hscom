# アイテム確認＞タグ確認＞表示
#読み込み確認
#execute at @a[scores={seer_id=0..}] run tell @s runned.
#アイテム所持判定>あればseer_setタグ付与
#give @p minecraft:stick{display:{Name:'{"text":"占い"}'}}
execute as @a[scores={seer_id=0..},nbt={Inventory:[{id:"minecraft:stick",tag:{display:{Name:'{"text":"占い"}'}}}]}] run tag @s add seer_set
#タグがある場合、対象から占いアイテム-1
execute as @a[tag=seer_set] run clear @s minecraft:stick{display:{Name:'{"text":"占い"}'}} 1
#占い先のIDを持つプレイヤーにseer_targetタグ付与
execute as @a[tag=seer_set,scores={seer_id=1}] run tag @a[scores={player_id=1}] add seer_target
#占い対象が実行する形でセレクトし占い実行者へ通知
execute as @a[tag=seer_target,tag=wolf] run tellraw @a[tag=seer_set] [{"text":"  [Seer]: "},{"selector":"@s"},{"text":"は"},{"text":"人狼","color":"red"},{"text":"です。","color":"white"}]
execute as @a[tag=seer_target,tag=!wolf] run tellraw @a[tag=seer_set] [{"text":"  [Seer]: "},{"selector":"@s"},{"text":"は"},{"text":"村人","color":"green"},{"text":"です。","color":"white"}]
#占い実行確認
#execute if entity @a[tag=seer_set] as @e[tag=Seer] run say 占い実行!
#execute as @e[tag=Seer] run tell @a[tag=seer_target] 占い対象!
#タグ、スコア初期化
tag @a remove seer_set
tag @a remove seer_target
execute at @a[scores={seer_id=0..}] run scoreboard players set @s seer_id 0