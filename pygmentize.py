#! /usr/bin/env python
import argparse
import sys
import pygments.cmdline as _cmdline
import pygments.lexer as _lexer
import pygments.token as _token

def main(args):
    parser = argparse.ArgumentParser()
    parser.add_argument('-l', dest='lexer', type=str)
    opts, rest = parser.parse_known_args(args[1:])
    if opts.lexer == 'ssh_config':
        args = [__file__, '-l', __file__ + ':SSHConfigLexer', '-x', *rest]
    if args[2] == "elpi": 
        args[2] = './elpi.py:ElpiLexer'
    _cmdline.main(args + ['-x'])


class SSHConfigLexer(_lexer.RegexLexer):
    name = 'ssh_config'
    tokens = {
        'root': [
            (r'(\s*Host)( .*\n)', _lexer.bygroups(
                _token.Keyword, _token.String)),
            (r'(\s*\w*)( ?.*\n)', _lexer.bygroups(
                _token.Name.Attribute, _token.String)),
        ],
    }

def isEmptyLine(x: str):
    return x.lstrip(' ') == '\n'

def getSpaceOfLine(x: str):
    if isEmptyLine(x): 
        return float('inf')
    return len(x) - len(x.lstrip(' '))

def getMinSpace(l):
    mLen = min(map(getSpaceOfLine, l))
    return [line[mLen:] if not(isEmptyLine(line)) else "\n" for line in l]

import os

if __name__ == '__main__':
    f_name = ".aux/" + list(filter(lambda x: x.endswith("pyg"), os.listdir(".aux")))[0]
    with open(f_name) as X:
        lines = X.readlines()
    with open(f_name, "w") as X:
        X.write("".join(getMinSpace(lines)))
    # with open("tt.txt", "w") as DUMP:
    #     DUMP.write(str(os.listdir()))
    #     DUMP.write("".join(getMinSpace(lines)))
    main(sys.argv)