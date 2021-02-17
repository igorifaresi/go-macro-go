{
    if ($1 == "%%assert") {
        {
            split($0,a,"%%assert");
            split(a[2], b, ";")
            print a[1]"if err != nil {\n"a[1]"\tl.Error(err.Error())\n"a[1]"\tv :="b[1]"\n"a[1]"\tl.Error(v)\n"a[1]"\treturn "b[2]"\n"a[1]"}"
            ;
        }
    } else {
        print $0;
    }
}
