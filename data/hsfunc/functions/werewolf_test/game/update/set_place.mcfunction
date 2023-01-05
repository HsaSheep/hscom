summon armor_stand ~ ~1 ~ {Tags:["DummyPlayer","Game"],CustomName:'{"text":"人狼ゲーム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
execute as @e[tag=DummyPlayer,tag=Game] run tell @a[tag=GM] ゲーム地点を設定しました

execute as @e[tag=DummyPlayer,tag=Game] run tell @a[tag=GM] 開始前設定中（設定を表示します）
execute at @e[tag=DummyPlayer,tag=Game] run function hsfunc:werewolf_test/player_score_id/init
execute at @e[tag=DummyPlayer,tag=Game] run function hsfunc:werewolf_test/role/init
execute at @e[tag=DummyPlayer,tag=Game] run function hsfunc:werewolf_test/seer/init
execute at @e[tag=DummyPlayer,tag=Game] run function hsfunc:werewolf_test/timer/init

function hsfunc:werewolf_test/game/reset

function hsfunc:werewolf_test/setting