//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for VerificaAutoResidencialVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="VerificaAutoResidencialVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdTipoSistema" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdUsoVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtCalculo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtFimVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtInicioVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flNovaTarifa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flSeguroCorretor" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flTipoPessoa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "VerificaAutoResidencialVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdTipoSistema",
    "cdUsoVeiculo",
    "cdVeiculo",
    "dtCalculo",
    "dtFimVigencia",
    "dtInicioVigencia",
    "flNovaTarifa",
    "flSeguroCorretor",
    "flTipoPessoa"
})
public class VerificaAutoResidencialVo {

    protected Integer cdTipoSistema;
    protected Integer cdUsoVeiculo;
    protected Integer cdVeiculo;
    protected String dtCalculo;
    protected String dtFimVigencia;
    protected String dtInicioVigencia;
    protected String flNovaTarifa;
    protected String flSeguroCorretor;
    protected String flTipoPessoa;

    /**
     * Gets the value of the cdTipoSistema property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdTipoSistema() {
        return cdTipoSistema;
    }

    /**
     * Sets the value of the cdTipoSistema property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdTipoSistema(Integer value) {
        this.cdTipoSistema = value;
    }

    /**
     * Gets the value of the cdUsoVeiculo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdUsoVeiculo() {
        return cdUsoVeiculo;
    }

    /**
     * Sets the value of the cdUsoVeiculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdUsoVeiculo(Integer value) {
        this.cdUsoVeiculo = value;
    }

    /**
     * Gets the value of the cdVeiculo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdVeiculo() {
        return cdVeiculo;
    }

    /**
     * Sets the value of the cdVeiculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdVeiculo(Integer value) {
        this.cdVeiculo = value;
    }

    /**
     * Gets the value of the dtCalculo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtCalculo() {
        return dtCalculo;
    }

    /**
     * Sets the value of the dtCalculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtCalculo(String value) {
        this.dtCalculo = value;
    }

    /**
     * Gets the value of the dtFimVigencia property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtFimVigencia() {
        return dtFimVigencia;
    }

    /**
     * Sets the value of the dtFimVigencia property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtFimVigencia(String value) {
        this.dtFimVigencia = value;
    }

    /**
     * Gets the value of the dtInicioVigencia property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtInicioVigencia() {
        return dtInicioVigencia;
    }

    /**
     * Sets the value of the dtInicioVigencia property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtInicioVigencia(String value) {
        this.dtInicioVigencia = value;
    }

    /**
     * Gets the value of the flNovaTarifa property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlNovaTarifa() {
        return flNovaTarifa;
    }

    /**
     * Sets the value of the flNovaTarifa property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlNovaTarifa(String value) {
        this.flNovaTarifa = value;
    }

    /**
     * Gets the value of the flSeguroCorretor property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlSeguroCorretor() {
        return flSeguroCorretor;
    }

    /**
     * Sets the value of the flSeguroCorretor property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlSeguroCorretor(String value) {
        this.flSeguroCorretor = value;
    }

    /**
     * Gets the value of the flTipoPessoa property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlTipoPessoa() {
        return flTipoPessoa;
    }

    /**
     * Sets the value of the flTipoPessoa property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlTipoPessoa(String value) {
        this.flTipoPessoa = value;
    }

}