[
    {
        type: 'Pipeline',
        api_version: 'core/v2',
        metadata: {
            name: 'mimir',
        },
        spec: {
            workflows: [
                {
                    name: 'send-metrics-to-mimir',
                    filters: [
                        {
                            name: 'has_metrics',
                            type: 'EventFilter',
                            api_version: 'core/v2',
                        },
                    ],
                    handler: {
                        name: 'mimir',
                        type: 'Handler',
                        api_version: 'core/v2',
                    },
                },
            ],
        },
    },
]
