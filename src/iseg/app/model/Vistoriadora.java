package iseg.app.model;

import static javax.persistence.FetchType.LAZY;
import static javax.persistence.InheritanceType.JOINED;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@Inheritance(strategy=JOINED) 
@NamedQueries({
	@NamedQuery(name="getCountVistoriadora", query="SELECT Count(*) FROM Vistoriadora s"),
	@NamedQuery(name="getVistoriadora", query="SELECT s FROM Vistoriadora s ORDER BY s.nome"),
	@NamedQuery(name="getVistoriadoraByRazaoSocial", query = "SELECT s FROM Vistoriadora s WHERE s.razaoSocial = :razaoSocial ORDER BY s.nome"),
	@NamedQuery(name="getVistoriadoraOrdered", query = "SELECT s FROM Vistoriadora s ORDER BY s.nome"),
	@NamedQuery(name="getVistoriadoraByCpfOuCnpj", query = "SELECT s FROM Vistoriadora s WHERE s.cpfOuCnpj = :cpfOuCnpj ORDER BY s.nome"),
	@NamedQuery(name="getVistoriadoraByNome", query = "SELECT s FROM Vistoriadora s WHERE s.nome = :nome ORDER BY s.nome")})
public class Vistoriadora extends PessoaJuridica implements Serializable {

	@OneToMany(mappedBy="vistoriadora", fetch = LAZY)
	private List<VistoriadoraSeguradora> vistoriadoraSeguradoraCollection = new ArrayList<VistoriadoraSeguradora>();

	@OneToMany(mappedBy="vistoriadora", fetch = LAZY)
	private List<Proposta> propostaVistoriadoraCollection = new ArrayList<Proposta>();

	private static final long serialVersionUID = 1L;

	public Vistoriadora() {
		super();
	}

	public List<VistoriadoraSeguradora> getVistoriadoraSeguradoraCollection() {
		return this.vistoriadoraSeguradoraCollection;
	}

	public void setVistoriadoraSeguradoraCollection(List<VistoriadoraSeguradora> vistoriadoraSeguradoraCollection) {
		this.vistoriadoraSeguradoraCollection = vistoriadoraSeguradoraCollection;
	}

	public List<Proposta> getPropostaVistoriadoraCollection() {
		return propostaVistoriadoraCollection;
	}

	public void setPropostaVistoriadoraCollection(List<Proposta> propostaVistoriadoraCollection) {
		this.propostaVistoriadoraCollection = propostaVistoriadoraCollection;
	}
}