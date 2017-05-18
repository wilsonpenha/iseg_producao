package iseg.app.action;

import iseg.app.business.OrcamentoSeguroServiceImpl;
import iseg.app.model.OrcamentoSeguro;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"file:resource/META-INF/persistence.xml" })  
@Transactional  
@TransactionConfiguration(defaultRollback = false)  
public class TesteUnit {
	
	@Autowired
	OrcamentoSeguroServiceImpl dao = new OrcamentoSeguroServiceImpl();
	
	@Test
	public void find(){
		try {
			dao.find(OrcamentoSeguro.class, 600L);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
