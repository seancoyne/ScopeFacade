component extends="mxunit.framework.TestCase" {
	
	public void function setUp() {
		variables.scopefacade = createObject("component","ScopeFacade.cfscript.ScopeFacade");
	}
	
	public void function tearDown() {
		structDelete(session,"test");
		structDelete(application,"test");
		structDelete(server,"test");
		structDelete(request,"test");
		structDelete(variables,"scopefacade");
	}
	
	// Init & GetScope
	
	public void function testInitSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,session);
	}
	
	public void function testInitApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,application);
	}
	
	public void function testInitServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,server);
	}
	
	public void function testInitRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,request);
	}
	
	public void function testInitSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,session.test);
	}
	
	public void function testInitApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,application.test);
	}
	
	public void function testInitServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,server.test);
	}
	
	public void function testInitRequestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.cfscript.ScopeFacade"));
		makePublic(variables.scopefacade,"getScope");
		var scope = variables.scopefacade.getScope();
		assertSame(scope,request.test);
	}
	
	// GetLockScope
	
	public void function testGetLockScopeSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("session",result);
	}
	
	public void function testGetLockScopeSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("session",result);
	}
	
	public void function testGetLockScopeApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("application",result);
	}
	
	public void function testGetLockScopeApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("application",result);
	}
	
	public void function testGetLockScopeServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("server",result);
	}
	
	public void function testGetLockScopeServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("server",result);
	}
	
	public void function testGetLockScopeRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("request",result);
	}
	
	public void function testGetLockScopeRequestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals("request",result);
	}
	
	// Get
	
	public void function testGetSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		session.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,session.test);
	}
	
	public void function testGetSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		session.test.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,session.test.test);
	}
	
	public void function testGetApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		application.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,application.test);
	}
	
	public void function testGetApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		application.test.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,application.test.test);
	}
	
	public void function testGetServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		server.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,server.test);
	}
	
	public void function testGetServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		server.test.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,server.test.test);
	}
	
	public void function testGetRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		request.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,request.test);
	}
	
	public void function testGetReqestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		request.test.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,request.test.test);
	}
	
	// Set
	
	public void function testSetSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		variables.scopefacade.set("Test",1);
		assertEquals(1,session.test);
	}
	
	public void function testSetSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		variables.scopefacade.set("Test",1);
		assertEquals(1,session.test.test);
	}
	
	public void function testSetApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		variables.scopefacade.set("Test",1);
		assertEquals(1,application.test);
	}
	
	public void function testSetApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		variables.scopefacade.set("Test",1);
		assertEquals(1,application.test.test);
	}
	
	public void function testSetServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		variables.scopefacade.set("Test",1);
		assertEquals(1,server.test);
	}
	
	public void function testSetServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		variables.scopefacade.set("Test",1);
		assertEquals(1,server.test.test);
	}
	
	public void function testSetRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		variables.scopefacade.set("Test",1);
		assertEquals(1,request.test);
	}
	
	public void function testSetRequestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		variables.scopefacade.set("Test",1);
		assertEquals(1,request.test.test);
	}
	
	// Exists
	
	public void function testExistsSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		session.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(session,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		session.test.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(session,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		application.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(application,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		application.test.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(application,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		server.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(server,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		server.test.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(server,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		request.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(request,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	public void function testExistsRequestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		request.test.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(request,"test");
		assertFalse(variables.scopefacade.exists("test"));		
	}
	
	// Delete
	
	public void function testDeleteSession() {
		variables.scopefacade = variables.scopefacade.init("session");
		session.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(session,"test"));
	}
	
	public void function testDeleteSessionSubkey() {
		variables.scopefacade = variables.scopefacade.init("session.test");
		session.test.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(session.test,"test"));
	}
	
	public void function testDeleteApplication() {
		variables.scopefacade = variables.scopefacade.init("application");
		application.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(application,"test"));
	}
	
	public void function testDeleteApplicationSubkey() {
		variables.scopefacade = variables.scopefacade.init("application.test");
		application.test.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(application.test,"test"));
	}
	
	public void function testDeleteServer() {
		variables.scopefacade = variables.scopefacade.init("server");
		server.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(server,"test"));
	}
	
	public void function testDeleteServerSubkey() {
		variables.scopefacade = variables.scopefacade.init("server.test");
		server.test.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(server.test,"test"));
	}
	
	public void function testDeleteRequest() {
		variables.scopefacade = variables.scopefacade.init("request");
		request.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(request,"test"));
	}
	
	public void function testDeleteRequestSubkey() {
		variables.scopefacade = variables.scopefacade.init("request.test");
		request.test.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(request.test,"test"));
	}
	
	
}