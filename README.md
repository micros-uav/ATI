Data and codes of simulations and real-world experiments for "Assemble topological interaction overcomes consistency-cohesion trade-off in complex environments". They are generated based on the $\it{CoFlyers}$ platform which is available at https://github.com/micros-uav/CoFlyers.

### Data

All data is in the "data" file path.

### Simulation

run "matlab_simulink_ws/Prototype_Simulator/main_rapid_prototyping.m" to see the motion of simulated drone swarms in complex environments.

All parameters are configured in "matlab_simulink_ws/Prototype_Simulator/parameters.xml".

int_type__: 0:KTI, 1:SBTI, 2:HTI, 3:ATI, 4:DMI.
k__: Neighbour number of KTI.
mu__: Angular resolution of SBTI.
r_m__: Cutoff distance of DMI.
p_informed__: Proportion of informed agents.

### Real-world experiment

Require an OptiTrack motion capture system and some Tello EDU drones.

In "parameters.xml",
set flag_prac__ to 1;
set sim_quad to 0 in field of "simulink".

Control the drone swarms through "matlab_simulink_ws/Simulink_Module/testControlWithDroneSwarm.slx".

See details at https://github.com/micros-uav/CoFlyers.