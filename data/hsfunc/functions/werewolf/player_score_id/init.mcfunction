function hsfunc:werewolf/player_score_id/remove_all

#プレイヤーID設定用
scoreboard objectives add player_id dummy "PlayerID"
#参加人数カウント
scoreboard objectives add player_count dummy
#アマスタ召喚
summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Id"],CustomName:'{"text":"Id"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
scoreboard players set @e[tag=DummyPlayer,tag=Id] player_count 0
