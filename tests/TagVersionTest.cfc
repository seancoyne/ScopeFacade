component extends="mxunit.framework.TestCase" {

	public void function setUp() {
		variables.scopefacade = createObject("component","ScopeFacade.tag.ScopeFacade");
		scope_data = ["session","application","request","server"];
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
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.tag.ScopeFacade"));
	}

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testInitSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		assert(isInstanceOf(variables.scopefacade,"ScopeFacade.tag.ScopeFacade"));
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

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testGetScopeSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		makePublic(variables.scopefacade,"getScope");
		var s = variables.scopefacade.getScope();
		assertSame(s,structGet(arguments.scope & ".test"));
	}

// GetLockScope

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testGetLockScope(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope);
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals(arguments.scope,result);
	}

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testGetLockScopeSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		makePublic(variables.scopefacade,"getLockScope");
		var result = variables.scopefacade.getLockScope();
		assertEquals(arguments.scope,result);
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
	}

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testGetSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		var s = structGet(arguments.scope);
		s.test.test = "1";
		var result = variables.scopefacade.get("test");
		assertEquals(result,s.test.test);
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
	}


/**
   * @mxunit:dataprovider scope_data
   */
	public void function testSetSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		variables.scopefacade.set("Test",1);
		var s = structGet(arguments.scope);
		assertEquals(1,s.test.test);
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

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testExistsSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		var s = structGet(arguments.scope);
		s.test.test = 1;
		assertTrue(variables.scopefacade.exists("test"));
		structDelete(s.test,"test");
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
	}

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testDeleteSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		var s = structGet(arguments.scope);
		s.test.test = 1;
		variables.scopefacade.delete("test");
		assertFalse(structKeyExists(s.test,"test"));
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
	}

/**
   * @mxunit:dataprovider scope_data
   */
	public void function testParamSubkey(required string scope) {
		variables.scopefacade = variables.scopefacade.init(arguments.scope & ".test");
		var s = structGet(arguments.scope);
		s.test.test = 1;
		variables.scopefacade.param("test","numeric",2);
		assertTrue(structKeyExists(s.test,"test") && s.test.test eq 1);
		structDelete(s.test,"test");
		variables.scopefacade.param("test","numeric",2);
		assertTrue(structKeyExists(s.test,"test") && s.test.test eq 2);
	}

}