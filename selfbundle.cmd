@echo off

REM Create a self-contained version of luabundle
lua luabundle.lua luabundle.lua luabundle.bundle.lua & ^
luac -o luabundle.luac luabundle.bundle.lua
