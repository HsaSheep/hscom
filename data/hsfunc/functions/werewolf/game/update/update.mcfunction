gamemode spectator @a[tag=wPlayer,scores={death=1..}]

#終了判定
#execute unless entity @a[tag=!wolf,tag=!mani,scores={death=0}] run title @a[tag=wPlayer] title ["",{"text":"--- "},{"text":"人狼","color":"red"},{"text":"の勝利 ---"}]
#execute unless entity @a[tag=wolf,scores={death=0}] run title @a[tag=wPlayer] title ["",{"text":"--- "},{"text":"村人","color":"green"},{"text":"の勝利 ---"}]

schedule function hsfunc:werewolf/game/update/update 1s