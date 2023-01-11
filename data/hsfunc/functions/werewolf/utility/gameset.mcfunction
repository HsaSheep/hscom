say @a[tag=gm] gameset
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
#どちらも生きているとき(中断)
execute if entity @p[tag=wwp,tag=wolf,scores={death_count=0}] if entity @p[tag=wwp,tag=!wolf,tag=!mani,scores={death_count=0}] run scoreboard players set @e[tag=game,limit=1] num 100

#tellraw終了時情報表示
tellraw @a[tag=wwps] "\n"
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]
##勝利陣営表示(メッセージ)
execute if score @e[tag=game,limit=1] num matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・勝利陣営: "},{"text":"村人","color":"green"}]
execute if score @e[tag=game,limit=1] num matches 1 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・勝利陣営: "},{"text":"人狼","color":"red"}]
execute if score @e[tag=game,limit=1] num matches 1 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":" "},{"text":"ゲーム中断","color":"white"}]
##区切り表示
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]
##役職表示
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"- 役職内訳 -","color":"white"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"人狼","color":"red"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_wolf"},"color":"white"},{"text":" --","color":"white"}]
execute as @e[tag=wwp,tag=wolf] run tellraw @a[tag=wwps] ["",{"text":"            "},{"selector":"@s","color":"red"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"狂人","color":"gold"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_wolf"},"color":"white"},{"text":" --","color":"white"}]
execute as @e[tag=wwp,tag=mani] run tellraw @a[tag=wwps] ["",{"text":"            "},{"selector":"@s","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"村人","color":"green"},{"text":" : ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"r_wolf"},"color":"white"},{"text":" --","color":"white"}]
execute as @e[tag=wwp,tag=!wolf,tag=!mani] run tellraw @a[tag=wwps] ["",{"text":"            "},{"selector":"@s","color":"green"}]
##プレイ時間表示
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"- その他情報 -","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"日数… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"white"},{"text":"・","color":"white"},{"text":"昼","color":"yellow"},{"text":" --","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 1 as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"日数… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"white"},{"text":"・","color":"white"},{"text":"夜","color":"purple"},{"text":" --","color":"white"}]
execute if score @e[tag=game,limit=1] time_total_m matches 10.. if score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute if score @e[tag=game,limit=1] time_total_m matches 10.. unless score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute unless score @e[tag=game,limit=1] time_total_m matches 10.. if score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute unless score @e[tag=game,limit=1] time_total_m matches 10.. unless score @e[tag=game,limit=1] time_total_s matches 10.. as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-- ","color":"white"},{"text":"プレイ時間… ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_h"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_m"},"color":"white"},{"text":":0","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_total_s"},"color":"white"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=wwps] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]

#タイトル表示
##勝利陣営表示(タイトル)
execute if score @e[tag=game,limit=1] num matches 0 run title @a[tag=wwps] subtitle ["",{"text":""},{"text":"村人の勝利","color":"green"}]
execute if score @e[tag=game,limit=1] num matches 1 run title @a[tag=wwps] subtitle ["",{"text":""},{"text":"人狼の勝利","color":"red"}]
##タイトル
title @a[tag=wwps] title ["",{"text":"--- "},{"text":"ゲーム終了","color":"white"},{"text":" ---"}]

#サウンド再生
stopsound @a[tag=wwps]
##村人が勝ったとき
execute if score @e[tag=game,limit=1] num matches 0 as @a[tag=wwps] run playsound minecraft:entity.villager.ambient master @a ~ ~ ~ 0.9 1.0 0.9
execute if score @e[tag=game,limit=1] num matches 0 as @a[tag=wwps] run playsound minecraft:entity.wolf.death master @a ~ ~ ~ 0.5 1.0 0.5
##人狼が勝ったとき
execute if score @e[tag=game,limit=1] num matches 1 as @a[tag=wwps] run playsound minecraft:entity.wolf.howl master @a ~ ~ ~ 0.5 1.0 0.5
execute if score @e[tag=game,limit=1] num matches 1 as @a[tag=wwps] run playsound minecraft:entity.villager.death master @a ~ ~ ~ 0.7 1.0 0.7

#初期化呼出
function hsfunc:werewolf/utility/reset
#設定呼出
function hsfunc:werewolf/utility/setting