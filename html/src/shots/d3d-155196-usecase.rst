DIII-D #155196
==============

Description
-----------

This H-mode discharge case was part of a study comparing ITER 
Baseline Scenario (IBS) discharges with neutral beam (NB) heating 
alone to otherwise identical discharges in which some of the 
NB power was replaced with electron cyclotron heating (ECH).
Two time slices were chosen. The first time slice at 2.20 secs includes both
NBI and ECH. The second time is at 3.0 secs and has NBI only.

The major plasma parameters are Bt=1.7T, Ip=1.3MA, kappa=1.8, and
delta(u,l)=(0.35,0.8). The first time slice at 2200ms has 3.3MW
of ECH and 2.6MW of NBI. The second time slice has only 3.5MW of NBI.

----

Data analysis
-------------

TRANSP run E04 by B. Grierson

TRANSP statefiles:

| :download:`statefile at 2200 <./../../../../atom-usecase/d3d/statefiles/155196/state155196E04_2200.cdf>`
| :download:`statefile at 3000 <./../../../../atom-usecase/d3d/statefiles/155196/state155196E04_3000.cdf>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/155196-revplus.png

----

EFIT
----

Kinetic efits at 2200 and 3000ms:

| :download:`a-file at 2200 <./../../../../atom-usecase/d3d/efits/155196/a155196.02200>`
| :download:`g-file at 2200 <./../../../../atom-usecase/d3d/efits/155196/g155196.02200>`
| :download:`a-file at 3000 <./../../../../atom-usecase/d3d/efits/155196/a155196.03000>`
| :download:`g-file at 3000 <./../../../../atom-usecase/d3d/efits/155196/g155196.03000>`

.. toggle-header::
   :header: **Plot of EFIT at 2200ms**

   .. figure:: ../efits/155196_2200-efit.png

.. toggle-header::
   :header: **Plot of EFIT at 3000ms**

   .. figure:: ../efits/155196_3000-efit.png

----

TGYRO
-----

TGYRO runs with TGLF09(SAT0) and EPED1-NN models:

| :download:`TGYRO at 2200 <./../../../../atom-usecase/d3d/tgyro/155196/155196_2200-tglf09-eped.tar.gz>`
| :download:`TGYRO at 3000 <./../../../../atom-usecase/d3d/tgyro/155196/155196_3000-tglf09-eped.tar.gz>`

----

Publication
-----------

Grierson, B., et al, Phys. Plasmas 25, 022509 (2018).
