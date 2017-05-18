//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ParcelamentoImpressaoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ParcelamentoImpressaoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdPlanoPagamento" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dsPlanoPagamento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nuPrestacao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="percAdicionalFracionamento" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlAdicionalFracionamento" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlDemaisParcelas" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlIOF" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPremioTotal" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPrimeiraParcela" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ParcelamentoImpressaoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdPlanoPagamento",
    "dsPlanoPagamento",
    "nuPrestacao",
    "percAdicionalFracionamento",
    "vlAdicionalFracionamento",
    "vlDemaisParcelas",
    "vlIOF",
    "vlPremioTotal",
    "vlPrimeiraParcela"
})
public class ParcelamentoImpressaoVo {

    protected Integer cdPlanoPagamento;
    protected String dsPlanoPagamento;
    protected Integer nuPrestacao;
    protected Double percAdicionalFracionamento;
    protected Double vlAdicionalFracionamento;
    protected Double vlDemaisParcelas;
    protected Double vlIOF;
    protected Double vlPremioTotal;
    protected Double vlPrimeiraParcela;

    /**
     * Gets the value of the cdPlanoPagamento property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdPlanoPagamento() {
        return cdPlanoPagamento;
    }

    /**
     * Sets the value of the cdPlanoPagamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdPlanoPagamento(Integer value) {
        this.cdPlanoPagamento = value;
    }

    /**
     * Gets the value of the dsPlanoPagamento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsPlanoPagamento() {
        return dsPlanoPagamento;
    }

    /**
     * Sets the value of the dsPlanoPagamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsPlanoPagamento(String value) {
        this.dsPlanoPagamento = value;
    }

    /**
     * Gets the value of the nuPrestacao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuPrestacao() {
        return nuPrestacao;
    }

    /**
     * Sets the value of the nuPrestacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuPrestacao(Integer value) {
        this.nuPrestacao = value;
    }

    /**
     * Gets the value of the percAdicionalFracionamento property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPercAdicionalFracionamento() {
        return percAdicionalFracionamento;
    }

    /**
     * Sets the value of the percAdicionalFracionamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPercAdicionalFracionamento(Double value) {
        this.percAdicionalFracionamento = value;
    }

    /**
     * Gets the value of the vlAdicionalFracionamento property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlAdicionalFracionamento() {
        return vlAdicionalFracionamento;
    }

    /**
     * Sets the value of the vlAdicionalFracionamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlAdicionalFracionamento(Double value) {
        this.vlAdicionalFracionamento = value;
    }

    /**
     * Gets the value of the vlDemaisParcelas property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlDemaisParcelas() {
        return vlDemaisParcelas;
    }

    /**
     * Sets the value of the vlDemaisParcelas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlDemaisParcelas(Double value) {
        this.vlDemaisParcelas = value;
    }

    /**
     * Gets the value of the vlIOF property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlIOF() {
        return vlIOF;
    }

    /**
     * Sets the value of the vlIOF property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlIOF(Double value) {
        this.vlIOF = value;
    }

    /**
     * Gets the value of the vlPremioTotal property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPremioTotal() {
        return vlPremioTotal;
    }

    /**
     * Sets the value of the vlPremioTotal property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPremioTotal(Double value) {
        this.vlPremioTotal = value;
    }

    /**
     * Gets the value of the vlPrimeiraParcela property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPrimeiraParcela() {
        return vlPrimeiraParcela;
    }

    /**
     * Sets the value of the vlPrimeiraParcela property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPrimeiraParcela(Double value) {
        this.vlPrimeiraParcela = value;
    }

}