[![Build Status](https://travis-ci.org/seancoyne/ScopeFacade.png)](https://travis-ci.org/seancoyne/ScopeFacade)

# Scope Facade
[Sean Coyne](http://n42designs.com), Copyright 2014 and Beyond.  All Rights Reserved.

Apache 2.0 License

A simple ColdFusion facade to abstract a shared scope (session, application, server, request). Useful in applications where you do not want to directly access the shared scope from services.

## Usage

Call `init()` or `new ScopeFacade()` with the name of the scope you want to abstract.  You can also use subkeys of a scope, provided they are structs.

```cfml
<cfscript>
scopeFacade = new ScopeFacade("session");  // this would abstract the entire session scope
scopeFacade = new ScopeFacade("session.userinfo"); // this would abstract only the "userinfo" key of the session scope;
</cfscript>
```