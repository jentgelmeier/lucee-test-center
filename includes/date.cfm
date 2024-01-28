<cfif structKeyExists(form, 'fld_submitDate')>
  <cfset aErrorMessages = ArrayNew(1) />
  <cfif isNull(form.fld_dateid)>
    <cfset arrayAppend(aErrorMessages, 'Please make a selection to continue.') />
  </cfif>
  <cfif arrayIsEmpty(aErrorMessages)>
    <cfset session.dateID = form.fld_dateid />
    <cflocation url="/schedule.cfm?confirm"/>
  </cfif>
</cfif>
<cfif structKeyExists(form, 'fld_dateBack')>
  <cflocation url="/schedule.cfm?location"/>
</cfif>
<cfset rsDates= application.testService.getDates(session.testTypeID, session.locationID)>

<h2>Schedule Your Test</h2>
<cfif structKeyExists(variables, 'aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
  <cfoutput>
    <cfloop array="#aErrorMessages#" item="message">
      <p class="errorMessage text-danger">#message#</p>
    </cfloop>
  </cfoutput>
</cfif>
<cfoutput query="rsDates" >
  <div class="d-flex border my-2 p-2">
    <div class="col-auto p-2"><cfinput class="btn btn-primary my-2" value="#fld_dateid#" name="fld_dateid" type="radio"/></div>
    <div class="d-flex align-content-center flex-wrap">
    #dateTimeFormat(fld_date, 'mm/d/yyyy h:nn tt')#
    </div>
  </div>
</cfoutput>
<div class="d-flex justify-content-between">
  <cfinput class="btn btn-link" value="Back" name="fld_dateBack" type="submit">
  <cfinput class="btn btn-primary" value="Continue" name="fld_submitDate" type="submit">
</div>