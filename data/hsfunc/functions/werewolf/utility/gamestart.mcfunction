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
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wolf,tag=!mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "村人","color": "green"},{"text": " です"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=!wolf,tag=!mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： すべての人狼を倒す"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "人狼","color": "red"},{"text": " です"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： すべての村人を倒す"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "あなたは "},{"text": "狂人","color": "gold"},{"text": " です"}]
execute if score @e[tag=game,limit=1] update matches 0 as @e[tag=game,limit=1] run tellraw @a[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text": "勝利条件： 村人に悟られないよう人狼に協力し、すべての村人を倒す"}]

execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps,tag=!wolf,tag=!mani] subtitle ["",{"text": "あなたは "},{"text": "村人","color": "green"},{"text": " です"}]
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps,tag=wolf] subtitle ["",{"text": "あなたは "},{"text": "人狼","color": "red"},{"text": " です"}]
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps,tag=mani] subtitle ["",{"text": "あなたは "},{"text": "狂人","color": "gold"},{"text": " です"}]

#title表示
execute if score @e[tag=game,limit=1] update matches 0 run title @a[tag=wwps] title ["",{"text": "--- "},{"text": "ゲーム開始"},{"text": " ---"}]
execute if score @e[tag=game,limit=1] update matches -1 run title @a[tag=wwps] title ["",{"text": "--- "},{"text": "ゲーム再開"},{"text": " ---"}]
#サウンド再生
stopsound @a[tag=wwps]
execute as @a[tag=wwps] run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1 0.5

#updateが0以下の時、1をセット
execute if score @e[tag=game,limit=1] update matches 0 run scoreboard players set @e[tag=game,limit=1] update 1
execute if score @e[tag=game,limit=1] update matches -1 run scoreboard players set @e[tag=game,limit=1] update 1

#ショップ設置
execute if entity @e[tag=shop_position] run function hsfunc:werewolf/shop/set_shop

#update_time呼び出し
function hsfunc:werewolf/utility/update_time