<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" import="java.util.*, java.text.*, models.Pessoa " %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@page import="org.omg.PortableInterceptor.SUCCESSFUL"%>
<html lang="pt-br">

    <head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilo.css" type="text/css">
    
        <title>Estoque</title>
    </head>
    <body>

         <div class="container-fluid">
            <a class="navbar-brand">
                <img src="C:\Users\Carlos\Desktop\carrinho.png" width="60" height="60" alt="" >
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

                    <h1 class="display-4">Estoque</h1>

                </div>

            </div>
            
            	<% 		
						Object erroPesquisa = request.getAttribute("ErroPesquisa");
						if(erroPesquisa != null){	
							char aspas ='"';
							String msg = (String)erroPesquisa;	
							out.print("<div class="+aspas+"alert alert-primary alert-dismissible fade show"+aspas+" role="+aspas+"alert"+aspas+">"+
							"<h4>Sua busca falhou</h4>"+
							"<button type="+aspas+"button"+aspas+ "class="+aspas+"close"+aspas+ "data-dismiss="+aspas+"alert"+aspas+ "aria-label="+aspas+"Close"+aspas+">" +
    						"<span aria-hidden="+aspas+"true"+aspas+">&times;</span>" +
 							"</button>" +
							msg +
 							"</div>");
						}	
			%>
            
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary mt-2 mb-0">
                
                <div class="input-group my-2">
  					<input type="text" class="form-control" id="inputPesquisa" placeholder="Pesquise pelo nome do produto" aria-label="Pesquisa" aria-describedby="Pesquisa">
  						<div class="input-group-append">
    					<button class="btn btn-secondary" id="btnPesquisa" type="button" onclick='pesquisar()'>Pesquisar
    						<span class="glyphicon glyphicon-search"></span>
    					</button>
  					</div>
				</div>
                
                

                
                <div class="col-xs-12 col-md-2">
                    <button class="btn btn-secondary ml-5" type="button">Imprimir</button>
                </div>  

            </nav>

            <div class="scrollspySite" data-spy="scroll" data-offset="0">

                <div class="table-responsive-md">
                
                    <table class="table table-striped table-hover ">
                
                        <thead class="thead-ligth">
                
                            <tr class="table-primary">
                
                                <th scope="col">Produto</th>
                                <th scope="col">Und. Venda</th>
                                <th scope="col">Custo</th>
                                <th scope="col">Venda</th>                        
                                <th scope="col">Quantidade</th>
                                <th scope="col">&nbsp;</th>
                            
                            </tr>
                        
                        </thead>
                        
                        <tbody>
                        
                            <c:forEach var="produto" items="${listaProdutos}">
        					<tr>
            					
            					<td><c:out value=" ${produto.nome}" /></td>
            					<td><c:out value=" ${produto.undVenda}"/></td>
            					<td><c:out value="R$ ${produto.precoCusto}"/></td>
            					<td><c:out value="R$ ${produto.precoVenda}"/></td>
            					<td><c:out value="${produto.quantidade}"/></td>
            					<td align="right">
                                    <div>
                                        <a class="btn btn-primary btn-sm" href="alterarProduto?id=${produto.id}"  role="button">...</a>
                                   
                                        <a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#pessoasCadastradasModal" role="button" onclick='excluir(${produto.id})' >
                                        X
                                        </a>
                                    </div>
                                </td>
        					
        					</tr>
						</c:forEach>
                        
                        </tbody>
            
                    </table>    

                </div>

            </div>

        </div> 
        
        <!-- Modal para exclusão-->

		 
        <div class="modal fade" id="pessoasCadastradasModal" tabindex="-1" role="dialog">

            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Exclusão de registro</h5>
                        
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                            
                        <div class="container-fluid">
                            
                            <h5>Tem certeza de que quer excluir o registro selecionado?</h5>
                            <p>essa operação é irreversível</p>
                            
                        </div>  

                    </div>

                    <div class="modal-footer">
                      <a class="btn btn-danger btn" id="btnExcluir" href="estoque?id_remover=" role="button" >Excluir</a>
                        
                    </div>

                </div>

            </div>

        </div>

        



        <!-- JavaScript JQerry-->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>   
    </body>
    <script type="text/javascript"> 
 		var btnExcluir = document.getElementById("btnExcluir");
 		
		function excluir(id) {

 			btnExcluir.href = "estoque?id_remover=" + id;		
 			
 	 	}

 	 	function pesquisar(){

			var campoPesquisa = document.getElementById("inputPesquisa");
			window.location.href = "estoque?search=" + campoPesquisa.value;
 	 		
 	 	}
	 	 
 	</script> 
</html>