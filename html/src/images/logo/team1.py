import numpy as np
from jaamplotdefs import *

fig = plt.figure(figsize=(8,8))
fig.subplots_adjust(left=0,right=1,top=1,bottom=0)
ax = fig.add_subplot(111)

def arc(n,a1,a2,r2,r3):
    # Team 1
    cx = r2*np.cos(a1+x*(a2-a1))
    sx = r2*np.sin(a1+x*(a2-a1))
    cx = np.append(cx,[r3*np.cos(a2)])
    sx = np.append(sx,[r3*np.sin(a2)])
    cx = np.append(cx,r3*np.cos(a2+x*(a1-a2)))
    sx = np.append(sx,r3*np.sin(a2+x*(a1-a2)))
    cx = np.append(cx,[r2*np.cos(a1)])
    sx = np.append(sx,[r2*np.sin(a1)])
   
    return cx,sx
    

n = 32
r1=1.0
r2=1.3
r3=2.5

c = '#777777'

# Team 2
x = np.arange(n)/(n-1.0)
cx = r1*np.cos(x*2*np.pi)
sx = r1*np.sin(x*2*np.pi)
ax.fill(cx,sx,color=c,alpha=0.4,edgecolor='none')

a  = np.pi/3.5
da = np.pi/14.0

# Team 1
cx,sx = arc(n,-a/2,a/2,r2,r3)
ax.fill(sx,cx,'m',alpha=0.4,edgecolor='none')

cx,sx = arc(n,da+a/2,da+3*a/2,r2,r3)
ax.fill(sx,cx,'m',alpha=0.4,edgecolor='none')

cx,sx = arc(n,-da-a/2,-da-3*a/2,r2,r3)
ax.fill(sx,cx,'m',alpha=0.4,edgecolor='none')

# Team 3
k = np.pi
cx,sx = arc(n,k-da/2,k-da/2-a,r2,r3)
ax.fill(sx,cx,color=c,alpha=0.4,edgecolor='none')

cx,sx = arc(n,k+da/2,k+da/2+a,r2,r3)
ax.fill(sx,cx,color=c,alpha=0.4,edgecolor='none')

ax.set_xlim([-r3*1.01,r3*1.01])
ax.set_ylim([-r3*1.01,r3*1.01])
ax.set_axis_off()

plt.savefig('team1.pdf')
#plt.show()
