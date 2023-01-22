#仮DP削除
execute if entity @e[tag=ww] run kill @e[tag=ww]
#DP召喚
summon armor_stand ~ ~ ~ {Tags:["dummy","ww","game"],CustomName:'{"text":"人狼ゲーム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
#execute as @e[tag=game,limit=1] run tell @a[tag=gm] ゲーム地点を設定しました

#スポーン地点設定
execute at @e[tag=ww,tag=game,limit=1] run setworldspawn ~ ~ ~

#ワールドボーダー設定
execute at @e[tag=ww,tag=game,limit=1] run worldborder center ~11 ~41
#worldborder set 50 0
worldborder set 145 0
worldborder warning distance 3
worldborder warning time 3
worldborder damage amount 0.1
worldborder damage buffer 5.0

difficulty hard

#scoreboard初期化（宣言）
###プレイヤー関係
scoreboard objectives add p_id dummy "プレイヤーID"
scoreboard objectives add seer_id dummy "占い先ID"
scoreboard objectives add thie_id dummy "怪盗ID(怪盗…変更元ID、対象…怪盗ID)"
scoreboard objectives add death_count deathCount "死亡確認用"
scoreboard objectives add damage_give minecraft.custom:minecraft.damage_dealt "与ダメージ"
scoreboard objectives add damage_taken minecraft.custom:minecraft.damage_taken "受ダメージ"
scoreboard objectives add damage_resis minecraft.custom:minecraft.damage_resisted "防ダメージ"
scoreboard objectives add shop_rightClick minecraft.custom:minecraft.talked_to_villager "shop右クリック検知用"
###アイテム関係
scoreboard objectives add carrot_on_a_stick_rightClick minecraft.used:minecraft.carrot_on_a_stick "人参棒右クリック検知用"
scoreboard objectives add warped_fungus_on_a_stick_rightClick minecraft.used:minecraft.warped_fungus_on_a_stick "ネザーキノコ棒右クリック検知用"
###ゲーム関係
scoreboard objectives add p_count dummy "参加プレイヤー数"
scoreboard objectives add r_wolf dummy "人狼の数"
scoreboard objectives add r_mani dummy "狂人の数"
scoreboard objectives add r_drac dummy "吸血の数"
scoreboard objectives add r_thie dummy "怪盗の数"
scoreboard objectives add r_vill dummy "村人の数(結果表示用)"
scoreboard objectives add r_set dummy "ロール設定用、役職ごとに増やす"
scoreboard objectives add s_multi dummy "夜敵Mobの沸きセット数(15秒間隔でs_multi体x p_count沸く)"
scoreboard objectives add s_count dummy "夜敵Mobの沸き数(処理用)"
scoreboard objectives add s_posy dummy "夜敵MobのY座標(処理用)"
scoreboard objectives add enable_vc dummy "SimpleVoiceChatが有効かどうか(0...無効 1...有効)"
scoreboard objectives add day dummy
scoreboard objectives add night dummy
scoreboard objectives add night_swap dummy
#0/etc... 0…タイマー停止(ゲーム停止)、1…タイマー動作(ゲーム実行中)、2…ゲーム終了(gameset呼出、初期化へ)
scoreboard objectives add update dummy
#0/etc... 0…設定未完了、1…設定完了(ゲーム開始)
scoreboard objectives add setting_done dummy
scoreboard objectives add num dummy "各処理での作業用変数"
###時間関係
scoreboard objectives add 2 dummy
scoreboard objectives add 60 dummy
scoreboard objectives add 3600 dummy
scoreboard objectives add time dummy
scoreboard objectives add time_total dummy
scoreboard objectives add countdown dummy
scoreboard objectives add time_day dummy
scoreboard objectives add time_night dummy
scoreboard objectives add time_day_first dummy
scoreboard objectives add time_night_first dummy
###時間関係(時)
scoreboard objectives add time_total_h dummy
###時間関係(分)
scoreboard objectives add time_m dummy
scoreboard objectives add time_total_m dummy
scoreboard objectives add time_day_m dummy
scoreboard objectives add time_night_m dummy
scoreboard objectives add time_day_first_m dummy
scoreboard objectives add time_night_first_m dummy
###時間関係(秒)
scoreboard objectives add time_s dummy
scoreboard objectives add time_total_s dummy
scoreboard objectives add time_day_s dummy
scoreboard objectives add time_night_s dummy
scoreboard objectives add time_day_first_s dummy
scoreboard objectives add time_night_first_s dummy

#scoreboard初期化（初期値代入）
###プレイヤー関係
scoreboard players set @a p_id 0 
scoreboard players set @a seer_id 0
scoreboard players set @a thie_id 0
scoreboard players set @a death_count 0
scoreboard players set @a damage_give 0
scoreboard players set @a damage_taken 0
scoreboard players set @a damage_resis 0
scoreboard players set @a shop_rightClick 0
###アイテム関係
scoreboard players set @a carrot_on_a_stick_rightClick 0
scoreboard players set @a warped_fungus_on_a_stick_rightClick 0
###ゲーム関係
scoreboard players set @e[tag=game] p_count 0 
scoreboard players set @e[tag=game] r_wolf 2
scoreboard players set @e[tag=game] r_mani 0
scoreboard players set @e[tag=game] r_drac 1
scoreboard players set @e[tag=game] r_thie 0
scoreboard players set @e[tag=game] r_vill 0
scoreboard players set @e[tag=game] r_set 0
scoreboard players set @e[tag=game] s_multi 17
scoreboard players set @e[tag=game] s_count 0
scoreboard players set @e[tag=game] enable_vc 0
scoreboard players set @e s_posy 0
scoreboard players reset @e day
scoreboard players reset @e night
scoreboard players reset @e night_swap
scoreboard players reset @e update
scoreboard players reset @e setting_done
scoreboard players reset @e num

###時間関係
scoreboard players set @e[tag=game] 2 2
scoreboard players set @e[tag=game] 60 60
scoreboard players set @e[tag=game] 3600 3600
scoreboard players set @e[tag=game] time 0
scoreboard players set @e[tag=game] time_total 0
scoreboard players set @e[tag=game] countdown 3
scoreboard players set @e[tag=game] time_day 120
scoreboard players set @e[tag=game] time_night 180
scoreboard players set @e[tag=game] time_day_first 30
scoreboard players set @e[tag=game] time_night_first 180
###時間関係(時)
scoreboard players reset @e time_total_h
###時間関係(分)
scoreboard players reset @e time_m
scoreboard players reset @e time_total_m
scoreboard players reset @e time_day_m
scoreboard players reset @e time_night_m
scoreboard players reset @e time_day_first_m
scoreboard players reset @e time_night_first_m
###時間関係(秒)
scoreboard players reset @e time_s
scoreboard players reset @e time_total_s
scoreboard players reset @e time_day_s
scoreboard players reset @e time_night_s
scoreboard players reset @e time_day_first_s
scoreboard players reset @e time_night_first_s

#reset呼出
function hsfunc:werewolf/utility/reset

#設定表示(時間以外)初期化
scoreboard objectives add wwlist dummy "---人狼ゲーム設定---"
scoreboard players reset @e wwlist

#設定呼出
function hsfunc:werewolf/utility/setting

#GM自動参加
#tag @s add wwp