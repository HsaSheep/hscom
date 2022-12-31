title @a[tag=wPlayer] title ["",{"text":"まもなく開始します…"}]
schedule clear hsfunc:werewolf/game/update/display_setting

function hsfunc:werewolf/player_score_id/set
function hsfunc:werewolf/role/set
schedule function hsfunc:werewolf/seer/set 2s append
schedule function hsfunc:werewolf/timer/update/start 3s append
schedule function hsfunc:werewolf/game/update/update 3s append