#プレイヤーID設定用
scoreboard objectives add player_id dummy "PlayerID"
#参加人数カウント
scoreboard objectives add player_count dummy

scoreboard players set @a player_id 0
scoreboard players set @a player_count 0

tellraw @s [{"text":"player_id:","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":", player_count:","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]