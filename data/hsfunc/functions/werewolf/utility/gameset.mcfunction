#say @a[tag=gm] gameset
#トータル時間計算
scoreboard players operation @e[tag=game,limit=1] time_total_h = @e[tag=game,limit=1] time_total
scoreboard players operation @e[tag=game,limit=1] time_total_h /= @e[tag=game,limit=1] 3600
scoreboard players operation @e[tag=game,limit=1] time_total_m = @e[tag=game,limit=1] time_total
scoreboard players operation @e[tag=game,limit=1] time_total_m %= @e[tag=game,limit=1] 3600
scoreboard players operation @e[tag=game,limit=1] time_total_s = @e[tag=game,limit=1] time_total_m
scoreboard players operation @e[tag=game,limit=1] time_total_s %= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_total_m /= @e[tag=game,limit=1] 60

#bossbar削除
bossbar set hsfunc:werewolf/time_bar players
bossbar remove hsfunc:werewolf/time_bar

#勝利陣営判定
#村人の勝利：numを0に
scoreboard players set @e[tag=game,limit=1] num 0
#人狼の勝利：numを1に
execute if entity @p[tag=wwp,tag=wolf,scores={death_count=0}] run scoreboard players set @e[tag=game,limit=1] num 1
#吸血の勝利：numを2に
execute if entity @p[tag=wwp,tag=drac,scores={death_count=0}] run scoreboard players set @e[tag=game,limit=1] num 2
#どちらも生きているとき(中断)
execute if entity @p[tag=wwp,tag=wolf,scores={death_count=0}] if entity @p[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,scores={death_count=0}] run scoreboard players set @e[tag=game,limit=1] num 100

#wwpタグ保持者のカウント
scoreboard players set @e[tag=game,limit=1] p_count 0
execute at @a[tag=wwp] run scoreboard players add @e[tag=game,limit=1] p_count 1
#村人の数計算
execute as @e[tag=game,limit=1] run scoreboard players set @s r_vill 0
execute as @a[tag=wwp] run scoreboard players add @e[tag=game,limit=1] r_vill 1
execute as @a[tag=wwp,tag=wolf] run scoreboard players remove @e[tag=game,limit=1] r_vill 1
execute as @a[tag=wwp,tag=mani] run scoreboard players remove @e[tag=game,limit=1] r_vill 1
execute as @a[tag=wwp,tag=drac] run scoreboard players remove @e[tag=game,limit=1] r_vill 1

#tellraw終了時情報表示
tellraw @a[tag=wwps] "\n"
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-------------------------------------------"}]
##勝利陣営表示(メッセージ)
execute if score @e[tag=game,limit=1] num matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"・勝利陣営: "},{"text":"村人","color":"green"}]
execute if score @e[tag=game,limit=1] num matches 1 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"・勝利陣営: "},{"text":"人狼","color":"red"}]
execute if score @e[tag=game,limit=1] num matches 2 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"・勝利陣営: "},{"text":"吸血","color":"dark_purple"}]
execute if score @e[tag=game,limit=1] num matches 100 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":" "},{"text":"ゲーム中断","color":"white"}]
##区切り表示
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-------------------------------------------"}]
##役職表示
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"- 役職内訳 -","color":"white"}]
###村人
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"村人","color":"green"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_vill"},"color":"white"},{"text":" --","color":"white"}]
execute as @e[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,tag=!thie,tag=!thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"green"}]
execute as @e[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,tag=!thie,tag=thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"green"},{"text":"(怪盗被害者)","color": "blue"}]
###人狼
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"人狼","color":"red"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_wolf"},"color":"white"},{"text":" --","color":"white"}]
execute as @e[tag=wwp,tag=wolf,tag=!thie] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"red"}]
execute as @e[tag=wwp,tag=!thie,tag=thie_done_wolf] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"red","strikethrough":true}]
###狂人
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"狂人","color":"gold"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_mani"},"color":"white"},{"text":" --","color":"white"}]
execute if entity @a[tag=wwp,tag=mani] as @a[tag=wwp,tag=mani,tag=!thie] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"gold"}]
execute if entity @a[tag=wwp,tag=mani] as @a[tag=wwp,tag=!thie,tag=thie_done_mani] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"gold","strikethrough":true}]
###吸血
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_drac"},"color":"white"},{"text":" --","color":"white"}]
execute if entity @a[tag=wwp,tag=drac] as @a[tag=wwp,tag=drac,tag=!thie] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"dark_purple"}]
execute if entity @a[tag=wwp,tag=drac] as @a[tag=wwp,tag=!thie,tag=thie_done_drac] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"dark_purple","strikethrough":true}]
###怪盗
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"怪盗","color":"blue"},{"text":" : (","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_thie"},"color":"white"},{"text":") --","color":"white"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=!wolf,tag=!mani,tag=!drac,tag=!thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"村人","color":"green"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=wolf,tag=!thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"人狼","color":"red"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=mani,tag=!thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"狂人","color":"gold"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=drac,tag=!thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"吸血","color":"dark_purple"}]
####怪盗が怪盗された場合
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=!wolf,tag=!mani,tag=!drac,tag=thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"村人","color":"green"},{"text":"(怪盗被害者)","color":"blue"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=wolf,tag=thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"人狼","color":"red"},{"text":"(怪盗被害者)","color":"blue"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=mani,tag=thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"狂人","color":"gold"},{"text":"(怪盗被害者)","color":"blue"}]
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,tag=drac,tag=thie_done] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"selector":"@s","color":"blue"},{"text":" -> ","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"(怪盗被害者)","color":"blue"}]

##プレイ時間表示
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"- その他情報 -","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"日数… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"white"},{"text":"・","color":"white"},{"text":"昼","color":"yellow"},{"text":" --","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 1 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"日数… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"white"},{"text":"・","color":"white"},{"text":"夜","color":"purple"},{"text":" --","color":"white"}]
execute if score @e[tag=game,limit=1] time_total_m matches 10.. if score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute if score @e[tag=game,limit=1] time_total_m matches 10.. unless score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute unless score @e[tag=game,limit=1] time_total_m matches 10.. if score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute unless score @e[tag=game,limit=1] time_total_m matches 10.. unless score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":"-------------------------------------------"}]

#タイトル表示
##勝利陣営表示(タイトル)
execute if score @e[tag=game,limit=1] num matches 0 run title @a[tag=wwps] subtitle ["",{"text":""},{"text":"村人の勝利","color":"green"}]
execute if score @e[tag=game,limit=1] num matches 1 run title @a[tag=wwps] subtitle ["",{"text":""},{"text":"人狼の勝利","color":"red"}]
execute if score @e[tag=game,limit=1] num matches 2 run title @a[tag=wwps] subtitle ["",{"text":""},{"text":"吸血の勝利","color":"dark_purple"}]
##タイトル
title @a[tag=wwps] title ["",{"text":"--- "},{"text":"ゲーム終了","color":"white"},{"text":" ---"}]

#サウンド再生
stopsound @a[tag=wwps]
execute as @a[tag=wwps] run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.5 1.0 0.5
##村人が勝ったとき
#execute if score @e[tag=game,limit=1] num matches 0 as @a[tag=wwps] run playsound minecraft:entity.villager.ambient master @a ~ ~ ~ 0.9 1.0 0.9
execute if score @e[tag=game,limit=1] num matches 0 as @a[tag=wwps] run playsound minecraft:entity.wolf.death master @a ~ ~ ~ 0.5 1.0 0.5
##人狼が勝ったとき
execute if score @e[tag=game,limit=1] num matches 1 as @a[tag=wwps] run playsound minecraft:entity.wolf.howl master @a ~ ~ ~ 0.5 1.0 0.5
#execute if score @e[tag=game,limit=1] num matches 1 as @a[tag=wwps] run playsound minecraft:entity.villager.death master @a ~ ~ ~ 0.7 1.0 0.7
##吸血が勝ったとき
#execute if score @e[tag=game,limit=1] num matches 2 as @a[tag=wwps] run playsound minecraft:entity.villager.death master @a ~ ~ ~ 0.7 1.0 0.7
execute if score @e[tag=game,limit=1] num matches 2 as @a[tag=wwps] run playsound minecraft:entity.wolf.death master @a ~ ~ ~ 0.5 1.0 0.5

#初期化呼出
schedule function hsfunc:werewolf/utility/reset 1s replace
#
#設定呼出
schedule function hsfunc:werewolf/utility/setting 1.5s replace