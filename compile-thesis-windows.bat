@echo off
setlocal
cd /d "%~dp0"
latexmk -pdf thesis.tex
exit /b %errorlevel%
