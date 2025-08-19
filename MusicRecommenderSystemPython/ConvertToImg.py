import numpy as np
import pandas as pd
import os
from PIL import Image

UPLOAD_DIR=os.getcwd()+"\\DataSetImg\\" 
  
df = pd.read_csv(os.getcwd()+"\\fer2013.csv")
df0 = df[df['emotion'] == 0]
df1 = df[df['emotion'] == 1]
df2 = df[df['emotion'] == 2]
df3 = df[df['emotion'] == 3]
df4 = df[df['emotion'] == 4]
df5 = df[df['emotion'] == 5]
df6 = df[df['emotion'] == 6]

os.mkdir(UPLOAD_DIR+"/Angry/")
os.mkdir(UPLOAD_DIR+"/Disgust/")
os.mkdir(UPLOAD_DIR+"/Fear/")
os.mkdir(UPLOAD_DIR+"/Happy/")
os.mkdir(UPLOAD_DIR+"/Sad/")
os.mkdir(UPLOAD_DIR+"/Surprise/")
os.mkdir(UPLOAD_DIR+"/Neutral/")

d=0
for image_pixels in df0.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Angry/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df1.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Disgust/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df2.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Fear/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df3.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Happy/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df4.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Sad/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df5.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Surprise/img_%d.jpg"%d, "JPEG")
    d+=1

d=0
for image_pixels in df6.iloc[1:,1]:
    image_string = image_pixels.split(' ')
    image_data = np.asarray(image_string, dtype=np.uint8).reshape(48,48)
    img = Image.fromarray(image_data)
    img.save(UPLOAD_DIR+"/Neutral/img_%d.jpg"%d, "JPEG")
    d+=1