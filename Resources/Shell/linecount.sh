#!/bin/sh

#
# Portions of this AppleScript may incorporate work from 3rd 
# parties. These portions of code are noted. All other work is 
# Copyright © 2010 — 2014 Codeux Software, LLC. See 
# Acknowledgements.pdf for full license information. 
#

#
# Find command search pattern explained:
#
# -type d -name "Build Results" -prune		— Exclude directory.
# -type d -name "Frameworks" -prune			— Exclude directory.
# -type d -name ".tmp" -prune				— Exclude directory.
#
# -name '*.cpp'						— C++ Source
# -name '*.css'						— Cascading Style Sheet
# -name '*.h'						— Objective-C Header
# -name '*.hpp'						— C++ Header
# -name '*.js'						— JavaScript Source
# -name '*.l'						– Lex Source
# -name '*.m'						— Objective-C Implementation
# -name '*.mm'						– Objective-C++ Implementation
# -name '*.mustache'				— Mustache template files.
# -name '*.pch'						— Pre-compiled Header File
# -name '*.php'						- PHP Script
# -name '*.plist'					— Apple Property List
# -name '*.sh'						— Include Ourselves (joke!)
# -name '*.strings'					— Localization Strings
#
# AppleScript files (.scpt) are not included in this
# count because they are not saved as plain text so
# reading the file would be pointless as the results
# would not be accurate to the actual line count.
#
# The line count generated by this script should not
# be taken seriously. It is not very accurate and is
# more for fun.
#

find ../.. \
-type d -name "Build Results" -prune \
-o -type d -name "Frameworks" -prune \
-o -type d -name ".tmp" -prune \
-o -type f \( \
   -name '*.cpp' \
-o -name '*.css' \
-o -name '*.h' \
-o -name '*.hpp' \
-o -name '*.js' \
-o -name '*.l' \
-o -name '*.m' \
-o -name '*.mm' \
-o -name '*.mustache' \
-o -name '*.pch' \
-o -name '*.php' \
-o -name '*.plist' \
-o -name '*.sh' \
-o -name '*.strings' \
\) -print0 | xargs -0 wc -l | sort
