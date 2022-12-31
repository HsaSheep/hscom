scoreboard players set @a[tag=wPlayer] player_id 0 

#デバック表示
#tellraw @a [{"text":"player_id:","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":", player_count:","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]
#scoreboard objectives setdisplay sidebar player_id
#scoreboard objectives setdisplay sidebar player_id descending
#scoreboard objectives setdisplay list player_count

function hsfunc:werewolf/player_score_id/set_update