import os, sys

def get_file_cnt(lines):
    indexBegin = lines.index("%BEGIN\n")
    indexEnd = lines.index("%END\n")
    return lines[indexBegin+1:indexEnd]

def print_tex(lines, fout):
    with open(fout, "w") as f:
        f.write("\\begin{elpicode}\n")
        f.write("".join(lines))
        f.write("\\end{elpicode}\n")

def mk_fname(fname):
    return fname[:-4] + "tex"

def read_file(fname):
    with open("../../code/deep/" + fname) as f:
        lines = f.readlines()
        print_tex(get_file_cnt(lines), mk_fname(fname))
        
if __name__ == "__main__":
    fname = sys.argv[1]
    # print(sys.argv)
    read_file(fname)
