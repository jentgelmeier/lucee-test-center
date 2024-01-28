<!---begin header--->
<cfparam name="attributes.title" default="Test Center - Login" >
<cfif thistag.executionMode EQ 'start'>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="utf-8" />
  <title><cfoutput>#attributes.title#</cfoutput></title>
  <link href="/assets/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/assets/css/index.css" rel="stylesheet" />
  <link rel="icon" type="image/png" href="/luceeIncluded/favicon.ico">
  </head>

  <body>
    <div id="wrapper">
      <div id="header">
        <img src="luceeIncluded/assets/img/lucee-logo.png" alt="logo"/>
        <span class="fs-2 text-light ms-3" style="vertical-align: -20px">Test Center</span>
      </div>
      <div id="section">
<!---end header--->
<cfelse>
<!---begin footer--->
      </div>
      <footer id="myFooter">
        <div class="row">
          <div class="col-md-3 col-sm-4">
            <img src="/luceeIncluded/assets/img/lucee-logo.png" alt="Lucee">
          </div>
          <div class="col-md-5 col-sm-4 pt-3">
            <p class="text-light">2023 - Jason Entgelmeier</p>
          </div>
        </div>
      </footer>
    </div>
  </body>
  </html>
</cfif>
<!---end footer--->
