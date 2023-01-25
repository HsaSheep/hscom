#各種ループ停止(endless以外)
schedule clear hsfunc:werewolf/utility/countdown_update
schedule clear hsfunc:werewolf/utility/day_update
schedule clear hsfunc:werewolf/utility/item_update
schedule clear hsfunc:werewolf/utility/setting_update
schedule clear hsfunc:werewolf/utility/time_update
#無限ループ削除
schedule clear hsfunc:werewolf/utility/item_update
schedule clear hsfunc:werewolf/utility/endless_update