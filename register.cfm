<cf_front title="Test Center - Register">
  <cfif structKeyExists(form,'fld_newUserSubmit')>
    <!---Server side data validation--->
    <cfset aErrorMessages = application.registrationService.validateUser(form.fld_userFirstName, form.fld_userLastName, form.fld_userEmail, form.fld_userPassword, form.fld_userPasswordConfirm) />
    <cfif ArrayisEmpty(aErrorMessages)>
      <!---Insert data in database if no error detected--->
      <cfset application.registrationService.addUser(form.fld_userFirstName, form.fld_userLastName, form.fld_userEmail, form.fld_userPassword) />
      <cfset userIsInserted = true />
    </cfif>
  </cfif>

  <cfif isDefined('userIsInserted')>
    <cfset isUserLoggedIn = application.authenticationService.doLogin(form.fld_userEmail, form.fld_userPassword) />
  </cfif>
  <cfif structKeyExists(session, 'stLoggedInUser')>
    <cflocation url="/schedule.cfm">
  </cfif>

  <div class="container">
    <cfform class="mt-4">
      <fieldset>
        <legend>Register a new account</legend>
        <cfif structKeyExists(url, 'noaccess')>
          <p class="errorMessage"> Please log in to access the site.</p>
        </cfif>
        <cfif structKeyExists(variables, 'aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
          <cfoutput>
            <cfloop array="#aErrorMessages#" item="message">
              <p class="errorMessage text-danger">#message#</p>
            </cfloop>
          </cfoutput>
        </cfif>
        <cfif structKeyExists(variables, 'isUserLoggedIn') AND isUserLoggedIn EQ false>
          <p class="errorMessage">Email and password combination not found. Please try again.</p>
        </cfif>
        <cfif structKeyExists(session, 'stLoggedInUser')>
          <cflocation url="/schedule.cfm">
        <cfelse>
          <div class="col-6">
            <dl>
              <dt><label class="form-label" for="fld_userFirstName">First Name</label><dt>
              <dd><cfinput class="form-control" type="text" name="fld_userFirstName" id="fld_userFirstName" required="true" message="Please enter your first name" /></dd>
              <dt><label class="form-label" for="fld_userLastName">Last Name</label><dt>
              <dd><cfinput class="form-control" type="text" name="fld_userLastName" id="fld_userLastName" required="true" message="Please enter a your last name" /></dd>
              <dt><label class="form-label" for="fld_userEmail">Email address</label><dt>
              <dd><cfinput class="form-control" type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="email" message="Please enter a valid email address" /></dd>
              <dt><label class="form-label" for="fld_userPassword">Password</label><dt>
              <dd><cfinput class="form-control" type="password" name="fld_userPassword" id="fld_userPassword" required="true" message="Please enter a password" /></dd>
              <dt><label class="form-label" for="fld_userPasswordConfirm">Confirm Password</label><dt>
              <dd><cfinput class="form-control" type="password" name="fld_userPasswordConfirm" id="fld_userPasswordConfirm" required="true" message="Please confirm your password" /></dd>
            </dl>
            <cfinput class="btn btn-secondary" type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Register" />
          </div>
        </cfif>
      </fieldset>
    </cfform>
  </div>
</cf_front>