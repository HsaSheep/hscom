#耐性付与（死亡防止）
execute if entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run effect give @a[tag=wwp] minecraft:resistance 16 255 true
#透明化付与（ネタバレ防止）
execute if entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run effect give @a[tag=wwp] minecraft:invisibility 16 255 true
#暗転付与（thie以外、ネタバレ防止）
execute if entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run effect give @a[tag=wwp,tag=!thie] minecraft:darkness 16 255 true


#設定未完了のthieがいる場合、時価呼出
execute if entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run schedule function hsfunc:werewolf/utility/thie_update 1s replace


#thieの設定が完了場合、effectを削除し、スタート
execute unless entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run schedule clear hsfunc:werewolf/utility/thie_update
##tp
execute unless entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run tp @a[tag=wwp] @e[tag=game,limit=1]
##ポーション効果削除
execute unless entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run effect clear @a[tag=wwp]
##ショップ設置
execute unless entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run execute if entity @e[tag=shop_position] run function hsfunc:werewolf/shop/set_shop
##update_time呼出
execute unless entity @a[tag=wwp,tag=thie,scores={thie_id=0}] run function hsfunc:werewolf/utility/update_time