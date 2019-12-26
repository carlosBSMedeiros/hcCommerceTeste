package metodos;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidaForms {
	static ArrayList<String> listaErros = new ArrayList<String>();

	public ArrayList<String> validarFormularioPessoa(String nome, String email, String cpfCnpj, String telefone) {

		validaVazio("Nome", nome);
		
		if(validaVazio("Email", email)){
			validaEmail(email);
		}
		
		if(validaVazio("CPF CNPJ", cpfCnpj)) {
			validaCpfCnpj(cpfCnpj);
		}

		return listaErros;
	}

	public ArrayList<String> validarFormularioProduto(String nome, String precoCusto, String precoVenda,
			String margemLucro, String quantidadade) {

		validaVazio("Nome", nome);
		
//		if(validaVazio("Preço de custo", precoCusto)){
//			validaValores("Preço de custo", precoCusto);
//
//		}
//		
//		
//		if(validaVazio("Preço de venda", precoVenda)) {
//			validaValores("Preço de venda", precoVenda);
//
//		}
//		
//		
//		if(validaVazio("Margem de lucro", margemLucro)) {
//			validaMargemLucro(margemLucro);
//
//		}
//		
//		if(validaVazio("Quantidade Inicial", quantidadade)) {
//			validaQuantidadeInicial(quantidadade);
//		}
		
		validaVazio("Preço de custo", precoCusto);
		validaVazio("Preço de venda", precoVenda);
		validaVazio("Margem de lucro", margemLucro);
		validaVazio("Quantidade Inicial", quantidadade);
			
		
		
		return listaErros;
	}

	// campos vazios
	public boolean validaVazio(String nomeForm, String conteudoForm) {
		boolean preenchido = true;
		conteudoForm.trim();
		if (conteudoForm.isEmpty()) {
			listaErros.add("O campo " + nomeForm + " deve ser preenchido");
			preenchido = false;
		}
		
		return preenchido;
	}

	// CPF ou CNPJ

	public void validaCpfCnpj(String cpfCnpjForm) {
		if (regexCpfCnpj(cpfCnpjForm) == false) {
			listaErros.add("O CPF ou CNPJ inserido é inválido");
		}
	}

	public static boolean regexCpfCnpj(String cpfCnpjForm) {
		boolean isCpfCnpjIdValid = false;
		if (cpfCnpjForm != null && cpfCnpjForm.length() > 0) {
			String expression = "(^\\d{3}\\.\\d{3}\\.\\d{3}\\-\\d{2}$)|(^\\d{2}\\.\\d{3}\\.\\d{3}\\/\\d{4}\\-\\d{2}$)";
			Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(cpfCnpjForm);
			if (matcher.matches()) {
				isCpfCnpjIdValid = true;
			}
		}
		return isCpfCnpjIdValid;
	}

	// email

	public void validaEmail(String emailForm) {
		if (regexEmail(emailForm) == false) {
			listaErros.add("O Email inserido é inválido");
		}
	}

	public static boolean regexEmail(String email) {
		boolean isEmailIdValid = false;
		if (email != null && email.length() > 0) {
			String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
			Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(email);
			if (matcher.matches()) {
				isEmailIdValid = true;
			}
		}
		return isEmailIdValid;
	}

	// Produto

	// preço custo e venda

	public void validaValores(String nomeCampo, String valorStr) {
		if (regexValores(valorStr) == false) {
			listaErros.add("O valor do campo " + nomeCampo + " não é válido");
		}
	}

	public static boolean regexValores(String valor) {
		boolean valorValido = false;
		valor.replace("R", "");
		valor.replace("$", "");
		valor.replace(",", "");
		valor.replace(".", "");
		if (valor != null && valor.length() > 0 ) {
			String expression = "^\\d*.\\d*$";
			Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(valor);
			if (matcher.matches()) {
				valorValido = true;
			}
		}
		return valorValido;
	}

	// margem lucro

	public void validaMargemLucro(String margemLucro) {
		if (regexMargemLucro(margemLucro) == false) {
			listaErros.add("O valor do campo Margem de lucro é inválido");
		}
	}

	public static boolean regexMargemLucro(String margemLucro) {
		boolean margemValida = false;
		margemLucro.trim().replace("%", "");
		if (margemLucro != null && margemLucro.length() > 0 && Double.parseDouble(margemLucro) > 0) {
			String expression = "^\\d*$";
			Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
			Matcher matcher = pattern.matcher(margemLucro);
			if (matcher.matches()) {
				margemValida = true;
			}
		}
		return margemValida;
	}

	// quantidade inicial

	public void validaQuantidadeInicial(String quantidadeStr) {
		if (quantidadeStr.isEmpty()) {
			listaErros.add("O campo quantidade inicial não pode ter valor nulo nem negativo");
		} else {
			double quantidade = Double.parseDouble(quantidadeStr);
			if (quantidade <= 0) {
				listaErros.add("O campo quantidade inicial não pode ter valor nulo nem negativo");
			}
		}
	}
	


//	public String removePontVirgPct(String valor) {
//		
//		 return valor.replace(",", "").replace(".", "").replace("%", "").trim();
//		
//		
//	}
}
