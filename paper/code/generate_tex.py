import os, sys, re

def get_file_cnt(lines):
    indexBegin = lines.index("%BEGIN\n")
    indexEnd = lines.index("%END\n")
    return lines[indexBegin+1:indexEnd]

def print_tex(lines, fout):
    with open(fout, "w") as f:
        f.write("\\begin{elpicode}\n")
        for l in lines:
            l = re.sub("^ *% +.*\n","",l)
            l = re.sub("^ *%%%.*\n","",l)
            l = re.sub("==l",r"~$\\Ue$~",l)
            l = re.sub("==o",r"~$\\Eo$~",l)
            l = re.sub(".*% *HIDE.*\n","",l)
            l = re.sub("type \(~\$([^ ]+)\$~\) (.*)\.$",r"~\\PYG{k+kd}{type} \\PYG{n+nf}{(\g<1>)} \\PYG{k+kt}{\g<2>}~.",l)
            l = re.sub("type (\([^ ]+\)) (.*)\.$",r"~\\PYG{k+kd}{type} \\PYG{n+nf}{\g<1>} \\PYG{k+kt}{\g<2>}~.",l)
            f.write(l)
        f.write("\\end{elpicode}\n")

def mk_fname(fname):
    return fname.split("/")[-1][:-4] + "tex"

def read_file(fname):
    with open(fname) as f:
        lines = f.readlines()
        print_tex(get_file_cnt(lines), mk_fname(fname))
        
if __name__ == "__main__":
    fname = sys.argv[1]
    # print(sys.argv)
    read_file(fname)
