#!/bin/bash

set -ex

rm -rf ./build && mkdir -p build
cat src/ss-1.0.js \
    src/skins.js \
    src/keyboard.js \
    src/main.js > build/main.js
yuicompressor -o mods/js/main.min.js build/main.js
cp build/main.js mods/js/main.js
# cat src/main.js > mods/js/main.min.js

cat vendor/bot/bot.user.js \
  src/ss.js > build/ss.js
yuicompressor -o build/ss.min.js build/ss.js
cat build/ss.min.js > mods/js/ss.min.js
cat build/ss.min.js > chrome/js/ss.min.js

yuicompressor -o mods/js/social.min.js src/social.js
yuicompressor -o mods/css/style.min.css mods/css/style.css
cat mods/css/style.min.css > chrome/css/style.min.css

cat www/js/main.js www/js/plugins.js www/js/ga.js > www/js/app.js
yuicompressor -o www/js/app.min.js www/js/app.js
yuicompressor -o www/css/main.min.css www/css/main.css

rm -f *.zip

zip -r slither-sessions-chrome.zip chrome
