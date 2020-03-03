#!/usr/bin/env python
import sys
import numpy as np
import matplotlib.pyplot as plt

if len(sys.argv) == 1:
    ext = 'png'
else:
    ext = sys.argv[1]

fsize = 9

# Spacing adjustment
eps = 0.005
delta = 0.02

input_files = ['day1.txt', 'day2.txt', 'day3.txt', 'day4.txt', 'day5.txt']

day_labels = ['Monday March 30 -- AToM core team',
              'Tuesday March 31 -- AToM core team',
              'Wednesday April 1 -- AToM core team',
              'Thursday April 2 -- ITER',
              'Friday April 3 -- ITER', ]

x0 = np.zeros(3)
x1 = np.zeros(3)
xm = np.zeros(3)

for input_file, day_label in zip(input_files, day_labels):

    fig = plt.figure(figsize=(8.5, 11))

    print(input_file)

    for line in open(input_file, 'r'):

        data = line.split('|')
        tag = data[-1].strip()

        x0 = eps
        x1 = 1.0 - eps
        xm = 0.5

        # Correct newline string
        event = tag.replace('\\n', '\n').strip()
        x = data[0].split(':')
        # Height of session window
        start = int(x[0]) + int(x[1]) / 60.0
        end = start + int(data[1]) / 60.0

        # background/font colors
        thiscolor = 'lightpink'
        thisfc = 'black'

        fsize = 10
        dy = 0
        if event.find('tiny') > 0:
            event = event.replace("tiny", "")
            fsize = 8
            dy = 0.03

        if event.find('hack') > 0:
            thiscolor = 'lightblue'
        elif event == 'open':
            thiscolor = 'lightgreen'
            event = ''
        elif event == 'closed':
            thiscolor = 'gray'
            thisfc = 'white'
            event = ''
        elif event == 'BREAK':
            thiscolor = 'slateblue'
            thisfc = 'white'
        elif event == 'LUNCH':
            thiscolor = 'cornsilk'
            thisfc = 'black'

        # plot event
        plt.fill_between([x0, x1],
                         [start, start],
                         [end - delta, end - delta],
                         color=thiscolor,
                         edgecolor='k', linewidth=0.5)
        # plot beginning time
        if event != 'BREAK' and event != 'LUNCH':
            plt.text(x0 + eps, start + 0.05 - dy,
                     '{0}:{1:0>2}'.format(int(x[0]), int(x[1])) + '\n',
                     va='top', fontsize=7, color=thisfc)
        else:
            plt.text(x0 + eps, start + 0.05 - dy,
                     '{0}:{1:0>2}'.format(int(x[0]), int(x[1])),
                     va='top', fontsize=7, color=thisfc)

        # plot event name
        plt.text(xm, start + 0.05 - dy,
                 event, va='top', ha='center', fontsize=fsize, color=thisfc)

        # Set Axis
    ax = fig.add_subplot(111)
    ax.set_xlim(0.0 - eps, 1.0 + eps)
    ax.set_ylim(18.05, 8.95)
    ax.set_xticks([])
    ax.set_yticks(np.arange(10) + 9)
    ax.set_ylabel('Time')

    # Set Second Axis
    ax2 = ax.twiny().twinx()
    ax2.set_xlim(0.0 - eps, 1.0 + eps)
    ax2.set_ylim(18.05, 8.95)
    ax2.set_xticks([])
    ax2.set_yticks(np.arange(10) + 9)
    ax2.set_ylabel('Time')

    ttl = ax.title
    ttl.set_position([.5, 1.0])
    ax.set_title(day_label)
    plt.tight_layout()
    if ext == 'screen':
        plt.show()
    else:
        plt.savefig(input_file.split('.')[0] + '.' + ext)
