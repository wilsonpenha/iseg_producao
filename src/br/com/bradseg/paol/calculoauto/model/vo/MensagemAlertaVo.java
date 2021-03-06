//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MensagemAlertaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="MensagemAlertaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdAlerta" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dsAlerta" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtCancelamento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtLiberacao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flAcatavel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flImpacto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MensagemAlertaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdAlerta",
    "dsAlerta",
    "dtCancelamento",
    "dtLiberacao",
    "flAcatavel",
    "flImpacto"
})
public class MensagemAlertaVo {

    protected Integer cdAlerta;
    protected String dsAlerta;
    protected String dtCancelamento;
    protected String dtLiberacao;
    protected String flAcatavel;
    protected String flImpacto;

    /**
     * Gets the value of the cdAlerta property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdAlerta() {
        return cdAlerta;
    }

    /**
     * Sets the value of the cdAlerta property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdAlerta(Integer value) {
        this.cdAlerta = value;
    }

    /**
     * Gets the value of the dsAlerta property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsAlerta() {
        return dsAlerta;
    }

    /**
     * Sets the value of the dsAlerta property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsAlerta(String value) {
        this.dsAlerta = value;
    }

    /**
     * Gets the value of the dtCancelamento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtCancelamento() {
        return dtCancelamento;
    }

    /**
     * Sets the value of the dtCancelamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtCancelamento(String value) {
        this.dtCancelamento = value;
    }

    /**
     * Gets the value of the dtLiberacao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtLiberacao() {
        return dtLiberacao;
    }

    /**
     * Sets the value of the dtLiberacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtLiberacao(String value) {
        this.dtLiberacao = value;
    }

    /**
     * Gets the value of the flAcatavel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlAcatavel() {
        return flAcatavel;
    }

    /**
     * Sets the value of the flAcatavel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlAcatavel(String value) {
        this.flAcatavel = value;
    }

    /**
     * Gets the value of the flImpacto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlImpacto() {
        return flImpacto;
    }

    /**
     * Sets the value of the flImpacto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlImpacto(String value) {
        this.flImpacto = value;
    }

}
