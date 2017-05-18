//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for PagamentoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="PagamentoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdOpcPagto1Parcela" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdOpcPagtoDemaisParcelas" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuParcelas" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="pcAdicFracionamento" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="pcTaxaJuros" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlAdicFinal" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlAdicResidencial" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlDemaisParcela" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlDemaisParcelaResidencial" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlIofFinal" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlIofResidencial" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPrimeiraParcela" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPrimeiraParcelaResidencial" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPrimeraParcelaResidencial" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "PagamentoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdOpcPagto1Parcela",
    "cdOpcPagtoDemaisParcelas",
    "nuParcelas",
    "pcAdicFracionamento",
    "pcTaxaJuros",
    "vlAdicFinal",
    "vlAdicResidencial",
    "vlDemaisParcela",
    "vlDemaisParcelaResidencial",
    "vlIofFinal",
    "vlIofResidencial",
    "vlPrimeiraParcela",
    "vlPrimeiraParcelaResidencial",
    "vlPrimeraParcelaResidencial"
})
public class PagamentoVo {

    protected Integer cdOpcPagto1Parcela;
    protected Integer cdOpcPagtoDemaisParcelas;
    protected Integer nuParcelas;
    protected Double pcAdicFracionamento;
    protected Double pcTaxaJuros;
    protected Double vlAdicFinal;
    protected Double vlAdicResidencial;
    protected Double vlDemaisParcela;
    protected Double vlDemaisParcelaResidencial;
    protected Double vlIofFinal;
    protected Double vlIofResidencial;
    protected Double vlPrimeiraParcela;
    protected Double vlPrimeiraParcelaResidencial;
    protected Double vlPrimeraParcelaResidencial;

    /**
     * Gets the value of the cdOpcPagto1Parcela property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdOpcPagto1Parcela() {
        return cdOpcPagto1Parcela;
    }

    /**
     * Sets the value of the cdOpcPagto1Parcela property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdOpcPagto1Parcela(Integer value) {
        this.cdOpcPagto1Parcela = value;
    }

    /**
     * Gets the value of the cdOpcPagtoDemaisParcelas property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdOpcPagtoDemaisParcelas() {
        return cdOpcPagtoDemaisParcelas;
    }

    /**
     * Sets the value of the cdOpcPagtoDemaisParcelas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdOpcPagtoDemaisParcelas(Integer value) {
        this.cdOpcPagtoDemaisParcelas = value;
    }

    /**
     * Gets the value of the nuParcelas property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuParcelas() {
        return nuParcelas;
    }

    /**
     * Sets the value of the nuParcelas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuParcelas(Integer value) {
        this.nuParcelas = value;
    }

    /**
     * Gets the value of the pcAdicFracionamento property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPcAdicFracionamento() {
        return pcAdicFracionamento;
    }

    /**
     * Sets the value of the pcAdicFracionamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPcAdicFracionamento(Double value) {
        this.pcAdicFracionamento = value;
    }

    /**
     * Gets the value of the pcTaxaJuros property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPcTaxaJuros() {
        return pcTaxaJuros;
    }

    /**
     * Sets the value of the pcTaxaJuros property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPcTaxaJuros(Double value) {
        this.pcTaxaJuros = value;
    }

    /**
     * Gets the value of the vlAdicFinal property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlAdicFinal() {
        return vlAdicFinal;
    }

    /**
     * Sets the value of the vlAdicFinal property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlAdicFinal(Double value) {
        this.vlAdicFinal = value;
    }

    /**
     * Gets the value of the vlAdicResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlAdicResidencial() {
        return vlAdicResidencial;
    }

    /**
     * Sets the value of the vlAdicResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlAdicResidencial(Double value) {
        this.vlAdicResidencial = value;
    }

    /**
     * Gets the value of the vlDemaisParcela property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlDemaisParcela() {
        return vlDemaisParcela;
    }

    /**
     * Sets the value of the vlDemaisParcela property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlDemaisParcela(Double value) {
        this.vlDemaisParcela = value;
    }

    /**
     * Gets the value of the vlDemaisParcelaResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlDemaisParcelaResidencial() {
        return vlDemaisParcelaResidencial;
    }

    /**
     * Sets the value of the vlDemaisParcelaResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlDemaisParcelaResidencial(Double value) {
        this.vlDemaisParcelaResidencial = value;
    }

    /**
     * Gets the value of the vlIofFinal property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlIofFinal() {
        return vlIofFinal;
    }

    /**
     * Sets the value of the vlIofFinal property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlIofFinal(Double value) {
        this.vlIofFinal = value;
    }

    /**
     * Gets the value of the vlIofResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlIofResidencial() {
        return vlIofResidencial;
    }

    /**
     * Sets the value of the vlIofResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlIofResidencial(Double value) {
        this.vlIofResidencial = value;
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

    /**
     * Gets the value of the vlPrimeiraParcelaResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPrimeiraParcelaResidencial() {
        return vlPrimeiraParcelaResidencial;
    }

    /**
     * Sets the value of the vlPrimeiraParcelaResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPrimeiraParcelaResidencial(Double value) {
        this.vlPrimeiraParcelaResidencial = value;
    }

    /**
     * Gets the value of the vlPrimeraParcelaResidencial property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPrimeraParcelaResidencial() {
        return vlPrimeraParcelaResidencial;
    }

    /**
     * Sets the value of the vlPrimeraParcelaResidencial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPrimeraParcelaResidencial(Double value) {
        this.vlPrimeraParcelaResidencial = value;
    }

}
