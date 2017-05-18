//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EPessoaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="EPessoaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="EEnderecoVoCobranca" type="{http://vo.model.calculoauto.paol.bradseg.com.br}EEnderecoVo" minOccurs="0"/>
 *         &lt;element name="EEnderecoVoRisco" type="{http://vo.model.calculoauto.paol.bradseg.com.br}EEnderecoVo" minOccurs="0"/>
 *         &lt;element name="ETelefoneVoCelular" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ETelefoneVo" minOccurs="0"/>
 *         &lt;element name="ETelefoneVoComercial" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ETelefoneVo" minOccurs="0"/>
 *         &lt;element name="ETelefoneVoResidencial" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ETelefoneVo" minOccurs="0"/>
 *         &lt;element name="cdAtividadePrincipal" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdCpfCnpj" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cdFaixaRenda" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdTipoPessoa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nmPessoa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EPessoaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "eEnderecoVoCobranca",
    "eEnderecoVoRisco",
    "eTelefoneVoCelular",
    "eTelefoneVoComercial",
    "eTelefoneVoResidencial",
    "cdAtividadePrincipal",
    "cdCpfCnpj",
    "cdFaixaRenda",
    "cdTipoPessoa",
    "nmPessoa"
})
public class EPessoaVo {

    @XmlElement(name = "EEnderecoVoCobranca")
    protected EEnderecoVo eEnderecoVoCobranca;
    @XmlElement(name = "EEnderecoVoRisco")
    protected EEnderecoVo eEnderecoVoRisco;
    @XmlElement(name = "ETelefoneVoCelular")
    protected ETelefoneVo eTelefoneVoCelular;
    @XmlElement(name = "ETelefoneVoComercial")
    protected ETelefoneVo eTelefoneVoComercial;
    @XmlElement(name = "ETelefoneVoResidencial")
    protected ETelefoneVo eTelefoneVoResidencial;
    protected Integer cdAtividadePrincipal;
    protected String cdCpfCnpj;
    protected Integer cdFaixaRenda;
    protected String cdTipoPessoa;
    protected String nmPessoa;

    /**
     * Gets the value of the eEnderecoVoCobranca property.
     * 
     * @return
     *     possible object is
     *     {@link EEnderecoVo }
     *     
     */
    public EEnderecoVo getEEnderecoVoCobranca() {
        return eEnderecoVoCobranca;
    }

    /**
     * Sets the value of the eEnderecoVoCobranca property.
     * 
     * @param value
     *     allowed object is
     *     {@link EEnderecoVo }
     *     
     */
    public void setEEnderecoVoCobranca(EEnderecoVo value) {
        this.eEnderecoVoCobranca = value;
    }

    /**
     * Gets the value of the eEnderecoVoRisco property.
     * 
     * @return
     *     possible object is
     *     {@link EEnderecoVo }
     *     
     */
    public EEnderecoVo getEEnderecoVoRisco() {
        return eEnderecoVoRisco;
    }

    /**
     * Sets the value of the eEnderecoVoRisco property.
     * 
     * @param value
     *     allowed object is
     *     {@link EEnderecoVo }
     *     
     */
    public void setEEnderecoVoRisco(EEnderecoVo value) {
        this.eEnderecoVoRisco = value;
    }

    /**
     * Gets the value of the eTelefoneVoCelular property.
     * 
     * @return
     *     possible object is
     *     {@link ETelefoneVo }
     *     
     */
    public ETelefoneVo getETelefoneVoCelular() {
        return eTelefoneVoCelular;
    }

    /**
     * Sets the value of the eTelefoneVoCelular property.
     * 
     * @param value
     *     allowed object is
     *     {@link ETelefoneVo }
     *     
     */
    public void setETelefoneVoCelular(ETelefoneVo value) {
        this.eTelefoneVoCelular = value;
    }

    /**
     * Gets the value of the eTelefoneVoComercial property.
     * 
     * @return
     *     possible object is
     *     {@link ETelefoneVo }
     *     
     */
    public ETelefoneVo getETelefoneVoComercial() {
        return eTelefoneVoComercial;
    }

    /**
     * Sets the value of the eTelefoneVoComercial property.
     * 
     * @param value
     *     allowed object is
     *     {@link ETelefoneVo }
     *     
     */
    public void setETelefoneVoComercial(ETelefoneVo value) {
        this.eTelefoneVoComercial = value;
    }

    /**
     * Gets the value of the eTelefoneVoResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link ETelefoneVo }
     *     
     */
    public ETelefoneVo getETelefoneVoResidencial() {
        return eTelefoneVoResidencial;
    }

    /**
     * Sets the value of the eTelefoneVoResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link ETelefoneVo }
     *     
     */
    public void setETelefoneVoResidencial(ETelefoneVo value) {
        this.eTelefoneVoResidencial = value;
    }

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
     *     {@link String }
     *     
     */
    public String getCdTipoPessoa() {
        return cdTipoPessoa;
    }

    /**
     * Sets the value of the cdTipoPessoa property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdTipoPessoa(String value) {
        this.cdTipoPessoa = value;
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

}