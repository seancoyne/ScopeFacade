component extends="mxunit.framework.TestCase" {

	public void function setUp() {
		variables.scopefacade = createObject("component","ScopeFacade.ScopeFacade");
		scope_data = ["session","application","request","server","session.test","application.test","request.test","server.test"];
	}

	public void function tearDown() {
		structDelete(session,"test");
		structDelete(application,"test");
		structDelete(server,"test");
		structDelete(request,"test");
		structDelete(variables,"scopefacade");
	}

	// Init

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testInit(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.ScopeFacade"));
	}

	// GetScope

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testGetScope(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		makePublic(variables.scopefacade,"getScope");
		var s = variables.scopefacade.getScope();
		assertSame(s,structGet(arguments.scope));
	}

	// GetLockScope

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testGetLockScope(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals(listFirst(arguments.scope,"."),result);
	}

	// Get

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testGet(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		var s = structGet(arguments.scope);
		s.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,s.test);

		// do some clean up
		structDelete(s,"test");
	}

	// Set

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testSet(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		variables.scopefacade.set("Test",1);
		var s = structGet(arguments.scope);
		assertEquals(1,s.test);

		// do some clean up
		structDelete(s,"test");
	}

	// Exists

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testExists(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		var s = structGet(arguments.scope);
		s.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(s,"test");
		assertFalse(variables.scopefacade.exists("test"));
	}

	// Delete

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testDelete(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		var s = structGet(arguments.scope);
		s.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(s,"test"));

		// do some clean up
		structDelete(s,"test");
	}

	// Param

	/**
	* @mxunit:dataprovider scope_data
	*/
	public void function testParam(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		var s = structGet(arguments.scope);
		s.test = 1;
		variables.scopefacade.param("test","numeric",2);
		assertTrue(structKeyExists(s,"test") && s.test eq 1);
		structDelete(s,"test");
		variables.scopefacade.param("test","numeric",2);
		assertTrue(structKeyExists(s,"test") && s.test eq 2);

		// do some clean up
		structDelete(s,"test");
	}

}