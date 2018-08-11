BUCKET=GeneralBacku
BBZ_ACCOUNT_ID=fe576cdc21c5
duplicity /media/moolit/backups/Long.mpg  "b2://${BBZ_ACCOUNT_ID}:${BBZ_APPLICATION_KEY}@[$BUCKET]"


b2 authorize-account $BBZ_ACCOUNT_ID $BBZ_APPLICATION_KEY
b2 upload-file --contentType "image/jpeg" GeneralBacku ~/Wedding/uploaded/Shir\ \&\ Moly-3418.jpg "3418"
b2 list-file-names GeneralBacku
# duplicity \
#           --no-encryption \
#           --progress  \
#           ~/Wedding/uploaded/ \
#           b2://$BBZ_ACCOUNT_ID:$BBZ_APPLICATION_KEY@GeneralBacku
#
# https://help.backblaze.com/hc/en-us/articles/115001518354-How-to-configure-Backblaze-B2-with-Duplicity-on-Linux?_ga=2.69080084.445021510.1526064900-456598132.1525516202
# duplicity restore --file-to-restore [folder name from backup] b2://[account id]:[application key]@[B2 bucket name] [restore path]
