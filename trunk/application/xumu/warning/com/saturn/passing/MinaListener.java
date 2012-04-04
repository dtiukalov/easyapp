package com.saturn.passing;

import java.io.IOException;
import java.net.InetSocketAddress;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.mina.core.filterchain.DefaultIoFilterChainBuilder;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.filter.logging.MdcInjectionFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;

public class MinaListener implements ServletContextListener {

	private NioSocketAcceptor acceptor;
	private int port = 8234;
	
	public MinaListener() {
		acceptor = new NioSocketAcceptor();
	}
	
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		String portStr = (String)servletContextEvent.getServletContext().getAttribute("port");
		if (portStr != null) {
			port = Integer.parseInt(portStr);
		}
		
		DefaultIoFilterChainBuilder chain = acceptor.getFilterChain();

		// 不带密钥的杂凑函数生成的消息摘要称为MDC
		MdcInjectionFilter mdcInjectionFilter = new MdcInjectionFilter();
		chain.addLast("mdc", mdcInjectionFilter);

		// chain.addLast("codec", new ProtocolCodecFilter(
		// new TextLineCodecFactory()));

		addLogger(chain);

		try {
			// 创建消息处理器
			acceptor.setHandler(new CardHandler());
			// 创建套接字地址，其中 IP 地址为通配符地址，端口号为指定值。
			acceptor.bind(new InetSocketAddress(port));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		System.out.println("Listening on port " + port);
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if (acceptor != null) {
			acceptor.dispose();
		}

	}

	private void addLogger(DefaultIoFilterChainBuilder chain) {
		chain.addLast("logger", new LoggingFilter());
		System.out.println("Logging ON");
	}
}
