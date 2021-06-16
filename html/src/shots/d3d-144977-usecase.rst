DIII-D #144977
==============

Description
-----------

This H-mode discharge was part of a plasma current scan carried
out at fixed toroidal field, plasma shape, and heating power.
It was heated with 4.0W of NBI. Analysis was performed at 2.99 secs.

The major plasma parameters are Bt=2.1T, Ip=1.0MA, kappa=1.73, and
delta(u,l)=(0.25,0.38). This discharge complements 144981 (1.5MA).

----

Data analysis
-------------

ONETWO run with 101 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144977/inone.144977>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144977/iterdb.144977>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144977/summary.144977>`

.. toggle-header::
   :header: **Plot of power densities**

   .. figure:: ../images/onetwo/144977-qplt.png

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/144977-revplus.png

----

EFIT
----

Kinetic EFIT at 2990ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/144977/a144977.02990>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/144977/g144977.02990>`

.. toggle-header::
   :header: **Plot of EFIT**

   .. figure:: ../efits/144977-efit.png

----

CGYRO
-----

| Linear run at r/a=0.75, ky=0.30:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs time**

   .. figure:: ../cgyro/144977-cgyro-lin-r0.75ky0.30-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta**

   .. figure:: ../cgyro/144977-cgyro-lin-r0.75ky0.30-phi.png

|  
| CGYRO files:
| :download:`input.cgyro <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144977/input.cgyro>`
| :download:`input.gacode <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144977/input.gacode>`
| :download:`out.cgyro.info <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144977/out.cgyro.info>`


TGYRO
-----

TGYRO run with TGLF09(SAT0) and EPED1-NN models:

| :download:`TGYRO at 2990 <https://github.com/scidac/atom-usecase/raw/main/d3d/tgyro/144977/144977-tglf09-eped.tar.gz>`

----

Publication
-----------

| J.P. Floyd, et al., Phys. Plasmas 22, 022508 (2015).
`Journal paper hyperlink <https://doi.org/10.1063/1.4907780>`__
