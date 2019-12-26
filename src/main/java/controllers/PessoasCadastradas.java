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

import models.Pessoa;
import persistence.PessoaDAO;

@SuppressWarnings("serial")

@WebServlet(urlPatterns = "/pessoasCadastradas")
public class PessoasCadastradas extends HttpServlet {
	
	PessoaDAO DAO = new PessoaDAO();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Pessoa> pessoas = new ArrayList<>();
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("pessoasCadastradas.jsp");
		
		String stringPesquisa = req.getParameter("search");

		if(stringPesquisa != null && stringPesquisa != "") {
			try{
				pessoas = DAO.buscaEspecifica(stringPesquisa);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			if(!pessoas.isEmpty()) {
				
				req.setAttribute("listaPessoas", pessoas);

			}
			
			else {
				String erroPesquisa ="Não foram encontrados resultados para a busca solicitada";
				req.setAttribute("ErroPesquisa", erroPesquisa);
			}

		}
		else {
			pessoas = DAO.buscaGeral();
			req.setAttribute("listaPessoas", pessoas);
		}
		
		
		
		String removeId = req.getParameter("id_remover");

		if(removeId != null && removeId != "") {
			//List<Pessoa> pessoaBuscaDeletar = new ArrayList<Pessoa>();
			//pessoaBuscaDeletar = DAO.buscar(removeId);
			//DAO.deletar(pessoaBuscaDeletar.get(0));
			
			DAO.deletar(Integer.parseInt(removeId));
			
			removeId = null;
			resp.sendRedirect("pessoasCadastradas");
		
		}
		else {
			dispatcher.forward(req, resp);

		}
		
		
			
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
	}
	
	
}
