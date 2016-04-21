from pylambda import renderer as r

def my_handler(event, context):
  a = r.Renderer()
  print a.foo

if __name__ == '__main__':
  my_handler(None, None)
