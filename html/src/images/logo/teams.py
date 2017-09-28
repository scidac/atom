import numpy as np
from jaamplotdefs import *

def arc(n,a1,a2,r2,r3):
    cx = r2*np.cos(a1+x*(a2-a1))
    sx = r2*np.sin(a1+x*(a2-a1))
    cx = np.append(cx,[r3*np.cos(a2)])
    sx = np.append(sx,[r3*np.sin(a2)])
    cx = np.append(cx,r3*np.cos(a2+x*(a1-a2)))
    sx = np.append(sx,r3*np.sin(a2+x*(a1-a2)))
    cx = np.append(cx,[r2*np.cos(a1)])
    sx = np.append(sx,[r2*np.sin(a1)])
   
    return cx,sx
    

n = 48
r1=0.85
r2=1.05
r3=2.4
al=0.3
ec='black'

a  = np.pi/3.5
da = np.pi/18.0

for i in range(4):
    fig = plt.figure(figsize=(8,8))
    fig.subplots_adjust(left=0,right=1,top=1,bottom=0)
    ax = fig.add_subplot(111)

    if i == 0:
        c1 = 'm'
        c2 = '#5555ff'
        c3 = '#229922'
    elif i==1:
        c1 = 'm'
        c2 = '#777777'
        c3 = '#777777'
    elif i==2:
        c1 = '#777777'
        c2 = '#5555ff'
        c3 = '#777777'
    elif i==3:
        c1 = '#777777'
        c2 = '#777777'
        c3 = '#229922'
        
    # Team 2
    x = np.arange(n)/(n-1.0)
    cx = r1*np.cos(x*2*np.pi)
    sx = r1*np.sin(x*2*np.pi)
    ax.fill(cx,sx,color=c2,alpha=al,edgecolor=ec)

    # Team 1
    cx,sx = arc(n,-a/2,a/2,r2,r3)
    ax.fill(sx,cx,color=c1,alpha=al,edgecolor=ec)

    cx,sx = arc(n,da+a/2,da+3*a/2,r2,r3)
    ax.fill(sx,cx,color=c1,alpha=al,edgecolor=ec)

    cx,sx = arc(n,-da-a/2,-da-3*a/2,r2,r3)
    ax.fill(sx,cx,color=c1,alpha=al,edgecolor=ec)

    # Team 3
    k = np.pi
    cx,sx = arc(n,k-da/2,k-da/2-a,r2,r3)
    ax.fill(sx,cx,color=c3,alpha=al,edgecolor=ec)

    cx,sx = arc(n,k+da/2,k+da/2+a,r2,r3)
    ax.fill(sx,cx,color=c3,alpha=al,edgecolor=ec)

    ax.set_xlim([-r3*1.01,r3*1.01])
    ax.set_ylim([-r3*1.01,r3*1.01])
    ax.set_axis_off()

    file='team'+str(i)+'.png'
    plt.savefig(file)
    print 'Writing '+file
    file='team'+str(i)+'.pdf'
    plt.savefig(file)
    print 'Writing '+file
