#remove呼出
function hsfunc:werewolf/utility/remove

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

##観戦チーム削除、再作成、初期化
team add wws "人狼観戦チーム"
team empty wws
##team設定
team modify wws color gray
team modify wws collisionRule never
team modify wws nametagVisibility hideForOtherTeams
team modify wws deathMessageVisibility always
team modify wws friendlyFire false
team modify wws seeFriendlyInvisibles true

#無限ループ呼出
function hsfunc:werewolf/utility/endless_update
#update_item呼出
function hsfunc:werewolf/utility/item_update

#DP削除(position以外すべて)
execute if entity @e[tag=ww] run kill @e[tag=ww]

#デバック用DP召喚
##アイテムデバック
#summon armor_stand ~ ~2 ~ {Tags:["dummy","ww","debug_item"],CustomName:'{"text":"アイテム常時有効"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}

#仮DP召喚
summon armor_stand ~ ~ ~ {Tags:["dummy","ww","game"],CustomName:'{"text":"人狼ゲーム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}

#DP召喚場所指定をGMへ通知
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"\n\n\n\n"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"        HsCom 人狼ゲーム Ver. 1.01","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------","color":"gold"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"必要に応じて、プレイヤーへ権限2を与えてください。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・設定:  "},{"text":"--- 権限付与 ---","color":"red","clickEvent":{"action":"suggest_command","value":"op @a[tag=!gm]"},"hoverEvent": {"action": "show_text","value": "opコマンドは権限レベル2が必要なため、\nクリック後opの前に自ら/を入力してください。"}}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"SimpleVoiceChatを使用する場合は下記をクリック。"}]
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・設定:  "},{"text":"--- SVC有効 ---","color":"red","clickEvent":{"action":"run_command","value":"/tag @s add voice"},"hoverEvent": {"action": "show_text","value": "参加時にSimpleVoiceChatの導入をアナウンスします。"}}]
#execute as @e[tag=game,limit=1] if entity @e[tag=ww_game_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"既定のゲーム地点が設定されています","color": "green"}]
execute as @e[tag=game,limit=1] unless entity @e[tag=ww_game_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"ゲーム地点に移動し、設定開始をクリック。"}]
execute as @e[tag=game,limit=1] unless entity @e[tag=ww_game_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・設定:  "},{"text":"--- 設定開始 ---","color":"red","clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/utility/set_place"},"hoverEvent": {"action": "show_text","value": "占い看板設置10x10マスの中心点（夜はスポーン50x50の中心点にもなります）"}}]
#position設定通知
##判定用タグ付与
execute unless entity @e[tag=ww_game_position] run tag @e[tag=game,limit=1] add no_ww_game_position
execute unless entity @e[tag=ww_isolate_position] run tag @e[tag=game,limit=1] add no_ww_isolate_position
execute unless entity @e[tag=ww_shop_position] run tag @e[tag=game,limit=1] add no_ww_shop_position
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_game_position] run tag @s add no_ww_position
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_isolate_position] run tag @s add no_ww_position
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_shop_position] run tag @s add no_ww_position
##通知
execute as @e[tag=game,limit=1] if entity @s[tag=!no_ww_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"地点は全て設定されています","color": "green"}]
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"!!! 注意!!!","color": "red"}]
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_game_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・既定のゲーム地点が設定されていません！","color": "red"}]
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_isolate_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・隔離地点が設定されていません！","color": "red"}]
execute as @e[tag=game,limit=1] if entity @s[tag=no_ww_shop_position] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"・ショップ地点が設定されていません！","color": "red"}]
##判定用タグ削除
execute if entity @e[tag=no_ww_game_position] run tag @e[tag=game,limit=1] remove no_ww_game_position
execute if entity @e[tag=no_ww_isolate_position] run tag @e[tag=game,limit=1] remove no_ww_isolate_position
execute if entity @e[tag=no_ww_shop_position] run tag @e[tag=game,limit=1] remove no_ww_shop_position
execute if entity @e[tag=no_ww_position] run tag @e[tag=game,limit=1] remove no_ww_position
execute as @e[tag=game,limit=1] run tellraw @a[tag=gm] ["",{"text":"["},{"selector":"@s"},{"text":"] "},{"text":"-------------------------------------------"}]

#ゲーム地点が設置されている場合、tpして呼出
execute if entity @e[tag=ww_game_position] run tp @s @e[tag=ww_game_position,limit=1]
execute if entity @e[tag=ww_game_position] at @e[tag=ww_game_position,limit=1] positioned ~ ~-1 ~ run function hsfunc:werewolf/utility/set_place