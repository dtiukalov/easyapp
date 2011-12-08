package com.saturn.sldb;

import static org.junit.Assert.*;

import org.junit.Test;

public class IdCardUtilTest {

	@Test
	public void testTo18() {
		assertEquals("220323198811011618", IdCardUtil.to18("220323881101161"));
		
		assertEquals("220102198112034412", IdCardUtil.to18("220102811203441"));
		
	//	assertEquals("220102198112034412", IdCardUtil.to18("220102811203442"));
	}

}
