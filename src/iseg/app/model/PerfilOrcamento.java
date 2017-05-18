package iseg.app.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="perfil_orcamento")
@SequenceGenerator(name="seq_perfil_orcamento", sequenceName = "seq_perfil_orcamento")
@NamedQueries({
	@NamedQuery(name="getPerfilOrcamento", query="SELECT a FROM PerfilOrcamento a")
})
public class PerfilOrcamento extends PerfilSeguro implements Serializable{
	
	private static final long serialVersionUID = -7376615956591493703L;

	@ManyToOne
	@JoinColumn(name="orcamento_seguro_id")
	private OrcamentoSeguro orcamentoSeguro; 
	
	public OrcamentoSeguro getOrcamentoSeguro() {
		return orcamentoSeguro;
	}

	public void setOrcamentoSeguro(OrcamentoSeguro orcamentoSeguro) {
		this.orcamentoSeguro = orcamentoSeguro;
	}
}
