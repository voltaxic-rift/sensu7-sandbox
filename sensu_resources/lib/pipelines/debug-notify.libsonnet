local filters(priority) =
    [
        {
            type: 'EventFilter',
            api_version: 'core/v2',
            name: 'is_incident',
        },
        {
            type: 'EventFilter',
            api_version: 'core/v2',
            name: 'not_silenced',
        },
        {
            type: 'EventFilter',
            api_version: 'core/v2',
            name: 'is-' + priority,
        },
        {
            type: 'EventFilter',
            api_version: 'core/v2',
            name: 'fatigue-check',
        },
    ];

[
    {
        type: 'Pipeline',
        api_version: 'core/v2',
        metadata: {
            name: 'debug-notify',
        },
        spec: {
            workflows: [
                {
                    name: 'send-warn',
                    filters: filters('warn'),
                    handler: {
                        type: 'Handler',
                        api_version: 'core/v2',
                        name: 'warn-debug',
                    },
                },
                {
                    name: 'send-crit',
                    filters: filters('crit'),
                    handler: {
                        type: 'Handler',
                        api_version: 'core/v2',
                        name: 'crit-debug',
                    },
                },
                {
                    name: 'send',
                    filters: [
                        {
                            type: 'EventFilter',
                            api_version: 'core/v2',
                            name: 'has_metrics',
                        },
                    ],
                    handler: {
                        type: 'Handler',
                        api_version: 'core/v2',
                        name: 'debug',
                    },
                },
            ],
        },
    },
]
