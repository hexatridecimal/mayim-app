![Mayim Chat](/graphics/mayim_logo.png?raw=true "Mayim Chat")

# SETUP GUIDE

First setup the Mayim server 
[here.](https://github.com/jjeffus/mayim-server "Mayim Server Repository")

# CHANGE BRANDING

These are the steps to update the app to your own branding.

1. We use
   [flutter_launcher_icons](https://github.com/fluttercommunity/flutter_launcher_icons)
so place the app launcher icon you have in /graphics.
2. Update the paths in pubspec.yaml to graphics/your_icon.png
3. flutter pub run flutter_launcher_icons:main
4. Change domain name globally:

`find . -type f -print0 | xargs -0 perl -i.bak -pe 's/may-im.com/yourapp.com/g'`

5. Change package name globally:

`find . -type f -print0 | xargs -0 perl -i.bak -pe 's/mayim/yourapp/g'`

6. After verifying this works remove the backup .bak files.

`find . -name "*.bak" -type f -delete`

7. Go to [agora.io](https://agora.io) and put your App ID in lib/Settings.dart

# COPYRIGHT

&copy; 2020 Janet Braswell-Jeffus
See includeed
[LICENSE.md](https://github.com/jjeffus/mayim-app/blob/master/LICENSE.md).
