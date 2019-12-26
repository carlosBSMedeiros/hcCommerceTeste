<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8" isELIgnored="false" import="java.util.*, java.text.*, models.Pessoa "%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<%@page import="org.omg.PortableInterceptor.SUCCESSFUL"%>
<html lang="pt-br">
    <head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilo.css" type="text/css">
    
        <title>Cadastro de Produtos</title>
    </head>
    <body>

         <div class="container-fluid">
            <a class="navbar-brand">
                <img src="C:\Users\Carlos\Desktop\carrinho.png" width="60" height="60" alt="" mr-auto>
              </a>
            <p class="display-4 d-inline ">HC de Medeiros</p>
        </div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid"> 
            <a class="navbar-brand" href="index">Início</a> 
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menuPrincipal" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="menuPrincipal">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-iten dropdown">
                        <a class="nav-link" href="#" if="menuCadastro" data-toggle="dropdown">Cadastro</a>
                        <div class="dropdown-menu" aria-labelledby="menuCadastro">
                           <a class="dropdown-item" href="cadastroPessoa">Pessoa</a> 
                           <a class="dropdown-item" href="cadastroProduto">Produto</a>
                           <div class="dropdown-divider"></div>
                           <a class="dropdown-item" href="pessoasCadastradas">Pessoas cadastradas</a> 

                        </div>
                    </li>
                    <li class="nav-iten dropdown">
                        <a class="nav-link" href="estoque">Estoque</a>
                    </li>
                        <li class="nav-iten dropdown">
                                <a class="nav-link" href="#" id="menuNotas" data-toggle="dropdown">Notas</a>
                                <div class="dropdown-menu" aria-labelledby="menuNotas">
                                   <a class="dropdown-item" href="notaVenda">Nova nota de venda</a>
                                   <div class="dropdown-divider"></div> 
                                   <a class="dropdown-item" href="historicoVendas">Histórico de vendas</a>
                                </div>
                            </li>
                </ul>    
            </div>

                
        </div>
        </nav>

        <div class="container">

            <div class="row">

                <div class="col-12 text-center my-2">

                    <h1 class="display-4">Cadastro de Produto</h1>

                </div>

            </div>

<div class="row">
				
				<div class="col-12 text-justify my-2">
						
					
					<%
						Object sucessMsg = request.getAttribute("SucessMsg");
						if(sucessMsg != null){	
							char aspas ='"';
							String msg = (String)sucessMsg;	
							out.print("<div class="+aspas+"alert alert-success alert-dismissible fade show"+aspas+" role="+aspas+"alert"+aspas+">"+
							"<button type="+aspas+"button"+aspas+ "class="+aspas+"close"+aspas+ "data-dismiss="+aspas+"alert"+aspas+ "aria-label="+aspas+"Close"+aspas+">" +
		    				"<span aria-hidden="+aspas+"true"+aspas+">&times;</span>" +
		 					"</button>" +
							msg +
							"</div>");
						}	
					%>
					
					
				</div>
		
			</div>
			
			<div class="row">
				
				<div class="col-12 text-justify my-2">
			
						
			<% 		
						Object listaErros = request.getAttribute("erroList");
						if(listaErros != null){	
							char aspas ='"';
							String msg = (String)listaErros;	
							out.print("<div class="+aspas+"alert alert-danger alert-dismissible fade show"+aspas+" role="+aspas+"alert"+aspas+">"+
							"<h4> Erros no cadastro</h4>"+
							"<button type="+aspas+"button"+aspas+ "class="+aspas+"close"+aspas+ "data-dismiss="+aspas+"alert"+aspas+ "aria-label="+aspas+"Close"+aspas+">" +
    						"<span aria-hidden="+aspas+"true"+aspas+">&times;</span>" +
 							"</button>" +
							msg +
 							"</div>");
						}	
			%>
				</div>
		
			</div>
       
            <div class="row justify-content-center mb-5">

                <div class="col-sm-12 col-md-10 col-lg-8">

                    <form method="post" action="cadastroProduto">

                        <div class="form-row">

                            <div class="form-group col-8">

                                <label for="inputNome">Nome do produto<span class="alerta-erro">*<span></label>
                                <input type="text" class="form-control" name="inputNome" placeholder="Nome">

                            </div>

                            <div class="form-group col-4">

                                <label for="inputUnVenda">Unidade de Venda</label>
                                <select class="form-control" name="inputUnVenda" >
                                    <option selected value="unidade">UND</option>
                                    <option value="Kg">KG</option>
                                    <option value="pacote">PCT</option>
                                </select>    
                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-4">

                                <label for="inputPrecoCompra">Preço de custo<span class="alerta-erro">*<span></label>
                                <input type="numeric" class="form-control" name="inputPrecoCompra" placeholder="R$" onkeypress="mascara(this,valor)" maxlength="11">

                            </div>

                            <div class="form-group col-4">

                                <label for="inputPrecoVenda">Preço de venda<span class="alerta-erro">*<span></label>
                                <input type="numeric" class="form-control" name="inputPrecoVenda" placeholder="R$" onkeypress="mascara(this,valor)" maxlength="11">

                            </div>

                            <div class="form-group col-4">

                                <label for="inputMargem">Margem de lucro<span class="alerta-erro">*<span></label>
                                <input type="numeric" class="form-control" name="inputMargemLucro" placeholder="lucro (%)" onkeypress="mascara(this,porcentagem)" maxlength="6">
                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-4">

                                <label for="inputQuantidade">Quantidade Inicial<span class="alerta-erro">*<span></label>
                                <input type="numeric" class="form-control" name="inputQuantidade" placeholder="Quantidade" onkeypress="mascara(this,valor)" maxlength="14">

                            </div>

                        </div>

                        <div class="form-row">  

                                <div class="form-group col-sm-12 ml-auto">
    
                                    <button type="submit" class="btn btn-primary my-1">Salvar</button>
    
                                </div>
    
                            </div> 

                    </form>

                </div>

            </div>    
        </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
    
    <script type="text/javascript">
    
    function execmascara(){
	    v_obj.value=v_fun(v_obj.value)
	}
	
	function mascara(o, f){
		v_obj = o
		v_fun = f
		setTimeout("execmascara()",1)

	}

	function valor(v){

        v = v.replace(/\D/g,'')
        v = v.replace(/(\d{1})(\d{1,2})$/, "$1,$2")
        v = v.replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1.')
        
        return v;

	}

		function porcentagem(v){

        v = v.replace(/\D/g,'')
      
       v = v.concat('%')
        return v;

	}
    
    </script>
    
    
    </body>
</html>