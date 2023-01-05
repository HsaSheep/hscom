tell @a[tag=GM] 初期化します…
scoreboard players set @a[tag=wPlayer] death_count 0
function hsfunc:werewolf_test/player_score_id/set
schedule function hsfunc:werewolf_test/role/reset 3s append
schedule function hsfunc:werewolf_test/seer/reset 4s append
tell @a[tag=GM] 初期化完了！