execute if entity @e[tag=DummyPlayer,tag=Seer] run function hsfunc:werewolf/seer/reset
execute if entity @e[tag=DummyPlayer,tag=Seer] as @e[tag=DummyPlayer,tag=Seer,limit=1] run kill @e[tag=DummyPlayer,tag=Seer]
