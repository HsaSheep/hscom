#PlayerIDがPlayerCountを超えているプレイヤーがいた場合、0に
execute if score "*" player_id > "*" player_count run tellraw @s [{"text":"--PlayerID-- プレイヤーIDの最大値がカウントを超えているため、初期化します。","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":":","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]
execute if score "*" player_id > "*" player_count run scoreboard players set @a[gamemode=creative,tag=wPlayer] player_id 0

#アドベンチャーモード　かつ　プレイヤータグあり　かつ　PlayerIDが0のプレイヤーがいる場合のみ実行
execute if entity @a[gamemode=creative,tag=wPlayer,scores={player_id=0}] run tag @r[gamemode=creative,tag=wPlayer,scores={player_id=0}] add pidset

#pidsetタグつきプレイヤーがいる場合
##PlayerCount+1
execute if entity @a[tag=pidset] run scoreboard players add "*" player_count 1
##対象プレイヤーのPlayerIDにPlayerCountを代入
execute if entity @a[tag=pidset] run scoreboard players operation @a[tag=pidset] player_id = "*" player_count
##pidsetタグ削除
tag @a[tag=pidset] remove pidset

#アドベンチャーモード　かつ　プレイヤータグあり　かつ　PlayerIDが0のプレイヤーがいる場合もう一度実行
execute if entity @a[gamemode=creative,tag=wPlayer,scores={player_id=0}] run function hsfunc:werewolf/role/player_score_id/set

#いない場合、終了表示
execute unless entity @a[gamemode=creative,tag=wPlayer,scores={player_id=0}] run tellraw @s [{"text":"--PlayerID-- ","color":"white"},{"score":{"name":"@s","objective":"player_count"},"color":"gold"},{"text":"人登録しました。","color":"white"}]
