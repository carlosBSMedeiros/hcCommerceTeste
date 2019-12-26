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
@Table(name = "hc_commerce.hc_pessoa")
public class Pessoa implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "nome")
	private String nome;

	@Column(name = "tipo_pessoa")
	private String tipoPessoa;

	@Column(name = "cidade")
	private String cidade;

	@Column(name = "bairro")
	private String bairro;

	@Column(name = "cpf_cnpj")
	private String cpfCNPJ;

	@Column(name = "telefone")
	private String telefone;

	@Column(name = "email")
	private String email;

	// construtor padrão
	public Pessoa() {

	}

	// construtor com email
	public Pessoa(String nome, String tipoPessoa, String cidade, String bairro, String cpfCNPJ, String telefone,
			String email) {

		this.nome = nome;
		this.tipoPessoa = tipoPessoa;
		this.cidade = cidade;
		this.bairro = bairro;
		this.cpfCNPJ = cpfCNPJ;
		this.telefone = telefone;
		this.email = email;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer identif) {
		this.id = identif;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(String tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCpfCNPJ() {
		return cpfCNPJ;
	}

	public void setCpfCNPJ(String cpfCNPJ) {
		this.cpfCNPJ = cpfCNPJ;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Pessoa [id=" + id + ", nome=" + nome + ", tipoPessoa=" + tipoPessoa + ", cidade=" + cidade
				+ ", bairro=" + bairro + ", cpfCNPJ=" + cpfCNPJ + ", telefone=" + telefone + ", email=" + email + "]";
	}

}
