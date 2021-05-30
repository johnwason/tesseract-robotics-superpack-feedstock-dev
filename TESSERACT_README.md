# Tesseract Conda Recipes

Anaconda channel: https://anaconda.org/Tesseract-Robotics/dashboard

This repository contains experimental recipes for building Tesseract Robotics (https://github.com/ros-industrial-consortium/tesseract) conda packages. These recipes will eventually be migrated to feedstock repositories using conda-smithy (https://github.com/conda-forge/conda-smithy).

**The packages produced by these recipes are experimental, and are subject to change.**

## tesseract-robotics-superpack

The `tesseract-robotics-superpack` contains all the packages that make up the Tesseract project and its related planners. It is available for Linux and Windows. Ideally, each package would have its own conda package, however the resources were not available to create an individual package. The packages are all built using `colcon`, and installed to `$CONDA_PREFIX/opt/tesseract_robotics` within the package. On activation of the environment containing the package, the local_setup script is called to include the `$CONDA_PREFIX/opt/tesseract_robotics` in the relevant path environmental variables, include `PATH`, `LD_LIBRARARY_PATH`, `CMAKE_PREFIX_PATH`, and `PYTHONPATH`.

This package makes the `tesseract_robotics` Python packages available for import.

The build products of the following repositories are included in the superpack:

* https://github.com/ros-industrial/ros_industrial_cmake_boilerplate
* https://github.com/Jmeyer1292/opw_kinematics
* https://github.com/ethz-adrl/ifopt
* https://github.com/swri-robotics/descartes_light
* https://github.com/ros-industrial-consortium/trajopt_ros
* https://github.com/ros-industrial-consortium/tesseract
* https://github.com/ros-industrial-consortium/tesseract_planning
* https://github.com/ros-industrial-consortium/tesseract_python
* https://github.com/ompl/ompl

### Installation

Installation requires the installation of `anaconda` or `miniconda`.

To install, first create a conda environment. An existing environment can also be used. The `tesseract-robotics-superpack` package is currently built using Python 3.8. Other versions may work, but mileage may vary.

`conda create -n tesseract-robotics -c conda-forge -c robotology -c tesseract-robotics tesseract-robotics-superpack python=3.8`

Activate the environment.

`conda activate tesseract-robotics`

### Using Tesseract

Tesseract is now ready for use. To begin, activate the environment:

`conda activate tesseract-robotics`

Tesseract is now available for use.

### Usage Example

Let's run a simple example to demonstrate using Tesseract Python. Download the ABB Tesseract viewer plan and viewer example:

Linux:

`wget https://raw.githubusercontent.com/johnwason/tesseract_python-1/pr/RenamePythonPackage/tesseract_viewer_python/examples/abb_irb2400_viewer.py`

Windows:

`curl -o abb_irb2400_viewer.py https://raw.githubusercontent.com/johnwason/tesseract_python-1/pr/RenamePythonPackage/tesseract_viewer_python/examples/abb_irb2400_viewer.py`

Set the `TESSERACT_SUPPORT_DIR` so the example can find the URDF resources:

Linux:

`export TESSERACT_SUPPORT_DIR=$CONDA_PREFIX/opt/tesseract_robotics/share/tesseract_support`

Windows:

`set TESSERACT_SUPPORT_DIR=%CONDA_PREFIX%/opt/tesseract_robotics/share/tesseract_support`

Now run the example!

`python abb_irb2400_viewer.py`

And point a modern browser to `http://localhost:8000` to see the animation!
