<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Student Evaluator Tool</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="chalkBoard.css">
	<link href='https://fonts.googleapis.com/css?family=Permanent+Marker' rel='stylesheet' type='text/css'>
	<link rel="icon" href="images/navBarPhoto2.png">
</head>
<body>
<div class="shade">
        <div class="blackboard">
                <div class="form">
                        <p>
                                <label>Attendance (%) : </label>
                                <input type="text" class="allownumericwithdecimal" id="attendance" />
                        </p>
                        <p>
                                <label>Mid Sems Marks (%) : </label>
                                <input type="text" class="allownumericwithdecimal" id="mid" />
                        </p>
                        <p>
                                <label>End Sems Marks (%) : </label>
                                <input type="text" class="allownumericwithdecimal" id="end"/>
                        </p>
                       
                        <p class="wipeout">
                                <input type="submit" value="See Result" id="submit"/>
                        </p>

                        <p>
                        	<label class="errorHandling">The following errors were found in your inputs : <br></label>
                        	<label class="Result"></label>
                        </p>	

                </div>
        </div>
</div>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script src="StudentEvaluator.js"></script>
</body>
</html>