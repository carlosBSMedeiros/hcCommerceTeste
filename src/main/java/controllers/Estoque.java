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

import models.Produto;
import persistence.ProdutoDAO;

@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/estoque")
public class Estoque extends HttpServlet{

	ProdutoDAO DAO = new ProdutoDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Produto> produtos = new ArrayList<Produto>();
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("estoque.jsp");

		String stringPesquisa = req.getParameter("search");
		
		if(stringPesquisa != null && stringPesquisa != "") {
			try{
				produtos = DAO.buscaEspecifica(stringPesquisa);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			if(!produtos.isEmpty()) {
				
				req.setAttribute("listaProdutos", produtos);

			}
			else{
				String erroPesquisa ="Não foram encontrados resultados para a busca solicitada";
				req.setAttribute("ErroPesquisa", erroPesquisa);
			}
		}
		else {
			produtos = DAO.buscaGeral();
			req.setAttribute("listaProdutos", produtos);
		}
		String removeId = req.getParameter("id_remover");

		if(removeId != null && removeId != "") {
			//List<Pessoa> pessoaBuscaDeletar = new ArrayList<Pessoa>();
			//pessoaBuscaDeletar = DAO.buscar(removeId);
			//DAO.deletar(pessoaBuscaDeletar.get(0));
			
			DAO.deletar(Integer.parseInt(removeId));
			
			removeId = null;
			resp.sendRedirect("estoque");
		
		}
		else {
			dispatcher.forward(req, resp);

		}
		
	
			
			
		
	}
}
