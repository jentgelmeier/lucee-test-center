<cfcomponent output="false">
	<!---getUserTestInfo() method --->
	<cffunction name="getUserTestInfo" access="public" returntype="query">
		<cfargument name="userExam" type="numeric" required="true" />
		<cfset var rsUserTest = '' />
		<cfquery  name="rsUserTest">
			SELECT tbl_testtypes.fld_type, tbl_locations.fld_name, tbl_locations.fld_street, tbl_locations.fld_city, tbl_locations.fld_state, tbl_locations.fld_zipcode, tbl_dates.fld_date
			FROM tbl_examinstances
      INNER JOIN tbl_testtypes
      ON tbl_examinstances.fld_typeid = tbl_testtypes.fld_typeid
      INNER JOIN tbl_locations
      ON tbl_examinstances.fld_locationid = tbl_locations.fld_locationid
      INNER JOIN tbl_dates
      ON tbl_examinstances.fld_dateid = tbl_dates.fld_dateid
			WHERE fld_examid = <cfqueryparam value="#arguments.userExam#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
		<cfreturn rsUserTest />
	</cffunction>

  <!---updateUserTest() method --->
	<cffunction name="updateUserTest" access="public" returntype="void">
		<cfargument name="userID" type="numeric" required="true" />
		<cfargument name="examID" type="numeric" required="true" />
		<cfquery>
      UPDATE tbl_users
      SET fld_exam = <cfqueryparam value="#arguments.examID#" cfsqltype="cf_sql_integer" />
      WHERE fld_userid = <cfqueryparam value="#arguments.userID#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>

  	<!---getTest() method --->
	<cffunction name="getTest" access="public" returntype="query">
		<cfargument name="typeID" type="numeric" required="true" />
		<cfargument name="locationID" type="numeric" required="true" />
		<cfargument name="dateID" type="numeric" required="true" />
		<cfset var rsTest = '' />
		<cfquery  name="rsTest">
			SELECT DISTINCT tbl_examinstances.fld_examid, tbl_testtypes.fld_type, tbl_locations.fld_name, tbl_locations.fld_street, tbl_locations.fld_city, tbl_locations.fld_state, tbl_locations.fld_zipcode, tbl_dates.fld_date
			FROM tbl_examinstances
      INNER JOIN tbl_testtypes
      ON tbl_examinstances.fld_typeid = tbl_testtypes.fld_typeid
      INNER JOIN tbl_locations
      ON tbl_examinstances.fld_locationid = tbl_locations.fld_locationid
      INNER JOIN tbl_dates
      ON tbl_examinstances.fld_dateid = tbl_dates.fld_dateid
			WHERE tbl_examinstances.fld_typeid = <cfqueryparam value="#arguments.typeID#" cfsqltype="cf_sql_integer" />
			AND tbl_examinstances.fld_locationid = <cfqueryparam value="#arguments.locationID#" cfsqltype="cf_sql_integer" />
			AND tbl_examinstances.fld_dateid = <cfqueryparam value="#arguments.dateID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfreturn rsTest />
	</cffunction>

  <!---cancelUserTest() method --->
	<cffunction name="cancelUserTest" access="public" returntype="void">
		<cfargument name="userTestID" type="numeric" required="true" />
		<cfset var rsUserTest = '' />
		<cfquery  name="rsUserTest">
			UPDATE tbl_users
      SET fld_exam = NULL
			WHERE fld_userid = <cfqueryparam value="#arguments.userTestID#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
		<cfreturn rsUserTest />
	</cffunction>

	<!---getTestTypes() method --->
	<cffunction name="getTestTypes" access="public" returntype="query">
		<cfset var rsTestTypes = '' />
		<cfquery  name="rsTestTypes">
			SELECT fld_type, fld_typeid, fld_description
			FROM tbl_testtypes 
		</cfquery>
		<cfreturn rsTestTypes />
	</cffunction>

  <!---getTypeID() method --->
	<cffunction name="getTypeID" access="public" returntype="query">
		<cfargument name="type" type="string" required="true" />
		<cfset var rsTypeID = '' />
		<cfquery name="rsTypeID">
			SELECT fld_typeid
			FROM tbl_testtypes 
      WHERE fld_type = <cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_varchar" /> 
		</cfquery>
		<cfreturn rsTypeID />
	</cffunction>

  <!---getLocationsByType() method --->
	<cffunction name="getLocationsByType" access="public" returntype="query">
		<cfargument name="typeID" type="numeric" required="true" />
		<cfset var rsTestLocations = '' />
		<cfquery  name="rsTestLocations">
			SELECT DISTINCT fld_name, fld_street, fld_city, fld_state, fld_zipcode, tbl_locations.fld_locationid
			FROM tbl_locations
      INNER JOIN tbl_examinstances
      ON tbl_locations.fld_locationid = tbl_examinstances.fld_locationid
      WHERE tbl_examinstances.fld_typeid = <cfqueryparam value="#arguments.typeID#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
		<cfreturn rsTestLocations />
	</cffunction>

  <!---getDates() method --->
	<cffunction name="getDates" access="public" returntype="query">
		<cfargument name="typeID" type="numeric" required="true" />
		<cfargument name="locationID" type="numeric" required="true" />
		<cfset var rsTestDates = '' />
		<cfquery  name="rsTestDates">
			SELECT DISTINCT tbl_dates.fld_dateid, fld_date
			FROM tbl_dates
      INNER JOIN tbl_examinstances
      ON tbl_dates.fld_dateid = tbl_examinstances.fld_dateid
      WHERE tbl_examinstances.fld_typeid = <cfqueryparam value="#arguments.typeID#" cfsqltype="cf_sql_integer" />
      AND tbl_examinstances.fld_locationid = <cfqueryparam value="#arguments.locationID#" cfsqltype="cf_sql_integer" />
      ORDER BY tbl_dates.fld_dateid
		</cfquery>
		<cfreturn rsTestDates />
	</cffunction>

  <!---getTestID() method --->
	<cffunction name="getTestID" access="public" returntype="query">
		<cfargument name="userExam" type="numeric" required="true" />
		<cfset var rsUserTest = '' />
		<cfquery  name="rsUserTest">
			SELECT tbl_testtypes.fld_type, tbl_locations.fld_name, tbl_locations.fld_street, tbl_locations.fld_city, tbl_locations.fld_state, tbl_locations.fld_zipcode, tbl_dates.fld_date
			FROM tbl_examinstances
      INNER JOIN tbl_testtypes
      ON tbl_examinstances.fld_typeid = tbl_testtypes.fld_typeid
      INNER JOIN tbl_locations
      ON tbl_examinstances.fld_locationid = tbl_locations.fld_locationid
      INNER JOIN tbl_dates
      ON tbl_examinstances.fld_dateid = tbl_dates.fld_dateid
			WHERE fld_examid = <cfqueryparam value="#arguments.userExam#" cfsqltype="cf_sql_integer" /> 
		</cfquery>
		<cfreturn rsUserTest />
	</cffunction>
</cfcomponent>