import time
from jinja2 import Template

class Renderer(object):

  def __init__(self):
    template = Template('Good afternoon {{ name }} it is {{ now }} ')
    self.foo = template.render(name='John Doe', now=time.strftime('%c'))

