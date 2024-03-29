#tell @a item_run
## ##### 右クリック処理 #####
##carrot_on_a_stick
execute as @a[tag=wwp,scores={death_count=0}] if score @s carrot_on_a_stick_rightClick matches 1.. run tag @s add using_carrot_on_a_stick
#execute as @a[tag=using_carrot_on_a_stick] run tell @s carrot_on_a_stick
execute as @a[tag=using_carrot_on_a_stick] run scoreboard players set @s carrot_on_a_stick_rightClick 0
execute as @a[tag=using_carrot_on_a_stick] run clear @s carrot_on_a_stick 1
execute as @a[tag=using_carrot_on_a_stick] run effect give @a[tag=wwp,tag=!using_carrot_on_a_stick] minecraft:glowing 60 255 true
execute as @a[tag=using_carrot_on_a_stick] run tag @s remove using_carrot_on_a_stick

##carrot_on_a_stick
execute as @a[tag=wwp,scores={death_count=0}] if score @s warped_fungus_on_a_stick_rightClick matches 1.. run tag @s add using_warped_fungus_on_a_stick
#execute as @a[tag=using_warped_fungus_on_a_stick] run tell @s warped_fungus_on_a_stick
execute as @a[tag=using_warped_fungus_on_a_stick] run scoreboard players set @s warped_fungus_on_a_stick_rightClick 0
execute as @a[tag=using_warped_fungus_on_a_stick] run clear @s warped_fungus_on_a_stick 1
execute as @a[tag=using_warped_fungus_on_a_stick] at @a[tag=using_warped_fungus_on_a_stick] run kill @p[tag=drac,distance=..7]
execute as @a[tag=using_warped_fungus_on_a_stick] run tag @s remove using_warped_fungus_on_a_stick


## ##### 左クリック処理 #####
#事前処理（与ダメージ確認tag付与）
execute as @a[tag=wwp,scores={death_count=0,damage_give=1..}] run tag @s add damage_give
#事前処理（受ダメージまたは防ダメージ確認tag付与）
execute as @a[tag=wwp,scores={death_count=0,damage_taken=1..}] run tag @s add damage_take
execute as @a[tag=wwp,scores={death_count=0,damage_resis=1..}] run tag @s add damage_take
#デバック用
#execute as @a[tag=damage_give] run tell @a[tag=gm] damage_give
#execute as @a[tag=damage_take] run tell @a[tag=gm] damage_take

##nether_star
###ダメージを与えたプレイヤーがネザースターを持っている場合、タグ付与
####テスト用、とにかくインベントリ内にあれば判定
#execute as @a[tag=damage_give] if entity @s[nbt={Inventory:[{id:"minecraft:nether_star"}]}] run tag @s add using_nether_star
execute as @a[tag=damage_give] if entity @s[nbt={SelectedItem:{id:"minecraft:nether_star"}}] run tag @s add using_nether_star
###周辺のダメージを受けた生存プレイヤーがtag=dracかどうか判定し、タグ付与
#execute as @a[tag=using_nether_star] at @s run tag @a[tag=damage_take,sort=nearest,limit=1,distance=..5,tag=drac] add damage_nether_star
execute as @a[tag=using_nether_star] at @s run tag @a[tag=damage_take,sort=nearest,limit=1,tag=drac] add damage_nether_star
###アイテム削除（距離条件適用）
execute as @a[tag=using_nether_star] if entity @a[tag=damage_nether_star] run clear @s nether_star 1
###ダメージを受けたdarcプレイヤー周辺でエフェクト、サウンド
#execute as @a[tag=damage_nether_star] run stopsound @a[tag=damage_nether_star]
execute as @a[tag=damage_nether_star] at @s run playsound minecraft:entity.lightning_bolt.thunder master @a[tag=wwps] ~ ~0.5 ~ 0.7 1.0 0.0
execute as @a[tag=damage_nether_star] at @s run particle minecraft:explosion_emitter ~ ~0.5 ~
###キル
execute as @a[tag=damage_nether_star] run kill @s
###デバック用
#execute as @a[tag=using_nether_star] run tell @a[tag=gm] using_nether_star
#execute as @a[tag=damage_nether_star] run tell @a[tag=gm] damage_nether_star
###処理終了（タグ削除）
execute as @a[tag=using_nether_star] run tag @s remove damage_give
execute as @a[tag=using_nether_star] run tag @s remove using_nether_star
execute as @a[tag=damage_nether_star] run tag @s remove damage_take
execute as @a[tag=damage_nether_star] run tag @s remove damage_nether_star

##左クリック処理タグ削除（スコア初期化は基本的にitem_updateで。
tag @a[tag=wwp,tag=damage_give] remove damage_give
tag @a[tag=wwp,tag=damage_take] remove damage_take



## ##### オフハンド処理 #####
##glowstone_dust
execute as @a[tag=wwp,scores={death_count=0}] if entity @s[nbt={Inventory:[{Slot:-106b,id:"minecraft:glowstone_dust"}]}] run tag @s add has_glowstone_dust
#すでに使用しているかチェック（他プレイヤーに発光エフェクトが付与されているか）
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] if entity @a[nbt={ActiveEffects:[{Id:24}]}] run title @s actionbar ["",{"text": "-- すでに効果が付与されています --", "color": "red"}]
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] if entity @a[nbt={ActiveEffects:[{Id:24}]}] run tag @s remove has_glowstone_dust
#発光、通知、アイテム削除処理
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] run effect give @a[tag=wwp,tag=!has_glowstone_dust] minecraft:glowing 60 255 true
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~0.5 ~ 0.7 0.5
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] run title @s actionbar ["",{"text": "-- 他のプレイヤーに発光を付与しました --", "color": "white"}]
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] run clear @s glowstone_dust 1
execute as @a[tag=wwp,scores={death_count=0},tag=has_glowstone_dust] run tag @s remove has_glowstone_dust


## ##### その他処理 #####
##斧使用処理
execute as @a[tag=wwp,scores={death_count=0,use_axe=1..}] at @s run playsound minecraft:entity.wither.death master @a ~ ~ ~ 0.5 2.0 0.0

##空き瓶回収
clear @a glass_bottle