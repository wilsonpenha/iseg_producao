package iseg.app.model;

import iseg.app.persistence.PObject;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="automovel_orc_acessorios")
@SequenceGenerator(name="seq_automovel_orc_acessorios", sequenceName = "seq_automovel_orc_acessorios")
@NamedQueries({
	@NamedQuery(name="getAutomovelOrcAcessorios", query="SELECT a FROM AutomovelOrcAcessorios a"),
	@NamedQuery(name="getCountAutomovelOrcAcessorios", query="SELECT Count(*) FROM AutomovelOrcAcessorios a"),
	@NamedQuery(name="deleteAutomovelOrcAcessoriosByAutomovelOrcamento", query="DELETE FROM AutomovelOrcAcessorios a WHERE a.automovelOrcamento.id = ?0")
})
public class AutomovelOrcAcessorios extends PObject implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "seq_automovel_orc_acessorios")
	private Long id;

	@ManyToOne
	@JoinColumn(name="acessorio_id")
	private Acessorios acessorio;

	@ManyToOne
	@JoinColumn(name="automovel_orcamento_id")
	private AutomovelOrcamento automovelOrcamento;

	private static final long serialVersionUID = 1L;

	public AutomovelOrcAcessorios() {
		super();
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Acessorios getAcessorio() {
		return this.acessorio;
	}

	public void setAcessorio(Acessorios acessorio) {
		this.acessorio = acessorio;
	}

	public AutomovelOrcamento getAutomovelOrcamento() {
		return this.automovelOrcamento;
	}

	public void setAutomovelOrcamento(AutomovelOrcamento automovelOrcamento) {
		this.automovelOrcamento = automovelOrcamento;
	}

}
