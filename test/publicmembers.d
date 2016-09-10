import painlesstraits;

unittest {
    struct TestStruct
    {
        int i = 5;
        string str = "a";
        long l;
        private double b;
        static ubyte s;

        void foo()
        {
        }

        int bar() @property
        {
            return i;
        }

        this(int j)
        {
            i = j;
        }

        void hello()()
        {
        }
    }

    alias members = allPublicFieldsOrProperties!TestStruct;
    static assert(members.length == 4);
    static assert(members[0] == "i");
    static assert(members[1] == "str");
    static assert(members[2] == "l");
    static assert(members[3] == "bar");

    alias fields = allPublicFields!TestStruct;
    static assert(fields.length == 3);
    static assert(fields[0] == "i");
    static assert(fields[1] == "str");
    static assert(fields[2] == "l");

    TestStruct s = TestStruct(4);
    s.foo();
    int i = s.bar();
    assert(i == 4);
    s.hello();
}

unittest {
    class TestClass
    {
        int i = 5;
        string str = "a";
        long l;
        private double b;
        static ubyte s;

        void foo()
        {
        }

        int bar() @property
        {
            return i;
        }

        this(int j)
        {
            i = j;
        }

        void hello()()
        {
        }
    }

    alias members = allPublicFieldsOrProperties!TestClass;
    static assert(members.length == 4);
    static assert(members[0] == "i");
    static assert(members[1] == "str");
    static assert(members[2] == "l");
    static assert(members[3] == "bar");

    alias fields = allPublicFields!TestClass;
    static assert(fields.length == 3);
    static assert(fields[0] == "i");
    static assert(fields[1] == "str");
    static assert(fields[2] == "l");

    TestClass s = new TestClass(4);
    s.foo();
    int i = s.bar();
    assert(i == 4);
    s.hello();
}
