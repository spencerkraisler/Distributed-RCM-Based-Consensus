# Distributed-RCM-Based-Consensus

This repo is an implementation of the algorithm from the paper [Distributed Consensus on Manifolds
using the Riemannian Center of Mass](https://par.nsf.gov/biblio/10422995). 

Just run ``main.m``.

``ConsensusError.m`` is a function that computes the geodesic variance, aka consensus error, of a set of points under a graph on a manifold. ``RiemannianCenterOfMass.m`` computes the Riemannian center of mass of a set of points on a manifold. ``main.m`` is the file that contains the algorithm. Run it, and it will plot the consensus error over time. The number of agents is set to 10, the tolernace is set to $10^{-6}$, and the max number of steps is set to 200. The manifold of choice is $\mathcal{M}=SO(3)$, however you can switch that out for any manifold you want. 

# Dependencies
These files require the matlab Manopt library to run. Follow the [installation instructions](https://www.manopt.org/downloads.html). The basic instructions are
1. Download the MATLAB Manopt library
2. Move the Manopt directory to your MATLAB directory
3. In the MATLAB console, cd into the Manopt directory
4. Type ``importmanopt`` in the MATLAB console


For any issues, please post an issue here, or contact me at kraisler(at)uw(dot)edu! I am always happy to help and explain anything!  
