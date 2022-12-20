tellraw @s ["",{"text":"--- タイマー設定を削除しました ---","color":"Yellow"}]
#ScoreboardのObjectives削除
scoreboard objectives remove time
scoreboard objectives remove list
scoreboard objectives remove 60
#エンティティ削除
kill @e[type=armor_stand,name="Timer"]
#コマンド本削除
clear @a written_book{title:"タイマー設定"}
#BossBar削除
function hsfunc:timer/bossbar/remove