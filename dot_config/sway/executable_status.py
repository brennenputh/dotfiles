#!/bin/python3

from datetime import datetime
from psutil import sensors_battery, cpu_percent, virtual_memory, net_io_counters
from socket import gethostname, gethostbyname
from subprocess import check_output
from sys import stdout
from time import sleep


def write(data):
    stdout.write("%s\n" % data)
    stdout.flush()


def refresh():
    format = ""

    format += "CPU: " + str(cpu_percent()) + "% | "
    format += (
        "RAM: "
        + str(
            int(
                (100 - (virtual_memory().available * 100 / virtual_memory().total)) * 10
            )
            / 10
        )
        + "% | "
    )

    format += "IP: " + gethostbyname(gethostname()) + " "
    try:
        ssid = check_output("iwgetid -r", shell=True).strip().decode("utf-8")
        format += "(%s) " % ssid
    except Exception:
        pass
    format += "| "

    network_info = net_io_counters()
    format += "Send: " + str(int(network_info.bytes_sent/1e4)/1e2) + "KB "
    format += "Recv: " + str(int(network_info.bytes_recv/1e4)/1e2) + "KB "
    format += "| "

    battery_data = sensors_battery()
    if not battery_data is None:
        format += "Battery: " + str(battery_data.percent) + " "
        format += (
            "Charging" if sensors_battery().power_plugged else "Discharging" + " | "
        )

    format += "Date: " + datetime.now().strftime("%h %d %A %H:%M")
    write(format)


while True:
    refresh()
    sleep(1)
