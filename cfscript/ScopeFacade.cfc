/*
* 
* Scope Facade
* Author: Sean Coyne (http://n42designs.com)
* Copyright 2012 and Beyond.  All Rights Reserved.
* 
* call init() with the name of the scope you want to abstract.  you can also use subkeys of a scope.
* examples:
* 	init("session");  // this would abstract the entire session scope
* 	init("session.userinfo"); // this would abstract only the "userinfo" key of the session scope;
* 
* you can abstract the Application, Session, Server, or Request scopes 
* 
*/
component {
	
	variables.instance = {};
	variables.instance.scopename = "";
	variables.instance.scope = "";
	
	public scopeFacade function init(variablename scope) {
		variables.instance.scopename = arguments.scope;
		return this;
	}
	
	private struct function getScope() {
		return structGet(variables.instance.scopename);
	}
	
	private string function getLockScope() {
		return listFirst(variables.instance.scopename,".");
	}
	
	public any function get(string key, string defaultValue) {
		var scope = getScope();
		lock scope=getLockScope() timeout="5" throwontimeout="true" type="exclusive" {
			if (structKeyExists(arguments,"defaultValue") and not structKeyExists(scope,arguments.key)) {
				return arguments.defaultValue;
			}
			return scope[arguments.key];
		}
	}
	
	public void function set(string key, any value) {
		var scope = getScope();
		lock scope=getLockScope() timeout="5" throwontimeout="true" type="exclusive" {
			scope[arguments.key] = arguments.value;
		}
	}
	
	public void function delete(string key) {
		var scope = getScope();
		lock scope=getLockScope() timeout="5" throwontimeout="true" type="exclusive" {
			if (exists(arguments.key)) {
				structDelete(scope,arguments.key);
			}
		}
	}
	
	public boolean function exists(string key) {
		lock scope=getLockScope() timeout="5" throwontimeout="true" type="readonly" {
			return structKeyExists(getScope(),arguments.key);
		}
	}

	public void function param(string key, string type = "any", any defaultValue) {
		if (structKeyExists(arguments,"defaultValue")) {
			param name="#variables.instance.scopename#.#arguments.key#" type="#arguments.type#" default="#arguments.defaultValue#";
		} else {
			param name="#variables.instance.scopename#.#arguments.key#" type="#arguments.type#";
		}

	}

}