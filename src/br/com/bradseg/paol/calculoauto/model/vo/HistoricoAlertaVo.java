//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for HistoricoAlertaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="HistoricoAlertaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdAlerta" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdUserLiber" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dsAlerta" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dsImpacto" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtCancel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtLiberacao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="hrLiberacao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="stAcatavel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "HistoricoAlertaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdAlerta",
    "cdUserLiber",
    "dsAlerta",
    "dsImpacto",
    "dtCancel",
    "dtLiberacao",
    "hrLiberacao",
    "stAcatavel"
})
public class HistoricoAlertaVo {

    protected Integer cdAlerta;
    protected String cdUserLiber;
    protected String dsAlerta;
    protected String dsImpacto;
    protected String dtCancel;
    protected String dtLiberacao;
    protected String hrLiberacao;
    protected String stAcatavel;

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
     * Gets the value of the cdUserLiber property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdUserLiber() {
        return cdUserLiber;
    }

    /**
     * Sets the value of the cdUserLiber property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdUserLiber(String value) {
        this.cdUserLiber = value;
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
     * Gets the value of the dsImpacto property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsImpacto() {
        return dsImpacto;
    }

    /**
     * Sets the value of the dsImpacto property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsImpacto(String value) {
        this.dsImpacto = value;
    }

    /**
     * Gets the value of the dtCancel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtCancel() {
        return dtCancel;
    }

    /**
     * Sets the value of the dtCancel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtCancel(String value) {
        this.dtCancel = value;
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
     * Gets the value of the hrLiberacao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHrLiberacao() {
        return hrLiberacao;
    }

    /**
     * Sets the value of the hrLiberacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHrLiberacao(String value) {
        this.hrLiberacao = value;
    }

    /**
     * Gets the value of the stAcatavel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStAcatavel() {
        return stAcatavel;
    }

    /**
     * Sets the value of the stAcatavel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStAcatavel(String value) {
        this.stAcatavel = value;
    }

}