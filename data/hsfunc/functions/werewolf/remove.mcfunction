#reset呼出
function hsfunc:werewolf/utility/reset

#無限ループ削除
schedule clear hsfunc:werewolf/utility/update_endless

#タグ削除
execute if entity @e[tag=gm] run tag @e[tag=gm] remove gm
execute if entity @e[tag=wwp] run tag @e[tag=wwp] remove wwp
execute if entity @e[tag=first] run tag @e[tag=first] remove first
execute if entity @e[tag=wwfirst] run tag @e[tag=wwfirst] remove wwfirst

#スコアボード削除


#エンティティ削除
kill @e[tag=ww,tag=game]

#チーム削除
team remove wwt

#ゲームルール変更
