#tell @s 1
#execute if entity @e[tag=shop,sort=nearest,limit=1,distance=..5] run tell @s 2
#データ初期化
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes set value {}

#データ追加
##おにく
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:1b},sell:{id:"cooked_beef",Count:5b,tag:{display:{Name:'{"text":"おにく","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','{"text":"ただのにく","color":"#8B00A1"}']}}}}
##占い
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:6b},sell:{id:"blaze_rod",Count:1b,tag:{display:{Name:'{"text":"占い","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','{"text":"ただの棒…？","color":"dark_purple"}','{"text":"※看板を右クリックで使用","color":"white"}']}}}}
##剣
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:1b},sell:{id:"golden_sword",Count:1b,tag:{display:{Name:'{"text":"剣","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の剣","color":"dark_purple"}','{"text":"ちょっといたい。","color":"#8B00A1"}']},Damage:29,Enchantments:[{id:"minecraft:sharpness",lvl:15s}]}}}
##弓
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"bow",Count:1b,tag:{display:{Name:'{"text":"弓","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の弓","color":"dark_purple"}','[{"text":"※1発で壊れる","color":"white"}]']},Damage:384,Enchantments:[{id:"minecraft:power",lvl:100s}]}}}
##矢
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"arrow",Count:1b,tag:{display:{Name:'{"text":"矢","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の矢","color":"dark_purple"}','{"text":"弓がないと意味がない","color":"dark_purple"}']},PickupDelay:10000}}}
##斧(人狼、吸血用)
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:4b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:100s}]}}}
#execute if entity @s[tag=wolf] run execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:5b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}
#execute if entity @s[tag=drac] run execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:5b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}
##発光
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:1b,buy:{id:"minecraft:emerald",Count:4b},sell:{id:"carrot_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"発光","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','{"text":"なぜ光るのかは永遠の謎。","color":"white"}','{"text":"※右クリックで使用者以外が発光する","color":"white"}]']}}}}
##にんにく
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:1b,buy:{id:"minecraft:emerald",Count:3b},sell:{id:"warped_fungus_on_a_stick",Count:1b,tag:{display:{Name:'{"text":"吸血メタ","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム,"color":"dark_purple"}','{"text":"メタって何のこと？","color":"white"}','{"text":"※右クリックで数m以内の吸血が死亡する","color":"white"}']}}}}
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:1b,buy:{id:"minecraft:emerald",Count:3b},sell:{id:"nether_star",Count:1b,tag:{display:{Name:'{"text":"にんにく","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','{"text":"くさい","color":"white"}','{"text":"※吸血を殴ると死亡する","color":"white"}']}}}}
##透明化
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:3b},sell:{id:"potion",Count:1b,tag:{display:{Name:'{"透明化","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のポーション","color":"dark_purple"}','{"text":"飲むと30秒間透明になる。","color":"white"}']},CustomPotionColor:40447,HideFlags:32,CustomPotionEffects:[{Id:14,Amplifier:0,Duration:600}]}}}
##無敵
execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:5b},sell:{id:"splash_potion",Count:1b,tag:{display:{Name:'{"無敵","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のポーション","color":"dark_purple"}','{"text":"浴びると3秒間無敵になる。","color":"white"}']},CustomPotionColor:16711769,CustomPotionEffects:[{Id:1,Amplifier:0,Duration:60},{Id:11,Amplifier:254,Duration:60}]}}}

#データ追加
##おにく
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"cooked_beef",Count:5b,tag:{display:{Name:'{"text":"おにく","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','{"text":"ただのにく","color":"#8B00A1"}']}}}}
##占い
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:10b},sell:{id:"blaze_rod",Count:1b,tag:{display:{Name:'{"text":"占い","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のアイテム","color":"dark_purple"}','[{"text":"※看板を右クリックで使用","color":"white"}]']}}}}
##剣
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:8b},sell:{id:"golden_sword",Count:1b,tag:{display:{Name:'{"text":"剣","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の剣","color":"dark_purple"}','{"text":"ちょっといたい。","color":"#8B00A1"}']},Damage:29,Enchantments:[{id:"minecraft:sharpness",lvl:15s}]}}}
##弓
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:4b},sell:{id:"bow",Count:1b,tag:{display:{Name:'{"text":"弓","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の弓","color":"dark_purple"}','[{"text":"※1発で壊れる","color":"white"}]']},Damage:384,Enchantments:[{id:"minecraft:power",lvl:255s}]}}}
##矢
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:4b},sell:{id:"arrow",Count:1b,tag:{display:{Name:'{"text":"矢","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の矢","color":"dark_purple"}','{"text":"弓がないと意味がない","color":"dark_purple"}']},PickupDelay:10000}}}
##斧(人狼、吸血用)
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:2b,buy:{id:"minecraft:emerald",Count:8b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}
#execute if entity @s[tag=wolf] run execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:5b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}
#execute if entity @s[tag=drac] run execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:5b,buy:{id:"minecraft:emerald",Count:2b},sell:{id:"netherite_axe",Count:1b,tag:{display:{Name:'{"text":"斧","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用の斧","color":"dark_purple"}','{"text":"※1発で壊れる","color":"white"}','[{"text":"※","color":"white"},{"text":"人狼","color":"dark_red"},{"text":"、","color":"white"},{"text":"吸血","color":"dark_purple"},{"text":"用","color":"white"}]']},Damage:2031,Enchantments:[{id:"minecraft:sharpness",lvl:255s}]}}}
##透明化
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:3b,buy:{id:"minecraft:emerald",Count:6b},sell:{id:"potion",Count:1b,tag:{display:{Name:'{"透明化","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のポーション","color":"dark_purple"}','{"text":"飲むと30秒間透明になる。","color":"white"}']},CustomPotionColor:40447,HideFlags:32,CustomPotionEffects:[{Id:14,Amplifier:0,Duration:600}]}}}
##無敵
#execute at @s run data modify entity @e[tag=shop,sort=nearest,limit=1,distance=..5] Offers.Recipes append value {rewardExp:0b,maxUses:3b,buy:{id:"minecraft:emerald",Count:10b},sell:{id:"splash_potion",Count:1b,tag:{display:{Name:'{"無敵","color":"dark_purple","bold":true}',Lore:['{"text":"人狼ゲーム用のポーション","color":"dark_purple"}','{"text":"浴びると3秒間無敵になる。","color":"white"}']},CustomPotionColor:16711769,CustomPotionEffects:[{Id:1,Amplifier:0,Duration:60},{Id:11,Amplifier:254,Duration:60}]}}}