import yaml
from graphviz import Digraph

dot = Digraph(comment='ChargeGrid dependencies')


with open("docker-compose.yml", 'r') as dc_file:
    yml = yaml.load(dc_file)
    services = yml['services']
    for name, definition in services.iteritems():
        dot.node(name)
        deps = definition.get('links', []) + definition.get('depends_on', []) + \
            definition.get('volumes_from', [])
        for d in deps:
            d_name = d.split(":")[0]
            dot.edge(name, d_name)
    dot.render('depencencies', view=True)
