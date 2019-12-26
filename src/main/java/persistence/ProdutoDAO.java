package persistence;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.Session;

import models.Produto;

public class ProdutoDAO {
	static EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceDAO");
	static EntityManager em = emf.createEntityManager();

	public void incluir(Produto produto) {
		em.getTransaction().begin();
		em.merge(produto);
		em.getTransaction().commit();
		System.out.println("Produto cadastrado");
		System.out.println("Infos dp produto: " + produto.toString());
	}

	public void alterar(Produto produto) {
		Session session;
		session = (Session) em.getDelegate();

		session.getTransaction().begin();

		session.update(Produto.class.getName(), produto);

		session.getTransaction().commit();
		session.clear();

		System.out.println("Dados alterados!");
		System.out.println(produto.toString());
	}

	public void deletar(Integer id) {

		Session session;
		session = (Session) em.getDelegate();
		try {

			Produto produtoDeletar;

			session.getTransaction().begin();
			produtoDeletar = session.find(Produto.class, id);
			System.out.println("Produto parar exclusão encontrado");
			System.out.println(produtoDeletar.toString());

			session.delete(produtoDeletar);
			session.getTransaction().commit();
			session.clear();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Produto> buscar(String id) {

		List<Produto> produtoBusca = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		@SuppressWarnings("unchecked")
		List<Object[]> list = session.createNativeQuery("select * from hc_commerce.hc_produto where id=:id")
				.setParameter("id", Integer.parseInt(id)).list();

		for (Object[] object : list) {

			try {
				Produto produtoBuscaG = new Produto();

				if (object[0] != null) {
					produtoBuscaG.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					produtoBuscaG.setNome((String) object[1]);

				}

				if (object[2] != null) {
					produtoBuscaG.setUndVenda((String) object[2]);

				}

				if (object[3] != null) {
					produtoBuscaG.setPrecoCusto((Double) object[3]);

				}

				if (object[4] != null) {
					produtoBuscaG.setPrecoVenda((Double) object[4]);

				}

				if (object[5] != null) {
					produtoBuscaG.setMargemLucro((Double) object[5]);

				}

				if (object[6] != null) {
					produtoBuscaG.setQuantidade((Double) object[6]);

				}

				produtoBusca.add(produtoBuscaG);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.printStackTrace();
			}
		}

		return produtoBusca;
	}

	public List<Produto> buscaGeral() {

		List<Produto> produtosBuscaG = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		@SuppressWarnings("unchecked")
		List<Object[]> list = session.createNativeQuery("select * from hc_commerce.hc_produto").list();

		for (Object[] object : list) {

			try {
				Produto produtoBuscaG = new Produto();

				if (object[0] != null) {
					produtoBuscaG.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					produtoBuscaG.setNome((String) object[1]);

				}

				if (object[2] != null) {
					produtoBuscaG.setUndVenda((String) object[2]);

				}

				if (object[3] != null) {

					produtoBuscaG.setPrecoCusto((Double) object[3]);

				}

				if (object[4] != null) {

					produtoBuscaG.setPrecoVenda((Double) object[4]);

				}

				if (object[5] != null) {
					produtoBuscaG.setMargemLucro((Double) object[5]);

				}

				if (object[6] != null) {
					produtoBuscaG.setQuantidade((Double) object[6]);

				}

				produtosBuscaG.add(produtoBuscaG);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.printStackTrace();
			}

		}

		return produtosBuscaG;
	}

	public List<Produto> buscaEspecifica(String pesquisa) {

		List<Produto> produtosBuscaE = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		pesquisa = "%" + pesquisa + "%";

		@SuppressWarnings("unchecked")
		List<Object[]> list = session
				.createNativeQuery("select * from hc_commerce.hc_produto  where nome like :pesquisa ")
				.setParameter("pesquisa", pesquisa).list();

		for (Object[] object : list) {

			try {
				Produto produtoBuscaE = new Produto();

				if (object[0] != null) {
					produtoBuscaE.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					produtoBuscaE.setNome((String) object[1]);

				}

				if (object[2] != null) {
					produtoBuscaE.setUndVenda((String) object[2]);

				}

				if (object[3] != null) {

					produtoBuscaE.setPrecoCusto((Double) object[3]);

				}

				if (object[4] != null) {

					produtoBuscaE.setPrecoVenda((Double) object[4]);

				}

				if (object[5] != null) {
					produtoBuscaE.setMargemLucro((Double) object[5]);

				}

				if (object[6] != null) {
					produtoBuscaE.setQuantidade((Double) object[6]);

				}

				produtosBuscaE.add(produtoBuscaE);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.printStackTrace();
			}

		}

		return produtosBuscaE;
	}
}