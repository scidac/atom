import matplotlib.pyplot as plt
import numpy as np
from matplotlib import rc
import matplotlib.font_manager as fm
import matplotlib.patches as mpatches

prop = fm.FontProperties(fname='/home/candy/.fonts/sofachrome_rg.ttf')

# Figure dimensoins
fig = plt.figure(figsize=(9,3))
ax = fig.gca()
ax.set_aspect('equal')
ax.set_xlim([0,9])
ax.set_ylim([0,3])
ax.set_axis_off()

c='#555555'
s=150

ax.text(-1.4,0.6,'A',
            horizontalalignment='left',verticalalignment='bottom',
            fontproperties=prop,size=s,color=c)
ax.text(1.7,0.6,'T',
            horizontalalignment='left',verticalalignment='bottom',
            fontproperties=prop,size=s,color=c)
ax.text(6.3,0.6,'M',
            horizontalalignment='left',verticalalignment='bottom',
            fontproperties=prop,size=s,color=c)
im=plt.imshow(plt.imread('teams-tran.png'),extent=(3.7,6.7,0,3))

#plt.show()
fig.savefig('atom.pdf')
fig.savefig('atom.png')

