@echo off
if EXIST %1 (
	nodemon --exec "manim -pql %1 SquareToCircle"
) else (
	echo please use python file as first argument
)
