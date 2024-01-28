<cf_front>
  <!--- Form processing begins here --->
  <cfif structKeyExists(form, 'fld_submitLogin')>
    <!--- server side data validation --->
    <cfset aErrorMessages = application.authenticationService.validateUser(form.fld_userEmail, form.fld_userPassword) />
    <cfif arrayIsEmpty(aErrorMessages)>
      <!--- proceed to the login procedure --->
      <cfset isUserLoggedIn = application.authenticationService.doLogin(form.fld_userEmail, form.fld_userPassword) />
    </cfif>
  </cfif>

  <!--- Form processing ends here --->
  <div class="container">
    <div class="col-6 mt-5">
    <cfform>
      <fieldset>
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
          <dl>
            <dt><label class="form-label" for="fld_userEmail">Email address</label><dt>
            <dd><cfinput class="form-control" type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="email" message="Please enter a valid email address" /></dd>
            <dt><label class="form-label" for="fld_userPassword">Password</label><dt>
            <dd><cfinput class="form-control"type="password" name="fld_userPassword" id="fld_userPassword" required="true" message="Please enter a password" /></dd>
          </dl>
          <cfinput type="submit" name="fld_submitLogin" id="fld_submitLogin" value="Login" class="btn btn-secondary" />
        </cfif>
      </fieldset>
    </cfform>
    </div>

    <div class="mt-3">Don't have an account?</div>
    <a href="/register.cfm">Register here</a>
  </div>
</cf_front>