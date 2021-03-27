DIII-D #144981
==============

Description
-----------

This H-mode discharge was part of a plasma current scan carried
out at fixed toroidal field, plasma shape, and heating power.
It was heated with 4.0W of NBI. Analysis was performed at 3.20 secs.

The major plasma parameters are Bt=2.1T, Ip=1.5MA, kappa=1.73, and
delta(u,l)=(0.25,0.38). This discharge complements 144977 (1.0MA).

----

Data analysis
-------------

ONETWO run with 101 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144981/inone.144981>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144981/iterdb.144981>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/144981/summary.144981>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/144981-revplus.png

----

EFIT
----

Kinetic EFIT at 3200ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/144981/a144981.03200>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/144981/g144981.03200>`

.. toggle-header::
   :header: **Plot of EFIT**

   .. figure:: ../efits/144981-efit.png

----

CGYRO
-----

| Linear run at r/a=0.75, ky=0.30:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs time**

   .. figure:: ../cgyro/144981-cgyro-lin-r0.75ky0.30-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta**

   .. figure:: ../cgyro/144981-cgyro-lin-r0.75ky0.30-phi.png

|  
| CGYRO files:
| :download:`input.cgyro <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144981/input.cgyro>`
| :download:`input.gacode <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144981/input.gacode>`
| :download:`out.cgyro.info <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/144981/out.cgyro.info>`


TGYRO
-----

TGYRO run with TGLF09(SAT0) and EPED1-NN models:

| :download:`TGYRO at 3200 <https://github.com/scidac/atom-usecase/raw/main/d3d/tgyro/144981/144981-tglf09-eped.tar.gz>`

----

Publication
-----------

| J.P. Floyd, et al., Phys. Plasmas 22, 022508 (2015).
`Journal paper hyperlink <https://doi.org/10.1063/1.4907780>`__
