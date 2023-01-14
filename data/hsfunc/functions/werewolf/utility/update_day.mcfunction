#say @a[tag=gm] update_day
#night更新
scoreboard players operation @e[tag=game,limit=1] night >< @e[tag=game,limit=1] night_swap

#day_count更新
execute if score @e[tag=game,limit=1] night matches 0 run scoreboard players add @e[tag=game,limit=1] day 1

#timeの数値を更新(昼、夜、初日昼、初日夜)
execute if score @e[tag=game,limit=1] night matches 0 run scoreboard players operation @e[tag=game,limit=1] time = @e[tag=game,limit=1] time_day
execute if score @e[tag=game,limit=1] night matches 1 run scoreboard players operation @e[tag=game,limit=1] time = @e[tag=game,limit=1] time_night
execute if score @e[tag=game,limit=1] night matches 0 if score @e[tag=game,limit=1] day matches 1 run scoreboard players operation @e[tag=game,limit=1] time = @e[tag=game,limit=1] time_day_first
execute if score @e[tag=game,limit=1] night matches 1 if score @e[tag=game,limit=1] day matches 1 run scoreboard players operation @e[tag=game,limit=1] time = @e[tag=game,limit=1] time_night_first
#2日目以降はs_multi /= 2
#execute if score @e[tag=game,limit=1] night matches 1 if score @e[tag=game,limit=1] day matches 2 run scoreboard players operation @e[tag=game,limit=1] s_multi /= @e[tag=game,limit=1] 2

#bossbar削除
bossbar add hsfunc:werewolf/time_bar "-"
bossbar set hsfunc:werewolf/time_bar players
bossbar remove hsfunc:werewolf/time_bar

#bossbar作成
##仮名称で作成
bossbar add hsfunc:werewolf/time_bar "-"
#execute if score @e[tag=game,limit=1] time_s matches 10.. run bossbar add hsfunc:werewolf/time_bar ["",{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"}},{"text":":"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"}}]
#execute unless score @e[tag=game,limit=1] time_s matches 10.. run bossbar add hsfunc:werewolf/time_bar ["",{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"}},{"text":":0"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"}}]
##BossBarのセグメント数(Progressは1セグ)
#bossbar set hsfunc:werewolf/time style progress
bossbar set hsfunc:werewolf/time_bar style notched_6
##BossBar色および文字色(JSON指定しない場合用)
execute if score @e[tag=game,limit=1] night matches 0 run bossbar set hsfunc:werewolf/time_bar color yellow
execute if score @e[tag=game,limit=1] night matches 1 run bossbar set hsfunc:werewolf/time_bar color purple
##BossBar最大値設定
execute store result bossbar hsfunc:werewolf/time_bar max run scoreboard players get @e[tag=game,limit=1] time
##BossBar現在値設定(update_timeで実行)
#execute store result bossbar hsfunc:werewolf/time_bar value run scoreboard players get @e[tag=game,limit=1] time
##BossBarの可視化、対象者設定
bossbar set hsfunc:werewolf/time_bar visible true
bossbar set hsfunc:werewolf/time_bar players @a[tag=wwps]

#昼・夜切り替え
execute if score @e[tag=game,limit=1] night matches 0 run time set day
execute if score @e[tag=game,limit=1] night matches 1 run time set night

#生存者のカウント
scoreboard players set @e[tag=game,limit=1] p_count 0
execute as @a[tag=wwp,scores={death_count=0}] run scoreboard players add @e[tag=game,limit=1] p_count 1
##デバック　人数表示
#title @a[tag=gm] actionbar ["",{"text": "生存者："},{"score":{"name": "@e[tag=game,limit=1]","objective": "p_count"}}]

#夜ショップ再設置
execute if score @e[tag=game,limit=1] night matches 1 run function hsfunc:werewolf/shop/remove_shop
execute if score @e[tag=game,limit=1] night matches 1 run function hsfunc:werewolf/shop/set_shop

#吸血処理
execute if score @e[tag=game,limit=1] night matches 0 run effect clear @a[tag=drac]
execute if score @e[tag=game,limit=1] night matches 1 run effect give @a[tag=drac] minecraft:resistance 1000000 255 true

#夜敵Mobスポーン関係
##summon_skeのエンティティ削除、呼出削除(時間内に終了しなかったとき用)
schedule clear hsfunc:werewolf/utility/summon_ske
kill @e[tag=ske]
##夜の場合、summon_ske呼出
execute if score @e[tag=game,limit=1] night matches 0 run kill @e[tag=ske]
execute if score @e[tag=game,limit=1] night matches 1 run scoreboard players set @e[tag=game,limit=1] num 0
execute if score @e[tag=game,limit=1] night matches 1 run scoreboard players operation @e[tag=game,limit=1] s_count = @e[tag=game,limit=1] s_multi
execute if score @e[tag=game,limit=1] night matches 1 run schedule function hsfunc:werewolf/utility/summon_ske 5s replace

#昼・夜の通知・ミュート指示(プラグインにdiscordのmute足したらここで呼出)
execute if score @e[tag=game,limit=1] night matches 0 unless score @e[tag=game,limit=1] day matches 1 run title @a[tag=wwps] subtitle ["",{"text":"[ ミュートを 解除 してください ]","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 0 unless score @e[tag=game,limit=1] day matches 1 run title @a[tag=wwps] title ["",{"text":"--- 昼 ---","color":"yellow"}]
execute if score @e[tag=game,limit=1] night matches 1 run title @a[tag=wwps] subtitle ["",{"text":"[ ミュートを","color":"white"},{"text":" 設定 ","color":"red"},{"text":"してください ]","color":"white"}]
execute if score @e[tag=game,limit=1] night matches 1 run title @a[tag=wwps] title ["",{"text":"--- 夜 ---","color":"purple"}]
