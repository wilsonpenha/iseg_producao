package iseg.app.model;

public class SessionLog {
	
	private String usuarioId;
	private String sessionId;
	private long horaLogin;
	private long ultimoRequest;
	private Long corretoraId;
	private Long assessoriaId;
	private String queryStr;
	
	public String getUsuarioId() {
		return usuarioId;
	}
	public void setUsuarioId(String usuarioId) {
		this.usuarioId = usuarioId;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public long getHoraLogin() {
		return horaLogin;
	}
	public void setHoraLogin(long horaLogin) {
		this.horaLogin = horaLogin;
	}
	public long getUltimoRequest() {
		return ultimoRequest;
	}
	public void setUltimoRequest(long ultimoRequest) {
		this.ultimoRequest = ultimoRequest;
	}
	public Long getCorretoraId() {
		return corretoraId;
	}
	public void setCorretoraId(Long corretoraId) {
		this.corretoraId = corretoraId;
	}
	public Long getAssessoriaId() {
		return assessoriaId;
	}
	public void setAssessoriaId(Long assessoriaId) {
		this.assessoriaId = assessoriaId;
	}
	public String getQueryStr() {
		return queryStr;
	}
	public void setQueryStr(String queryStr) {
		this.queryStr = queryStr;
	}

}
