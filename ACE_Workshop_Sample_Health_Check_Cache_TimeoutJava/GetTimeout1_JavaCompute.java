
import java.util.concurrent.TimeoutException;

import com.ibm.broker.javacompute.MbJavaComputeNode;
import com.ibm.broker.plugin.MbException;
import com.ibm.broker.plugin.MbMessage;
import com.ibm.broker.plugin.MbMessageAssembly;
import com.ibm.broker.plugin.MbOutputTerminal;
import com.ibm.broker.plugin.MbUserException;
import com.ibm.broker.plugin.MbElement;
import com.ibm.broker.plugin.MbGlobalMap;

public class GetTimeout1_JavaCompute extends MbJavaComputeNode {
	
	public void evaluate(MbMessageAssembly inAssembly) throws MbException {

		MbOutputTerminal out = getOutputTerminal("out");
		MbOutputTerminal alt = getOutputTerminal("alternate");

		MbMessage inMessage = inAssembly.getMessage();
		MbMessageAssembly outAssembly = null;
		try {
			// create new message as a copy of the input
			MbMessage outMessage = new MbMessage(inMessage);
			outAssembly = new MbMessageAssembly(inAssembly, outMessage);
			
			// ----------------------------------------------------------
			// Add user code below
			String resultadoFinal = null;
			Object result = null;

			// ----------------------------------------------------------
			// Busca dados no fluxo existente, serão os dados obtidos em uma consulta externa executada no fluxo alternate
	        final String tranid = null;			
				
		    	TimeoutController controller = new TimeoutController();

		    	//result = buscarDadosCache(inAssembly, alt, tranid);
		    	
		    	boolean falhouCache = false;
		    	
				// ----------------------------------------------------------
				// Busca dados no cache, importante cobrir com try and catch, a não execução do cache não deve quebrar a solução
		    	try {
					// Busca dados no cache, terá tratamento de timeout, quando passar de um tempo sem sucesso a consulta será finalizada
		    	     	result = controller.callWithTimeout(() -> {
		    	        // Your object method call here
		    	        return buscarDadosCache(inAssembly, alt, tranid);
		    	    }, 5000); // Timeout set to 5000 milliseconds
		    	} catch (TimeoutException e) {					
		    		//System.err.println(e);
		    		falhouCache = true;
		    	} catch (Exception e) {
		    		//System.err.println(e);
		    		falhouCache = true;
		    	}		  
		    	
		    	resultadoFinal = (String) result;
		    	
		    	if (falhouCache == true) {
		    		criarResposta(outMessage, "falhanocache");
		    	}else{
		    		criarResposta(outMessage, "cachesucesso:retornocache:"+resultadoFinal);
		    	}
			
			// End of user code
			// ----------------------------------------------------------
		} catch (MbException e) {
			// Re-throw to allow Broker handling of MbException
			throw e;
		} catch (RuntimeException e) {
			// Re-throw to allow Broker handling of RuntimeException
			throw e;
		} catch (Exception e) {
			// Consider replacing Exception with type(s) thrown by user code
			// Example handling ensures all exceptions are re-thrown to be handled in the flow
			throw new MbUserException(this, "evaluate()", "", "", e.toString(), null);
		}
		// The following should only be changed
		// if not propagating message to the 'out' terminal
		out.propagate(outAssembly);

		
	}

	private void criarResposta(MbMessage outMessage, String resultadoFinal) throws MbException {
		// Get root element of the new message
		MbElement outRoot = outMessage.getRootElement();

		// Create XMLNSC domain
		MbElement outXMLNSC = outRoot.createElementAsLastChild("XMLNSC");

		// Create DFDL element under XMLNSC
		MbElement dfdlElement = outXMLNSC.createElementAsLastChild(MbElement.TYPE_NAME, "healthcheck", null);

		// Create renavamServicoDataContabil element under DFDL and set its value
		dfdlElement.createElementAsLastChild(MbElement.TYPE_NAME_VALUE, "resultado", resultadoFinal);
	}


	private String buscarDadosCache(MbMessageAssembly inAssembly, MbOutputTerminal alt, final String tranid) throws Exception {
			String retorno = null;
			String chaveCacheHealthCheck = "chaveCacheHealthCheck"; //possui dados

			MbGlobalMap mapa9310_Map = MbGlobalMap.getGlobalMap("MAPA_9310_cache1");
			//mapa9310_Map.put("chaveCacheHealthCheck", "valorteste");
			
			retorno = (String)mapa9310_Map.get(chaveCacheHealthCheck);

		
		return retorno;
	}	

	/**
	 * onPreSetupValidation() is called during the construction of the node
	 * to allow the node configuration to be validated.  Updating the node
	 * configuration or connecting to external resources should be avoided.
	 *
	 * @throws MbException
	 */
	@Override
	public void onPreSetupValidation() throws MbException {
	}

	/**
	 * onSetup() is called during the start of the message flow allowing
	 * configuration to be read/cached, and endpoints to be registered.
	 *
	 * Calling getPolicy() within this method to retrieve a policy links this
	 * node to the policy. If the policy is subsequently redeployed the message
	 * flow will be torn down and reinitialized to it's state prior to the policy
	 * redeploy.
	 *
	 * @throws MbException
	 */
	@Override
	public void onSetup() throws MbException {
	}

	/**
	 * onStart() is called as the message flow is started. The thread pool for
	 * the message flow is running when this method is invoked.
	 *
	 * @throws MbException
	 */
	@Override
	public void onStart() throws MbException {
	}

	/**
	 * onStop() is called as the message flow is stopped. 
	 *
	 * The onStop method is called twice as a message flow is stopped. Initially
	 * with a 'wait' value of false and subsequently with a 'wait' value of true.
	 * Blocking operations should be avoided during the initial call. All thread
	 * pools and external connections should be stopped by the completion of the
	 * second call.
	 *
	 * @throws MbException
	 */
	@Override
	public void onStop(boolean wait) throws MbException {
	}

	/**
	 * onTearDown() is called to allow any cached data to be released and any
	 * endpoints to be deregistered.
	 *
	 * @throws MbException
	 */
	@Override
	public void onTearDown() throws MbException {
	}

}
