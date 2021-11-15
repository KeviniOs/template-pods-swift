#!/usr/bin/env python3
import fileinput
import os
import glob
import string
import re

podsLockFile = "Podfile.lock"
swiftLintFile = ".swiftlint.yml"
includePathSession = "included:\n  - ../Sources\n"
updateIncludePathSession = includePathSession

with open(swiftLintFile, 'r') as swiftLint:
  text = swiftLint.read()

with open(podsLockFile, 'r') as podsLock:
  for line in podsLock.readlines():
    if line.startswith("    :path: \""):
        podPath = line[12:-2]
        if podPath != "../":
            updateIncludePathSession += "  - " + podPath + "\n"

text = re.sub(r'included:\n(  - .*\n)*', updateIncludePathSession, text)

with open(swiftLintFile, 'w') as swiftLint:
  swiftLint.write(text)
