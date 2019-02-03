# Student Intervention System
## Team : Support-Vectors || HackDotSlash2019

### Introduction
In this competetive world, students need to keep pace with the current education system. Parents/Teachers keep an intervention of students after seeing the results mainly during the parent teachers meet. Many a times these manual intervenetions can become unnecessary if the elders only focus on absolute performance , whereas maybe the child might have done pretty well relatively. Also the socio-economic factors of the child plays a lot of role on his/her performance. The parents might not consider the childs overall emotional state and might set up an intervention straight up on analysing the poor results.

### PipeLine
Our **ML model** considers various socio-economic factors for predicting the child's final sem grades namely : **Family size, Father's job, Drug/Alcohol intake, Freetime, Health Status** among various other 31 parameters. The predicted score is then compared with the original score of the student as evaluated by the **fuzzy** inference system. The fuzzy expert system was carefully designed by doing simulations for a wide variety of data in matlab and was implemented in software using **Java**. The predicted score and the fuzzy score is actually compared to assess the students final performance. 

### Tech-Stack
- ML Model - Keras API (tensorflow Backend) , Anaconda Environment
- Matlab , **j-Fuzzy Logic** 
- JSP(Java Server Pages), Flask for Rest API 

### References 
- UCI Machine Learning Repository - Student Performance Dataset
- Fuzzy Logic based student academic evaluation system - Rajat Sharma(SVNIT) [[IJRECE]](http://nebula.wsimg.com/413ecc78a668feb30d60dfd4c9b5a14a?AccessKeyId=DFB1BA3CED7E7997D5B1&disposition=0&alloworigin=1)
