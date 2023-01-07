#特定タグ保持プレイヤーのゲームモードをスペクテイターにし、チームから離脱、タグ削除する(参加取消用)
gamemode spectator @a[tag=leave]
team leave @a[tag=leave]
tag @a[tag=leave] remove wwp
tag @a[tag=leave] remove wws
tag @a[tag=leave] remove wwps
tag @a[tag=leave] remove leave

#ワールド参加者へゲーム名通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"\n\n\n\n"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"---------------------------------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"                 HsCom 人狼ゲーム","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!gm,tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"---------------------------------------------------------------------","color":"gold"}]
#プレイヤーへ参加するか通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"ゲームに参加する場合、参加をクリックしてください。(見るだけの場合、観戦をクリックしてください。)"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--- 参加 ---","color":"red","clickEvent":{"action":"run_command","value":"/execute if entity @s[tag=!wwp] run tag @s add wwp"}},{"text":"   "},{"text":"--- 観戦 ---","color":"green","clickEvent":{"action":"run_command","value":"/execute if entity @s[tag=!wws] run tag @s add wws"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=!first] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"---------------------------------------------------------------------"}]
#すべてのプレイヤーにfirstタグ付与
tag @a[tag=!first] add first

#wwpまたはwwsタグのプレイヤーにwwpsタグ付与
tag @a[tag=wwp,tag=!wwfirst] add wwps
tag @a[tag=wws,tag=!wwfirst] add wwps

#wwpsタグのプレイヤーをtp、ゲームモード変更
tp @a[tag=wwps,tag=!wwfirst] @e[tag=ww,limit=1]
gamemode adventure @a[tag=wwps,tag=!wwfirst]

#wwpチーム参加、通知
team join wwt @a[tag=wwp,tag=!wwfirst]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"参加しました。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"Discordの「MINECTAFTイベント」-「Minecraft人狼 生存者」通話に参加してください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"参加を取り消す場合、参加取消をクリックしてください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--- 参加取消 ---","color":"red","clickEvent":{"action":"run_command","value":"/execute if score @e[tag=game,limit=1] setting_done matches 0 run tag @s add leave"}},{"text":"   ※カウントダウン開始後は取消できません。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"---------------------------------------------------------------------"}]

#wws通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"観戦に登録しました。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"Discordの「MINECTAFTイベント」-「Minecraft人狼 生存者」通話に参加してください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"観戦を取り消す場合、観戦取消をクリックしてください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"--- 観戦取消 ---","color":"red","clickEvent":{"action":"run_command","value":"/execute if score @e[tag=game,limit=1] setting_done matches 0 run tag @s add leave"}},{"text":"   ※カウントダウン開始後は取消できません。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wws,tag=!wwfirst] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"---------------------------------------------------------------------"}]

#wwpsタグのプレイヤーにwwfirstタグ付与
tag @e[tag=wwps,tag=!wwfirst] add wwfirst

#設定(時間以外)表示
##wwpタグ保持者のカウント
scoreboard players reset "--プレイヤー数:" wwlist
execute at @e[tag=wwp] run scoreboard players add "--プレイヤー数：" wwlist 1
#他スコアからの代入
scoreboard players operation "人狼の数(-100000)" wwlist = @e[tag=game,limit=1] r_wolf
scoreboard players operation "狂人の数(-10000)" wwlist = @e[tag=game,limit=1] r_mani
#ソート対応用加算
scoreboard players add "人狼の数(+100000)" wwlist 100000
scoreboard players add "狂人の数(+10000)" wwlist 10000

#時間表示


#設定完了スコアが0の場合、次回呼び出し
execute if score @e[tag=game,limit=1] setting_done matches 0 run schedule function hsfunc:werewolf/utility/update_setting 10t
#設定完了スコアが1の場合、次回呼び出しを削除し、カウントダウンを呼び出し
execute if score @e[tag=game,limit=1] setting_done matches 1 run schedule clear hsfunc:werewolf/utility/update_setting
execute if score @e[tag=game,limit=1] setting_done matches 1 run function hsfunc:werewolf/utility/countdown