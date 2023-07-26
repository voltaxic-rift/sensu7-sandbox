[
    {
        type: 'EventFilter',
        api_version: 'core/v2',
        metadata: {
            name: 'is-warn',
        },
        spec: {
            action: 'allow',
            // warn のみ許可
            expressions: ['event.check.status === 1'],
        },
    },
]
