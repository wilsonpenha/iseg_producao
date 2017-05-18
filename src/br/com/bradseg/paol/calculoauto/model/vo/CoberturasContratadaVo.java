//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CoberturasContratadaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CoberturasContratadaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="listaValoresApp" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfValoresCoberturaVo" minOccurs="0"/>
 *         &lt;element name="listaValoresAuto" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfValoresCoberturaVo" minOccurs="0"/>
 *         &lt;element name="listaValoresRcf" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfValoresCoberturaVo" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioLiquidoAci" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioLiquidoAuto" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioLiquidoRcf" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioTarifaAci" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioTarifaAuto" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalPremioTarifaRcf" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CoberturasContratadaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "listaValoresApp",
    "listaValoresAuto",
    "listaValoresRcf",
    "vlTotalPremioLiquidoAci",
    "vlTotalPremioLiquidoAuto",
    "vlTotalPremioLiquidoRcf",
    "vlTotalPremioTarifaAci",
    "vlTotalPremioTarifaAuto",
    "vlTotalPremioTarifaRcf"
})
public class CoberturasContratadaVo {

    protected ArrayOfValoresCoberturaVo listaValoresApp;
    protected ArrayOfValoresCoberturaVo listaValoresAuto;
    protected ArrayOfValoresCoberturaVo listaValoresRcf;
    protected Double vlTotalPremioLiquidoAci;
    protected Double vlTotalPremioLiquidoAuto;
    protected Double vlTotalPremioLiquidoRcf;
    protected Double vlTotalPremioTarifaAci;
    protected Double vlTotalPremioTarifaAuto;
    protected Double vlTotalPremioTarifaRcf;

    /**
     * Gets the value of the listaValoresApp property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public ArrayOfValoresCoberturaVo getListaValoresApp() {
        return listaValoresApp;
    }

    /**
     * Sets the value of the listaValoresApp property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public void setListaValoresApp(ArrayOfValoresCoberturaVo value) {
        this.listaValoresApp = value;
    }

    /**
     * Gets the value of the listaValoresAuto property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public ArrayOfValoresCoberturaVo getListaValoresAuto() {
        return listaValoresAuto;
    }

    /**
     * Sets the value of the listaValoresAuto property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public void setListaValoresAuto(ArrayOfValoresCoberturaVo value) {
        this.listaValoresAuto = value;
    }

    /**
     * Gets the value of the listaValoresRcf property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public ArrayOfValoresCoberturaVo getListaValoresRcf() {
        return listaValoresRcf;
    }

    /**
     * Sets the value of the listaValoresRcf property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfValoresCoberturaVo }
     *     
     */
    public void setListaValoresRcf(ArrayOfValoresCoberturaVo value) {
        this.listaValoresRcf = value;
    }

    /**
     * Gets the value of the vlTotalPremioLiquidoAci property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioLiquidoAci() {
        return vlTotalPremioLiquidoAci;
    }

    /**
     * Sets the value of the vlTotalPremioLiquidoAci property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioLiquidoAci(Double value) {
        this.vlTotalPremioLiquidoAci = value;
    }

    /**
     * Gets the value of the vlTotalPremioLiquidoAuto property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioLiquidoAuto() {
        return vlTotalPremioLiquidoAuto;
    }

    /**
     * Sets the value of the vlTotalPremioLiquidoAuto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioLiquidoAuto(Double value) {
        this.vlTotalPremioLiquidoAuto = value;
    }

    /**
     * Gets the value of the vlTotalPremioLiquidoRcf property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioLiquidoRcf() {
        return vlTotalPremioLiquidoRcf;
    }

    /**
     * Sets the value of the vlTotalPremioLiquidoRcf property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioLiquidoRcf(Double value) {
        this.vlTotalPremioLiquidoRcf = value;
    }

    /**
     * Gets the value of the vlTotalPremioTarifaAci property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioTarifaAci() {
        return vlTotalPremioTarifaAci;
    }

    /**
     * Sets the value of the vlTotalPremioTarifaAci property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioTarifaAci(Double value) {
        this.vlTotalPremioTarifaAci = value;
    }

    /**
     * Gets the value of the vlTotalPremioTarifaAuto property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioTarifaAuto() {
        return vlTotalPremioTarifaAuto;
    }

    /**
     * Sets the value of the vlTotalPremioTarifaAuto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioTarifaAuto(Double value) {
        this.vlTotalPremioTarifaAuto = value;
    }

    /**
     * Gets the value of the vlTotalPremioTarifaRcf property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlTotalPremioTarifaRcf() {
        return vlTotalPremioTarifaRcf;
    }

    /**
     * Sets the value of the vlTotalPremioTarifaRcf property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlTotalPremioTarifaRcf(Double value) {
        this.vlTotalPremioTarifaRcf = value;
    }

}
