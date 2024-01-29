<cfcomponent output="false">
	<cfset this.name = 'testSchedulingApp'/>
	<cfset this.applicationTimeout = createTimespan(0, 2, 0, 0) />
	<cfset this.datasource = 'testSchedulingDB' />
	<cfset this.customTagPaths = expandPath('/customTags') />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeOut = createTimespan(0, 0, 30, 0) />

	<!--- OnApplicationStart() method	 --->
	<cffunction  name="onApplicationStart" returntype="boolean">
		<!--- add components here	 --->
  	<cfset application.authenticationService = createObject("component", 'components.authenticationService') />
		<cfset application.registrationService = createObject("component",'components.registrationService') />
		<cfset application.testService = createObject("component",'components.testService') />
		<cfreturn true />
	</cffunction>

	<!--- OnRequestStart() method	 --->
	<cffunction  name="onRequestStart" returntype="boolean">
		<cfargument  name="targetPage" type="string" required="true">
		<!--- enter '?restartApp' at end of URL to restart App and update components --->
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>
		<cfreturn true />
	</cffunction>
</cfcomponent>