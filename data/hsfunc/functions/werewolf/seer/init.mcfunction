function hsfunc:werewolf/seer/remove

scoreboard objectives add seer_id dummy "占い対象ID"
scoreboard players set @a seer_id 0
#scoreboard players operation @s seer_id = @a[scores={player_id=1}] player_id
summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Seer"],CustomName:'{"text":"Seer"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
#scoreboard players set @e[tag=DummyPlayer,tag=Id] player_count 0
