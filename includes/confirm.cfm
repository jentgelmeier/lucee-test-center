<cfif structKeyExists(form, 'fld_confirmBack')>
  <cflocation url="/schedule.cfm?date"/>
</cfif>
<cfset rsTest = application.testService.getTest(session.testTypeID, session.locationID, session.dateID)>
<cfif structKeyExists(form, 'fld_submitFinal')>
  <cfset application.testService.updateUserTest(session.stLoggedInUser.userID, rsTest.fld_examid) />
  <cfset session.stLoggedInUser.userExam = rsTest.fld_examid>
  <cflocation url="/schedule.cfm"/>
</cfif>


<h2>Schedule Your Test</h2>
<div class="col-auto bg-body-secondary p-3 mb-2">
  <cfoutput query="rsTest">
    <div class="pb-1"><b>Test</b>: #fld_type#</div>
    <div><b>Location</b>: #fld_name#</div>
    <div>#fld_street#</div>
    <div class="pb-1">#fld_city#, #fld_state# #fld_zipcode#</div>
    <div><b>Time</b>: #dateTimeFormat(fld_date, 'h:nn tt')# on #dateFormat(fld_date, 'm/d/yyyy')#</div>
  </cfoutput>
</div>
<div class="d-flex justify-content-between">
  <cfinput class="btn btn-link" value="Back" name="fld_confirmBack" type="submit">
  <cfinput class="btn btn-primary" value="Confirm" name="fld_submitFinal" type="submit">
</div>