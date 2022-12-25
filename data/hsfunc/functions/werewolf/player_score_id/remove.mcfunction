#プレイヤーID設定用
scoreboard players set @s player_id 0
#参加人数カウント
scoreboard players set @s player_count 0

#デバック表示
tellraw @a [{"text":"player_id:","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":", player_count:","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]