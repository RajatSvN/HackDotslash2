
# REST API developed by Rajat, Rishabh, Divyam
# necessary imports

from flask import Flask
from flask import request
from flask import json
import numpy as np
import keras
import pickle
from ast import literal_eval
import pandas as pd
from sklearn.model_selection import train_test_split
from keras.utils import to_categorical
from keras.layers import *
import tensorflow as tf


def preprocess(x):
    x=pd.DataFrame(x[1:])
    x=x.transpose()
    outX = pd.DataFrame(index=x.index)
    for col, col_data in x.iteritems():
        if col_data.dtype == object:
            col_data = col_data.replace(['yes','no'],[1,0])

        if col_data.dtype == object:
            col_data = pd.get_dummies(col_data, prefix=col)

        outX = outX.join(col_data)
    return outX

def pre_pro(a):
    j=0
    d=[None]*48
    for i in range(len(a)):
        if i==0:
            if a[i]=="F":
                d[j]=1
                d[j+1]=0
            else:
                d[j]=0
                d[j+1]=1
            j=j+2
        elif i==1:
            d[j]=a[i]
            j=j+1
        elif i==2:
            if a[i]=="R":
                d[j]=1
                d[j+1]=0
            else:
                d[j]=0
                d[j+1]=1
            j=j+2
        elif i==3:
            if a[i]=="GT3":
                d[j]=1
                d[j+1]=0
            else:
                d[j]=0
                d[j+1]=1
            j=j+2
        elif i==4:
            if a[i]=="A":
                d[j]=1
                d[j+1]=0
            else:
                d[j]=0
                d[j+1]=1
            j=j+2
        elif i==5:
            d[j]=a[i]
            j=j+1
        elif i==6:
            d[j]=a[i]
            j=j+1
        elif i==7:
            if a[i]=="at_home":
                d[j]=1
                d[j+1]=0
                d[j+2]=0
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="health":
                d[j]=0
                d[j+1]=1
                d[j+2]=0
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="other":
                d[j]=0
                d[j+1]=0
                d[j+2]=1
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="services":
                d[j]=0
                d[j+1]=0
                d[j+2]=0
                d[j+3]=1
                d[j+4]=0
            else:
                d[j]=0
                d[j+1]=0
                d[j+2]=0
                d[j+3]=0
                d[j+4]=1
            j=j+5
        elif i==8:
            if a[i]=="at_home":
                d[j]=1
                d[j+1]=0
                d[j+2]=0
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="health":
                d[j]=0
                d[j+1]=1
                d[j+2]=0
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="other":
                d[j]=0
                d[j+1]=0
                d[j+2]=1
                d[j+3]=0
                d[j+4]=0
            elif a[i]=="services":
                d[j]=0
                d[j+1]=0
                d[j+2]=0
                d[j+3]=1
                d[j+4]=0
            else:
                d[j]=0
                d[j+1]=0
                d[j+2]=0
                d[j+3]=0
                d[j+4]=1
            j=j+5
        elif i==9:
            if a[i]=="course":
                d[j]=1
                d[j+1]=0
                d[j+2]=0
                d[j+3]=0
            elif a[i]=="home":
                d[j]=0
                d[j+1]=1
                d[j+2]=0
                d[j+3]=0
            elif a[i]=="other":
                d[j]=0
                d[j+1]=0
                d[j+2]=1
                d[j+3]=0
            else:
                d[j]=0
                d[j+1]=0
                d[j+2]=0
                d[j+3]=1
            j=j+4
        elif i==10:
            if a[i]=="father":
                d[j]=1
                d[j+1]=0
                d[j+2]=0
            elif a[i]=="mother":
                d[j]=0
                d[j+1]=1
                d[j+2]=0
            else:
                d[j]=0
                d[j+1]=0
                d[j+2]=1
            j=j+3
        else:
            if a[i]=="yes":
                d[j]=1
            elif a[i]=="no":
                d[j]=0
            else:
                d[j]=a[i]
            j=j+1

    return d

app = Flask(__name__)

# loading required pickles , serialized object for ML Models

model = pickle.load(open("Model.p","rb"))


@app.route('/',methods=["POST"])

def predict():

    a =  request.data.decode(encoding='utf-8',errors='strict')

    a = literal_eval(a)
    

    b = pre_pro(a[1:])

    e=pd.DataFrame(b)
    e=e.transpose()

    e.columns=['sex_F', 'sex_M', 'age', 'address_R', 'address_U', 'famsize_GT3',
       'famsize_LE3', 'Pstatus_A', 'Pstatus_T', 'Medu', 'Fedu', 'Mjob_at_home',
       'Mjob_health', 'Mjob_other', 'Mjob_services', 'Mjob_teacher',
       'Fjob_at_home', 'Fjob_health', 'Fjob_other', 'Fjob_services',
       'Fjob_teacher', 'reason_course', 'reason_home', 'reason_other',
       'reason_reputation', 'guardian_father', 'guardian_mother',
       'guardian_other', 'traveltime', 'studytime', 'failures', 'schoolsup',
       'famsup', 'paid', 'activities', 'nursery', 'higher', 'internet',
       'romantic', 'famrel', 'freetime', 'goout', 'Dalc', 'Walc', 'health',
       'absences', 'G1', 'G2']
    
    e=e.as_matrix()

    with graph.as_default():
        preds = (model.predict(e))
        return str(np.argmax(preds))

    

    # preprocessing code , removing stopwords




    

if __name__ == "__main__":
    graph = tf.get_default_graph()
    app.run(host='0.0.0.0',debug=True)
