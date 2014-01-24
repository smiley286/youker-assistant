#!/usr/bin/python
# -*- coding: utf-8 -*-
### BEGIN LICENSE

# Copyright (C) 2013 National University of Defense Technology(NUDT) & Kylin Ltd
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 3, as published
# by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranties of
# MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
# PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.
### END LICENSE

import time
import httplib

class UserInfo():
    def time_points(self, time):
        if time >= 1 and time < 2 :
            return 2
        elif time >= 2 and time < 4 :
            return 4
        elif time >= 4 and time < 6 :
            return 8
        elif time >= 6 and time < 10 :
            return 12
        elif time >= 10 and time < 15 :
            return 20
        elif time >= 15 :
            return 30
        else :
            return 0

    def get_httptime(self):
        try:
            conn = httplib.HTTPConnection("www.beijing-time.org")
            conn.request("GET", "/time.asp")
            response = conn.getresponse()
            if response.status == 200:
                result = response.read()
                data = result.split("\r\n")
                time = {}
                time['year'] = data[1][len("nyear")+1 : len(data[1])-1]
                time['month'] = data[2][len("nmonth")+1 : len(data[2])-1]
                time['day'] = data[3][len("nday")+1 : len(data[3])-1]
                time['hour'] = data[5][len("nhrs")+1 : len(data[5])-1]
                time['minute'] = data[6][len("nmin")+1 : len(data[6])-1]
                time['sec'] = data[7][len("nsec")+1 : len(data[7])-1]
                return time
        except Exception,e:
            return False
            #print e

    def get_currrent_date(self):
        current_time = self.get_httptime()
        if not current_time:
            return
        current_date = str(current_time['year']) + "-" + str(current_time['month']) + "-" + str(current_time['day'])
        return current_date

    def login_in_forum(self, login_flag, org_date):
        current_date = self.get_currrent_date()
        if not current_date == org_date:
            if login_flag:#first login today
                return 5
        return 0

    # Login judgment day for the first time
    def first_login(self, yesterday_login, user_points):
        '''Like this: {'hour': '13', 'month': '1', 'sec': '27', 'year': '2014', 'day': '21', 'minute': '55'}'''
        #current_time = time.localtime(time.time())
        current_time = self.get_httptime()
        #print "11"
        #print current_time
        if not current_time :
            #print None
            return None
        #days = '0'
        current_date = str(current_time['year']) + "-" + str(current_time['month']) + "-" + str(current_time['day'])
        #print "22"
        #print current_date
        flogin = 0
        if not current_date == yesterday_login:
            user_points += 5
            yesterday_login = current_date
            flogin = 1
        #print '33'
        #print yesterday_login, user_points, flogin
        return (yesterday_login, user_points, flogin)

    def login(self):
        current_time = self.get_httptime()
        if not current_time :
            return None
        login_time = int(current_time['day'])*24 + int(current_time['hour'])
        #print login_time
        return login_time

    def quit(self, login_time, user_points, today_time):
        current_time = self.get_httptime()
        if not current_time :
            return None
        quit_time = int(current_time['day'])*24 + int(current_time['hour'])
        add_time = quit_time - login_time
        #Less accumulated login time score increases
        user_points -= self.time_points(today_time)
        today_time += add_time
        #Increased cumulative time score increases
        user_points += self.time_points(today_time)
        #print today_time,user_points
        return (today_time, user_points)

if __name__ == '__main__':
    wb = UserInfo()
    print wb.get_currrent_date()
    #wb.first_login('2014-01-16', 1000)
    #wb.login()
    #wb.quit(418, 1005, 0)
