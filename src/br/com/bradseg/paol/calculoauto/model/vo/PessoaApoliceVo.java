//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PessoaApoliceVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="PessoaApoliceVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdAtividadePrincipal" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdCpfCnpj" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cdFaixaRenda" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdTipoPessoa" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="enderecoApoliceCobrancaVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}EnderecoApoliceVo" minOccurs="0"/>
 *         &lt;element name="enderecoApoliceRiscoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}EnderecoApoliceVo" minOccurs="0"/>
 *         &lt;element name="nmPessoa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="telefoneApoliceVoCel" type="{http://vo.model.calculoauto.paol.bradseg.com.br}TelefoneApoliceVo" minOccurs="0"/>
 *         &lt;element name="telefoneApoliceVoCom" type="{http://vo.model.calculoauto.paol.bradseg.com.br}TelefoneApoliceVo" minOccurs="0"/>
 *         &lt;element name="telefoneApoliceVoRes" type="{http://vo.model.calculoauto.paol.bradseg.com.br}TelefoneApoliceVo" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PessoaApoliceVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdAtividadePrincipal",
    "cdCpfCnpj",
    "cdFaixaRenda",
    "cdTipoPessoa",
    "enderecoApoliceCobrancaVo",
    "enderecoApoliceRiscoVo",
    "nmPessoa",
    "telefoneApoliceVoCel",
    "telefoneApoliceVoCom",
    "telefoneApoliceVoRes"
})
public class PessoaApoliceVo {

    protected Integer cdAtividadePrincipal;
    protected String cdCpfCnpj;
    protected Integer cdFaixaRenda;
    protected Integer cdTipoPessoa;
    protected EnderecoApoliceVo enderecoApoliceCobrancaVo;
    protected EnderecoApoliceVo enderecoApoliceRiscoVo;
    protected String nmPessoa;
    protected TelefoneApoliceVo telefoneApoliceVoCel;
    protected TelefoneApoliceVo telefoneApoliceVoCom;
    protected TelefoneApoliceVo telefoneApoliceVoRes;

    /**
     * Gets the value of the cdAtividadePrincipal property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdAtividadePrincipal() {
        return cdAtividadePrincipal;
    }

    /**
     * Sets the value of the cdAtividadePrincipal property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdAtividadePrincipal(Integer value) {
        this.cdAtividadePrincipal = value;
    }

    /**
     * Gets the value of the cdCpfCnpj property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdCpfCnpj() {
        return cdCpfCnpj;
    }

    /**
     * Sets the value of the cdCpfCnpj property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdCpfCnpj(String value) {
        this.cdCpfCnpj = value;
    }

    /**
     * Gets the value of the cdFaixaRenda property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdFaixaRenda() {
        return cdFaixaRenda;
    }

    /**
     * Sets the value of the cdFaixaRenda property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdFaixaRenda(Integer value) {
        this.cdFaixaRenda = value;
    }

    /**
     * Gets the value of the cdTipoPessoa property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdTipoPessoa() {
        return cdTipoPessoa;
    }

    /**
     * Sets the value of the cdTipoPessoa property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdTipoPessoa(Integer value) {
        this.cdTipoPessoa = value;
    }

    /**
     * Gets the value of the enderecoApoliceCobrancaVo property.
     * 
     * @return
     *     possible object is
     *     {@link EnderecoApoliceVo }
     *     
     */
    public EnderecoApoliceVo getEnderecoApoliceCobrancaVo() {
        return enderecoApoliceCobrancaVo;
    }

    /**
     * Sets the value of the enderecoApoliceCobrancaVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link EnderecoApoliceVo }
     *     
     */
    public void setEnderecoApoliceCobrancaVo(EnderecoApoliceVo value) {
        this.enderecoApoliceCobrancaVo = value;
    }

    /**
     * Gets the value of the enderecoApoliceRiscoVo property.
     * 
     * @return
     *     possible object is
     *     {@link EnderecoApoliceVo }
     *     
     */
    public EnderecoApoliceVo getEnderecoApoliceRiscoVo() {
        return enderecoApoliceRiscoVo;
    }

    /**
     * Sets the value of the enderecoApoliceRiscoVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link EnderecoApoliceVo }
     *     
     */
    public void setEnderecoApoliceRiscoVo(EnderecoApoliceVo value) {
        this.enderecoApoliceRiscoVo = value;
    }

    /**
     * Gets the value of the nmPessoa property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNmPessoa() {
        return nmPessoa;
    }

    /**
     * Sets the value of the nmPessoa property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNmPessoa(String value) {
        this.nmPessoa = value;
    }

    /**
     * Gets the value of the telefoneApoliceVoCel property.
     * 
     * @return
     *     possible object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public TelefoneApoliceVo getTelefoneApoliceVoCel() {
        return telefoneApoliceVoCel;
    }

    /**
     * Sets the value of the telefoneApoliceVoCel property.
     * 
     * @param value
     *     allowed object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public void setTelefoneApoliceVoCel(TelefoneApoliceVo value) {
        this.telefoneApoliceVoCel = value;
    }

    /**
     * Gets the value of the telefoneApoliceVoCom property.
     * 
     * @return
     *     possible object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public TelefoneApoliceVo getTelefoneApoliceVoCom() {
        return telefoneApoliceVoCom;
    }

    /**
     * Sets the value of the telefoneApoliceVoCom property.
     * 
     * @param value
     *     allowed object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public void setTelefoneApoliceVoCom(TelefoneApoliceVo value) {
        this.telefoneApoliceVoCom = value;
    }

    /**
     * Gets the value of the telefoneApoliceVoRes property.
     * 
     * @return
     *     possible object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public TelefoneApoliceVo getTelefoneApoliceVoRes() {
        return telefoneApoliceVoRes;
    }

    /**
     * Sets the value of the telefoneApoliceVoRes property.
     * 
     * @param value
     *     allowed object is
     *     {@link TelefoneApoliceVo }
     *     
     */
    public void setTelefoneApoliceVoRes(TelefoneApoliceVo value) {
        this.telefoneApoliceVoRes = value;
    }

}