tell @a[tag=GM] 初期化します…
function hsfunc:werewolf/player_score_id/set
schedule function hsfunc:werewolf/role/reset 3s append
schedule function hsfunc:werewolf/seer/reset 4s append
tell @a[tag=GM] 初期化完了！