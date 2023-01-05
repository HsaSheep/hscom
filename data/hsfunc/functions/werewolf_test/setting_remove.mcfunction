say ゲーム設定を削除します。
function hsfunc:werewolf_test/timer/update/remove
function hsfunc:werewolf_test/role/remove
function hsfunc:werewolf_test/seer/remove
function hsfunc:werewolf_test/player_score_id/remove_all

schedule clear hsfunc:werewolf_test/game/update/update
scoreboard objectives setdisplay sidebar
kill @e[tag=DummyPlayer,tag=Game]