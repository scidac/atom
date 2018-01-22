AToM Components
===============

The guiding philosophy of AToM is to fully leverage the existing capability represented by the OMFIT and 
IPS frameworks and the components already integrated with them, as well as the advanced composite 
components TGYRO, TSC and FASTRAN.  There are many established workflows, dedicated users and use cases 
represented by both the composite components, as well as for advanced components like GYRO, COGENT and M3Dc1.

We endeavour to support -- rather than subvert -- current workflows, build essential new infrastructure 
to address critical modeling gaps, and guide integration of high-performance computing resources to enable 
new physics capabilities.  The guiding philosophy of AToM is to take a bottom-up, collaborative approach 
that focuses on leveraging and integrating the wide spectrum of existing research activities throughout 
the US fusion community.  In this way, we seek to improve and extend the US fusion program’s existing, 
mission-critical integrated modeling capabilities.

.. figure:: images/AToM_world.png
  :width: 100%
  :figwidth: 80%
  :align: center
  :alt: AToM world
  :target: _images/AToM_world.png

  *A schematic of the current inter-relationship and nesting of the frameworks and components selected for inclusion into AToM*

~~~~~
OMFIT
~~~~~

`OMFIT <http://gafusion.github.io/OMFIT-source/>`_
is a software developed at General Atomics to support integrated modeling and experimental
data analysis of magnetically confined thermonuclear fusion experiments.
The goal of OMFIT is to enhance existing scientific workflows and enable new integrated modeling capabilities.
To achieve these goals OMFIT adopts a bottom-up collaborative development approach. Today the framework
is used worldwide by over one hundred fusion scientists.

~~~
IPS
~~~

`IPS <http://ipsframework.sourceforge.net/doc/html/>`_
(Integrated Plasma Simulator) is an environment to orchestrate
complex coupled simulation workflows on parallel computers. The IPS
is designed primarily for use in a batch-processing environment, with
a batch job typically comprising a single invocation of the framework,
calling the individual physics codes many times as the simulation
progresses.

~~~~
GYRO
~~~~

`GYRO <https://fusion.gat.com/theory/Gyrooverview>`_
is an Eulerian gyrokinetic code. Unlike the various US PIC codes (GTC, GTS,
XGC1, GEM) full gyrokinetic electron dynamics and compressional electromagnetic
effects are treated. In terms of efficiency, even for simple problems, GYRO is
also far ahead of PIC solvers with much lower time-to-solution for a given problem.
Both the MPI implementation, and the more recent OpenMP directives, are highly
optimized in GYRO.  The OpenMP in particular was reoptimized by IBM and the
changes that improved performance at NERSC were retained.  Sensible GYRO runs
required at most 20K cores, but typically (say for ITER) will probably use
about 512-2048 cores.  The direct coupling scheme in TGYRO can use
about 16*4=64 instances, which brings the TGYRO core count to over 100K cores.

~~~~~~
COGENT
~~~~~~

COGENT is a continuum gyrokinetic code being developed at LLNL for edge plasma modeling.
The present version of the code models a nonlinear (full-F) axisymmetric 4D gyrokinetic equation 
coupled to the long-wavelength limit of the gyro-Poisson equation. There are two configuration 
dimensions: labels of flux surface and poloidal angle, and two velocity-space dimensions: parallel 
velocity and magnetic-moment.  The code is distinguished by the use of a fourth-order 
finite-volume (conservative) discretization combined with arbitrary mapped multiblock grid 
technology (nearly field-aligned on blocks) to handle the complexity of divertor geometry with 
high accuracy. COGENT has a variety of collision options including the fully nonlinear 
Fokker-Planck (FP) collision model.  COGENT is built upon the Chombo adaptive mesh refinement 
library, which is under development in the FASTMath SciDAC Institute (LBNL).  In more detail, COGENT 
exploits mapped multiblock grid technology, whereby the inner and outer closed flux surface regions, 
the inner and outer scrape off layer, the inner and outer divertor legs, and the inner and outer 
portions of the private flux region are mapped from the physical toroidal geometry (with appropriate 
metric information) onto communicating rectangular grid blocks. The code was ''born parallel'', with 
grid blocks assigned to groups of processors.  Phase, configuration and velocity space can be domain 
decomposed independently for flexible and efficient mapping to current and future parallel machines. 
The code gets single-null geometric data via fourth-order interpolation of tabular data generated 
by the UEDGE edge fluid code.

~~~~~
TGYRO
~~~~~

`TGYRO <https://fusion.gat.com/theory/Tgyrooverview>`_
is a transport solver based on the drift-ordering formulation of Sugama.
This formulation is by far the most complete and rigourous formulation of
the core transport equations (for axisymmetric plasmas).
TGYRO requires a core turbulence flux component (from TGLF or GYRO).
and a core neoclassical flux component (from NEO code).
Finally, electron and ions auxiliary heating sources are required.  These
are supplemented with self-consistent calculations of electron radiation
and thermonuclear heating to ions and electrons.  TGYRO is a steady-state
solver so can in principle take arbitrarily large time steps, but the
time-dependent capability is best managed by OMFIT.
The TGYRO capability to invoke multiple instances of GYRO is a key capability
for usage of leadership resources.  In addition to the parallelism of the
component (say GYRO) TGYRO will also parallelize over radial zone (8-16
are typically needed) and Jacobian.  This means a factor of about 64 over
the parallelism of the turbulence component.

~~~~
TGLF
~~~~

`TGLF <https://fusion.gat.com/theory/Tglfoverview>`_
is a theory-based transport model based on linear gyrofluid equations plus
"calibration" with a database of GYRO nonlinear simulations.  In some sense,
the goal of TGLF is to provide an answer as close as possible to that one
would obtain from GYRO but more quickly (10,000 times or more).  In some
sense, practical performance modeling MUST use TGLF.  To my knowledge TGLF
is far superior to any other transport model.  It is a significant
improvement on its predecesor GLF23, especially in the weak or negative
shear regime and for strongly shaped plasmas.

~~~~
NEO
~~~~

`NEO <https://fusion.gat.com/theory/Neooverview>`_
is a :math:`\large \delta f` Eulerian code which provides first-principles based numerical calculations
of the neoclassical transport (particle flux, energy flux, bootstrap current,
poloidal flows, etc.). NEO solves a hierarchy of equations derived by expanding
the drift-kinetic equation in powers of , the ratio of the ion gyroradius to
the system size. NEO includes the self-consistent coupling of electrons and
multiple ion species via complete cross-species collisional coupling, the
calculation of the first-order electrostatic potential via coupling with
the Poisson equation, general geometry effects, and rapid toroidal rotation
effects (including centrifugal effects). NEO has recently been upgraded to
include the full linearized Fokker-Planck collision operator.

~~~~
EPED
~~~~

EPED is a model to predict the height (ie pressure, or temperature at a given density) and width
of the H-Mode pedestal in tokamaks.   It predicts a boundary condition (near the top of the
pedestal, typical psi_norm~0.9-0.95) that can be coupled to a core transport solver such as TGYRO
to predict profiles across the confined plasma.  EPED is designed to predict the pedestal
structure in "high performance" H-mode operation (ie Type I ELM or QH-Mode regime), and
typically provides an upper bound in other regimes of operation.   EPED can be applied
to existing experiments, future experiments on existing devices, or to predict and optimize
future devices such as ITER or FNSF.    EPED has been tested on more than 300 cases
on 5 tokamaks, typically finding agreement with observations to a standard deviation of ~20%.
EPED first calculates a kinetic ballooning mode constraint using series of model equilibria from toq
and stability calculations from baloo (or in the future, GYRO or TGLF), and then calculates a
peeling-ballooning mode stability constraint using model equilibria from toq and stability
calculations with ELITE.   The two constraints are combined to determine the two unknowns,
pedestal height and width.
