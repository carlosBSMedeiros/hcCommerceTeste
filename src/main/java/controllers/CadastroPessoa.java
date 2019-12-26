package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metodos.ValidaForms;
import models.Pessoa;
import persistence.PessoaDAO;

@SuppressWarnings("serial")

//urlpattern define a rota
@WebServlet(urlPatterns = "/cadastroPessoa")
public class CadastroPessoa extends HttpServlet {

	PessoaDAO DAOpessoa = new PessoaDAO();
	Pessoa pessoaCadastro;

	// GET que recupera a rota e relaciona ela ao arquivo .jsp
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroPessoa.jsp");


		dispatcher.forward(req, resp);
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Método POST Invocado");

		//recupera os valores do form
		ArrayList<String> listaErros = new ArrayList<String>();
		String nome = req.getParameter("inputNome"), cidade = req.getParameter("inputCidade"),
				bairro = req.getParameter("inputBairro"), cpf_cnpj = req.getParameter("inputCPFCNPJ"),
				telefone = req.getParameter("inputTelefone"), email = req.getParameter("inputEmail");

		String id_tipo_pessoa = req.getParameter("inputTipoPessoa");

		//instacia o metodo de validação de formulario
		ValidaForms validaForms = new ValidaForms();
		
		//tratamento dos dados
		
		
		
		
		//atribui a uma lista local a lista que e retornada pelo metodo de validação
		listaErros = validaForms.validarFormularioPessoa(nome, email, cpf_cnpj, telefone);
		
		
		//caso não sejam encontrados erros no nos dados do formulario, é feito o cadastro do usuário
		if(listaErros.isEmpty()) {
		
			pessoaCadastro = new Pessoa(nome, id_tipo_pessoa, cidade, bairro, cpf_cnpj, telefone, email);
	
			try {
	
				DAOpessoa.incluir(pessoaCadastro);
				
				//exibição dos elementos de confirmação na tela do usuario
				RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroPessoa.jsp");

				req.setAttribute("SucessMsg", "Cadastro realizado com sucesso!" );
				
				dispatcher.forward(req, resp);
	
			} catch (Exception e) {
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().print("Erro ao tentar realizar a conexão com o DB para cadastro");
				System.out.println("Erro ao tentar realizar a conexão com o DB para cadastro");
			}
		}
		
		//caso contrario, o usuario é informado dos erros
		else {
	
			System.out.println("Não foi possivel realizar o cadastro. Infos no log");
			
			String erros = null;
			StringBuilder strB = new StringBuilder();
			
			strB.append("<hr>");
			strB.append("<p>");
			for (int i = 0; i < listaErros.size(); i++) {
				strB.append( "<p>" + listaErros.get(i) + "<p>");
			}
			
			erros = strB.toString();
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroPessoa.jsp");

			req.setAttribute("erroList", erros);
			
			dispatcher.forward(req, resp);

			listaErros.clear();
			
		}
	}
	
	
}
