#tellraw @s ["",{"text":"--「ショップ設定」を付与します"}]
item replace entity @s hotbar.8 with written_book{display:{Name:'{"text":"ショップ設定","color":"#B60DFF","bold":true}'},"title":"",author:"hsfunc",pages:['[{"text":"-- 設置場所設定 --","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/execute as @s at @s run function hsfunc:werewolf/shop/set_shop_position"}},{"text":"\\n-- 設置場所削除 --","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/execute at @s run function hsfunc:werewolf/unique_position/shop_position_remove"}},{"text":"\\n\\n-- 全設置場所召喚 --","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/execute at @s run function hsfunc:werewolf/shop/set_shop"}},{"text":"\\n-- 全召喚削除 --","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/execute at @s run function hsfunc:werewolf/shop/remove_shop"}},{"text":"\\n\\n-- 召喚設定確認 --","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/function hsfunc:werewolf/unique_position/check"}},{"text":"\\n\\n-- その他召喚設定 --","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/execute at @s run function hsfunc:werewolf/unique_position/setting"}}]']} 1