//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EVerificaTarifaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="EVerificaTarifaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cepRisco" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtCalculo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtInicioVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EVerificaTarifaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdVeiculo",
    "cepRisco",
    "dtCalculo",
    "dtInicioVigencia"
})
public class EVerificaTarifaVo {

    protected Integer cdVeiculo;
    protected String cepRisco;
    protected String dtCalculo;
    protected String dtInicioVigencia;

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
     * Gets the value of the cepRisco property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCepRisco() {
        return cepRisco;
    }

    /**
     * Sets the value of the cepRisco property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCepRisco(String value) {
        this.cepRisco = value;
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

}