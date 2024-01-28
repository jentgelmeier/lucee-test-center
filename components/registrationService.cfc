<cfcomponent output="false">
	<!---addUser() method--->
	<cffunction name="addUser" access="public" output="false" returntype="void">
		<cfargument name="userFirstName" type="string" required="true" />
		<cfargument name="userLastName" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfquery>
			INSERT INTO tbl_users
			(fld_userfirstname, fld_userlastname, fld_useremail, fld_userpassword)
			VALUES
			(
				<cfqueryparam value="#arguments.userFirstName#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.userLastName#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.userPassword#" cfsqltype="cf_sql_varchar" />
			)
		</cfquery>
	</cffunction>
	<!---validateUser() method--->
	<cffunction name="validateUser" access="public" output="false" returntype="array">
		<cfargument name="userFirstName" type="string" required="true" />
		<cfargument name="userLastName" type="string" required="true" />
		<cfargument name="userEmail" type="string" required="true" />
		<cfargument name="userPassword" type="string" required="true" />
		<cfargument name="userPasswordConfirm" type="string" required="true" />
		<cfset var aErrorMessages = arrayNew(1) />
		<!---Validate firstName--->
		<cfif arguments.userFirstName EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide your first name') />
		</cfif>
		<!---Validate lastName--->
		<cfif arguments.userLastName EQ ''>
			<cfset arrayAppend(aErrorMessages,'Please provide your last name') />
		</cfif>
		<!---Validate Email--->
		<cfif arguments.userEmail EQ '' OR NOT isValid('email', arguments.userEmail) >
			<cfset arrayAppend(aErrorMessages,'Please enter a valid email address ')/>
		</cfif>
		<!---Validate Password--->
		<cfif arguments.userPassword EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please provide a password ')/>
		</cfif>
		<!---Validate Password confirmation--->
		<cfif arguments.userPasswordConfirm EQ '' >
			<cfset arrayAppend(aErrorMessages,'Please confirm your password')/>
		</cfif>
		<!---validate password and password confirmation Match --->
		<cfif arguments.userPassword NEQ arguments.userPasswordConfirm >
			<cfset arrayAppend(aErrorMessages,'The password and the password confirmation do not match')/>
		</cfif>
		<cfreturn aErrorMessages />
	</cffunction>
</cfcomponent>