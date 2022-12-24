#プレイヤーID設定用
scoreboard objectives add player_id dummy "PlayerID"
#参加人数カウント
scoreboard objectives add player_count dummy
#アマスタ召喚
summon armor_stand ~2 ~ ~2 {Tags:["DummyPlayer","Id"],CustomName:'{"text":"Id"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
scoreboard players set @e[tag=DummyPlayer,tag=Id] player_count 0

scoreboard players set @a player_id 0

#デバック表示
#tellraw @a [{"text":"player_id:","color":"white"},{"score":{"name":"*","objective":"player_id"},"color":"gold"},{"text":", player_count:","color":"white"},{"score":{"name":"*","objective":"player_count"},"color":"gold"}]
scoreboard objectives setdisplay sidebar player_id
#scoreboard objectives setdisplay list player_count

function hsfunc:werewolf/role/player_score_id/init_update