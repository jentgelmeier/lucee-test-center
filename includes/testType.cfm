<cfif structKeyExists(form, 'fld_submitType')>
  <cfset session.testType = form.fld_submitType />
  <cflocation url="/schedule.cfm?location"/>
</cfif>

<cfset rsTestTypes = application.testService.getTestTypes()>
<h2>Exams</h2>
<cfoutput query="rsTestTypes" >
  <div>
    <cfinput class="btn btn-primary mt-2 mb-1" value="#fld_type#" name="fld_submitType" type="submit"/>
    <p>#fld_description#</p>
  </div>
</cfoutput>
