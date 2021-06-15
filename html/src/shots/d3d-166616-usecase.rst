DIII-D #166616
==============

Description
-----------

This H-mode discharge was part of an experiment designed to
test the impact of neon injection on the pedestal pressure at
varying NBI heating powers. The analysis shown here was conducted
prior to the neon injection which begins at 2.0 secs. This 
case has a NBI power of 3.2MW. The major plasma parameters are 
Bt=2.0T, Ip=1.3MA, kappa=1.8, and delta(u,l)=(0.32,0.57). 

----

Data analysis
-------------

ONETWO run with 201 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/166616/inone.166616>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/166616/iterdb.166616>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/166616/summary.166616>`

.. toggle-header::
   :header: **Plot of power densities**

   .. figure:: ../images/onetwo/166616-qplt.png

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/166616-revplus.png

----

EFIT
----

EFIT02 (129x29) at 1765ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/166616/a166616.01765_efit02>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/166616/g166616.01765_efit02>`

Kinetic EFIT (129x29) at 1765ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/166616/a166616.01765_kefit>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/166616/g166616.01765_kefit>`

.. toggle-header::
   :header: **Plots of EFIT02 at 1765ms**

   .. figure:: ../efits/166616-efit.png

----

CGYRO
-----

| Linear runs versus radius, ky=0.30, using KEFIT:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs rho**

   .. figure:: ../cgyro/166616-gam,om_vs_rho.png

----

Publication
-----------

| H. Lan, T. Osborne, et al., Nucl. Fusion 60, 056013 (2020).
`Journal paper hyperlink <https://doi.org/10.1088/1741-4326/ab7c2b>`__

