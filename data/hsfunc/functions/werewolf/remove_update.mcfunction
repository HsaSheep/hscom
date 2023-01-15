#各種ループ停止(endless以外)
schedule clear hsfunc:werewolf/utility/update_countdown
schedule clear hsfunc:werewolf/utility/update_day
schedule clear hsfunc:werewolf/utility/update_item
schedule clear hsfunc:werewolf/utility/update_setting
schedule clear hsfunc:werewolf/utility/update_time
#無限ループ削除
schedule clear hsfunc:werewolf/utility/update_item
schedule clear hsfunc:werewolf/utility/update_endless