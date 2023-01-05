title @a[tag=wPlayer] title ["",{"text":"まもなく開始します…"}]
schedule clear hsfunc:werewolf_test/game/update/display_setting

scoreboard players set @a[tag=wPlayer] death_count 0
tp @a[tag=wPlayer] @e[tag=Game,limit=1]
gamemode adventure @a[tag=wPlayer]
function hsfunc:werewolf_test/player_score_id/set
schedule function hsfunc:werewolf_test/role/set 1s append
schedule function hsfunc:werewolf_test/seer/set 2s append
schedule function hsfunc:werewolf_test/timer/update/start 3s append
schedule function hsfunc:werewolf_test/game/update/update 7s append