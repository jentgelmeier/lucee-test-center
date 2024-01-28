<cf_front title="Schedule Your Test">
  <!--- Check if user is logged in --->
  <cfif structKeyExists(URL,'logout')>
    <cfset createObject("component",'components.authenticationService').doLogout() />
    <cflocation url="/index.cfm">
  </cfif>
  <cfif NOT isUserLoggedIn()> 
    <cflocation url="/index.cfm?noaccess">
  </cfif>
  <cfif structKeyExists(form, 'fld_cancel')>
    <cfset session.stLoggedInUser.userExam = application.testService.cancelUserTest(session.stLoggedInUser.userID)>
  </cfif>
 
  <div class="container">
  
   <div class="border-bottom d-flex mb-2">
    <span>Welcome, <cfoutput>#session.stLoggedInUser.userFirstName#</cfoutput></span>
    <div class="col-auto ms-auto"><a href="/schedule.cfm?logout">Logout</a></div>
  </div>
    <cfinclude template="/includes/scheduledTest.cfm" />
    <cfform>
      <cfif isDefined('url.confirm')>
        <cfinclude template="includes/confirm.cfm" />
      <cfelseif isDefined('url.date')>
        <cfinclude template="/includes/date.cfm" />
      <cfelseif isDefined('url.location')>
        <cfinclude template="/includes/location.cfm" />
      <cfelse>
        <cfinclude template="/includes/testType.cfm" />
      </cfif>
    </cfform>
  </div>
</cf_front>