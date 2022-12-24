function hsfunc:werewolf/seer/remove

summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Seer"],CustomName:'{"text":"Seer"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
#scoreboard players set @e[tag=DummyPlayer,tag=Id] player_count 0
