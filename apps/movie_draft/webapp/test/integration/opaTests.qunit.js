sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/demo/moviedraft/test/integration/FirstJourney',
		'com/demo/moviedraft/test/integration/pages/ZMO_C_MOVIE_ADMIN_DList',
		'com/demo/moviedraft/test/integration/pages/ZMO_C_MOVIE_ADMIN_DObjectPage'
    ],
    function(JourneyRunner, opaJourney, ZMO_C_MOVIE_ADMIN_DList, ZMO_C_MOVIE_ADMIN_DObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/demo/moviedraft') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZMO_C_MOVIE_ADMIN_DList: ZMO_C_MOVIE_ADMIN_DList,
					onTheZMO_C_MOVIE_ADMIN_DObjectPage: ZMO_C_MOVIE_ADMIN_DObjectPage
                }
            },
            opaJourney.run
        );
    }
);