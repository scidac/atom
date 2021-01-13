DIII-D #153102
==============

Description
-----------

This H-mode discharge was part of an experiment designed
to study particle transport in low power NBI and NBI+ECH discharges.
This discharge used NBI only and two times are provided. The
first time slice is at 1900ms and has 4.3MW of NBI. The second
time slice is at 2400MS and has 2.9MW of NBI. The major plasma 
parameters are Bt=1.9T, Ip=1.1MA, kappa=1.8, and delta(u,l)=(0.35,0.80). 

----

Data analysis
-------------

ONETWO run with 51 radial grid points.

ONETWO files:

| :download:`inone_1900 file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/inone.153102_1900>`
| :download:`iterdb_1900 file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/iterdb.153102_1900>`
| :download:`summary_1900 <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/summary.153102_1900>`
| :download:`inone_2400 file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/inone.153102_2400>`
| :download:`iterdb_2400 file <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/iterdb.153102_2400>`
| :download:`summary_2400 <https://github.com/scidac/atom-usecase/raw/main/d3d/onetwo/153102/summary.153102_2400>`

.. toggle-header::
   :header: **Reviewplus time traces**

   .. figure:: ../images/revplus/153102-revplus.png

----

EFIT
----

EFIT02 at 1900ms,2400ms:

| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153102/a153102.01900>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153102/g153102.01900>`
| :download:`a-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153102/a153102.02400>`
| :download:`g-file <https://github.com/scidac/atom-usecase/raw/main/d3d/efits/153102/g153102.02400>`

.. toggle-header::
   :header: **Plots of EFIT at 1900ms**

   .. figure:: ../efits/153102_1900-efit.png

.. toggle-header::
   :header: **Plots of EFIT at 2400ms**

   .. figure:: ../efits/153102_2400-efit.png

----

CGYRO
-----

| Linear runs for t=2400ms at r/a=0.50, ky=0.20,0.30,0.40,0.50,0.60:
| Electrostatic, Miller equil., Suguma coll. model, n_species=2, n_theta=24, n_radial=8

.. toggle-header::
   :header: **Plot of gamma,omega vs time, ky=0.20**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.20-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta, ky=0.20**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.20-phi.png

.. toggle-header::
   :header: **Plot of gamma,omega vs time, ky=0.30**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.30-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta, ky=0.30**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.30-phi.png

.. toggle-header::
   :header: **Plot of gamma,omega vs time, ky=0.40**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.40-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta, ky=0.40**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.40-phi.png

.. toggle-header::
   :header: **Plot of gamma,omega vs time, ky=0.50**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.50-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta, ky=0.50**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.50-phi.png

.. toggle-header::
   :header: **Plot of gamma,omega vs time, ky=0.60**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.60-gamma.png

.. toggle-header::
   :header: **Plot of phi vs theta, ky=0.60**

   .. figure:: ../cgyro/153102_2400-cgyro-lin-r0.50ky0.60-phi.png

----

Publication
-----------

S. Mordijck, et al., Nucl. Fusion 55, 113025 (2015).

