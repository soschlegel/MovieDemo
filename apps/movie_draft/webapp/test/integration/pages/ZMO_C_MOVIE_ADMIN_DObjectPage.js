sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.demo.moviedraft',
            componentId: 'ZMO_C_MOVIE_ADMIN_DObjectPage',
            contextPath: '/ZMO_C_MOVIE_ADMIN_D'
        },
        CustomPageDefinitions
    );
});