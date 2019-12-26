package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
@WebServlet(urlPatterns = "/alterarPessoa")
public class AlterarPessoa extends HttpServlet {

	PessoaDAO DAOpessoa = new PessoaDAO();
	String idPessoa;

	public String getIdPessoa() {
		return idPessoa;
	}

	public void setIdPessoa(String idPessoa) {
		this.idPessoa = idPessoa;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("alterarPessoa.jsp");

		String id = req.getParameter("id");
		setIdPessoa(id);
		if (id != null && id != "") {
			List<Pessoa> pessoaBuscaLista = DAOpessoa.buscar(id);

			if (pessoaBuscaLista.size() > 0) {

				System.out.println("Pesoa encontrada. Dados abaixo:");
				System.out.println(pessoaBuscaLista.get(0).toString());
				Pessoa pessoaBusca = pessoaBuscaLista.get(0);

				req.setAttribute("pessoaBusca", pessoaBusca);

		
			}
		}
		dispatcher.forward(req, resp);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Método POST  de ateração Invocado");

		// recupera os valores do form
		ArrayList<String> listaErros = new ArrayList<String>();
		String nome = req.getParameter("inputNome"), cidade = req.getParameter("inputCidade"),
				bairro = req.getParameter("inputBairro"), cpf_cnpj = req.getParameter("inputCPFCNPJ"),
				telefone = req.getParameter("inputTelefone"), email = req.getParameter("inputEmail");

		String id_tipo_pessoa = req.getParameter("inputTipoPessoa");

		// instacia o metodo de validação de formulario
		ValidaForms validaForms = new ValidaForms();
		// atribui a uma lista local a lista que e retornada pelo metodo de validação
		listaErros = validaForms.validarFormularioPessoa(nome, email, cpf_cnpj, telefone);

		// caso não sejam encontrados erros no nos dados do formulario, é feito o
		// cadastro do usuário
		if (listaErros.isEmpty()) {

			Pessoa pessoaDadosAlterados = new Pessoa(nome, id_tipo_pessoa, cidade, bairro, cpf_cnpj, telefone, email);
			pessoaDadosAlterados.setId(Integer.parseInt(getIdPessoa()));
			try {

				DAOpessoa.alterar(pessoaDadosAlterados);

				// exibição dos elementos de confirmação na tela do usuario
				RequestDispatcher dispatcher = req.getRequestDispatcher("alterarPessoa.jsp");

				req.setAttribute("SucessMsg", "Dados Alterados com sucesso!");

			
			
				dispatcher.forward(req, resp);

			} catch (Exception e) {
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().print("Erro ao tentar realizar a conexão com o DB para alteração");
				System.out.println(e);
				System.out.println("Erro ao tentar realizar a conexão com o DB para alteração");
			}
		}

		// caso contrario, o usuario é informado dos erros
		else {

			System.out.println("Não foi possivel realizar a alteração. Infos no log");

			String erros = null;
			StringBuilder strB = new StringBuilder();

			strB.append("<hr>");
			strB.append("<p>");
			for (int i = 0; i < listaErros.size(); i++) {
				strB.append("<p>" + listaErros.get(i) + "<p>");
			}

			erros = strB.toString();

			RequestDispatcher dispatcher = req.getRequestDispatcher("alterarPessoa.jsp");

			req.setAttribute("erroList", erros);

			

			listaErros.clear();
			
			dispatcher.forward(req, resp);
		}
	}

}
