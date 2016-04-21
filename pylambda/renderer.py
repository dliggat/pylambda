import time
from jinja2 import Template

class Renderer(object):

  def __init__(self):
    template = Template('HI THERE yo yo {{ name }} it is {{ now }} YO!')
    self.foo = template.render(name='John Doe', now=time.strftime('%c'))

