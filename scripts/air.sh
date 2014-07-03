#!/bin/bash

cd 
git pull ~/Documents/myconfig/

rsync -av ~/Documents/myconfig/thunderbird/gmail/msgFilterRules.dat  ~/Library/Thunderbird/Profiles/66fp2r7z.default/ImapMail/imap.googlemail-1.com/msgFilterRules.dat
