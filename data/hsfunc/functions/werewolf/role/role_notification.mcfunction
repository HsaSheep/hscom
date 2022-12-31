execute as @a[tag=wolf,tag=!mani] run tellraw @s ["",{"text":"あなたは"},{"text":"人狼","color":"red"},{"text":"です。"}]
execute as @a[tag=!wolf,tag=mani] run tellraw @s ["",{"text":"あなたは"},{"text":"共犯者","color":"gold"},{"text":"です。"}]
execute as @a[tag=!wolf,tag=!mani] run tellraw @s ["",{"text":"あなたは"},{"text":"村人","color":"green"},{"text":"です。"}]