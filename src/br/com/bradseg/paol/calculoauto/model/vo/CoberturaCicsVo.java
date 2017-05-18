//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CoberturaCicsVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CoberturaCicsVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdGrupoCobertura" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dsGrupoCobertura" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="prmLiquidoCobertura" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmTarifaCobertura" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="tipoCobertura" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="vlCobertura" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquiaCobertura" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CoberturaCicsVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdGrupoCobertura",
    "dsGrupoCobertura",
    "prmLiquidoCobertura",
    "prmTarifaCobertura",
    "tipoCobertura",
    "vlCobertura",
    "vlFranquiaCobertura"
})
public class CoberturaCicsVo {

    protected Integer cdGrupoCobertura;
    protected String dsGrupoCobertura;
    protected Double prmLiquidoCobertura;
    protected Double prmTarifaCobertura;
    protected String tipoCobertura;
    protected Double vlCobertura;
    protected Double vlFranquiaCobertura;

    /**
     * Gets the value of the cdGrupoCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdGrupoCobertura() {
        return cdGrupoCobertura;
    }

    /**
     * Sets the value of the cdGrupoCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdGrupoCobertura(Integer value) {
        this.cdGrupoCobertura = value;
    }

    /**
     * Gets the value of the dsGrupoCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsGrupoCobertura() {
        return dsGrupoCobertura;
    }

    /**
     * Sets the value of the dsGrupoCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsGrupoCobertura(String value) {
        this.dsGrupoCobertura = value;
    }

    /**
     * Gets the value of the prmLiquidoCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmLiquidoCobertura() {
        return prmLiquidoCobertura;
    }

    /**
     * Sets the value of the prmLiquidoCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmLiquidoCobertura(Double value) {
        this.prmLiquidoCobertura = value;
    }

    /**
     * Gets the value of the prmTarifaCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmTarifaCobertura() {
        return prmTarifaCobertura;
    }

    /**
     * Sets the value of the prmTarifaCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmTarifaCobertura(Double value) {
        this.prmTarifaCobertura = value;
    }

    /**
     * Gets the value of the tipoCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoCobertura() {
        return tipoCobertura;
    }

    /**
     * Sets the value of the tipoCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoCobertura(String value) {
        this.tipoCobertura = value;
    }

    /**
     * Gets the value of the vlCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlCobertura() {
        return vlCobertura;
    }

    /**
     * Sets the value of the vlCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlCobertura(Double value) {
        this.vlCobertura = value;
    }

    /**
     * Gets the value of the vlFranquiaCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquiaCobertura() {
        return vlFranquiaCobertura;
    }

    /**
     * Sets the value of the vlFranquiaCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquiaCobertura(Double value) {
        this.vlFranquiaCobertura = value;
    }

}
