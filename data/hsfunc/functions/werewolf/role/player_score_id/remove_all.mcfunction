#プレイヤーID設定用
scoreboard objectives remove player_id
#参加人数カウント
scoreboard objectives remove player_count

#デバック表示
tellraw @a [{"text":"player_id:","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":", player_count:","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]