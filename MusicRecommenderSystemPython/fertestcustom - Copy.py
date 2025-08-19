#!C:\Users\Megha Home\AppData\Local\Programs\Python\Python310\python
from __future__ import division
import os
# Import modules for CGI handling
import cgi, cgitb
import urllib.request
# load json and create model


from keras.models import Sequential
from keras.layers import Dense
from keras.models import model_from_json
import numpy
import os
import numpy as np
import cv2

# enable debugging
cgitb.enable()
# print content type
print("Content-type:text/html\r\n\r\n")
print("path="+os.getcwd()) 

UPLOAD_DIR=os.getcwd()+"\\InputImg\\" 
#print("value="+form.getvalue("uid"))
# IF A FILE WAS UPLOADED (name=file) we can find it here.
#fid=form.getvalue("fid")
#print(form)
try:
    for file in os.listdir(UPLOAD_DIR):
        print(file)
        os.remove(UPLOAD_DIR+"/"+file)  
except Exception:
    print("directory exist")
 
HTML = """
<html>
<head>
<title></title>
</head>
<body style="background-color:black">

  <h1>Emotion Recognition</h1>
    
 

</body>
</html>
"""
print(HTML)
filename=""
ext=""
uploaded_file_path=""
inFileData = None
form = cgi.FieldStorage() 
docid=1001
if "file" in form:
    form_file = form['file']
   
    # form_file is now a file object in python
    if form_file.filename:
        print("file name"+os.path.basename(form_file.filename))
        nm,ext=os.path.basename(form_file.filename).split('.')
        filename=os.path.basename(form_file.filename)
        print("original file name")
        print(filename)
        print(str(docid)+"."+ext)
        filename=str(docid)+"."+ext
        uploaded_file_path = os.path.join(UPLOAD_DIR, filename)
        print(uploaded_file_path)
        with open(uploaded_file_path, 'wb') as fout:
            # read the file in chunks as long as there is data
            while True:
                chunk = form_file.file.read(100000)
                if not chunk:
                    break
                # write the file content on a file on the hdd
                fout.write(chunk)

        # load the written file to display it
        with open(uploaded_file_path, 'r',errors='ignore') as fin:
            inFileData = ""
            for line in fin:
                inFileData += line

    
headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'}
#print(jinja2.Environment().from_string(HTML).render(filedata=inFileData)) 
#w2d("E:\\python\\1.jpg",'haar','111')
#print(form.getvalue("fid"))
 


#loading the model
json_file = open('fer.json', 'r')
loaded_model_json = json_file.read()
json_file.close()
loaded_model = model_from_json(loaded_model_json)
# load weights into new model
loaded_model.load_weights("fer.h5")
print("Loaded model from disk")

#setting image resizing parameters
WIDTH = 48
HEIGHT = 48
x=None
y=None
labels = ['Angry', 'Disgust', 'Fear', 'Happy', 'Sad', 'Surprise', 'Neutral']

#loading image
full_size_image = cv2.imread(UPLOAD_DIR+"/"+filename)
print("Image Loaded")
gray=cv2.cvtColor(full_size_image,cv2.COLOR_RGB2GRAY)
face = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
faces = face.detectMultiScale(gray, 1.3  , 10)

#detecting faces
for (x, y, w, h) in faces:
        print("in loop")
        roi_gray = gray[y:y + h, x:x + w]
        cropped_img = np.expand_dims(np.expand_dims(cv2.resize(roi_gray, (48, 48)), -1), 0)
        cv2.normalize(cropped_img, cropped_img, alpha=0, beta=1, norm_type=cv2.NORM_L2, dtype=cv2.CV_32F)
        cv2.rectangle(full_size_image, (x, y), (x + w, y + h), (0, 255, 0), 1)
        #predicting the emotion
        yhat= loaded_model.predict(cropped_img)
        cv2.putText(full_size_image, labels[int(np.argmax(yhat))], (x, y), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 1, cv2.LINE_AA)
        print("Emotion: "+labels[int(np.argmax(yhat))])
        print("eeeee="+str(np.argmax(yhat)))

cv2.imshow('Emotion', full_size_image)
cv2.waitKey()
print("<html>")
print("<head>")
print("<meta http-equiv='refresh' content='0;url=http://localhost:8081/emotion.jsp'/>")
print("</head>")
print("</html>")