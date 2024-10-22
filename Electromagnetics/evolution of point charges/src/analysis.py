import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import imageio.v2 as imageio
from pathlib import Path

L = 10
B = 10
H = 10
iterations = 100

for i in range(iterations + 1):
    
    if i < 10:
        data = pd.read_csv(f"../data/systeminfo00{i}.dat")
    elif i < 100:
        data = pd.read_csv(f"../data/systeminfo0{i}.dat")
    else:
        data = pd.read_csv(f"../data/systeminfo{i}.dat")
    
    print(f"Now at iteration {i} of {iterations}" , flush="True")
    
    fig = plt.figure()
    ax = plt.axes(projection='3d')

    X = data.iloc[:,0]
    Y = data.iloc[:,1]
    Z = data.iloc[:,2]

    ax.set_xlim([0,L])
    ax.set_ylim([0,B])
    ax.set_zlim([0,H])

    ax.scatter(X,Y,Z,s=20,color="red")
    
    plt.savefig(f"../images/systeminfo00{i}.png")

    plt.close()

print("Images saved....animation sent to the oven....",flush="True")
folder_path = Path('../images/')
images = list(folder_path.glob('systeminfo*.png'))
images.sort()

image_list = [imageio.imread(str(img)) for img in images]

output_path = '../images/animation.mov'
imageio.mimsave(output_path, image_list, fps=10)

print("Animation baked!")