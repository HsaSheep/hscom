#設定用スコア設定
scoreboard players set @e[tag=game] setting_done 0
scoreboard players set @e[tag=game] update 0
scoreboard players set "--update動作時間" wwlist 0
#設定中のサイドバーを設定
scoreboard objectives setdisplay sidebar wwlist

#GMへ設定項目を通知
##時間関係
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・時間設定： 初日昼 "},{"text":" +30秒 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] time_day_first 30"}},{"text": "    "},{"text":" -30秒 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] time_day_first 30"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・時間設定： 初日夜 "},{"text":" +30秒 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] time_night_first 30"}},{"text": "    "},{"text":" -30秒 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] time_night_first 30"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・時間設定：     昼 "},{"text":" +30秒 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] time_day 30"}},{"text": "    "},{"text":" -30秒 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] time_day 30"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・時間設定：     夜 "},{"text":" +30秒 ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] time_night 30"}},{"text": "    "},{"text":" -30秒 ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] time_night 30"}}]
##役職関係
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・役職設定：   人狼 "},{"text":"  + 1  ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] r_wolf 1"}},{"text": "    "},{"text":"  - 1  ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] r_wolf 1"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・役職設定：   狂人 "},{"text":"  + 1  ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] r_mani 1"}},{"text": "    "},{"text":"  - 1  ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] r_mani 1"}}]
#execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・役職設定：   吸血 "},{"text":"  + 1  ","color":"red","clickEvent":{"action":"run_command","value":"/scoreboard players add @e[tag=game,limit=1] r_drac 1"}},{"text": "    "},{"text":"  - 1  ","color":"blue","clickEvent":{"action":"run_command","value":"/scoreboard players remove @e[tag=game,limit=1] r_drac 1"}}]
#区切り
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":" ------------ "}]
##gameへテレポート、削除、作成呼出
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・集合場所: "},{"text":"---@e[tag=game]をここに移動--- ","color":"gold","clickEvent":{"action":"run_command","value":"/tp @e[tag=game,limit=1] @p[tag=gm]"}}]
##gameへテレポート、削除、作成呼出
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・削除関係: "},{"text":"---@e[tag=game]へ移動--- ","color":"green","clickEvent":{"action":"run_command","value":"/tp @p[tag=gm] @e[tag=game,limit=1]"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"            "},{"text":" ---ゲーム削除--- ","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/remove"}},{"text":" ---初期呼出--- ","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/init"}}]
##ゲーム開始、一時停止、ゲーム中止
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・  ゲーム: "},{"text":"---  開始  --- ","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard players set @e[tag=game,limit=1] setting_done 1"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・          "},{"text":"---一時停止--- ","color":"dark_purple","clickEvent":{"action":"run_command","value":"/scoreboard players set @e[tag=game,limit=1] update -1"}},{"text":" ---中断--- ","color":"dark_purple","clickEvent":{"action":"run_command","value":"/scoreboard players set @e[tag=game,limit=1] update 2"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]


#設定中のループを呼出
function hsfunc:werewolf/utility/update_setting