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
    
        <title>Cadastro de Pessoa</title>
    </head>
    <body>

		<%@ page import ="java.util.ArrayList"%>
		<%@ page import ="java.util.List"%>



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
                        <a class="nav-link" href="#" id="menuCadastro" data-toggle="dropdown">Cadastro</a>
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

                    <h1 class="display-4">Cadastro de Pessoa</h1>

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

                    <form method="post" action="cadastroPessoa">
											
                        <div class="form-row">

                            <div class="form-group col-8">

                                <label for="inputNome">Nome<span class="alerta-erro">*</span></label>
                                <input type="text" class="form-control" name="inputNome" placeholder="Nome"></input>

                            </div>

                            <div class="form-group col-4">

                                <label for="inputTipoPessoa">Tipo de pessoa</label>
                                <select class="form-control" name="inputTipoPessoa">
                                    <option selected value="Clente">Cliente</option>
                                    <option value="Fornecedor">Fornecedor</option>
                                </select>    
                                
                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-4">

                                <label for="inputCidade">Cidade</label>
                                <input type="text" class="form-control" name="inputCidade" placeholder="Cidade">

                            </div>
                            
                            <div class="form-group col-4">

                                <label for="inputCidade">Bairro</label>
                                <input type="text" class="form-control" name="inputBairro" placeholder="Bairro" >

                            </div>

                            <div class="form-group col-4">

                               <label for="inputCPFCNPJ">
                                <div class="form-check form-check-inline">
  									<input class="form-check-input" type="radio" name="radio" id="inlineRadioBoxCPF" onclick="maskCPFCNPJ()" value="CPJ" checked>
  									<label class="form-check-label" for="inlineCheckbox1">CPF</label>
								</div>
								 <div class="form-check form-check-inline">
  									<input class="form-check-input" type="radio" name="radio" id="inlineRadioBoxCNPJ" onclick="maskCPFCNPJ()" value="CNPJ">
  									<label class="form-check-label" for="inlineCheckbox1">CNPJ</label>
								</div>
								</label>
                                <input type="text"  class="form-control" name="inputCPFCNPJ" id="inputCPFCNPJ" placeholder="CPF" >

                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-5">

                                <label for="inputTelefone">Telefone</label>
                                <input type="text" class="form-control"  name="inputTelefone" placeholder="(xx)xxxxx-xxxx"  onkeypress="mascara(this,telefone)" maxlength="15">

                            </div>

                            <div class="form-group col-7">

                                <label for="inputEmail">E-mail</label>
                                <input type="text" class="form-control" name="inputEmail" placeholder="E-mail" >

                            </div>

                        </div>

                        <div class="form-row">  

                            <div class="form-group col-sm-12 ml-auto">

                                <button type="submit" class="btn btn-primary my-1">Cadastrar</button>

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

		function telefone(v){

			v=v.replace(/\D/g,"")
			v=v.replace(/^(\d\d)(\d)/g,"($1) $2")
			v=v.replace(/(\d{5})(\d)/,"$1-$2")

			return v
		}

		
		var inlineRadioBoxCPF = document.getElementById('inlineRadioBoxCPF');
		var inlineRadioBoxCNPJ = document.getElementById('inlineRadioBoxCNPJ');

		var inputCPFCNPJ = document.getElementById('inputCPFCNPJ');
		inputCPFCNPJ.setAttribute("onkeypress", 'mascara(this,cpf)');
		inputCPFCNPJ.setAttribute("maxlength", "14");
		
		function maskCPFCNPJ() {
			inputCPFCNPJ.value = null;
			if(inlineRadioBoxCPF.checked == true){
				inputCPFCNPJ.setAttribute("onkeypress", 'mascara(this,cpf)');
				inputCPFCNPJ.setAttribute("maxlength", "14");
				inputCPFCNPJ.setAttribute("placeholder", "CPF");
				
			} else if(inlineRadioBoxCNPJ.checked == true){
				inputCPFCNPJ.setAttribute("onkeypress", 'mascara(this,cnpj)');
				inputCPFCNPJ.setAttribute("maxlength", "18");			
				inputCPFCNPJ.setAttribute("placeholder", "CNPJ");
			}
		}

		function cpf(v){

			v=v.replace(/\D/g,"")                    
		    v=v.replace(/(\d{3})(\d)/,"$1.$2")       
		    v=v.replace(/(\d{3})(\d)/,"$1.$2")       
		    v=v.replace(/(\d{3})(\d{1,2})$/,"$1-$2") 
		    return v

		}
					
		function cnpj(v){					
						
			v=v.replace(/\D/g,"")                           
			v=v.replace(/^(\d{2})(\d)/,"$1.$2")             
			v=v.replace(/^(\d{2})\.(\d{3})(\d)/,"$1.$2.$3") 
			v=v.replace(/\.(\d{3})(\d)/,".$1/$2")           
			v=v.replace(/(\d{4})(\d)/,"$1-$2")              
			return v			  
						
		}

		
 	</script> 

    </body>
</html>