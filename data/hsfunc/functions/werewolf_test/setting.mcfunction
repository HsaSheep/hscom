tellraw @a[tag=GM] "-----------ゲーム設定-----------"
#参加設定
tellraw @a ["",{"text":" 人狼ゲーム："},{"text":" 参加する ","color":"red","clickEvent":{"action":"run_command","value":"/execute as @p run function hsfunc:werewolf_test/player_tag/set"}}]
#タイマー設定
function hsfunc:werewolf_test/timer/setting
#役職設定
function hsfunc:werewolf_test/role/reset

#ゲーム関係
tellraw @a[tag=GM] ["",{"text":" ゲーム: "},{"text":" 開始 ","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf_test/game/start"}},{"text":" 中断 ","color":"blue","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf_test/game/end"}},{"text":" リセット ","color":"blue","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf_test/game/reset"}},{"text":" 削除 ","color":"blue","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf_test/setting_remove"}}]

#サイドバー表示
scoreboard objectives setdisplay sidebar wwsetting
function hsfunc:werewolf_test/game/update/update_setting