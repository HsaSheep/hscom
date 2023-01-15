#設定用スコア設定
scoreboard players set @e[tag=game] setting_done 0
execute unless score @e[tag=game,limit=1] update matches 0 run scoreboard players set "--update動作時間" wwlist 0
execute if score @e[tag=game,limit=1] update matches 1.. run scoreboard players set @e[tag=game] update 0

#設定中のサイドバーを設定
scoreboard objectives setdisplay sidebar wwlist

#数値設定を表示
execute if entity @s[tag=wwps] run function hsfunc:werewolf/utility/setting_tellraw

#GMへゲーム管理を表示（本、スロット7/右端から2番目）
execute as @a[tag=gm] run function hsfunc:werewolf/utility/setting_give

#GMへショップ設定を表示（本、スロット8/右端）
execute as @a[tag=gm] run function hsfunc:werewolf/shop/setting

#設定中のループを呼出
function hsfunc:werewolf/utility/update_setting