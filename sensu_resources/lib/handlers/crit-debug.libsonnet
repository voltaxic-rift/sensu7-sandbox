[
    {
        type: 'Handler',
        api_version: 'core/v2',
        metadata: {
            name: 'crit-debug',
        },
        spec: {
            command: 'jq . >> /var/log/sensu/crit-log.json',
            type: 'pipe',
            timeout: 2,
        },
    },
]
