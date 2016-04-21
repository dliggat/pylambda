from jinja2 import Template

class Renderer(object):

  def __init__(self):
    template = Template('Hello {{ name }}!')
    self.foo = template.render(name='John Doe')

