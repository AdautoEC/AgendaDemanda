<%
Response.Buffer  = true
Response.Expires = 0
Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%
id   = Request.QueryString("id")

if (trim(id) = "") or (isnull(id)) then id = 0 end if

' Consiste o Evento
if (cint(id) <> 0) then
			
	' Seleciona os dados do evento
	strSQL = "select * from Demandas where Id = " & id
	
	' Executa a string sql.
	Set ObjRst = conDB.execute(strSQL)
			
	' Verifica se não é final de arquivo.	
	if not ObjRst.EOF then
				
		' Carrega as informações do Evento
		id = ObjRst("id")
		titulo = ObjRst("titulo")
		descricao = ObjRst("descricao")
		obs =  ObjRst("obs")
		dtSolicitacao = Year(Date)&"-"&Month(Date)&"-"&Day(Date)
		dtLimite = ObjRst("dtLimite")
		status = ObjRst("status")
		responsavel = ObjRst("responsavel")
		criador = ObjRst("criador")

	end if
	
	set ObjRst = nothing
	
end if

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Agenda de Demanda</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
    	body {
		  padding-top: 50px;
		}
		.starter-template {
		  padding: 40px 15px;
		  text-align: center;
		}
    </style>
  </head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.asp">Agenda de Demanda</a>
        </div>
      </div>
    </nav>

    <div class="container">

    	<div class="starter">
    		<div class="row">
    			<div class="col-sm-6">
		    	    <h1>Adicionar Tarefa</h1>
			        <div class="modal-body">
		    			<form role="form" id="db-form" name="db-form" method="post" action="cad_tarefa.asp">
		    				<div class="form-group-attached">
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Titulo</label>
	    								<input type="text" name="titulo" id="titulo" class="form-control" placeholder="Informe o titulo" value="<%=Titulo%>" required>
	    							</div>
		    						
		    					</div>
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Descrição</label>
	    								<input type="text" name="descricao" id="descricao" class="form-control" placeholder="Informe a descrição" value="<%=Descricao%>" required>
	    							</div>
		    						
		    					</div>	
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Observação</label>
	    								<input type="text" name="obs" id="obs" class="form-control" placeholder="Informe a observação" value="<%=Obs%>" required>
	    							</div>
		    						
		    					</div>				
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Prazo Limite</label>
	    								<input type="date" name="dtLimite" id="dtLimite" class="form-control" placeholder="Informe o prazo máximo" value="<%=dtLimite%>" required>
	    							</div>
		    						
		    					</div>
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Status</label>
	    								<select name="status" id="status" class="form-control" placeholder="Informe a" value="<%=Status%>" required>
											<option value="Em espera" selected>Em espera</option>
											<option value="Iniciada">Iniciada</option>
											<option value="Em implementação">Em implementação</option>
											<option value="Em teste">Em teste</option>
											<option value="Aguardando Aprovação">guardando Aprovação</option>
											<option value="Finalizada">Finalizada</option>
											<option value="Cancelada">Cancelada</option>
											<option value="Adiada">Adiada</option>
											<option value="Pausada">Pausada</option>
										</select>
	    							</div>
		    						
		    					</div>
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Resposável</label>
	    								<select name="responsavel" id="responsavel" class="form-control" placeholder="Informe o nome do responsável" value="<%=Responsavel%>" required>
											<option value="TI 01" selected>TI 01</option>
											<option value="TI 02">TI 02</option>
											<option value="TI 03">TI 03</option>
										</select>
	    							</div>
		    						
		    					</div>		
		    					<div class="row">
	    							<div class="form-group">
	    								<label>Criador</label>
	    								<input type="text" name="criador" id="criador" class="form-control" placeholder="Informe seu nome" value="<%=Criador%>" required>
	    							</div>
		    						
		    					</div>		

		    				</div>
		    				<div class="row">
		    					<div class="form-group">
		    						<input type="hidden" name="id" id="id" value="<%=id%>">
		    						<button type="submit" class="btn btn-primary">Salvar</button>
		    						<a href="index.asp" class="btn btn-info">Voltar</a>
		    					</div>
		    				</div>
		    			</form>	    
		    		</div>
		    	</div>
		    </div>
    	</div>	  
    </div><!-- /.container -->

    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</html>
<%

conDB.close()

set conDB = Nothing

%>