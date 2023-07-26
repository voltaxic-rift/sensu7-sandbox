local template = import '../templates/check.libsonnet';

[
    {
        type: 'CheckConfig',
        api_version: 'core/v2',
        metadata: {
            name: 'cpu-usage',
        },
        spec: {
            command: |||
                check-cpu-usage \
                -w {{ index .annotations "cpu-usage/warning" | default 9223372036854775806 }} \
                -c {{ index .annotations "cpu-usage/critical" | default 9223372036854775807 }}
            |||,
            output_metric_format: 'nagios_perfdata',
            pipelines: template.pipelines,
            runtime_assets: ['check-cpu-usage'],
            subscriptions: ['linux'],
            interval: 60,
            publish: true,
        },
    },
    {
        type: 'CheckConfig',
        api_version: 'core/v2',
        metadata: {
            name: 'cpu-time',
        },
        spec: {
            command: 'check-cpu-time',
            output_metric_format: 'prometheus_text',
            pipelines: template.pipelines,
            runtime_assets: ['check-cpu-time'],
            subscriptions: ['linux'],
            interval: 60,
            publish: true,
        },
    },
    {
        type: 'Asset',
        api_version: 'core/v2',
        metadata: {
            name: 'check-cpu-usage',
            annotations: {
                'io.sensu.bonsai.url': 'https://bonsai.sensu.io/assets/sensu/check-cpu-usage',
                'io.sensu.bonsai.api_url': 'https://bonsai.sensu.io/api/v1/assets/sensu/check-cpu-usage',
                'io.sensu.bonsai.tier': 'Community',
                'io.sensu.bonsai.version': '0.2.2',
                'io.sensu.bonsai.namespace': 'sensu',
                'io.sensu.bonsai.name': 'check-cpu-usage',
                'io.sensu.bonsai.tags': '',
            },
        },
        spec: {
            builds: [
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_windows_amd64.tar.gz',
                    sha512: '900cfdf28d6088b929c4bf9a121b628971edee5fa5cbc91a6bc1df3bd9a7f8adb1fcfb7b1ad70589ed5b4f5ec87d9a9a3ba95bcf2acda56b0901406f14f69fe7',
                    filters: [
                        "entity.system.os == 'windows'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_darwin_amd64.tar.gz',
                    sha512: 'db81ee70426114e4cd4b3f180f2b0b1e15b4bffc09d7f2b41a571be2422f4399af3fbd2fa2918b8831909ab4bc2d3f58d0aa0d7b197d3a218b2391bb5c1f6913',
                    filters: [
                        "entity.system.os == 'darwin'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_linux_armv7.tar.gz',
                    sha512: '400aacce297176e69f3a88b0aab0ddfdbe9dd6a37a673cb1774c8d4750a91cf7713a881eef26ea21d200f74cb20818161c773490139e6a6acb92cbd06dee994c',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'armv7'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_linux_arm64.tar.gz',
                    sha512: 'bef7802b121ac2a2a5c5ad169d6003f57d8b4f5e83eae998a0e0dd1e7b89678d4a62e678d153edacdd65fd1d0123b5f51308622690455e77cec6deccfa183397',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_linux_386.tar.gz',
                    sha512: 'a2dcb5324952567a61d76a2e331c1c16df69ef0e0b9899515dad8d1531b204076ad0c008f59fc2f4735a5a779afb0c1baa132268c41942b203444e377fe8c8e5',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == '386'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/a7ced27e881989c44522112aa05dd3f25c8f1e49/check-cpu-usage_0.2.2_linux_amd64.tar.gz',
                    sha512: '24539739b5eb19bbab6eda151d0bcc63a0825afdfef3bc1ec3670c7b0a00fbbb2fd006d605a7a038b32269a22026d8947324f2bc0acdf35e8563cf4cb8660d7f',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
            ],
        },
    },
    {
        type: 'Asset',
        api_version: 'core/v2',
        metadata: {
            name: 'check-cpu-time',
            annotations: {
                'io.sensu.bonsai.url': 'https://bonsai.sensu.io/assets/jadiunr/check-cpu-time',
                'io.sensu.bonsai.api_url': 'https://bonsai.sensu.io/api/v1/assets/jadiunr/check-cpu-time',
                'io.sensu.bonsai.tier': 'Community',
                'io.sensu.bonsai.version': '0.0.1',
                'io.sensu.bonsai.namespace': 'jadiunr',
                'io.sensu.bonsai.name': 'check-cpu-time',
                'io.sensu.bonsai.tags': '',
            },
        },
        spec: {
            builds: [
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_windows_amd64.tar.gz',
                    sha512: 'fb46e2b209d11f8f9fd7d2ce2dc01578ef65609d31816b9d55d86663c4ff5a6ae912e5647862f898270763ef1920155d0922c117f3cd57fdf09e6b4da2270920',
                    filters: [
                        "entity.system.os == 'windows'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_darwin_amd64.tar.gz',
                    sha512: '47f79659414aa6bd4ee168f21fc8b15008fc2520fdbb798c71baacdf97c70f6562221c3ad1b11a16c639e1b44d8df619778209d59f57f60d7e48b8d1ce7620d3',
                    filters: [
                        "entity.system.os == 'darwin'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_linux_armv6.tar.gz',
                    sha512: 'd4fd5b8e6dd96f445a507a743b38c2f672b085ea9eb4781334fc03c2df08cb8688e7d33ad1ff56ab3a6fc0b5325a6da0cf884ad88e73d5366df80ffb61dbe2e8',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm'",
                        'entity.system.arm_version == 6',
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_linux_armv7.tar.gz',
                    sha512: '385a9f4f9d527c25a5bfb8f8cfb88a31acf4020fd86a9a191477799a7d0191024d6968db80524f70b70bebb9478c6550e17574692886023d36c317604293a70a',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm'",
                        'entity.system.arm_version == 7',
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_linux_arm64.tar.gz',
                    sha512: 'f1f03f6c6277ea81979a34475539c4b733c9337fd7f5b102332834cdb5b5d2af0aabcb12f007df570daa57b840ca0d930d455f15e667fc0bc2eb4868142f557e',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'arm64'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_linux_386.tar.gz',
                    sha512: 'f1085f60c86e3035a0d343dec363bdd41ae35eb36826d263d7fdbc41b464b5d74374cb7143538681d241ac8a0030e761c35735703881c30c2dde1e1c4160ddfc',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == '386'",
                    ],
                },
                {
                    url: 'https://assets.bonsai.sensu.io/4e1216090a50f924f3e62e743dc161f459b8aa34/check-cpu-time_0.0.1_linux_amd64.tar.gz',
                    sha512: '02f0256f42ca5668ec7410c3c4f75ecd578bd8c06fa5b0d8323688e46c34d080cddc8f907669b4d68f4718c0b892a6c09dc36a30b4de9e9924415397d7226a44',
                    filters: [
                        "entity.system.os == 'linux'",
                        "entity.system.arch == 'amd64'",
                    ],
                },
            ],
        },
    },
]
