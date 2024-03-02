#!/usr/bin/python
# split-flac
#
# splits audio up into smaller chunks in sub-directory
#
# syntax:
#     split-flac INPUT-FILE PERIOD
# ex:
#     split-flac audio-file.mp3 600
# the command above will split the audio-file into 10-minute segments

import os
import sys
import re

def line():
    print("========================================")

# print header indicating the program that is running.
line()
print(__file__)
line()

MIN_ARGS = 2
MAX_ARGS = 3
NUM_INPUT_ARGUMENTS = len(sys.argv) - 1

if NUM_INPUT_ARGUMENTS < MIN_ARGS:
    print("You have not entered enough arguments. Minimum args = " + str(MIN_ARGS))
    line()
    exit()

if NUM_INPUT_ARGUMENTS > MAX_ARGS:
    print("You have entered too many arguments!  You entered " +  str(NUM_INPUT_ARGUMENTS) + " total.  That is " + str(NUM_INPUT_ARGUMENTS-MAX_ARGS)  + " over the legal limit of " + str(MAX_ARGS))
    line()
    exit()

audio_file = sys.argv[1]
split_period = 600

if NUM_INPUT_ARGUMENTS >= 3:
    split_period = num(sys.argv[2])

print("Target String = \"" + sys.argv[1] + "\"")
print("Replacement String = \"" + sys.argv[2] + "\"")
line()

files_renamed = 0

def rename_and_report(name_orig, pattern_find, pattern_replace):
    global files_renamed
    name_new = name_orig.replace(pattern_find, pattern_replace)
    if name_new == name_orig:
        return
    else:
        if files_renamed > 0:
            print("")
        print(name_orig)
        print(name_new)
        os.rename(name_orig, name_new)
        files_renamed += 1

# TODO: allow user to specify target directory
TargetDirectory = '.'
FilesInTargetDirectory = os.listdir(TargetDirectory)

print("re-naming files...")
print("")
# rename the files as per the patterns provided by the user.
# this prints messages when it renames a file
[rename_and_report(f, sys.argv[1], sys.argv[2])  for f in FilesInTargetDirectory if not f.startswith('.')]
line()

print("total # of files renamed = " + str(files_renamed))
line()


