#reset_shop_offer(ショップのOffer初期化)を行う
execute as @a[tag=wwp] at @s run function hsfunc:werewolf/shop/reset_shop_offers
#スコア初期化
#scoreboard players set @a[tag=wwp] shop_rightClick 0
#次回呼出
schedule function hsfunc:werewolf/shop/update_shop 10t replace