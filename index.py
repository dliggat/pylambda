from pylambda import Renderer

def my_handler(event, context):
  a = Renderer()
  print a.foo

if __name__ == '__main__':
  my_handler(None, None)
