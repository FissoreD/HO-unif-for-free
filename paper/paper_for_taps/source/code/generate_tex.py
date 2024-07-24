import os, sys, re

def get_file_cnt(lines):
    res = []
    try:
        indexBegin = lines.index("%BEGIN\n")
        indexEnd = lines.index("%END\n")
        res = lines[indexBegin+1:indexEnd]
    finally:
        return res


def print_tex(lines, fout, raw = False):
    with open(fout, "w") as f:
        if not raw:
            f.write("\\begin{elpicode}\n")
        for l in lines:
            l = re.sub("^ *% +.*\n","",l)   
            l = re.sub("%~(.*)",r"~\g<1>",l)   
            l = re.sub("^ *%SNIP.*\n","",l)   
            l = re.sub("^ *%ENDSNIP.*\n","",l)   
            l = re.sub("^ *%%%.*\n","",l)   
            l = re.sub("==l",r"~$\\Ue$~",l) 
            l = re.sub("===o",r"~$\\Uo$~",l)
            l = re.sub("==o",r"~$\\Eo$~",l)
            l = re.sub(".*% *HIDE.*\n","",l)
            l = re.sub("% label: (.*).* cnt: (.*)",r"~\\customlabel{\g<1>}{(\g<2>)}~",l)
            l = re.sub("type \(~\$([^ ]+)\$~\) ([^\.]+)",r"~\\PYG{k+kd}{type} \\PYG{n+nf}{(\g<1>)} \\PYG{k+kt}{\g<2>}~",l)
            l = re.sub("type (\([^ ]+\)) ([^\.]+)",r"~\\PYG{k+kd}{type} \\PYG{n+nf}{\g<1>} \\PYG{k+kt}{\g<2>}~",l)
            f.write(l)
        if not raw:
            f.write("\\end{elpicode}\n")

def mk_fname(fname):
    return fname.split("/")[-1][:-4] + "tex"

def get_snippets(lines):
    snips = {}
    ingrp = False
    name = ""
    curgrp = []
    for l in lines:
        m = re.match(r"^%ENDSNIP",l)
        if not (m is None):
            snips[name] = curgrp
            ingrp = False
            curgrp = []
        if ingrp is True:
            curgrp = curgrp + [l]
        m = re.match(r"^%SNIP: *(.*) *$",l)
        if not (m is None):
            ingrp = True
            name = m.group(1)
            if name in snips:
                curgrp = snips[name]
            else:
                curgrp = []
    return snips

def read_file(fname):
    with open(fname) as f:
        lines = f.readlines()
        print_tex(get_file_cnt(lines), mk_fname(fname))
        snippets = get_snippets(lines)
        for fname in snippets:
            lines = snippets[fname]
            print_tex(lines, fname + ".tex")
            print_tex(lines, fname + "_raw.tex", True)

        
if __name__ == "__main__":
    fname = sys.argv[1]
    # print(sys.argv)
    read_file(fname)
