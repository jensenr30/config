#!/usr/bin/python

# # startup.py
# this is the entry point for start-up scripts on all of my machines
# everything you want to happen at start-up happens here.  :)




#===============================================================================
# imports
#===============================================================================

import datetime
from os.path import expanduser
import os
import platform
import subprocess
import time




#===============================================================================
# grope around - gather information about hardware, software, filesystem, ...
#===============================================================================

# get absolute path to user's home directory.
user_home = expanduser('~')
# get the name of this file
this_files_name = os.path.basename(__file__)
# set the configuration home directory.
cfg_home  = user_home + os.sep + ".jensenr30"
# get the name of the computer on which this python program is running.
hostname = platform.node()
# get the name of the operating system that is currently running this program.
sysname = platform.system().lower()
python_cmd = "python"
if sysname == "linux":
    python_cmd = "python3"
# TODO: figure out a better solution for this
bash_on_windows = '\"C:\Program Files\Git\bin\bash.exe\"'


#===============================================================================
# utilities
#===============================================================================
# determine the file to which the log will be written.
log_file_name_abs = cfg_home + os.sep + this_files_name + "_log.txt"


# write a message to the log (appears on terminal and gets written to log file)
def log(message):
    print(message)
    log = open(log_file_name_abs,"a")
    time_str = str(datetime.datetime.now())
    log.write(time_str + "   " + message + '\n')
    log.close()


def log_banner(message):
    log("========================================")
    log(message)
    log("========================================")


# ensure directory exists (create parent directories if needed)
def mkdir_p(path):
    if not os.path.isdir(path):
        os.makedirs(path)


# like the "touch" command, except it won't change the file's date modified
# if the file already exists.
def create_file_if_it_doesnt_exist(file):
    if os.path.isdir(file):
        raise ValueError('Error: user is trying to make sure a file exists, but it is a directory.')
    elif not os.path.isfile(file):
        fp = open(file, "a")
        fp.close()


# run a script
# currently supports:
#    python scripts
#    shell scripts
#    batch files
# returns true if run_script was able to identify and run the script
# returns false otherwise.
def run_script(filepath, filename):
    filename_abs = filepath + os.sep + filename
    log("attempting to run script:  " + filename_abs)
    if filename_abs[-3:] == '.py':
        os.system( python_cmd + ' ' + filename_abs)
    elif filename_abs[-3:] == '.sh':
        if (sysname == "linux"):
            os.system('chmod a+rx ' + filename_abs)
            os.system('cd ' + filepath + " && ./" + filename)
        #elif opsystem == 'Windows':
            # TODO: figure out a way to run a .sh file on windows
            #os.system(bash_on_windows + ' ' + filename_abs)
    elif filename_abs[-4:] == '.bat':
        # only run .bat scripts if you are currently on Windows.
        if sysname == 'windows':
            p = subprocess.Popen(filename, shell=True, cwd=filepath, )
        else:
            log('skipped .bat file - we aren''t in Kansas anymore...')
            return False
    else:
        # if we reach this point, it means we didn't recognize the script file
        # type, and we didn't execute anything.  So we failed: return False.
        return False
    return True


#===============================================================================
# Program Meat
#===============================================================================
log_banner("python startup script ::  running...")

# define your directory structure
cfg_dirs = [
    cfg_home,
    cfg_home + os.sep + sysname,
    cfg_home + os.sep + hostname,
    cfg_home + os.sep + sysname + os.sep + hostname,
]
cfg_dirs = sorted(cfg_dirs)

# all possible startup scripts
startup_python = 'startup.py'
startup_shell  = 'startup.sh'
startup_batch  = 'startup.bat'
cfg_files = [
    startup_python,
    startup_shell,
    startup_batch,
]


def file_type_OS_mismatch(filename, opsystem):
    if opsystem == "linux" and filename[-4:] == ".bat":
        return True
    if opsystem == "windows" and filename[-3:] == ".sh":
        return True


# ensure each file and directory exists.
for cfgdir in cfg_dirs:
    # make sure each directory exists
    mkdir_p(cfgdir)
    for cfgfile in cfg_files:
        if file_type_OS_mismatch(cfgfile, sysname):
            continue
        # make sure each file exists
        filename_abs = cfgdir + os.sep + cfgfile
        if not os.path.isfile(filename_abs):
            log("creating:                  " + filename_abs)
            create_file_if_it_doesnt_exist(filename_abs)


# run all startup scripts.
for cfgdir in cfg_dirs:
    # run all the startup scripts
    for cfgfile in cfg_files:
        if file_type_OS_mismatch(cfgfile, sysname):
            continue
        run_script(cfgdir, cfgfile)


#===============================================================================
# closing statements
#===============================================================================
log_banner("python startup script ::  completed!")
log_file_name_abs_print = log_file_name_abs.replace(expanduser('~'), '~')
log("startup log >> " + log_file_name_abs_print)
