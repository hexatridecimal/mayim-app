![Mayim Chat](/graphics/mayim_logo.png?raw=true "Mayim Chat")

# SETUP GUIDE

First deploy the Mayim server 
[here.](https://github.com/jjeffus/mayim-server/blob/master/GUIDE.md "Mayim Server Deployment Guide")

# CHANGE BRANDING

These are the steps to update the app to your own branding.

1. Deploy the Mayim server and set APP_SERVER in lib/Settings.dart
2. Go to [agora.io](https://agora.io) and set your APP_ID in lib/Settings.dart
3. We use
   [flutter_launcher_icons](https://github.com/fluttercommunity/flutter_launcher_icons)
so place the app launcher icon you have in /graphics.
4. Update the paths in pubspec.yaml to graphics/your_icon.png
5. flutter pub run flutter_launcher_icons:main
6. Change domain name globally:

`find . -type f -print0 | xargs -0 perl -i.bak -pe 's/may-im.com/yourapp.com/g'`

7. Change package name globally:

`find . -type f -print0 | xargs -0 perl -i.bak -pe 's/mayim/yourapp/g'`

8. After verifying this works remove the backup .bak files.

`find . -name "*.bak" -type f -delete`

9. Start an emulator or attach a device and then:

`flutter run`

VOILA! You should be able to login with the accounts in
mayim-server/db/seeds.rb.

# COPYRIGHT

&copy; 2020 Janet Braswell-Jeffus
See includeed
[LICENSE.md](https://github.com/jjeffus/mayim-app/blob/master/LICENSE.md).
