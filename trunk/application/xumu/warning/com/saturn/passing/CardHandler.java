package com.saturn.passing;


import java.util.Calendar;

import org.apache.mina.core.buffer.IoBuffer;
import org.apache.mina.core.service.IoHandler;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * {@link IoHandler} implementation of a simple chat server protocol.
 *
 * @author <a href="http://mina.apache.org">Apache MINA Project</a>
 */
public class CardHandler extends IoHandlerAdapter {
	
    private final static Logger LOGGER = LoggerFactory.getLogger(CardHandler.class);
    //private Thread b = null;
    IoSession wsession = null;
    @Override
    public void exceptionCaught(IoSession session, Throwable cause) {
        LOGGER.warn("Unexpected exception.", cause);
        // Close connection when unexpected exception is caught.
        session.close(true);
    }
    
	@Override
	public void sessionCreated(IoSession session) throws Exception {
		super.sessionCreated(session);
		LOGGER.info("The Session( " + session.getLocalAddress() + ") has created.");
	}

	@Override
    public void messageReceived(IoSession session, Object message) {
		IoBuffer buffer = (IoBuffer) message;
		
		byte[] data = new byte[buffer.limit()];
		buffer.get(data, buffer.position(), buffer.limit());
		//ByteArrayInputStream in = new ByteArrayInputStream(data);   
        //int result = in.read();
		int[] _data = new int[data.length];
		for(int i=0;i<data.length;i++){
			_data[i]=(data[i]&0xff);
		}
		boolean bl = Opertion.execute(_data);
    }
	
    @Override
    public void sessionClosed(IoSession session) throws Exception {
    	LOGGER.info("The Session( " + session.getLocalAddress() + ") has left.");
    }
    /**
	 * 校验数据有效性
	 * @param data
	 * @return
	 */
	public boolean checkData(int[] data){
		if(data==null)
			return false;
		try {
			int sum=0;
			for(int i=0;i<data.length-1;i++){
				sum+=data[i];
			}
			int i=(((sum<<24)>>>24)^0xff)+1;
			//System.out.println(i+"="+(data[data[5]+5]));
			if(i==data[data[5]+5])
				return true;
			else
				return false;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return false;
		}
		//this.data=data;
	}
}