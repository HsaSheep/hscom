#関係ないMOB(点火したTNT等)をキル
kill @e[type=!minecraft:player,type=!minecraft:arrow,tag=!dummy,tag=!ww]
#着弾した矢を削除
kill @e[type=minecraft:arrow,nbt={inGround:true}]
#次回呼出
schedule function hsfunc:werewolf/utility/update_endless 1s