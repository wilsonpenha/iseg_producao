//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.subscricao.model.client.qar;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ProprietarioQarVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ProprietarioQarVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cpfCnpjProprietario" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="nomeProprietario" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="tipoProprietario" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ProprietarioQarVo", namespace = "http://qar.client.model.subscricao.paol.bradseg.com.br", propOrder = {
    "cpfCnpjProprietario",
    "nomeProprietario",
    "tipoProprietario"
})
public class ProprietarioQarVo {

    protected Long cpfCnpjProprietario;
    protected String nomeProprietario;
    protected String tipoProprietario;

    /**
     * Gets the value of the cpfCnpjProprietario property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getCpfCnpjProprietario() {
        return cpfCnpjProprietario;
    }

    /**
     * Sets the value of the cpfCnpjProprietario property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setCpfCnpjProprietario(Long value) {
        this.cpfCnpjProprietario = value;
    }

    /**
     * Gets the value of the nomeProprietario property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNomeProprietario() {
        return nomeProprietario;
    }

    /**
     * Sets the value of the nomeProprietario property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNomeProprietario(String value) {
        this.nomeProprietario = value;
    }

    /**
     * Gets the value of the tipoProprietario property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoProprietario() {
        return tipoProprietario;
    }

    /**
     * Sets the value of the tipoProprietario property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoProprietario(String value) {
        this.tipoProprietario = value;
    }

}