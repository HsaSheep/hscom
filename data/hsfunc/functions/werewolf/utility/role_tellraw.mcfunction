#通知準備
##怪盗
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie,scores={thie_id=0}] run tag @s add thie_before

#役職の通知(tellraw)
##役職通知
tellraw @s[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,tag=!thie_before] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "あなたは "},{"text": "村人","color": "green"},{"text": " です","color": "white"}]
tellraw @s[tag=wwp,tag=!wolf,tag=!mani,tag=!drac,tag=!thie_before] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "勝利条件： すべての人狼を倒す"}]
tellraw @s[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "あなたは "},{"text": "人狼","color": "red"},{"text": " です","color": "white"}]
tellraw @s[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "勝利条件： すべての村人を倒す"}]
tellraw @s[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "あなたは "},{"text": "狂人","color": "gold"},{"text": " です","color": "white"}]
tellraw @s[tag=wwp,tag=mani] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "勝利条件： 村人に悟られないよう人狼に協力し、すべての村人を倒す"}]
tellraw @s[tag=wwp,tag=drac] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "あなたは "},{"text": "吸血","color": "dark_purple"},{"text": " です","color": "white"}]
tellraw @s[tag=wwp,tag=drac] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "勝利条件： 村人または人狼いずれかを壊滅させる"}]
tellraw @s[tag=wwp,tag=thie,tag=thie_before] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "あなたは "},{"text": "怪盗","color": "blue"},{"text": " です","color": "white"}]
tellraw @s[tag=wwp,tag=thie,tag=thie_before] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text": "勝利条件： 盗んだ陣営の勝利条件に従う"}]

#仲間通知
##仲間通知用タグ付与
tag @s add tell_m
##仲間の通知（人狼）
tellraw @s[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":" 人狼メンバー：","color": "red"}]
#execute as @a[tag=wwp,tag=wolf] run tellraw @a[tag=wwp,tag=wolf] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":" "},{"selector":"@s","color":"red"}]
execute as @a[tag=wwp,tag=wolf] run tellraw @a[tag=wwp,tag=wolf,tag=tell_m] ["",{"text":"["},{"selector":"@e[tag=game,limit=1]"},{"text":"] "},{"text":" "},{"selector":"@s","color":"red"}]

#終了処理
##怪盗
execute if entity @a[tag=wwp,tag=thie] as @a[tag=wwp,tag=thie] run tag @s remove thie_before
##仲間通知用タグ削除
tag @s remove tell_m