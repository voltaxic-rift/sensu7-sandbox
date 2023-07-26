[
    {
        type: 'Handler',
        api_version: 'core/v2',
        metadata: {
            name: 'mimir',
        },
        spec: {
            command: 'sensu-prometheus-remote-write-handler -i -e http://localhost:9009/api/v1/push -H "X-Scope-OrgID: hogehoge"',
            type: 'pipe',
            runtime_assets: ['sensu-prometheus-remote-write-handler'],
        },
    },
    {
        type: 'Asset',
        api_version: 'core/v2',
        metadata: {
            name: 'sensu-prometheus-remote-write-handler',
            labels: null,
            annotations: {
                'io.sensu.bonsai.url': 'https://bonsai.sensu.io/assets/jadiunr/sensu-prometheus-remote-write-handler',
                'io.sensu.bonsai.api_url': 'https://bonsai.sensu.io/api/v1/assets/jadiunr/sensu-prometheus-remote-write-handler',
                'io.sensu.bonsai.tier': 'Community',
                'io.sensu.bonsai.version': '0.2.0',
                'io.sensu.bonsai.namespace': 'jadiunr',
                'io.sensu.bonsai.name': 'sensu-prometheus-remote-write-handler',
                'io.sensu.bonsai.tags': '',
            },
        },
        spec: {
            builds: [
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_windows_amd64.tar.gz',
                    sha512: '608a447bef403f1d2a00bffc126ee44574a47d316a5bb37a1b2e508997dfeec1777970772a5b6e1b6c2b4bb31b82eaadf15dded585496b3eba6006831452fbf5',
                    filters: [
                        "entity.system.os == 'windows'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_darwin_amd64.tar.gz',
                    sha512: '5764628b02c5b337cd44e793094006b3eba3d435cae44307f285b212e65ba9c5f8fd66eead60c9147f7e9f08318487ea198e12812b73bcd7a156f3bea05f098d',
                    filters: [
                        "entity.system.os == 'darwin'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_linux_armv6.tar.gz',
                    sha512: 'aa43561b7b231e1228856d081edc62ed1844608be6e0789a14303f4a3137d4ebbfdb6d5926ecd6cb2c159332d922ab03f2789c27b4208c612f26c3df6fb56cca',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm'",
                        'entity.system.arm_version == 6',
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_linux_armv7.tar.gz',
                    sha512: '870b308124a3ee29d205dbf5683263e60a2801e88193c3ccaf45d9f7aeabe4604e4c12c5ba8aca83f0dfa133f843321c52cd100e8237e082c32311bd8c7144d0',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm'",
                        'entity.system.arm_version == 7',
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_linux_arm64.tar.gz',
                    sha512: 'a4a8b8aebd58667dfd1e6949f6fc0cfd6ae27d03636b0b32622450566ed30bb03057fb35e4976ac9bd296d1f3d9180b4f2088d23d26f7490514fd2fba27dbb57',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_linux_386.tar.gz',
                    sha512: 'ac5ed63eb59acc1ed2705a01a7cabd383de93ab6ba93a3d14bfe7c44b6d814f1eb6e1f7b5cf3441a3d61386659d893bc2d20d116a6fe1a1a2a6efd239c250953',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == '386'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/b718baa1b514de7eaa974a92791f805fc10077d3/sensu-prometheus-remote-write-handler_0.2.0_linux_amd64.tar.gz',
                    sha512: 'd9a92c485110cc3d35520edd69b60eae7c6e1f04705be9712af2a8a2de0dab2caa62baba42fc13c7b1d86a93d62b17e18d2a42240ff7769294c6462fe9eb5327',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
            ],
        },
    },
]
