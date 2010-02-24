<html>
	<head />
		<script language="javascript" type="text/javascript">
   var request = false;
   try {
     request = new XMLHttpRequest();
   } catch (trymicrosoft) {
     try {
       request = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (othermicrosoft) {
       try {
         request = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (failed) {
         request = false;
       }  
     }
   }
   if (!request)
     alert("Error initializing XMLHttpRequest!");
   function getCustomerInfo() {
     var phone = document.getElementById("phone").value;
     
     var url = "SimpleServlet?" + escape(phone);

	 request.open("GET", url, true);
	 request.onreadystatechange = updatePage;

 	 request.send(null);

   }



	function updatePage() {
	
	 if (request.readyState == 4)
	 	if (request.status == 200)
	 	{
	     	alert("Server is done!");
	     	var responseDiv = document.getElementById("address");
    		if(responseDiv.hasChildNodes()) {
        			responseDiv.removeChild(responseDiv.childNodes[0]);
    		}
   
   			var responseText = document.createTextNode(request.responseText);
    		responseDiv.appendChild(responseText);
	     }
	     else if (request.status == 404)
         	alert("Request URL does not exist");
       	 else
         	alert("Error: status code is " + request.status);
	     
   }

</script>
	<body>
		<p>
			<img src="breakneck-logo_4c.gif" alt="Break Neck Pizza" />
		</p>
		<form action="#">
			<p>
				Enter your phone number:
				<input type="text" size="14" name="phone" id="phone"
					onChange="getCustomerInfo();" />
			</p>
			<p>
				Your order will be delivered to:
			</p>
			<div id="address"></div>
			<p>
				Type your order in here:
			</p>
			<p>
				<textarea name="order" rows="6" cols="50" id="order"></textarea>
			</p>
			<p>
				<input type="submit" value="Order Pizza" id="submit" />
			</p>
		</form>
	</body>
</html>