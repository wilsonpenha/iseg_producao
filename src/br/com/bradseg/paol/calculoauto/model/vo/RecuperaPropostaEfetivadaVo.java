//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for RecuperaPropostaEfetivadaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="RecuperaPropostaEfetivadaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdCpfCnpjCorretor" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *         &lt;element name="cdSucursal" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nrProposta" type="{http://www.w3.org/2001/XMLSchema}long" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RecuperaPropostaEfetivadaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdCpfCnpjCorretor",
    "cdSucursal",
    "nrProposta"
})
public class RecuperaPropostaEfetivadaVo {

    protected Long cdCpfCnpjCorretor;
    protected Integer cdSucursal;
    protected Long nrProposta;

    /**
     * Gets the value of the cdCpfCnpjCorretor property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getCdCpfCnpjCorretor() {
        return cdCpfCnpjCorretor;
    }

    /**
     * Sets the value of the cdCpfCnpjCorretor property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setCdCpfCnpjCorretor(Long value) {
        this.cdCpfCnpjCorretor = value;
    }

    /**
     * Gets the value of the cdSucursal property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdSucursal() {
        return cdSucursal;
    }

    /**
     * Sets the value of the cdSucursal property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdSucursal(Integer value) {
        this.cdSucursal = value;
    }

    /**
     * Gets the value of the nrProposta property.
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getNrProposta() {
        return nrProposta;
    }

    /**
     * Sets the value of the nrProposta property.
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setNrProposta(Long value) {
        this.nrProposta = value;
    }

}