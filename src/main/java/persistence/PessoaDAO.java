package persistence;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.Session;

import models.Pessoa;

public class PessoaDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceDAO");
	EntityManager em = emf.createEntityManager();

	public void incluir(Pessoa pessoa) {
		
		em.getTransaction().begin();
		em.merge(pessoa);
		em.getTransaction().commit();
		System.out.println("Pessoa cadastrada");
		System.out.println("Infos da pessoa: " + pessoa.toString());
	
	}

	public void alterar(Pessoa pessoa) {
		
		Session session;
		session = (Session) em.getDelegate();

		session.getTransaction().begin();

		session.update(Pessoa.class.getName(), pessoa);

		session.getTransaction().commit();
		session.clear();

		System.out.println("Dados alterados!");
		System.out.println(pessoa.toString());

	}

	public void deletar(Integer id) {

		Session session;
		session = (Session) em.getDelegate();
		try {

			Pessoa pessoaDeletar;

			session.getTransaction().begin();

			pessoaDeletar = session.find(Pessoa.class, id);
			System.out.println("Pessoa parar exclusão encontrada");
			System.out.println(pessoaDeletar.toString());

			session.delete(pessoaDeletar);
			session.getTransaction().commit();
			session.clear();

			System.out.println("Registro excluido com sucesso");
			
		} catch (Exception e) {
			System.out.println("Erro na exclusão solicitada");
			e.printStackTrace();
		}
	}

	public List<Pessoa> buscar(String id) {

		List<Pessoa> pessoaBusca = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		@SuppressWarnings("unchecked")
		List<Object[]> list = session.createNativeQuery("select * from hc_commerce.hc_pessoa  where id=:id")
				.setParameter("id", Integer.parseInt(id)).list();

		for (Object[] object : list) {

			try {
				Pessoa pessoaBuscaG = new Pessoa();

				if (object[0] != null) {
					pessoaBuscaG.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					pessoaBuscaG.setNome((String) object[1]);

				}

				if (object[2] != null) {
					pessoaBuscaG.setCidade((String) object[2]);

				}

				if (object[3] != null) {
					pessoaBuscaG.setBairro((String) object[3]);

				}

				if (object[4] != null) {
					pessoaBuscaG.setCpfCNPJ((String) object[4]);

				}

				if (object[5] != null) {
					pessoaBuscaG.setTelefone((String) object[5]);

				}

				if (object[6] != null) {
					pessoaBuscaG.setEmail((String) object[6]);

				}

				if (object[7] != null) {
					pessoaBuscaG.setTipoPessoa((String) object[7]);

				}

				pessoaBusca.add(pessoaBuscaG);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.getStackTrace();
			}

		}

		return pessoaBusca;
	}

	public List<Pessoa> buscaGeral() {

		List<Pessoa> pessoasBuscaG = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		@SuppressWarnings("unchecked")
		List<Object[]> list = session.createNativeQuery("select * from hc_commerce.hc_pessoa").list();

		for (Object[] object : list) {

			try {
				Pessoa pessoaBuscaG = new Pessoa();

				if (object[0] != null) {
					pessoaBuscaG.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					pessoaBuscaG.setNome((String) object[1]);

				}

				if (object[2] != null) {
					pessoaBuscaG.setCidade((String) object[2]);

				}

				if (object[3] != null) {
					pessoaBuscaG.setBairro((String) object[3]);

				}

				if (object[4] != null) {
					pessoaBuscaG.setCpfCNPJ((String) object[4]);

				}

				if (object[5] != null) {
					pessoaBuscaG.setTelefone((String) object[5]);

				}

				if (object[6] != null) {
					pessoaBuscaG.setEmail((String) object[6]);

				}

				if (object[7] != null) {
					pessoaBuscaG.setTipoPessoa((String) object[7]);

				}

				pessoasBuscaG.add(pessoaBuscaG);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.getStackTrace();
			}

		}

		return pessoasBuscaG;
	}
	
	public List<Pessoa> buscaEspecifica(String pesquisa) {

		List<Pessoa> pessoasBuscaE = new ArrayList<>();

		Session session;
		session = (Session) em.getDelegate();

		pesquisa = "%" + pesquisa + "%";
		
		@SuppressWarnings("unchecked")
		List<Object[]> list = session.createNativeQuery("select * from hc_commerce.hc_pessoa  where nome like :pesquisa " + 
				"or replace(replace(replace(cpf_cnpj, '.',''), '-', ''), '/','') like :pesquisa " + 
				"or replace(replace(replace(telefone,'(',''),')',''),'-','')  like :pesquisa ")
		.setParameter("pesquisa", pesquisa)
		.list();

		for (Object[] object : list) {

			try {
				Pessoa pessoaBuscaE = new Pessoa();

				if (object[0] != null) {
					pessoaBuscaE.setId((Integer) object[0]);

				}
				if (object[1] != null) {
					pessoaBuscaE.setNome((String) object[1]);

				}

				if (object[2] != null) {
					pessoaBuscaE.setCidade((String) object[2]);

				}

				if (object[3] != null) {
					pessoaBuscaE.setBairro((String) object[3]);

				}

				if (object[4] != null) {
					pessoaBuscaE.setCpfCNPJ((String) object[4]);

				}

				if (object[5] != null) {
					pessoaBuscaE.setTelefone((String) object[5]);

				}

				if (object[6] != null) {
					pessoaBuscaE.setEmail((String) object[6]);

				}

				if (object[7] != null) {
					pessoaBuscaE.setTipoPessoa((String) object[7]);

				}

				pessoasBuscaE.add(pessoaBuscaE);
			}

			catch (Exception e) {
				System.out.println("Erro na nativeQuery");
				e.getStackTrace();
			}

		}

		return pessoasBuscaE;
	}
}
