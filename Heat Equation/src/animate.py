from PIL import Image
import imageio.v2 as imageio
from pathlib import Path
import re

folder_path = Path('../data/images/')
images = list(folder_path.glob('bath*.png'))
images.sort(key=lambda x: int(re.findall(r'\d+', x.stem)[0]))

image_list = []
for img_path in images:
    
    img = Image.open(img_path)
    img_rescaled = img.resize((880, 656), Image.NEAREST)
    image_list.append(img_rescaled)
    # image_list.append(img)

output_path = '../data/images/animation.mov'
imageio.mimsave(output_path, image_list, fps=10)

print("Animation baked!")
