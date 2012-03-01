<!--- 
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
--->
<cfcomponent output="false">
	
	<cfset variables.instance = {} />
	<cfset variables.instance.scopename = '' />
	<cfset variables.instance.scope = '' />
	
	<cffunction name="init" returntype="scopeFacade" output="false" access="public">
		<cfargument name="scope" required="true" type="variablename" />
		<cfparam name="#arguments.scope#" default="#structnew()#" />
		<cfset variables.instance.scopename = arguments.scope />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getscope" returntype="struct" output="false" access="private">
		<cfreturn structGet(variables.instance.scopename) />
	</cffunction>
	
	<cffunction name="getlockscope" returntype="string" output="false" access="private">
		<cfreturn listFirst(variables.instance.scopename,".") />
	</cffunction>
	
	<cffunction name="get" returntype="any" output="false" access="public">
		<cfargument name="key" required="true" type="string" />
		<cfargument name="default" required="false" type="string" />
		<cfset var scope = getscope() />
		<cflock scope="session" timeout="5" throwontimeout="true" type="exclusive">
			<cfif structKeyExists(arguments,"default") and not structKeyExists(scope,arguments.key)>
				<cfreturn arguments.default />
			</cfif>
			<cfreturn scope[arguments.key] />
		</cflock>
	</cffunction>
	
	<cffunction name="set" returntype="void" output="false" access="public">
		<cfargument name="key" required="true" type="string" />
		<cfargument name="value" required="true" type="any" />
		<cfset var scope = getscope() />
		<cflock scope="session" timeout="5" throwontimeout="true" type="exclusive">
			<cfset scope[arguments.key] = arguments.value />
		</cflock>
	</cffunction>
	
	<cffunction name="delete" returntype="void" output="false" access="public">
		<cfargument name="key" required="true" type="string" />
		<cfset var scope = getscope() />
		<cflock scope="session" timeout="5" throwontimeout="true" type="exclusive">
			<cfif exists(arguments.key)>
				<cfset structDelete(scope,arguments.key) />
			</cfif>
		</cflock>
	</cffunction>
	
	<cffunction name="exists" returntype="boolean" output="false" access="public">
		<cfargument name="key" required="true" type="string" />
		<cflock scope="session" type="readonly" timeout="5" throwontimeout="true">
			<cfreturn structKeyExists(getScope(),arguments.key) />
		</cflock>
	</cffunction>
	
</cfcomponent>