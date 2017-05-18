//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.wsat.controller.services;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import br.com.bradseg.paol.calculoauto.model.vo.BuscaCotacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.CotacaoEndossoVo;
import br.com.bradseg.paol.calculoauto.model.vo.CotacaoVo;
import br.com.bradseg.paol.calculoauto.model.vo.ImpressaoCotacaoVoOut;

@WebService(name = "BolCotacaoAutoPortType", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
@XmlSeeAlso({
    br.com.bradseg.paol.calculoauto.model.vo.ObjectFactory.class,
    br.com.bradseg.paol.wsat.controller.services.ObjectFactory.class,
    br.com.bradseg.paol.subscricao.model.vo.ObjectFactory.class
})
public interface BolCotacaoAutoPortType {


    /**
     * 
     * @param in0
     * @param in1
     * @param in2
     * @return
     *     returns br.com.bradseg.paol.calculoauto.model.vo.CotacaoEndossoVo
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "recuperarCotacaoEndosso", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.RecuperarCotacaoEndosso")
    @ResponseWrapper(localName = "recuperarCotacaoEndossoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.RecuperarCotacaoEndossoResponse")
    public CotacaoEndossoVo recuperarCotacaoEndosso(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        BuscaCotacaoVo in0,
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
     *     returns byte[]
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "imprimirCotacaoEndosso", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.ImprimirCotacaoEndosso")
    @ResponseWrapper(localName = "imprimirCotacaoEndossoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.ImprimirCotacaoEndossoResponse")
    public byte[] imprimirCotacaoEndosso(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        BuscaCotacaoVo in0,
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
     *     returns br.com.bradseg.paol.calculoauto.model.vo.ImpressaoCotacaoVoOut
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "imprimirCotacao", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.ImprimirCotacao")
    @ResponseWrapper(localName = "imprimirCotacaoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.ImprimirCotacaoResponse")
    public ImpressaoCotacaoVoOut imprimirCotacao(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        BuscaCotacaoVo in0,
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
     *     returns br.com.bradseg.paol.calculoauto.model.vo.CotacaoVo
     */
    @WebMethod
    @WebResult(name = "out", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
    @RequestWrapper(localName = "recuperarCotacao", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.RecuperarCotacao")
    @ResponseWrapper(localName = "recuperarCotacaoResponse", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br", className = "br.com.bradseg.paol.wsat.controller.services.RecuperarCotacaoResponse")
    public CotacaoVo recuperarCotacao(
        @WebParam(name = "in0", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        BuscaCotacaoVo in0,
        @WebParam(name = "in1", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in1,
        @WebParam(name = "in2", targetNamespace = "http://services.controller.wsat.paol.bradseg.com.br")
        String in2);

}
