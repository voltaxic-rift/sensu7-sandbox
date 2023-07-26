[
    {
        type: 'Handler',
        api_version: 'core/v2',
        metadata: {
            name: 'debug',
        },
        spec: {
            command: 'jq . >> /var/log/sensu/debug.json',
            type: 'pipe',
            timeout: 2,
        },
    },
]
