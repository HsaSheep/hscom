#特定タグ保持プレイヤーのゲームモードをスペクテイターにし、チームから離脱、タグ削除する(参加取消用)
gamemode spectator @a[tag=leave]
team leave @a[tag=leave]
tag @a[tag=leave] remove wwp
tag @a[tag=leave] remove wws
tag @a[tag=leave] remove wwps
tag @a[tag=leave] remove leave

#ワールド参加者へゲーム名通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"\n\n\n\n"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"-------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"          HsCom 人狼ゲーム","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"-------------------------------------------","color":"gold"}]
#プレイヤーへ参加するか通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"   --- 参加 ---","color":"green","clickEvent":{"action":"run_command","value":"/execute if entity @s[tag=!wwp] run tag @s add wwp"}},{"text":"   "},{"text":"--- 観戦 ---","color":"blue","clickEvent":{"action":"run_command","value":"/execute if entity @s[tag=!wws] run tag @s add wws"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]
#すべてのプレイヤーにfirstタグ付与
tag @a[tag=!first] add first

#wwpまたはwwsタグのプレイヤーにwwpsタグ付与
tag @a[tag=wwp,tag=!wwfirst] add wwps
tag @a[tag=wws,tag=!wwfirst] add wwps

#wwpsタグのプレイヤーをtp、ゲームモード変更
tp @a[tag=wwps,tag=!wwfirst] @e[tag=ww,tag=game,limit=1]
gamemode adventure @a[tag=wwps,tag=!wwfirst]

#wwpチーム参加、通知
team join wwt @a[tag=wwp,tag=!wwfirst]
execute if entity @a[tag=voice] as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--Forge--","color": "gold","clickEvent": {"action": "open_url","value": "https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.3-44.1.0/forge-1.19.3-44.1.0-installer.jar"}},{"text": "および","color": "white"},{"text": "--SVChat--","color": "gold","clickEvent": {"action": "open_url","value": "https://www.curseforge.com/minecraft/mc-mods/simple-voice-chat/download/4332116"}},{"text": "を導入してください。","color": "white"}]
execute unless entity @a[tag=voice] as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"指定された通話に参加してください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--- 参加取消 ---","color":"red","clickEvent":{"action":"run_command","value":"/execute if score @e[tag=game,limit=1] setting_done matches 0 run tag @s add leave"}},{"text":"   ※カウントダウン開始後は取消できません。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]
#wws通知
execute if entity @a[tag=voice] as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--Forge--","color": "gold","clickEvent": {"action": "open_url","value": "https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.3-44.1.0/forge-1.19.3-44.1.0-installer.jar"}},{"text": "および","color": "white"},{"text": "--SVChat--","color": "gold","clickEvent": {"action": "open_url","value": "https://www.curseforge.com/minecraft/mc-mods/simple-voice-chat/download/4332116"}},{"text": "を導入してください。","color": "white"}]
execute unless entity @a[tag=voice] as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"指定された通話に参加してください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--- 観戦取消 ---","color":"red","clickEvent":{"action":"run_command","value":"/execute if score @e[tag=game,limit=1] setting_done matches 0 run tag @s add leave"}},{"text":"   ※カウントダウン開始後は取消できません。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]
#gmにwwpsタグがなかった場合、setting_tellraw表示
execute as @a[tag=gm,tag=wwps,tag=first,tag=!wwfirst] run schedule function hsfunc:werewolf/utility/setting_tellraw 1t replace
#wwpsタグのプレイヤーにwwfirstタグ付与
tag @e[tag=wwps,tag=!wwfirst] add wwfirst


#設定(時間以外)表示
##update_settingの動作確認用
scoreboard players add "--update動作時間" wwlist 1
##wwpタグ保持者のカウント
scoreboard players set "--プレイヤー数" wwlist 0
execute at @a[tag=wwp] run scoreboard players add "--プレイヤー数" wwlist 1
##他スコアからの代入
scoreboard players operation "人狼の数(+100000000)" wwlist = @e[tag=game,limit=1] r_wolf
scoreboard players operation "狂人の数(+10000000)" wwlist = @e[tag=game,limit=1] r_mani
scoreboard players operation "吸血の数(+1000000)" wwlist = @e[tag=game,limit=1] r_drac
scoreboard players operation "怪盗の数(+100000)" wwlist = @e[tag=game,limit=1] r_thie
##ソート対応用加算
scoreboard players add "人狼の数(+100000000)" wwlist 100000000
scoreboard players add "狂人の数(+10000000)" wwlist 10000000
scoreboard players add "吸血の数(+1000000)" wwlist 1000000
scoreboard players add "怪盗の数(+100000)" wwlist 100000

#時間表示
scoreboard players operation @e[tag=game,limit=1] time_day_m = @e[tag=game,limit=1] time_day
scoreboard players operation @e[tag=game,limit=1] time_day_m /= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_day_s = @e[tag=game,limit=1] time_day
scoreboard players operation @e[tag=game,limit=1] time_day_s %= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_day_first_m = @e[tag=game,limit=1] time_day_first
scoreboard players operation @e[tag=game,limit=1] time_day_first_m /= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_day_first_s = @e[tag=game,limit=1] time_day_first
scoreboard players operation @e[tag=game,limit=1] time_day_first_s %= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_night_m = @e[tag=game,limit=1] time_night
scoreboard players operation @e[tag=game,limit=1] time_night_m /= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_night_s = @e[tag=game,limit=1] time_night
scoreboard players operation @e[tag=game,limit=1] time_night_s %= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_night_first_m = @e[tag=game,limit=1] time_night_first
scoreboard players operation @e[tag=game,limit=1] time_night_first_m /= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_night_first_s = @e[tag=game,limit=1] time_night_first
scoreboard players operation @e[tag=game,limit=1] time_night_first_s %= @e[tag=game,limit=1] 60
title @a[tag=wwps] actionbar ["",{"text":"昼…"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_day_m"}},{"text":":"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_day_s"}},{"text":" 夜…"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_night_m"}},{"text":":"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_night_s"}},{"text":" (初日昼…"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_day_first_m"}},{"text":":"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_day_first_s"}},{"text":" 初日夜…"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_night_first_m"}},{"text":":"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_night_first_s"}},{"text":")"}]

#各種ステータス回復エフェクト
#耐性付与（死亡防止）
effect give @a[tag=wwp] minecraft:resistance 16 255 true
#effect clear @a[tag=wwp]

#設定完了スコアが0の場合、次回呼び出し
execute if score @e[tag=game,limit=1] setting_done matches 0 run schedule function hsfunc:werewolf/utility/update_setting 1s
#設定完了スコアが1の場合、設定情報表示削除、観覧プレイヤーをスペクテイターに、numを0に
execute if score @e[tag=game,limit=1] setting_done matches 1 run scoreboard objectives setdisplay sidebar
execute if score @e[tag=game,limit=1] setting_done matches 1 run gamemode spectator @a[tag=wws]
execute if score @e[tag=game,limit=1] setting_done matches 1 run scoreboard players set @e[tag=game] num 0
#設定完了スコアが1かつupdateが0の場合、タイトル表示し、ID設定から呼出
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps] title [{"text":"まもなく開始します…"}]
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps] actionbar ["",{"text":"--- [設定完了、ID設定] ---","color":"gold"}]
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches 0 run function hsfunc:werewolf/utility/id
#設定完了スコアが1かつupdateが-1の場合、タイトル表示し、ID設定から呼出
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches -1 run title @a[tag=wwps] title [{"text":"まもなく再開します…"}]
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches -1 run title @a[tag=wwps] actionbar ["",{"text":"--- [設定完了] ---","color":"gold"}]
execute if score @e[tag=game,limit=1] setting_done matches 1 if score @e[tag=game,limit=1] update matches -1 run schedule function hsfunc:werewolf/utility/countdown 1s