DIII-D #153523
==============

Description
-----------

This H-mode discharge was run in a lower single null configuration 
with the aspect ratio, elongation, and triangularity closely matched 
to what is expected for the ITER baseline inductive 
scenario (ITER-similar-shape). It was heated with 2.6MW of NBI
and 3.3MW of ECH. Analysis was performed at 3.745 secs.

The major plasma parameters are Bt=1.7T, Ip=1.3MA, kappa=1.8, and
delta(u,l)=(0.37,0.8). This discharge complements 155196 but here
there is nearly zero beam torque (0.42 Nt-m).

----

Data analysis
-------------

ONETWO run with 51 radial grid points.

ONETWO files:

| :download:`inone file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153523/inone.153523>`
| :download:`iterdb file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153523/iterdb.153523>`
| :download:`statefile <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153523/state153523_12_3.745000E+00.nc>`
| :download:`summary <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153523/summary.153523>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/153523-revplus.png

----

EFIT
----

Kinetic efits at 3745ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153523/a153523.03745>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153523/g153523.03745>`

.. toggle-header::
   :header: **Plot of EFIT**

   .. figure:: ../efits/153523-efit.png

----

CGYRO
-----

| Linear runs versus radius, ky=0.30:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs rho**

   .. figure:: ../cgyro/153523-gam,om_vs_rho.png

.. toggle-header::
   :header: **Plot of phi vs theta at rho=0.50**

   .. figure:: ../cgyro/153523-cgyro-lin-r0.50ky0.30-phi.png

|  
| CGYRO files:
| :download:`input.cgyro <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/153523/input.cgyro>`
| :download:`input.gacode <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/153523/input.gacode>`
| :download:`out.cgyro.info <<https://github.com/scidac/atom-usecase/raw/main/d3d/cgyro/153523/out.cgyro.info>`


----


TGYRO
-----

TGYRO run with TGLF09(SAT0) and EPED1-NN models:

| :download:`TGYRO at 3745 <https://github.com/scidac/atom-usecase/raw/main/d3d/tgyro/153523/153523-tglf09-eped.tar.gz>`

----

Publication
-----------

| T. C. Luce et al., Proc. 25th IAEA FEC, St. Petersburg, Russia PPC/P2-34 (2014)
| C. Holland, N.T. Howard, and B. Grierson, Nucl. Fusion 57, 066043 (2017).
`Journal paper hyperlink <https://doi.org/10.1088/1741-4326/aa6c16>`__
