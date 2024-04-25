sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.demo.moviedraft',
            componentId: 'ZMO_C_MOVIE_ADMIN_DList',
            contextPath: '/ZMO_C_MOVIE_ADMIN_D'
        },
        CustomPageDefinitions
    );
});