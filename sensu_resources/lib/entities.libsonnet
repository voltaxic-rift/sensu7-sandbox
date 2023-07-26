local template = import 'templates/entity.libsonnet';

[
    template.linux('monitor1', subscriptions=['monitor']),
    template.linux('monitor2', subscriptions=['monitor']),
    template.linux('monitor3', subscriptions=['monitor']),
    // template.linux('agent1'),
    // template.linux('agent2'),
    // template.linux('agent3'),
    // template.linux('agent-c6'),
]
