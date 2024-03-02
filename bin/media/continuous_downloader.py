# Continuously downloads items from a textfile. One item per line.
# Items are saved to the file system.
# Ryan Jensen
# 2023-03-13


import subprocess
import time
import shlex


class ContinuousDownloader:
    def __init__(self, DownloadCommand, ItemListFileName):
        self.DownloadCommand = DownloadCommand
        self.ItemListFileName = ItemListFileName
        self.HistoryFileName = '.cd-history'
        self.ErrorFileName = '.cd-error-log'
        self.__ItemList = []


    def download_continuously(self):
        self.__print_waiting_for_new_item_message()
        while 1:
            self.__read_list()
            if len(self.__ItemList) > 0:
                self.__download_item()
                self.__print_waiting_for_new_item_message()
            else:
                time.sleep(3)


    def __download_item(self):
        CurrentItem = self.__ItemList[0]
        ErrorFile = open(self.ErrorFileName,'a')
        HistoryFile = open(self.HistoryFileName, 'a')
        p = subprocess.Popen(
            [self.DownloadCommand + ' ' + shlex.quote(CurrentItem.strip())],
            stderr=ErrorFile,
            shell=True
        )
        while p.returncode == None:
            p.poll()
            time.sleep(0.5)
        if p.returncode != 0:
            ErrorFile.write(CurrentItem)
        else:
            HistoryFile.writelines(CurrentItem)
        ErrorFile.close()
        HistoryFile.close()
        self.__remove_item_from_list(CurrentItem)


    def __remove_item_from_list(self, item):
        ListFile = open(self.ItemListFileName, 'r')
        self.__ItemList = ListFile.readlines()
        self.__ItemList.remove(item)
        ListFile = open(self.ItemListFileName, 'w')
        ListFile.writelines(self.__ItemList)
        ListFile.close()


    def __read_list(self):
        try:
            ListFile = open(self.ItemListFileName, 'r')
            self.__ItemList = ListFile.readlines()
        except:
            ListFile = open(self.ItemListFileName, 'a')
        ListFile.close()


    def __write_list(self):
        ListFile = open(self.ItemListFileName, 'w')
        ListFile.writelines(self.__ItemList)
        ListFile.close()


    def __print_waiting_for_new_item_message(self):
        print("[ContinuousDownloader] looking for new items in list file: " + self.ItemListFileName)
