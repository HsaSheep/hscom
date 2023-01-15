#remove呼出
function hsfunc:werewolf/remove

#GMタグ付与
tag @p add gm

#ゲームルール等設定
##ワールド設定
gamerule commandBlockOutput false
gamerule sendCommandFeedback false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doFireTick false
gamerule doTileDrops false
gamerule tntExplosionDropDecay true
gamerule globalSoundEvents false
gamerule randomTickSpeed 0
##Mob関係
gamerule doMobSpawning false
gamerule doInsomnia false
gamerule doPatrolSpawning false
gamerule doTraderSpawning false
gamerule doWardenSpawning false
gamerule mobGriefing true
##プレイヤー関係
gamerule naturalRegeneration true
gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule showDeathMessages true
gamerule announceAdvancements false
gamerule spectatorsGenerateChunks false
gamerule fallDamage false
gamerule fireDamage false
gamerule freezeDamage false
gamerule drowningDamage false

#時間と天候の設定
time set day
weather clear

#チーム作成
##チーム削除、再作成、初期化
team add wwt "人狼ゲームチーム"
team empty wwt
##team待機用設定
team modify wwt color gold
team modify wwt collisionRule pushOwnTeam
team modify wwt nametagVisibility always
team modify wwt deathMessageVisibility always
team modify wwt friendlyFire false
team modify wwt seeFriendlyInvisibles true

#無限ループ呼出
function hsfunc:werewolf/utility/update_endless
#update_item呼出
function hsfunc:werewolf/utility/update_item

#DP削除
execute if entity @e[tag=ww] run kill @e[tag=ww,tag=!shop_position]

#仮DP召喚
summon armor_stand ~ ~ ~ {Tags:["dummy","ww","game"],CustomName:'{"text":"人狼ゲーム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}

#DP召喚場所指定をGMへ通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"\n\n\n\n"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"        HsCom 人狼ゲーム Ver. 1.00","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"必要に応じて、プレイヤーへ権限2を与えてください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・設定:  "},{"text":"--- 権限付与 ---","color":"red","clickEvent":{"action":"suggest_command","value":"op @a[tag=!gm]"},"hoverEvent": {"action": "show_text","value": "opコマンドは権限レベル2が必要なため、\nクリック後opの前に自ら/を入力してください。"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"ゲーム地点に移動し、設定開始をクリック。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・設定:  "},{"text":"--- 設定開始 ---","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/set_place"},"hoverEvent": {"action": "show_text","value": "占い看板設置10x10マスの中心点（夜はスポーン50x50の中心点にもなります）"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]