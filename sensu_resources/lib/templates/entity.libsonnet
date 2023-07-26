local base(name, labels, annotations, subscriptions) = {
    type: 'Entity',
    api_version: 'core/v2',
    metadata: {
        name: name,
        labels: labels,
        annotations: annotations,
    },
    spec: {
        entity_class: 'agent',
        user: 'agent',
        redact: [
            'password',
            'passwd',
            'pass',
            'api_key',
            'api_token',
            'access_key',
            'secret_key',
            'private_key',
            'secret',
        ],
        subscriptions: [
            'entity:' + name,
        ] + subscriptions,
    },
};

{
    linux(name, labels={}, annotations={}, subscriptions=[])::
        base(name, labels, annotations, subscriptions=subscriptions + ['linux']),

    loadit_agent(name, labels={}, annotations={}, subscriptions=[])::
        base(name, labels, annotations, subscriptions=subscriptions + ['loadit']),
}
