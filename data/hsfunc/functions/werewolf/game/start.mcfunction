title @a[tag=wPlayer] title ["",{"text":"まもなく開始します…"}]
schedule clear hsfunc:werewolf/game/update/display_setting

scoreboard players set @a[tag=wPlayer] death 0
tp @a[tag=wPlayer] @e[tag=Game,limit=1]
function hsfunc:werewolf/player_score_id/set
schedule function hsfunc:werewolf/role/set 1s append
schedule function hsfunc:werewolf/seer/set 2s append
schedule function hsfunc:werewolf/timer/update/start 3s append
schedule function hsfunc:werewolf/game/update/update 4s append