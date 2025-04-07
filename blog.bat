@echo off
chcp 65001 >nul
title 启动博客预览服务

echo === 启动博客本地预览服务 ===
echo.

REM 检查是否安装了Ruby
where ruby >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到Ruby，请先安装Ruby
    echo 访问 https://rubyinstaller.org/downloads/ 下载安装
    pause
    exit /b 1
)

REM 检查是否安装了Bundle
where bundle >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [信息] 正在安装Bundle...
    gem install bundler
)

echo [信息] 正在安装依赖...
call bundle install

echo.
echo [信息] 启动Jekyll服务...
echo 请访问 http://localhost:4000 预览博客
echo 按Ctrl+C停止服务
echo.

call bundle exec jekyll serve

pause