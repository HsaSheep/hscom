#ショップのupdate呼出停止
schedule clear hsfunc:werewolf/shop/update_shop
#ショップ削除
kill @e[tag=ww,tag=shop]
#shop_positionの名称変更
##名称：アイテム（取り消し線）
execute as @e[tag=ww,tag=shop_position] at @s run data modify entity @s CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true,"strikethrough":true}'