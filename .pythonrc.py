# Universal default imports (I use these all the time).
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# Force UTF-8 (especially on Windows)
import sys

sys.stdin.reconfigure(encoding="utf-8")
sys.stdout.reconfigure(encoding="utf-8")
sys.stderr.reconfigure(encoding="utf-8")

del sys


# Another thing I seriously need to clear the screen.
# "cls" is a keyword, and "clear" is too broad.
import os
import platform

def clear_screen():
    command = "cls" if "Windows" in platform.system() else "clear"
    os.system(command)

globals()["clear_screen"] = clear_screen

del platform
del os