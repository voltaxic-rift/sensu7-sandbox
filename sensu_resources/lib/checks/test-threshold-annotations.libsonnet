local template = import '../templates/check.libsonnet';

[
    {
        type: 'CheckConfig',
        api_version: 'core/v2',
        metadata: {
            name: 'test-threshold-annotations',
        },
        spec: {
            command: |||
                cat << 'EOS'
                test_metric value=250
                EOS
            |||,
            output_metric_format: 'influxdb_line',
            output_metric_thresholds: [
                {
                    name: 'test_metric.value',
                    null_status: 2,
                    thresholds: [
                        {
                            min: '100',
                            max: '500',
                            status: 2,
                        },
                    ],
                },
            ],
            pipelines: template.pipelines,
            subscriptions: ['linux'],
            interval: 60,
            publish: true,
        },
    },
]
