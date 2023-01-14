#カウントダウン終了後の開始前準備
#gemeruleゲーム用設定
gamerule fallDamage true
gamerule fireDamage true
gamerule freezeDamage true
#teamゲーム用設定
team modify wwt color gold
team modify wwt collisionRule pushOwnTeam
team modify wwt nametagVisibility hideForOwnTeam
team modify wwt deathMessageVisibility never
team modify wwt friendlyFire true
team modify wwt seeFriendlyInvisibles false

#updateが0の時、役職通知(サブタイトル、tellraw)
##tellraw
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wolf,tag=!mani,tag=!drac] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "村人","color": "green"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wolf,tag=!mani,tag=!drac] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： すべての人狼を倒す"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "人狼","color": "red"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： すべての村人を倒す"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "狂人","color": "gold"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： 村人に悟られないよう人狼に協力し、すべての村人を倒す"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=drac] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "吸血","color": "dark_purple"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=drac] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： 村人または人狼いずれかを壊滅させる"}]
##仲間の通知（人狼）
tellraw @a[tag=wwp,tag=wolf] ["",{"text":" 仲間の人狼：","color": "red"}]
execute as @a[tag=wwp,tag=wolf] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"            "},{"selector":"@s","color":"red"}]
##subtitle
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwp,tag=!wolf,tag=!mani,tag=!drac] subtitle ["",{"text": "あなたは "},{"text": "村人","color": "green"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwp,tag=wolf] subtitle ["",{"text": "あなたは "},{"text": "人狼","color": "red"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwp,tag=mani] subtitle ["",{"text": "あなたは "},{"text": "狂人","color": "gold"},{"text": " です","color": "white"}]
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwp,tag=drac] subtitle ["",{"text": "あなたは "},{"text": "吸血","color": "dark_purple"},{"text": " です","color": "white"}]

#title表示
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps] title ["",{"text": "--- "},{"text": "ゲーム開始"},{"text": " ---"}]
execute if score @e[tag=game,limit=1] update matches -1 run title @a[tag=wwps] title ["",{"text": "--- "},{"text": "ゲーム再開"},{"text": " ---"}]
#サウンド再生
stopsound @a[tag=wwps]
execute as @a[tag=wwps] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1 0.5

#updateが0以下の時、1をセット
execute if score @e[tag=game,limit=1] update matches 0 run scoreboard players set @e[tag=game,limit=1] update 1
execute if score @e[tag=game,limit=1] update matches -1 run scoreboard players set @e[tag=game,limit=1] update 1

#scoreboard関係
##s_posyに高さ座標保存（skeleton召喚時判定用）
execute as @e[tag=ww,tag=game,limit=1] store result score @s s_posy run data get entity @s Pos[1] 
tellraw @a[tag=wwps] ["",{"text": "開始点Y: "},{"score":{"name": "@e[tag=game,limit=1]","objective": "s_posy"}}]
##s_posy+高さ座標マージン（skeleton召喚時判定用）
execute as @e[tag=ww,tag=game,limit=1] run scoreboard players add @e[tag=ww,tag=game,limit=1] s_posy 8
tellraw @a[tag=wwps] ["",{"text": "スポーン限界点Y: "},{"score":{"name": "@e[tag=game,limit=1]","objective": "s_posy"}}]

#ポーション効果削除
effect clear @a[tag=wwp]

#ショップ設置
execute if entity @e[tag=shop_position] run function hsfunc:werewolf/shop/set_shop

#update_time呼出
function hsfunc:werewolf/utility/update_time

#update_item呼出
function hsfunc:werewolf/utility/update_item