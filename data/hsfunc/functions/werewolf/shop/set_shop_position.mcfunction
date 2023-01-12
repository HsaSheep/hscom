#召喚（テストデータあり）
summon armor_stand ~ ~1 ~ {Tags:["dummy","ww","shop_position"],CustomName:'{"text":"アイテム"}',CustomNameVisible:true,Marker:true,Invisible:true,NoGravity:true}
#名称：アイテム（取り消し線）
data modify entity @e[tag=shop_position,limit=1,sort=nearest] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true,"strikethrough":true}'
#名称：アイテム
#data modify entity @e[tag=shop_point,limit=1,sort=nearest] CustomName set value '{"text":"アイテム","color":"#8B00A1","bold":true}'