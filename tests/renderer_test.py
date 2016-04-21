
import unittest

# from .context import pylambda
from pylambda import renderer as r

# Here's our "unit".
def IsOdd(n):
    return n % 2 == 1

# Here's our "unit tests".
class IsOddTests(unittest.TestCase):

    def testOne(self):
        self.failUnless(IsOdd(1))

    def testTwo(self):
        self.failIf(IsOdd(2))

    def testBlar(self):
        a = r.Renderer()
        print(a.foo)

def main():
    unittest.main()

if __name__ == '__main__':
    main()
