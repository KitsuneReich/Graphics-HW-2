# CMPM 163 | Graphics Homework 2
Nichole Boothroyd

## Part A 
![Part A Screenshot](Images/Part%20A.png)

A scene in Unity which has a bloom filter applied to the main camera, causing a white outline to radiate from the fantastic beast model. Additionally, there is an outline shader applied to this same model. This shader takes the normals from the mesh, dot products them with the cameria position, and applies a color based upon the normal to create the outlines upon the model. 

## Part B
![Part A Screenshot](Images/Part%20B.png)
An outdoor scene in Unity which procedurally increases the size of a plane mesh and then uses a shader to deform the plane according to a heightmap image. Separate textures are then applied to the mesh within this shader to create different terrain zones on the deformed plane. In addition, there is a cubemap skybox encasing the scene which is reflected by the plane representing water. Currently, the amount of displacement from the heightmap can be adjusted in the HillFromTexture shader. Additionally, a color can be adjusted within the Reflection shader to add a colorful tint to the water. 

## The builds can be accessed from this repo or downloaded with this link:
[download this](Builds/Final%Builds.zip)
