[
    {
        type: 'Handler',
        api_version: 'core/v2',
        metadata: {
            name: 'warn-debug',
        },
        spec: {
            command: 'jq . >> /var/log/sensu/warn-log.json',
            type: 'pipe',
            timeout: 2,
        },
    },
]
