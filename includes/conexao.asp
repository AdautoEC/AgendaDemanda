<% 
	Dim conDB
	Session("Con") = "DSN=TarefasRB;UID=admin;PASSWORD=12345"
	Set conDB=Server.createObject("Adodb.Connection")
	
	conDB.open Session("Con")

%>
