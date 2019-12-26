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
import models.Produto;
import persistence.ProdutoDAO;

@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/cadastroProduto")
public class CadastroProduto extends HttpServlet {

	ProdutoDAO DAO = new ProdutoDAO();

	ArrayList<String> listaErros = new ArrayList<>();
	Produto produtoCadastro;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroProduto.jsp");

		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Metodo POST invocado");

		String nome = req.getParameter("inputNome");
		String precoCusto = req.getParameter("inputPrecoCompra");
		String precoVenda = req.getParameter("inputPrecoVenda");
		String margemLucro = req.getParameter("inputMargemLucro");
		String quantidade = req.getParameter("inputQuantidade");
		String undVenda = req.getParameter("inputUnVenda");

		ValidaForms validaForms = new ValidaForms();
		
		
		
		listaErros = validaForms.validarFormularioProduto(nome, precoCusto, precoVenda, margemLucro, quantidade);

		precoCusto = precoCusto.replace(".","");
		precoCusto = precoCusto.replace(",",".");
		
		precoVenda = precoVenda.replace(".","");
		precoVenda = precoVenda.replace(",",".");
		
		margemLucro = margemLucro.replace(".","");
		margemLucro = margemLucro.replace(",",".");
		margemLucro = margemLucro.replace("%","");

		quantidade = quantidade.replace(".", "");
		quantidade = quantidade.replace(",", ".");
//		replace(",", "").replace(".", "").replace("%", "").trim();
		if (listaErros.isEmpty()) {

			double precoCDoub, precoVDoub, margemLDoub, quantDoub;
			
			
			
			precoCDoub = Double.parseDouble(precoCusto);
			precoVDoub = Double.parseDouble(precoVenda);
			margemLDoub = Double.parseDouble(margemLucro);
			quantDoub = Double.parseDouble(quantidade);
			produtoCadastro = new Produto(nome, undVenda, precoCDoub, precoVDoub, margemLDoub, quantDoub);

			try {
				DAO.incluir(produtoCadastro);

				// exibição dos elementos de confirmação na tela do usuario
				RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroProduto.jsp");

				req.setAttribute("SucessMsg", "Cadastro realizado com sucesso!");

				dispatcher.forward(req, resp);
			}

			catch (Exception e) {
				resp.setCharacterEncoding("UTF-8");
				resp.getWriter().print("Erro ao tentar realizar a conexão com o DB para cadastro");
				System.out.println("Erro ao tentar realizar a conexão com o DB para cadastro");

			}
		} else {

			System.out.println("Não foi possivel realizar o cadastro. Infos no log");

			String erros = null;
			StringBuilder strB = new StringBuilder();

			strB.append("<hr>");
			strB.append("<p>");
			for (int i = 0; i < listaErros.size(); i++) {
				strB.append("<p>" + listaErros.get(i) + "<p>");
			}

			erros = strB.toString();

			RequestDispatcher dispatcher = req.getRequestDispatcher("cadastroProduto.jsp");

			req.setAttribute("erroList", erros);

			dispatcher.forward(req, resp);

			listaErros.clear();
		}

	}
}
