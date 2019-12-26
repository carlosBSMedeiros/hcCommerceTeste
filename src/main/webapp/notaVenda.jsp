<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilo.css" type="text/css">
    
        <title>Nova nota</title>
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

        <div class="container-fluid">
            
            <div class="row">

                <div class="col-12 text-center my-2">

                    <h1 class="display-4">Nova nota</h1>

                </div>

            </div>

            <div class="row justify-content-center mb-5">

                <div class="col-sm-12 col-md-10 col-lg-8">
                
                    <form>

                        <div class="form-row">

                            <div class="col-lg-4">

                                <label for="inputNome">Cliente</label>
                                <input type="text" class="form-control" id="inputNome" placeholder="Nome">
    
                            </div>

                            <div class="col-lg-4">

                                <label for="outputCidade">EndereÃ§o</label>
                                <input type="text" class="form-control" id="outputCidade" placeholder="EndereÃ§o">

                            </div>

                            <div class="col-lg-4">

                                <label for="outputCPFCNPJ">CPF/CNPJ</label>
                                <input type="text" class="form-control" id="outputCPFCNPJ" placeholder="CPF/CNPJ">
    
                            </div>

                        </div>

                    </form>

                </div>
                    
            </div>


        </div>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
    </body>
</html>