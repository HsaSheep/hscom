#shop_positionの名称変更
##名称：アイテム（取り消し線）
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop_position,sort=nearest,limit=1] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true,"strikethrough":true}'
##名称：アイテム
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop_position,sort=nearest,limit=1] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true}'

#召喚（テストデータあり）
#summon villager ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["ww","shop"],CustomName:'{"text":"アイテム","color":"#8B00A1","bold":true}'}
execute as @e[tag=shop_position] at @s positioned ~ ~-1 ~ run summon villager ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:0b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Xp:251,Tags:["ww","shop"],CustomName:'{"text":"shop"}'}

#村人固有設定：指定解除
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] VillagerData set value {}
#村人固有設定：武器職人
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] VillagerData set value {profession:"minecraft:weaponsmith"}

#追加設定
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] VillagerData set value {level:5b}

#透明化付与
#execute as @e[tag=shop_position] at @s run effect give @e[tag=shop,sort=nearest,limit=1] invisibility 1000000 0 true

#ショップのOffers設定
execute as @e[tag=ww,tag=shop_position] run function hsfunc:werewolf/shop/reset_shop_offers

#ショップのupdate呼出
function hsfunc:werewolf/shop/update_shop