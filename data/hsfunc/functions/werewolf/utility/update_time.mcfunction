#say @a[tag=gm] update_day
#updateが1の時、timeを1減算
execute if score @e[tag=game,limit=1] update matches 1 run scoreboard players remove @e[tag=game] time 1
#dayが0の時以外、トータル時間に1加算
execute unless score @e[tag=game,limit=1] day matches 0 run scoreboard players add @e[tag=game] time_total 1

#updateが1かつ時間が-1の場合、update_day呼出
execute if score @e[tag=game,limit=1] update matches 1 if score @e[tag=game,limit=1] time matches ..-1 run function hsfunc:werewolf/utility/update_day

#時間計算
scoreboard players operation @e[tag=game,limit=1] time_m = @e[tag=game,limit=1] time
scoreboard players operation @e[tag=game,limit=1] time_m /= @e[tag=game,limit=1] 60
scoreboard players operation @e[tag=game,limit=1] time_s = @e[tag=game,limit=1] time
scoreboard players operation @e[tag=game,limit=1] time_s %= @e[tag=game,limit=1] 60

#bossbarの名称更新
##昼表示
execute if score @e[tag=game,limit=1] time_s matches 10.. if score @e[tag=game,limit=1] night matches 0 run bossbar set hsfunc:werewolf/time_bar name ["",{"text":"--- ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"yellow"},{"text":"日目 ","color":"white"},{"text":"昼","color":"yellow"},{"text":" 残り ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"},"color":"yellow"},{"text":":","color":"yellow"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"},"color":"yellow"},{"text":" ---","color":"white"}]
execute unless score @e[tag=game,limit=1] time_s matches 10.. if score @e[tag=game,limit=1] night matches 0 run bossbar set hsfunc:werewolf/time_bar name ["",{"text":"--- ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"yellow"},{"text":"日目 ","color":"white"},{"text":"昼","color":"yellow"},{"text":" 残り ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"},"color":"yellow"},{"text":":0","color":"yellow"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"},"color":"yellow"},{"text":" ---","color":"white"}]
##夜表示
execute if score @e[tag=game,limit=1] time_s matches 10.. if score @e[tag=game,limit=1] night matches 1 run bossbar set hsfunc:werewolf/time_bar name ["",{"text":"--- ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"dark_purple"},{"text":"日目 ","color":"white"},{"text":"夜","color":"dark_purple"},{"text":" 残り ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"},"color":"dark_purple"},{"text":":","color":"dark_purple"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"},"color":"dark_purple"},{"text":" ---","color":"white"}]
execute unless score @e[tag=game,limit=1] time_s matches 10.. if score @e[tag=game,limit=1] night matches 1 run bossbar set hsfunc:werewolf/time_bar name ["",{"text":"--- ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"day"},"color":"dark_purple"},{"text":"日目 ","color":"white"},{"text":"夜","color":"dark_purple"},{"text":" 残り ","color":"white"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_m"},"color":"dark_purple"},{"text":":0","color":"dark_purple"},{"score":{"name":"@e[tag=game,limit=1]","objective":"time_s"},"color":"dark_purple"},{"text":" ---","color":"white"}]

#bossbarの現在値更新
execute store result bossbar hsfunc:werewolf/time_bar value run scoreboard players get @e[tag=game,limit=1] time

#死亡したプレイヤーのゲームモード変更
execute as @a[tag=wwp,scores={death_count=1..}] run gamemode spectator @s

#終了条件チェック
##条件チェック
#人狼全滅または村人全滅時
##updateが1の時、updateに2(ゲーム終了)をセット
execute if score @e[tag=game,limit=1] update matches 1 run scoreboard players set @e[tag=game,limit=1] update 2
##updateが1の時、両陣営が生存していればupdateに1(ゲーム中)をセット
execute if score @e[tag=game,limit=1] update matches 2 if entity @p[tag=wwp,tag=wolf,scores={death_count=0}] if entity @p[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,scores={death_count=0}] run scoreboard players set @e[tag=game,limit=1] update 1

#中断確認（updateが3の時、updateに2をセット）
execute if score @e[tag=game,limit=1] update matches 3 run scoreboard players set @e[tag=game,limit=1] update 2

#停止・終了処理
##updateが-1の場合、setting呼出
execute if score @e[tag=game,limit=1] update matches -1 run schedule clear hsfunc:werewolf/utility/update_item
execute if score @e[tag=game,limit=1] update matches -1 if entity @e[tag=shop_position] run function hsfunc:werewolf/shop/remove_shop
execute if score @e[tag=game,limit=1] update matches -1 run function hsfunc:werewolf/utility/setting
##updateが1の時、次回呼出
execute if score @e[tag=game,limit=1] update matches 1 run schedule function hsfunc:werewolf/utility/update_time 1s replace
##updateが2の場合、gameset呼出、ショップ削除
execute if score @e[tag=game,limit=1] update matches 2 run function hsfunc:werewolf/utility/gameset