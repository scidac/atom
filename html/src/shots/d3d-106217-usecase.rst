DIII-D #106217
==============

Description
-----------

This H-mode discharge was part of a scan in elongation
with the density, temperature, and toroidal field held fixed 
at both fixed q_95 and fixed I_p. This discharge is the companion
discharge to 106210 with a lower elongation. Here, the plasma
current was reduced in order to maintain the same q-profile as
in 106210. The major plasma parameters are 
Bt=1.9T, Ip=0.84MA, kappa=1.7, and delta(u,l)=(0.14,0.43). 

----

Data analysis
-------------

ONETWO run with 51 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106217/inone.106217>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106217/iterdb.106217>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/106217/summary.106217>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/106217-revplus.png

----

EFIT
----

EFIT03 at 2070ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106217/a106217.02070_efit03>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106217/g106217.02070_efit03>`

Kinetic EFIT at 2070ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106217/a106217.02070_kefit>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/106217/g106217.02070_kefit>`

.. toggle-header::
   :header: **Plots of EFIT at 2070ms**

   .. figure:: ../efits/106217-efit.png

----

TGYRO
-----

TGYRO run with the Tensorflow neural net version of TGLF09(SAT0) with Te and Ti evolved, EPEDnn, 
and rho_BC=0.80:

| :download:`TGYRO at 2070ms <https://github.com/scidac/atom-usecase/raw/main/d3d/tgyro/106217/106217-tglfnn-eped.tar.gz>`

.. toggle-header::
   :header: **Plot of Te**

   .. figure:: ../images/tgyro/106217/106217-tglfnn-eped-te.png

.. toggle-header::
   :header: **Plot of Ti**

   .. figure:: ../images/tgyro/106217/106217-tglfnn-eped-ti.png

----

Publication
-----------

| T. Luce, C. Petty, and J. Kinsey, 28th EPS Conference on Controlled Fusion 
| and Plasma Physics, Funchal, ECA Vol. 25A, 1377 (2001).
`Conference paper P4.012 hyperlink <http://epsppd.epfl.ch/Madeira/html/authors/nav/AutL04fr.html>`__
