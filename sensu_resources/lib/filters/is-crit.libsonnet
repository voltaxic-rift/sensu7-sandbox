[
    {
        type: 'EventFilter',
        api_version: 'core/v2',
        metadata: {
            name: 'is-crit',
        },
        spec: {
            action: 'allow',
            expressions: [
                |||
                    (function () {
                        try {
                            // crit を許可
                            if (event.check.status > 1) {
                                return true;
                            }
                            // crit -> resolved を許可
                            if (event.check.history[event.check.history.length - 2].status > 1 && event.check.status === 0) {
                                return true;
                            }

                            return false;
                        } catch(e) {
                            console.log("Filter Error: name: %(filter_name)s, message: " + e.toString());
                            return false;
                        }
                    })();
                ||| % { filter_name: $.metadata.name },
            ],
        },
    },
]
