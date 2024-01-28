<cfif structKeyExists(form, 'fld_submitLocation')>
  <cfset aErrorMessages = ArrayNew(1) />
  <cfif isNull(form.fld_locationid)>
    <cfset arrayAppend(aErrorMessages, 'Please make a selection to continue.') />
  </cfif>
    <cfif arrayIsEmpty(aErrorMessages)>
      <cfset session.locationID = form.fld_locationid />
      <cflocation url="/schedule.cfm?date"/>
    </cfif>
</cfif>
<cfif structKeyExists(form, 'fld_locationback')>
  <cflocation url="/schedule.cfm"/>
</cfif>


<cfif structKeyExists(session, 'testType')>
  <cfset rsTypeID = application.testService.getTypeID(session.testType)>
  <cfset session.testTypeID = rsTypeID.fld_typeid>
  <cfset rsLocations= application.testService.getLocationsByType(session.testTypeID)>

  <h2>Select Your <cfoutput>#session.testType#</cfoutput> Location</h2>
  <cfif structKeyExists(variables, 'aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
    <cfoutput>
      <cfloop array="#aErrorMessages#" item="message">
        <p class="errorMessage text-danger">#message#</p>
      </cfloop>
    </cfoutput>
  </cfif>
  <cfoutput query="rsLocations" >
    <div class="d-flex border my-2 p-2">
      <div class="col-auto p-2"><cfinput class="btn btn-primary mt-2 mb-1" value="#fld_locationid#" name="fld_locationid" type="radio"/></div>
      <div>
        <div><b>#fld_name#</b></div>
        <div>#fld_street#</div>
        <div>#fld_city#, #fld_state# #fld_zipcode#</div>
      </div>
    </div>
  </cfoutput>
  <div class="d-flex justify-content-between">
    <cfinput class="btn btn-link" value="Back" name="fld_locationBack" type="submit">
    <cfinput class="btn btn-primary" value="Continue" name="fld_submitLocation" type="submit">
  </div>
</cfif>


