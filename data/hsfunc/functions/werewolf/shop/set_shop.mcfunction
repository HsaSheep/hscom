#召喚（テストデータあり）
#summon villager ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:1b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["ww","shop"],CustomName:'{"text":"アイテム","color":"#8B00A1","bold":true}'}
execute as @e[tag=shop_position] at @s positioned ~ ~-1 ~ run summon villager ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,CustomNameVisible:0b,PersistenceRequired:1b,NoAI:1b,CanPickUpLoot:0b,Tags:["ww","shop"],CustomName:'{"text":"shop"}'}
#名称：アイテム（取り消し線）
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop_position,sort=nearest,limit=1] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true,"strikethrough":true}'
#名称：アイテム
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop_position,sort=nearest,limit=1] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true}'

#村人固有設定：指定解除
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] VillagerData set value {}
#村人固有設定：武器職人
#execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] VillagerData set value {profession:"minecraft:weaponsmith"}

#透明化付与
execute as @e[tag=shop_position] at @s run effect give @e[tag=shop,sort=nearest,limit=1] invisibility 1000000 0 true

#データ初期化
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes set value {}

#データ追加
##おにく
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes append value {rewardExp:0b,buy:{id:"minecraft:emerald",Count:1b},sell:{id:"cooked_beef",Count:5b,tag:{display:{Name:'{"text":"おにく","color":"dark_purple","bold":true}',Lore:['{"text":"ただのにく","color":"#8B00A1"}']}}}}
##占い
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes append value {rewardExp:0b,buy:{id:"minecraft:emerald",Count:4b},sell:{id:"blaze_rod",Count:1b,tag:{display:{Name:'{"text":"占い","color":"dark_purple","bold":true}'}}}}
##弓
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes append value {rewardExp:0b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"bow",Count:1b,tag:{display:{Name:'{"text":"弓","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の弓","color":"dark_purple"}','{"text":"※1発で壊れる","color":"dark_red"}']},Damage:384,Enchantments:[{id:"minecraft:power",lvl:255s}]}}}
##矢
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes append value {rewardExp:0b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"arrow",Count:1b,tag:{display:{Name:'{"text":"矢","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の矢","color":"dark_purple"}','{"text":"弓がないと意味がない","color":"dark_purple"}']},PickupDelay:10000}}}
##斧
execute as @e[tag=shop_position] at @s run data modify entity @e[tag=shop,sort=nearest,limit=1] Offers.Recipes append value {rewardExp:0b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"dark_red"}']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}