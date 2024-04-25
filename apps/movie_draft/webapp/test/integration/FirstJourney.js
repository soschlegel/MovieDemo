sap.ui.define([
    "sap/ui/test/opaQunit"
], function (opaTest) {
    "use strict";

    var Journey = {
        run: function() {
            QUnit.module("First journey");

            opaTest("Start application", function (Given, When, Then) {
                Given.iStartMyApp();

                Then.onTheZMO_C_MOVIE_ADMIN_DList.iSeeThisPage();

            });


            opaTest("Navigate to ObjectPage", function (Given, When, Then) {
                // Note: this test will fail if the ListReport page doesn't show any data
                
                When.onTheZMO_C_MOVIE_ADMIN_DList.onFilterBar().iExecuteSearch();
                
                Then.onTheZMO_C_MOVIE_ADMIN_DList.onTable().iCheckRows();

                When.onTheZMO_C_MOVIE_ADMIN_DList.onTable().iPressRow(0);
                Then.onTheZMO_C_MOVIE_ADMIN_DObjectPage.iSeeThisPage();

            });

            opaTest("Teardown", function (Given, When, Then) { 
                // Cleanup
                Given.iTearDownMyApp();
            });
        }
    }

    return Journey;
});