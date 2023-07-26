[
    {
        type: 'EventFilter',
        api_version: 'core/v2',
        metadata: {
            name: 'fatigue-check',
        },
        spec: {
            action: 'allow',
            expressions: [
                |||
                    (function () {
                        try {
                            var occurrences = 4; // default

                            // Occurrences 閾値の優先順は entity.annotations[<Check名>/occurrences] -> check.annotations.occurrences -> default(4)
                            if (event.check.hasOwnProperty("annotations") && event.check.annotations.hasOwnProperty("occurrences")) {
                                occurrences = parseInt(event.check.annotations["occurrences"], 10);
                            }
                            if (event.entity.hasOwnProperty("annotations") && event.entity.annotations.hasOwnProperty(event.check.name + "/occurrences")) {
                                occurrences = parseInt(event.entity.annotations[event.check.name + "/occurrences"], 10);
                            }

                            return fatigue_check(event, occurrences, 1800, 1);
                        } catch(e) {
                            console.log("Filter Error: name: %(filter_name)s, message: " + e.toString());
                            return false;
                        }
                    })();
                ||| % { filter_name: $.metadata.name },
            ],
            runtime_assets: ['sensu-go-fatigue-check-filter'],
        },
    },
    {
        type: 'Asset',
        api_version: 'core/v2',
        metadata: {
            name: 'sensu-go-fatigue-check-filter',
            annotations: {
                'io.sensu.bonsai.url': 'https://bonsai.sensu.io/assets/sensu/sensu-go-fatigue-check-filter',
                'io.sensu.bonsai.api_url': 'https://bonsai.sensu.io/api/v1/assets/sensu/sensu-go-fatigue-check-filter',
                'io.sensu.bonsai.tier': 'Community',
                'io.sensu.bonsai.version': '0.8.1',
                'io.sensu.bonsai.namespace': 'sensu',
                'io.sensu.bonsai.name': 'sensu-go-fatigue-check-filter',
                'io.sensu.bonsai.tags': '',
            },
        },
        spec: {
            builds: [
                {
                    url: 'https://assets.bonsai.sensu.io/5d3f277dff2847d55d5dcbcbc3db98296991bb67/sensu-go-fatigue-check-filter_0.8.1.tar.gz',
                    sha512: 'd584a9c62631044e8496abca2fd7cdbe724b3b68fb09fe8dcb93da07b73f6a0211a4d6cc20ea23dd9d1ce5a580d409d9cb21e5a227f33dd7ed4c496ec0eba4a0',
                    filters: [],
                },
            ],
        },
    },
]
