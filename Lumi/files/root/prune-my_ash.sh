#!/usr/bin/env sh

AVAIL=$(df|grep 'overlayfs'|awk '{print $4}')

for path in /opt/zigbee2mqtt /usr/lib/node/ /usr/lib/node_modules
do
cd $path
echo "Before: "$(du -hs .) "Files: "$(find . -type f | wc -l) " in " $path

# Common unneeded files
find . -type d -name node_modules -prune -exec find {} -type f -iname Makefile -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname README -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname README.md -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname CHANGELOG -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname CHANGELOG.md -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .editorconfig -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .gitmodules -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .gitattributes -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name robot.html -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .lint -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname Gulpfile.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname Gruntfile.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .tern-project -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .gitattributes -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .editorconfig -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .eslintrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .jshintrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .npmignore -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name .flowconfig -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .documentup.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .yarn-metadata.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .travis.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name thumbs.db -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .tern-port -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .ds_store -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name desktop.ini -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name npm-debug.log -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .npmrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE.txt -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE.md -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE-MIT -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE-MIT.txt -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE.BSD -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE-BSD -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE-jsbn -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname LICENSE -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname AUTHORS -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname CONTRIBUTORS -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name .yarn-integrity -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name builderror.log -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .documentup.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname appveyor.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .gitlab-ci.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname circle.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .coveralls.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname CHANGES -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .yarnclean -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -iname _config.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .babelrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .babelrc.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .yo-rc.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname jest.config.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname karma.conf.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname wallaby.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname wallaby.conf.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .prettierrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .prettierrc.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .prettierrc.toml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .prettierrc.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .prettierrc.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname prettier.config.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .appveyor.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname tsconfig.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname tslint.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname Jenkinsfile -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .tern-project -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname eslint -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .eslintrc.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .eslintrc.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .eslintrc.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .eslintignore -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .stylelintrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname stylelint.config.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .stylelintrc.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .stylelintrc.yaml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .stylelintrc.yml -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .stylelintrc.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .htmllintrc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname htmllint.js -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -iname .npmignore -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name prepare-tests -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name info -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name publish-built-version -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name travis-gh-pages -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name typedoc-tsconfig.json -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.md" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.sln" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.obj" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.gypi" -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name "*.png" -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name "*.jpg" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.js.map" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.ts.map" -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name "*-es5.js" -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type f -name "*-es5.min.js" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.vcxproj" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.vcxproj.filters" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.jst" -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type f -name "*.coffee" -print0 \; | xargs -0 rm -rf


# Common unneeded directories
find . -type d -name node_modules -prune -exec find {} -type d -name __tests__ -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name test -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name tests -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name powered-test -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name docs -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name doc -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name man -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type d -name website -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type d -name images -print0 \; | xargs -0 rm -rf
#find . -type d -name node_modules -prune -exec find {} -type d -name assets -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name example -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name builds -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name examples -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name coverage -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name node-gyp -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name node-pre-gyp -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name gyp -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name .nyc_output -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name .idea -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name .vscode -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name .circleci -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name .github -print0 \; | xargs -0 rm -rf
find . -type d -name node_modules -prune -exec find {} -type d -name benchmarks -print0 \; | xargs -0 rm -rf


#rm -rf ./node_modules/ajv/dist
#rm -rf ./test
#rm -rf ./node_modules/mqtt/dist
#rm -rf ./node_modules/async/dist
#rm -rf ./node_modules/winston/dist
#rm -rf ./node_modules/js-yaml/dist

#rm ./node_modules/mqtt-packet/testRandom.js
#rm ./node_modules/mqtt-packet/test.js

#rm ./node_modules/zigbee-herdsman/npm-shrinkwrap.json
#rm ./node_modules/zigbee-herdsman-converters/npm-shrinkwrap.json
#rm -f ./node_modules/zigbee2mqtt-frontend/dist/report.html
#rm -f ./node_modules/zigbee2mqtt-frontend/dist/*.map
#rm -f ./node_modules/zigbee2mqtt-frontend/dist/*/*.map
#rm -rf ./node_modules/moment/min
#rm -rf ./node_modules/moment/src
#rm -rf ./node_modules/moment/locale
#mv ./node_modules/moment/dist/locale/ru.js ./node_modules/moment/dist/locale/ru.jstmp
#mv ./node_modules/moment/dist/locale/de.js ./node_modules/moment/dist/locale/de.jstmp
#mv ./node_modules/moment/dist/locale/en-gb.js ./node_modules/moment/dist/locale/en-gb.jstmp
#rm -rf ./node_modules/moment/dist/locale/*.js
#for i in ./node_modules/moment/dist/locale/*.jstmp; do mv "$i" "${i/tmp/}"; done

echo "After: "$(du -hs .) "Files: "$(find . -type f | wc -l)

done

N=$(df|grep 'overlayfs'|awk '{print $4}')

echo "Everything is done! Cleaned `expr $N - $AVAIL` Kb"

sleep 5s
