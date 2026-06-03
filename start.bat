@echo off
chcp 65001 >nul
title OFFICOS AI LAB server (5577)
cd /d "%~dp0"
echo ============================================
echo     OFFICOS AI LAB   社内サーバー
echo ============================================
echo.
echo ● この黒い画面は開いたままにしてください（閉じると停止します）
echo ● 3人がブラウザで開くアドレス:  http://[このPCのIPアドレス]:5577/
echo    IPの調べ方: スタート→「cmd」→ ipconfig と入力 →「IPv4 アドレス」
echo.
set "PY="
where python  >nul 2>nul && set "PY=python"
if not defined PY ( where py      >nul 2>nul && set "PY=py" )
if not defined PY ( where python3 >nul 2>nul && set "PY=python3" )
if defined PY (
  echo 起動します ... (%PY%)   ※止めるにはこのウィンドウを閉じる
  echo.
  %PY% -m http.server 5577 --bind 0.0.0.0
) else (
  echo [!] このPCには Python が見つかりませんでした。
  echo     README.txt の「Python が無い場合」をご覧ください（中村さんに相談でもOK）
  echo.
  pause
)
