package models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "hc_commerce.hc_produto")
public class Produto implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "nome")
	private String nome;

	@Column(name = "und_venda")
	private String undVenda;

	@Column(name = "preco_custo")
	private Double precoCusto;

	@Column(name = "preco_venda")
	private Double precoVenda;

	@Column(name = "margem_lucro")
	private Double margemLucro;

	@Column(name = "quantidade")
	private Double quantidade;

	public Produto() {

	}

	public Produto(String nome, String undVenda, Double precoCusto, Double precoVenda, Double margemLucro,
			Double quantidade) {
		this.nome = nome;
		this.undVenda = undVenda;
		this.precoCusto = precoCusto;
		this.precoVenda = precoVenda;
		this.margemLucro = margemLucro;
		this.quantidade = quantidade;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer identf) {
		this.id = identf;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getUndVenda() {
		return undVenda;
	}

	public void setUndVenda(String undVenda) {
		this.undVenda = undVenda;
	}

	public Double getPrecoCusto() {
		return precoCusto;
	}

	public void setPrecoCusto(Double precoCusto) {
		this.precoCusto = precoCusto;
	}

	public Double getPrecoVenda() {
		return precoVenda;
	}

	public void setPrecoVenda(Double precoVenda) {
		this.precoVenda = precoVenda;
	}

	public Double getMargemLucro() {
		return margemLucro;
	}

	public void setMargemLucro(Double margenLucro) {
		this.margemLucro = margenLucro;
	}

	public Double getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Double quantidade) {
		this.quantidade = quantidade;
	}

	@Override
	public String toString() {
		return "Produto [id=" + id + ", nome=" + nome + ", undVenda=" + undVenda + ", precoCusto=" + precoCusto
				+ ", precoVenda=" + precoVenda + ", margenLucro=" + margemLucro + ", quantidade=" + quantidade + "]";
	}

}
