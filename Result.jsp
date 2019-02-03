

<%@page import="net.sourceforge.jFuzzyLogic.FIS"%>
<%@page import="java.net.*" %>
<%@page import="java.io.*" %>
<% 

	double ml = Double.parseDouble(request.getParameter("ML"));
	
	double attendance = Double.parseDouble(request.getParameter("at"));
	
	double mid = Double.parseDouble(request.getParameter("mi"));
	
	double end = Double.parseDouble(request.getParameter("en"));
	
	out.print(eval(mid,end,attendance,ml));
	
	%>
	
<%! public String performanceValue(double val) {
    	
    	if(val>=0 && val<46.66) {
    		return "poor";
    	}else if(val>=46.66 && val<60) {
    		return "average";
    	}else if(val>=60 && val<70) {
    		return "good";
    	}else if(val>=70 && val<80) {
    		return "very good";
    	}else {
    		return "excellent";
    	}
    	}
 
    public String eval(double a , double b ,double c,double ml) throws Exception {

    	String clause = "Your weighted score is <span style='font-size:35px;'>";
    	String clause2 = " and your predicted score was  <span style='font-size:35px;'>";
    	
    	
    	
    	System.out.print(FIS.class + "Class is accessible...");
    	
        if(c>=60 && c<=74.99) {

            // Unfortunately putting a fcl file as string
            
        	String initialString = "FUNCTION_BLOCK Evaluation\n"+	
        			"VAR_INPUT\n"+				
        			"InternalMarks : REAL;\n"+
        			"ExternalMarks : REAL;\n"+
        		"END_VAR\n"+
        		"VAR_OUTPUT\n"+				
        			"Performance : REAL;\n"+
        			"END_VAR\n"+
        		"FUZZIFY InternalMarks\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (79.99,1) (79.99,0);\n"+
        			"TERM excellent := (80,0) (80,1) (101,1) (101,0);\n"+
        		"END_FUZZIFY\n"+
        		"FUZZIFY ExternalMarks\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (79.99,1) (79.99,0);\n"+
        			"TERM excellent := (80,0) (80,1) (101,1) (101,0);\n"+
        		"END_FUZZIFY\n"+
        		"DEFUZZIFY Performance\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (79.99,1) (79.99,0);\n"+
        			"TERM excellent := (80,0) (80,1) (101,1) (101,0);\n"+
        			"METHOD : COG;\n"+		
        			"DEFAULT := 0;\n"+		
        		"END_DEFUZZIFY\n"+
        		"RULEBLOCK No1\n"+
        			"AND : MIN;\n"+	
        			"ACT : MIN;	\n"+
        			"ACCU : MAX;\n"+	
        			"RULE 1 : IF InternalMarks IS poor and ExternalMarks IS poor THEN Performance is poor ;\n"+                
        			"RULE 2 : IF InternalMarks IS poor and ExternalMarks IS average THEN Performance is poor ;\n"+
        			"RULE 3 : IF InternalMarks IS poor and ExternalMarks IS good THEN Performance is poor ;\n"+
        			"RULE 4 : IF InternalMarks IS poor and ExternalMarks IS very_good THEN Performance is average ;\n"+                
        			"RULE 5 : IF InternalMarks IS poor and ExternalMarks IS excellent THEN Performance is average ;\n"+
        			"RULE 6 : IF InternalMarks IS average and ExternalMarks IS poor THEN Performance is poor ;\n"+
        			"RULE 7 : IF InternalMarks IS average and ExternalMarks IS average THEN Performance is poor ;\n"+                
        			"RULE 8 : IF InternalMarks IS average and ExternalMarks IS good THEN Performance is average ;\n"+
        			"RULE 9 : IF InternalMarks IS average and ExternalMarks IS very_good THEN Performance is average ;\n"+
        			"RULE 10 : IF InternalMarks IS average and ExternalMarks IS excellent THEN Performance is good ;\n"+                
        			"RULE 11 : IF InternalMarks IS good and ExternalMarks IS poor THEN Performance is poor ;\n"+
        			"RULE 12 : IF InternalMarks IS good and ExternalMarks IS average THEN Performance is poor ;\n"+
        			"RULE 13 : IF InternalMarks IS good and ExternalMarks IS good THEN Performance is average ;       \n"+         
        			"RULE 14 : IF InternalMarks IS good and ExternalMarks IS very_good THEN Performance is good ;\n"+
        			"RULE 15 : IF InternalMarks IS good and ExternalMarks IS excellent THEN Performance is good ;\n"+
        			"RULE 16 : IF InternalMarks IS very_good and ExternalMarks IS poor THEN Performance is poor ;   \n"+             
        			"RULE 17 : IF InternalMarks IS very_good and ExternalMarks IS average THEN Performance is average ;\n"+
        			"RULE 18 : IF InternalMarks IS very_good and ExternalMarks IS good THEN Performance is good ;\n"+
        			"RULE 19 : IF InternalMarks IS very_good and ExternalMarks IS very_good THEN Performance is good ;\n"+                
        			"RULE 20 : IF InternalMarks IS very_good and ExternalMarks IS excellent THEN Performance is very_good ;\n"+
        			"RULE 21 : IF InternalMarks IS excellent and ExternalMarks IS poor THEN Performance is poor ;\n"+
        			"RULE 22 : IF InternalMarks IS excellent and ExternalMarks IS average THEN Performance is average ;  \n"+              
        			"RULE 23 : IF InternalMarks IS excellent and ExternalMarks IS good THEN Performance is good ;\n"+
        			"RULE 24 : IF InternalMarks IS excellent and ExternalMarks IS very_good THEN Performance is good ;\n"+
        			"RULE 25 : IF InternalMarks IS excellent and ExternalMarks IS excellent THEN Performance is very_good ;\n"+                
        		"END_RULEBLOCK\n"+
        		"END_FUNCTION_BLOCK\n";

    InputStream in = new ByteArrayInputStream(initialString.getBytes());
            
            FIS fis = FIS.load(in,true);
            
            // Error while loading?
            if (fis == null) {
                return "Error loading the Fuzzy Evaluation Model.";
            }

            // Set inputs
            fis.setVariable("InternalMarks", a);
            fis.setVariable("ExternalMarks", b);

            // Evaluate
            fis.evaluate();



            if(b>=33.33) {
                // Print output
                String clause3 = "";
                
                double fuzVal = fis.getVariable("Performance").getValue();
                
                if((ml-10)<=fuzVal && fuzVal<=(ml+10)){
                	clause3="Your Performance was well within the <span style='font-size:35px;'>expected</span> range!";
                }else if((ml+10)<fuzVal && fuzVal<=(ml+20)){
                	clause3="Your Performance was <span style='font-size:35px;'>better</span> than expected!";
                }else if(fuzVal> ml+20){
                	clause3="Your Performance was <span style='font-size:35px;'>much better</span> than expected!";
                }else{
                	clause3= "Your performance can be <span style='font-size:35px;'>improved</span> further with the help of <span style='font-size:35px;'>intervention</span>!";
                }
                
                return clause + ((fuzVal+"").substring(0, 5))
                		+"</span>" + clause2 + ml +"</span><br>"+clause3;
            }else{
                return "Your scored less than minimum passing percentage <span style='font-size : 35px;'>33</span> in External Exam so " +
                        "we can not evaluate your performance";
            }

        }else if(c>=75){

            // Unfortunately putting a fcl file as string
            
        	String initialString = "FUNCTION_BLOCK Evaluation\n"+	
        			"VAR_INPUT\n"+				
        			"InternalMarks : REAL;\n"+
        			"ExternalMarks : REAL;\n"+
        		"END_VAR\n"+
        		"VAR_OUTPUT\n"+				
        			"Performance : REAL;\n"+
        			"END_VAR\n"+
        		"FUZZIFY InternalMarks\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (80,1) (80,0);\n"+
        			"TERM excellent := (80.1,0) (80.1,1) (101,1) (101,0);\n"+
        		"END_FUZZIFY\n"+
        		"FUZZIFY ExternalMarks\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (80,1) (80,0);\n"+
        			"TERM excellent := (80.1,0) (80.1,1) (101,1) (101,0);\n"+
        		"END_FUZZIFY\n"+
        		"DEFUZZIFY Performance\n"+			
        			"TERM poor := (0,0) (0,1) (33.33,1) (46.66,0)  ;\n"+ 
        			"TERM average := (40, 0) (60,1) (60,0) ;\n"+
        			"TERM good := (49,0) (70,1) (70,0);\n"+
        			"TERM very_good := (65,0) (80,1) (80,0);\n"+
        			"TERM excellent := (80.1,0) (80.1,1) (101,1) (101,0);\n"+
        			"METHOD : COG;\n"+		
        			"DEFAULT := 0;\n"+		
        		"END_DEFUZZIFY\n"+
        		"RULEBLOCK No1\n"+
        			"AND : MIN;\n"+	
        			"ACT : MIN;	\n"+
        			"ACCU : MAX;\n"+	
        			"RULE 1 : IF InternalMarks IS poor and ExternalMarks IS poor THEN Performance is poor ;\n"+                
        			"RULE 2 : IF InternalMarks IS poor and ExternalMarks IS average THEN Performance is average ;\n"+
        			"RULE 3 : IF InternalMarks IS poor and ExternalMarks IS good THEN Performance is average ;\n"+
        			"RULE 4 : IF InternalMarks IS poor and ExternalMarks IS very_good THEN Performance is good ;\n"+                
        			"RULE 5 : IF InternalMarks IS poor and ExternalMarks IS excellent THEN Performance is good ;\n"+
        			"RULE 6 : IF InternalMarks IS average and ExternalMarks IS poor THEN Performance is poor ;\n"+
        			"RULE 7 : IF InternalMarks IS average and ExternalMarks IS average THEN Performance is average ;\n"+                
        			"RULE 8 : IF InternalMarks IS average and ExternalMarks IS good THEN Performance is good ;\n"+
        			"RULE 9 : IF InternalMarks IS average and ExternalMarks IS very_good THEN Performance is good ;\n"+
        			"RULE 10 : IF InternalMarks IS average and ExternalMarks IS excellent THEN Performance is very_good ;\n"+                
        			"RULE 11 : IF InternalMarks IS good and ExternalMarks IS poor THEN Performance is average ;\n"+
        			"RULE 12 : IF InternalMarks IS good and ExternalMarks IS average THEN Performance is average ;\n"+
        			"RULE 13 : IF InternalMarks IS good and ExternalMarks IS good THEN Performance is good ;       \n"+         
        			"RULE 14 : IF InternalMarks IS good and ExternalMarks IS very_good THEN Performance is very_good ;\n"+
        			"RULE 15 : IF InternalMarks IS good and ExternalMarks IS excellent THEN Performance is very_good ;\n"+
        			"RULE 16 : IF InternalMarks IS very_good and ExternalMarks IS poor THEN Performance is average ;   \n"+             
        			"RULE 17 : IF InternalMarks IS very_good and ExternalMarks IS average THEN Performance is good ;\n"+
        			"RULE 18 : IF InternalMarks IS very_good and ExternalMarks IS good THEN Performance is very_good ;\n"+
        			"RULE 19 : IF InternalMarks IS very_good and ExternalMarks IS very_good THEN Performance is very_good ;\n"+                
        			"RULE 20 : IF InternalMarks IS very_good and ExternalMarks IS excellent THEN Performance is excellent ;\n"+
        			"RULE 21 : IF InternalMarks IS excellent and ExternalMarks IS poor THEN Performance is average ;\n"+
        			"RULE 22 : IF InternalMarks IS excellent and ExternalMarks IS average THEN Performance is good ;  \n"+              
        			"RULE 23 : IF InternalMarks IS excellent and ExternalMarks IS good THEN Performance is very_good ;\n"+
        			"RULE 24 : IF InternalMarks IS excellent and ExternalMarks IS very_good THEN Performance is very_good ;\n"+
        			"RULE 25 : IF InternalMarks IS excellent and ExternalMarks IS excellent THEN Performance is excellent ;\n"+                
        		"END_RULEBLOCK\n"+
        		"END_FUNCTION_BLOCK\n";

    InputStream in = new ByteArrayInputStream(initialString.getBytes());
            
        
            FIS fis = FIS.load(in,true);

            // Error while loading?
            if (fis == null) {
                return "Error loading the Fuzzy Evaluation Model.";
            }

            // Set inputs
            fis.setVariable("InternalMarks", a);
            fis.setVariable("ExternalMarks", b);

            // Evaluate
            fis.evaluate();
            double fuzVal = fis.getVariable("Performance").getValue();
               String clause3= "";
            if((ml-10)<=fuzVal && fuzVal<=(ml+10)){
            	clause3=" Your Performance was well within the <span style='font-size:35px;'>expected</span> range!";
            }else if((ml+10)<fuzVal && fuzVal<=(ml+20)){
            	clause3=" Your Performance was <span style='font-size:35px;'>better</span> than expected!";
            }else if(fuzVal> ml+20){
            	clause3=" Your Performance was <span style='font-size:35px;'>much better</span> than expected!";
            }else{
            	clause3= " Your performance can be <span style='font-size:35px;'>improved</span> further with the help of <span style='font-size:35px;'>intervention</span>!";
            }

            if(b>=33.33) {
                // Print output
            	  return clause + ((fis.getVariable("Performance").getValue()+"").substring(0, 5))
                  		+"</span>" +clause2 + ml +"</span>"+clause3;
            }else{
                return "Your scored less than minimum passing percentage <span style='font-size : 35px;'>33</span> in External Exam so " +
                        "we can not evaluate your performance";
            }

        }else{
            return "Your Attendance was short so we can not evaluate your performance.";
            }


    }
	
	

%>