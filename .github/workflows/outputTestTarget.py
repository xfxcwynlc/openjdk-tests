import sys
import os
import ast

def main():
  print(ast.literal_eval(os.getenv('TARGET_LIST')))

if __name__ == "__main__":
  main()
