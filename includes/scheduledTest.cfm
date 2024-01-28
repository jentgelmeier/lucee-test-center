<div class="row mb-3">
  <cfif session.stLoggedInUser.userExam NEQ '' AND NOT isDefined('url.confirm')>
    <cfset userTest = application.testService.getUserTestInfo(session.stLoggedInUser.userExam)>
    <div class="col-auto bg-body-secondary p-3 mt-3">
      <cfoutput>
        <div class="mb-1">You are signed up for the <b>#userTest.fld_type#</b> test:</div>
        <div><b>#userTest.fld_name#</b></div>
        <div>#userTest.fld_street#</div>
        <div>#userTest.fld_city#, #userTest.fld_state# #userTest.fld_zipcode#</div>
        <div>at #dateTimeFormat(userTest.fld_date, 'h:nn tt')# on #dateFormat(userTest.fld_date, 'm/d/yyyy')#</div>
        <cfform>
          <cfinput class="btn btn-danger mt-2" value="Cancel Test" name="fld_cancel" type="submit"/>
        </cfform>
      </cfoutput>
    </div>
  </cfif>
</div>