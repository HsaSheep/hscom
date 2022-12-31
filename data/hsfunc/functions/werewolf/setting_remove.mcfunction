say ゲーム設定を削除します。
function hsfunc:werewolf/timer/update/remove
function hsfunc:werewolf/role/remove
function hsfunc:werewolf/seer/remove
function hsfunc:werewolf/player_score_id/remove_all

schedule clear hsfunc:werewolf/game/update/update
scoreboard objectives setdisplay sidebar
kill @e[tag=DummyPlayer,tag=Game]