//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DetalhamentoCcbVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="DetalhamentoCcbVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dataGeracao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dataPagamento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dataVencimento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dsSituacao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nuCCB" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="vlParcela" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DetalhamentoCcbVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "dataGeracao",
    "dataPagamento",
    "dataVencimento",
    "dsSituacao",
    "nuCCB",
    "vlParcela"
})
public class DetalhamentoCcbVo {

    protected String dataGeracao;
    protected String dataPagamento;
    protected String dataVencimento;
    protected String dsSituacao;
    protected Long nuCCB;
    protected Double vlParcela;

    /**
     * Gets the value of the dataGeracao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDataGeracao() {
        return dataGeracao;
    }

    /**
     * Sets the value of the dataGeracao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDataGeracao(String value) {
        this.dataGeracao = value;
    }

    /**
     * Gets the value of the dataPagamento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDataPagamento() {
        return dataPagamento;
    }

    /**
     * Sets the value of the dataPagamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDataPagamento(String value) {
        this.dataPagamento = value;
    }

    /**
     * Gets the value of the dataVencimento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDataVencimento() {
        return dataVencimento;
    }

    /**
     * Sets the value of the dataVencimento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDataVencimento(String value) {
        this.dataVencimento = value;
    }

    /**
     * Gets the value of the dsSituacao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsSituacao() {
        return dsSituacao;
    }

    /**
     * Sets the value of the dsSituacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsSituacao(String value) {
        this.dsSituacao = value;
    }

    /**
     * Gets the value of the nuCCB property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getNuCCB() {
        return nuCCB;
    }

    /**
     * Sets the value of the nuCCB property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setNuCCB(Long value) {
        this.nuCCB = value;
    }

    /**
     * Gets the value of the vlParcela property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlParcela() {
        return vlParcela;
    }

    /**
     * Sets the value of the vlParcela property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlParcela(Double value) {
        this.vlParcela = value;
    }

}
