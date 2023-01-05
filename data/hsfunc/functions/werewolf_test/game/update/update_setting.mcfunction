#管理用アーマースタンド確認
execute if entity @e[tag=DummyPlayer,tag=Seer,limit=1] run scoreboard players set "---占い座標セット：" wwsetting 0
execute unless entity @e[tag=DummyPlayer,tag=Seer,limit=1] run scoreboard players set "---占い座標セット：" wwsetting -1
execute if entity @e[tag=DummyPlayer,tag=Role,limit=1] run scoreboard players set "---役職座標セット：" wwsetting 0
execute unless entity @e[tag=DummyPlayer,tag=Role,limit=1] run scoreboard players set "---役職座標セット：" wwsetting -1
execute if entity @e[tag=DummyPlayer,tag=Id,limit=1] run scoreboard players set "---人数座標セット：" wwsetting 0
execute unless entity @e[tag=DummyPlayer,tag=Id,limit=1] run scoreboard players set "---人数座標セット：" wwsetting -1
execute if entity @e[tag=DummyPlayer,tag=Timer,limit=1] run scoreboard players set "---時間座標セット：" wwsetting 0
execute unless entity @e[tag=DummyPlayer,tag=Timer,limit=1] run scoreboard players set "---時間座標セット：" wwsetting -1

#その他数値
scoreboard players operation "参加者数：" wwsetting = @e[tag=DummyPlayer,tag=Id,limit=1] player_count
scoreboard players operation "人狼：" wwsetting = @e[tag=DummyPlayer,tag=Role,limit=1] role_wolf
scoreboard players operation "狂人：" wwsetting = @e[tag=DummyPlayer,tag=Role,limit=1] role_mani
scoreboard players operation "昼時間：" wwsetting = @e[tag=DummyPlayer,tag=Timer,limit=1] time_day
scoreboard players operation "夜時間：" wwsetting = @e[tag=DummyPlayer,tag=Timer,limit=1] time_night
scoreboard players operation "初日昼時間：" wwsetting = @e[tag=DummyPlayer,tag=Timer,limit=1] time_day_first
scoreboard players operation "初日夜時間：" wwsetting = @e[tag=DummyPlayer,tag=Timer,limit=1] time_night_first


schedule function hsfunc:werewolf_test/game/update/update_setting 1s