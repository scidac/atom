DIII-D #136525
==============

Description
-----------

This H-mode discharge was part of an experiment designed to
test for the presence of kinetic ballooning modes in the pedestal
region and provide tests of the EPED1 model. A current scan
was performed during the experiment where Ip was varied from 1.0
to 1.3MA. The major plasma parameters for this discharge are 
Bt=2.1T, Ip=1.0MA, kappa=1.85, and delta(u,l)=(0.44,0.68). 

----

Data analysis
-------------

ONETWO run with 101 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/136525/inone.136525>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/136525/iterdb.136525>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/136525/summary.136525>`

.. toggle-header::
   :header: **Plot of power densities**

   .. figure:: ../images/onetwo/136525-qplt.png

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/136525-revplus.png

----

EFIT
----

Kinetic EFIT (129x29) at 2705ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/136525/a136525.02705>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/136525/g136525.02705>`

.. toggle-header::
   :header: **Plots of EFIT at 2705ms**

   .. figure:: ../efits/136525-efit.png

----

CGYRO
-----

| Linear runs versus radius, ky=0.30:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs rho**

   .. figure:: ../cgyro/136525-gam,om_vs_rho.png

----