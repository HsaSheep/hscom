#カウントダウン終了後の開始前準備
#gemeruleゲーム用設定
gamerule fallDamage true
gamerule fireDamage true
gamerule freezeDamage true
#teamゲーム用設定
team modify wwt color gold
team modify wwt collisionRule pushOwnTeam
team modify wwt nametagVisibility hideForOwnTeam
team modify wwt deathMessageVisibility never
team modify wwt friendlyFire true
team modify wwt seeFriendlyInvisibles false
#スコアボード初期化(中断からの復帰考慮)
scoreboard players set @e seer_id 0

#update_time呼び出し

#title表示
