DIII-D #106210
==============

Description
-----------

This H-mode discharge was part of a scan in elongation
with the density, temperature, and toroidal field held fixed 
at both fixed q_95 and fixed I_p. This discharge is the highest
elongation case with kappa=2.0. The major plasma parameters are 
Bt=1.9T, Ip=1.1MA, kappa=2.0, and delta(u,l)=(0.15,0.20). 

----

Data analysis
-------------

ONETWO run with 51 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106210/inone.106210>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106210/iterdb.106210>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106210/summary.106210>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/106210-revplus.png

----

EFIT
----

EFIT03 at 4290ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106210/a106210.04290_efit03>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106210/g106210.04290_efit03>`

Kinetic EFIT at 4290ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106210/a106210.04290_kefit>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106210/g106210.04290_kefit>`

.. toggle-header::
   :header: **Plots of EFIT at 4290ms**

   .. figure:: ../efits/106210-efit.png


----

TGYRO
-----

TGYRO run with the Tensorflow neural net version of TGLF09(SAT0) with Te and Ti evolved, EPEDnn, 
and rho_BC=0.80:

| :download:`TGYRO at 1500ms <https://github.com/scidac/atom-usecase/raw/main/d3d/tgyro/106210/106210-tglfnn-eped.tar.gz>`

.. toggle-header::
   :header: **Plot of Te**

   .. figure:: ../images/tgyro/106210/106210-tglfnn-eped-te.png

.. toggle-header::
   :header: **Plot of Ti**

   .. figure:: ../images/tgyro/106210/106210-tglfnn-eped-ti.png

----


Publication
-----------

| T. Luce, C. Petty, and J. Kinsey, 28th EPS Conference on Controlled Fusion 
| and Plasma Physics, Funchal, ECA Vol. 25A, 1377 (2001).
`Conference paper P4.012 hyperlink <http://epsppd.epfl.ch/Madeira/html/authors/nav/AutL04fr.html>`__
