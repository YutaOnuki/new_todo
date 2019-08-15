#!/bin/bash

cd /todo_ver2/frontend
npm install
npm run build

cp -a /todo_ver2/frontend/dist/static/js/. /todo_ver2/app/assets/javascripts/frontend
cp -a /todo_ver2/frontend/dist/static/css/. /todo_ver2/app/assets/stylesheets/frontend

if [ -d /todo_ver2/frontend/dist/static/img/ ] ;then
  # ディレクトリないとcpでエラーになるからなければ作る
  if [ ! -d /todo_ver2/public/static/img ] ;then
    mkdir -p /todo_ver2/public/static/img
  fi
  cp -a /todo_ver2/frontend/dist/static/img/. /todo_ver2/public/static/img/
fi