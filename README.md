# Anthropomorphism

## Introduction

This repository contains a MATLAB toolbox for the quantification of structural anthropomorphism of artificial arms and hands. The toolbox is based on computational geometry and set theory methods and is distributed under an open-source license (GPLv3). For doing so, it compares human and artificial workspaces proposing a series of metrics that assess their relative coverages. For human and artificial arms the toolbox assesses anthropomorphism of the upper-arm, forearm and wrist/hand workspaces. For human and artificial hands the toolbox evaluates the anthropomorphism of the workspaces of the finger bases frames and the workspaces of the finger phalanges. Various methods for the computation of the workspaces volumes are also presented. The final score of anthropomorphism is derived as a weighted sum of the sub-scores of the independent workspaces metrics proposed and always ranges from 0 (for non-anthropomorphic artifacts) to 1 (for human-identical artifacts). More details you can find here [here](https://hackaday.io/project/4745-openbionics-affordable-prosthetic-hands/log/27094-a-toolbox-for-the-quantification-of-anthropomorphism).

The toolbox is constantly under-development and the newest version can always be found in the OpenBionics/Anthropomorphism GitHub repository. We plan to eventually migrate the toolbox to Octave, R and/or Python (for people that do not have access to a MATLAB license). The toolbox has 3 main folders named: “Arm”, “Hand” and “Examples”. The first two folders contain the functions for the quantification of anthropomorphism of artificial arms and hands respectively, while the third folder contains examples of the implemented methods. Up to now (October 2015), the toolbox contains 55 functions and 3 examples.  Should you have any questions or suggestions, feel free to contact us. Enjoy! 

## Required ToolBoxes

List of required external toolboxes and functions:

* [MPT Multi-Parametric Toolbox](http://control.ee.ethz.ch/~mpt/)
Tested Version: 2.6.2
Authors: Michal Kvasnica, Pascal Grieder, Mato Baotic
(kvasnica,grieder,baotic@control.ee.ethz.ch)

* [Robotics Toolbox for MATLAB](http://petercorke.com/Robotics_Toolbox.html)
Tested Version: 9.7 
Author: Peter Corke (peter.corke@qut.edu.au) 

* [Alphavol function](http://www.mathworks.com/matlabcentral/fileexchange/28851-alpha-shapes)
Tested version: 1.0
Author: Jonas Lundgren (splinefit@gmail.com) 
