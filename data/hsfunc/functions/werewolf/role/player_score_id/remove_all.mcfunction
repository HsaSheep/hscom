#プレイヤーID設定用
scoreboard objectives remove player_id
#参加人数カウント
scoreboard objectives remove player_count

#デバック表示
scoreboard objectives setdisplay sidebar
scoreboard objectives setdisplay list

#アマスタ削除
kill @e[tag=DummyPlayer,tag=Id]