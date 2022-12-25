tellraw @s ["",{"text":"--- タイマー設定を削除しました ---","color":"Yellow"}]
#ScoreboardのObjectives削除
#setting
scoreboard objectives remove time 
scoreboard objectives remove list
scoreboard objectives remove 2 
scoreboard objectives remove 60 
scoreboard objectives remove timeM 
scoreboard objectives remove timeS 
scoreboard objectives remove time_day 
scoreboard objectives remove time_night 
scoreboard objectives remove time_day_first 
scoreboard objectives remove time_night_first 
scoreboard objectives remove night_now 
scoreboard objectives remove day_count 
scoreboard objectives remove time_count 
#countdown
scoreboard objectives remove timer_countdown
scoreboard objectives remove timer_countdown_odd
#start
scoreboard objectives remove time_backup
scoreboard objectives remove timer_running

#actionbar表示の停止
schedule clear hsfunc:werewolf/timer/update/display

#エンティティ削除
kill @e[type=armor_stand,name="Timer"]
#コマンド本削除
#clear @a written_book{title:"タイマー設定"}
#BossBar削除
function hsfunc:werewolf/timer/bossbar/remove