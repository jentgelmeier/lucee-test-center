<cfcomponent output="false">
  <!--- validateUser() method --->
  <cffunction  name="validateUser" access="public" output="false" returntype="array">
    <cfargument  name="userEmail" type="string" required="true">
    <cfargument  name="userPassword" type="string" required="true">

    <cfset var aErrorMessages = ArrayNew(1) />
    <!--- validate email --->
    <cfif NOT isValid('email', arguments.userEmail)>
      <cfset arrayAppend(aErrorMessages, 'Please provide a valid email address') />
    </cfif>
    <!--- validate password --->
    <cfif arguments.userPassword EQ ''>
      <cfset arrayAppend(aErrorMessages, 'Please provide a password') />
    </cfif>
    <cfreturn aErrorMessages />
  </cffunction>

  <!--- doLogin() method --->
  <cffunction  name="doLogin" access="public" output="false" returntype="boolean" >
      <cfargument  name="userEmail" type="string" required="true">
      <cfargument  name="userPassword" type="string" required="true">

      <!--- Create the isUserLoggedIn variable --->
      <cfset var isUserLoggedIn = false />
      <!--- Get the user data from the database --->
      <cfquery name="rsLoginUser">
        SELECT tbl_users.fld_userfirstname, tbl_users.fld_userlastname, tbl_users.fld_useremail, tbl_users.fld_userpassword, tbl_users.fld_userid, tbl_users.fld_exam
        FROM tbl_users
        WHERE fld_useremail = <cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar" /> AND fld_userpassword = <cfqueryparam value="#arguments.userPassword#" cfsqltype="cf_sql_varchar" />
      </cfquery>
      <!--- Check if the query returns one and only one user --->
      <cfif rsLoginUser.recordCount EQ 1>
        <!--- Log the user in --->
        <cflogin>
          <cfloginuser name="#rsLoginUser.fld_userfirstname# #rsLoginUser.fld_userlastname#" password="#rsLoginUser.fld_userpassword#" roles="user" />
        </cflogin>
        <!--- Save the user data in the session scope --->
        <cfset session.stLoggedInUser = {'userFirstName' = rsLoginUser.fld_userfirstname, 'userLastName' = rsLoginUser.fld_userlastname, 'userID' = rsLoginUser.fld_userid, 'userExam' = rsLoginUser.fld_exam} />
        <!--- Change the isUserLoggedIn variable to true --->
        <cfset var isUserLoggedIn = true />
      </cfif>
      
      <!--- Return the isUserLoggedIn variable --->
      <cfreturn isUserLoggedIn />
  </cffunction>

  <!--- doLogout() method --->
  <cffunction  name="doLogout" access="public" output="false" returntype="void" >
    <!--- delete user data from the session scope --->
    <cfset structDelete(session, 'stLoggedInUser')>
    <cfset structDelete(session, 'locationID')>
    <cfset structDelete(session, 'testTypeID')>
    <cfset structDelete(session, 'DateID')>
    <cfset structDelete(session, 'testType')>
    <!--- log the user out --->
    <cflogout />
  </cffunction>

</cfcomponent>