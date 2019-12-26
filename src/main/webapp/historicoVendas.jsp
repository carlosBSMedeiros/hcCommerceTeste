<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="webjars/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="estilo.css" type="text/css">
    
        <title>Histórico de Vendas</title>
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

                    <h1 class="display-4">Histórico de Vendas</h1>

                </div>

            </div>
            
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary my-2 ">
                
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Cliente" aria-label="busca">
                    <button class="btn btn-outline-ligth my-2 my-sm-0 " type="button">Busca</button>
                </form>

            </nav>

            <div class="scrollspySite" data-spy="scroll" data-offset="0">

                <div class="table-responsive-md">
                
                    <table class="table table-striped table-hover ">
                
                        <thead class="thead-ligth">
                
                            <tr class="table-primary">
                
                                <th scope="col">Vendas</th>
                                <th scope="col">Valor</th>
                                <th scope="col">NÂº Venda</th>
                                <th scope="col">&nbsp;</th>
                            
                            </tr>
                        
                        </thead>
                        
                        <tbody>
                        
                            <tr height="100">
                                
                                <td>Iogurte tal tal tal tal tal</td>
                                <td>R$ 00,00</td>
                                <td>000001</td>
                                <td align="right">
                                    
                                    <div>
                                        <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#estoqueModal" aria-label="btnEdicao">
                                        ...
                                        </button>
                                   
                                        <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#estoqueModal" aria-label="btnEdicao">
                                        X
                                        </button>
                                    </div>
                                
                                </td>

                            </tr>

                            <tr height="100">
                                
                                <td>Iogurte tal tal</td>
                                <td>R$ 00,00</td>
                                <td>000002</td>   
                                <td align="right">
                                    
                                    <div>
                                        <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#estoqueModal" aria-label="btnEdicao">
                                        ...
                                        </button>
                                   
                                        <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#estoqueModal" aria-label="btnEdicao">
                                        X
                                        </button>

                                    </div>

                                </td>
                                
                            </tr>
                        
                        </tbody>
            
                    </table>    

                </div>

            </div>

        </div> 
        
        <!-- Modal -->

        <div class="modal fade" id="estoqueModal" tabindex="-1" role="dialog">

            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Dados do produto</h5>
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                            
                        <div class="container-fluid">
                            
                            <form>

                                <div class="form-row ">

                                    <div class="form-group col-12">

                                        <label for="inputNome">Nome do produto</label>
                                        <input type="text" class="form-control" id="inputNome" placeholder="Nome">

                                    </div>
                                
                                </div>        
                                   
                                <div class="form-row">   
                                
                                    <div class="form-group col-md-6">

                                        <label for="inputUnVenda">Unidade de Venda</label>
                                        <select class="form-control" id="inputUnVenda" placeholder="Kg, Und, Pct">
                                            <option selected>Selecione</option>
                                            <option>UND</option>
                                            <option>KG</option>
                                            <option>PCT</option>
                                        </select>    
                                    
                                    </div>

                                    <div class="form-group col-md-6">

                                        <label for="inputMargem">Margem de lucro</label>
                                        <input type="number" class="form-control" id="inputMargem" placeholder="lucro (%)">

                                    </div>

                                </div>

                                <div class="form-row">

                                    <div class="form-group col-md-6">

                                        <label for="inputPrecoCompra">PreÃ§o de custo</label>
                                        <input type="number" class="form-control" id="inputPrecoCompra" placeholder="R$">

                                    </div>

                                    <div class="form-group col-md-6">

                                        <label for="inputPrecoVenda">PreÃ§o de venda</label>
                                        <input type="number" class="form-control" id="inputPrecoVenda" placeholder="R$">

                                    </div>

                                </div>

                                <div class="form-row">

                                    <div class="form-group col-md-4">

                                        <label for="inputQuantidade">Quantidade</label>
                                        <input type="number" class="form-control" id="inputQuantidade" placeholder="Quantidade">

                                    </div>

                                </div>


                            </form>

                        </div>  

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-target="#">Salvar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Sair</button>
                    </div>

                </div>

            </div>

        </div>



        <!-- JavaScript JQerry-->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
    </body>
</html>
