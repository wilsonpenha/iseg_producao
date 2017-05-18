//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.wsat.controller.services;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import br.com.bradseg.paol.calculoauto.model.vo.CalculoEndossoVo;
import br.com.bradseg.paol.calculoauto.model.vo.CalculoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECalculoEndossoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ECalculoVo;

@WebService(name = "BolCalculoAutoPortType", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
@XmlSeeAlso({
    br.com.bradseg.paol.wsat.controller.services.ObjectFactory.class,
    br.com.bradseg.paol.subscricao.model.vo.ObjectFactory.class,
    br.com.bradseg.paol.calculoauto.model.vo.ObjectFactory.class,
    br.com.bradseg.paol.subscricao.model.client.qar.ObjectFactory.class
})
public interface BolCalculoAutoPortType {


    /**
     * 
     * @param in0
     * @param in1
     * @param in2
     * @return
     *     returns br.com.bradseg.paol.calculoauto.model.vo.CalculoEndossoVo
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "calcularSeguroEndosso", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.CalcularSeguroEndosso")
    @ResponseWrapper(localName = "calcularSeguroEndossoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.CalcularSeguroEndossoResponse")
    public CalculoEndossoVo calcularSeguroEndosso(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        ECalculoEndossoVo in0,
        @WebParam(name = "in1", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in1,
        @WebParam(name = "in2", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in2);

    /**
     * 
     * @param in0
     * @param in1
     * @param in2
     * @return
     *     returns br.com.bradseg.paol.calculoauto.model.vo.CalculoVo
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "gerenciadorCalculo", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.GerenciadorCalculo")
    @ResponseWrapper(localName = "gerenciadorCalculoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.GerenciadorCalculoResponse")
    public CalculoVo gerenciadorCalculo(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        ECalculoVo in0,
        @WebParam(name = "in1", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in1,
        @WebParam(name = "in2", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in2);

}