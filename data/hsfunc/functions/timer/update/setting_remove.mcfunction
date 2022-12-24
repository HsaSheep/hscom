tellraw @s ["",{"text":"--- タイマー設定を削除しました ---","color":"Yellow"}]
#ScoreboardのObjectives削除
scoreboard objectives remove time
scoreboard objectives remove list
scoreboard objectives remove 60
scoreboard objectives remove timeS
scoreboard objectives remove timeM
scoreboard objectives remove time_backup
scoreboard objectives remove timer_running
scoreboard objectives remove 2
scoreboard objectives remove timer_countdown
scoreboard objectives remove timer_countdown_odd

#エンティティ削除
kill @e[type=armor_stand,name="Timer"]
#コマンド本削除
clear @a written_book{title:"タイマー設定"}
#BossBar削除
function hsfunc:timer/bossbar/remove