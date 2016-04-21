import os
import time
from jinja2 import Template
from jinja2 import Environment, FileSystemLoader

class Renderer(object):

  def __init__(self):
    env = Environment(loader=FileSystemLoader(os.path.join(os.path.dirname(__file__),
                      'templates')))
    self.template = env.get_template('message.txt')

  def render(self):
    return self.template.render(name='John Doe', now=time.strftime('%c'))
