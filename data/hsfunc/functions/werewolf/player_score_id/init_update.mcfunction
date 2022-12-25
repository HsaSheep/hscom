#アドベンチャーモード　かつ　プレイヤータグあり　かつ　PlayerIDが0のプレイヤーがいる場合のみ実行
execute if entity @p[tag=wPlayer,scores={player_id=0}] run tag @p[tag=wPlayer,scores={player_id=0}] add pidset

#pidsetタグつきプレイヤーがいる場合
execute if entity @p[tag=pidset] as @p[tag=pidset] run tell @a "ID登録します。"

##PlayerCount+1
execute if entity @p[tag=pidset] run scoreboard players add @e[tag=DummyPlayer,tag=Id,limit=1] player_count 1
##対象プレイヤーのPlayerIDにPlayerCountを代入
execute if entity @p[tag=pidset] as @p[tag=pidset] run scoreboard players operation @s player_id = @e[tag=DummyPlayer,tag=Id,limit=1] player_count

##pidsetタグ削除
tag @a[tag=pidset] remove pidset

#アドベンチャーモード　かつ　プレイヤータグあり　かつ　PlayerIDが0のプレイヤーがいる場合もう一度実行
execute if entity @a[tag=wPlayer,scores={player_id=0}] run schedule function hsfunc:werewolf/player_score_id/init_update 1t append

#いない場合、終了表示
execute unless entity @a[tag=wPlayer,scores={player_id=0}] as @a[tag=wPlayer,scores={player_id=0}] run tellraw @s [{"text":"--PlayerID-- ","color":"white"},{"score":{"name":"@e[tag=DummyPlayer,tag=Id,limit=1]","objective":"player_count"},"color":"gold"},{"text":"人登録しました。","color":"white"}]
