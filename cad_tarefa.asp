<%
Response.Buffer  = true
Response.Expires = 0
Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%

id = Request.form("Id")
titulo = Request.form("Titulo")
descricao = Request.form("Descricao")
obs =  Request.form("Obs")
dtSolicitacao = Year(Date)&"-"&Month(Date)&"-"&Day(Date)
dtLimite = Request.form("dtLimite")
status = Request.form("Status")
responsavel = Request.form("Responsavel")
criador = Request.form("Criador")

if (trim(id) = "") or (isnull(id)) then id = 0 end if
	
if cint(id) = 0 then
	
	strSQL = "insert into Demandas values ('"& titulo &"','"& descricao &"','"& obs &"','"& dtSolicitacao &"','"& dtLimite &"','"& dtLimite &"','"& status &"','"& responsavel & "','"& criador &"')"
	conDB.execute(strSQL)

	response.redirect("index.asp?strStatus=INC")
	response.End
	
else

	strSQL = "update Demandas set Titulo = '"&titulo&"', Descricao = '"&descricao&"', Obs = '"&obs&"', DtLimite = '"&dtLimite&"', Status = '"&status&"', Responsavel = '"&responsavel&"', Criador = '"&criador&"' where id = " & id
	conDB.execute(strSQL)

	response.redirect("index.asp?strStatus=ALT")
	response.End
end if

%>