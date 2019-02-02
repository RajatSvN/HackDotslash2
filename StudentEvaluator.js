
	
	   $(".allownumericwithdecimal").on("keypress keyup blur",function (event) {
           
     $(this).val($(this).val().replace(/[^0-9\.]/g,''));
            if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
            }
        });

	   $("#submit").click(function(e){
	   
	   	var attendance = $("#attendance").val();
	   	var mid = $("#mid").val();
	   	var end = $("#end").val();
	   	var error = "";



	   	if(attendance < 0 || attendance >100){

	   		error += "Attendance can take value only between 0% - 100%.<br>";
	   		$("#attendance").html("");

	   	}
	   	
	   	if(attendance == ""){
	   		error += "Attendance field is empty.<br>";
	   		$("#attendance").html("");
	   	}

	   	if(mid < 0 || mid >100){

	   		error += "Mid sems marks can take value only between 0% - 100%.<br>";
	   		$("#mid").html("");

	   	}
	   	
	   	if(mid == ""){
	   		error += "Mid sems marks field is empty.<br>";
	   		$("#mid").html("");
	   	}

	   	if(end < 0 || end >100){

            error += "End sem marks can take value only between 0% - 100%.";
            $("#end").html("");

	   	}
	   	
	   	if(end == ""){
	   		error += "End sem marks field is empty.<br>";
            $("#end").html("");
	   	}


        if( error != ""){
        	$(".errorHandling").append(error);
        	$(".Result").css("display","none");
        	$(".errorHandling").css("display","block");
        	error = "";
        }else{
        	$.ajax({
        		url: "Result.jsp",
        		data: {
        			at : attendance,
        			mi : mid,
        			en : end,
        		}
        	}).done(function(data){
        		
        		clause = "<span style='color : orange;font-size : 30px;'><br>For more information see the ' How it works? ' section in the Home Page of website.</span>";
        		
        		if(data.trim() == "Error loading the Fuzzy Evaluation Model." || data.trim() == "Your scored less than minimum passing percentage 33 in External Exam so " +
                        "we can not evaluate your performance" || data.trim() == "Your Attendance was short so we can not evaluate your performance."){
        			$(".Result").css("color","red");
        			$(".Result").html(data+clause);
        			$(".errorHandling").css("display","none");
        			$(".Result").css("display","block");
        			
        		}else{
        			$(".Result").css("color","green");
        			$(".Result").html(data+clause);
        			$(".errorHandling").css("display","none");
        			$(".Result").css("display","block");
        			
        			
        		}
        		
        	})
        }

      setTimeout(function(){
      	$(".errorHandling").css("display","none");
	   	$(".errorHandling").html("The following errors were found in your inputs : <br>");
      },5000);
      
      setTimeout(function(){
		   $(".Result").css("display","none");
		   $(".Result").html("");
	   },10000);

       	e.preventDefault();

})

	   



