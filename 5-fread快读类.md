```cpp
#include <bits/stdc++.h>
using namespace std;

struct MY_IO{
#define DEBUG 1///本地调试
#define MAXSIZE (1 << 20)
    inline bool isdigit(const char &x) { return x >= '0' && x <= '9'; }//字符集 看情况改
    inline bool blank(const char &c) { return c == ' ' || c == '\n' || c == '\r' || c == '\t'; }
#if DEBUG //
#else     //
    char buf[MAXSIZE + 3], *p1, *p2, pbuf[MAXSIZE + 3], *pp;
    MY_IO() : p1(buf), p2(buf), pp(pbuf) {}
    ~MY_IO() { fwrite(pbuf, 1, pp - pbuf, stdout); }
#endif    //

    inline char gc(){
#if DEBUG                 //
        return getchar(); //
#else                     //
        if (p1 == p2)
            p2 = (p1 = buf) + fread(buf, 1, MAXSIZE, stdin);
        return p1 == p2 ? EOF : *p1++;
#endif                    //
    }
    
    inline void pc(const char &c){
#if DEBUG           //
        putchar(c); //
#else               //
        if (pp - pbuf == MAXSIZE)
            fwrite(pbuf, 1, MAXSIZE, stdout), pp = pbuf;
        *pp++ = c;
#endif              //
    }
    
    template<typename T>inline bool read(T &x){
        x = 0; char c = gc(); int f = 1;
        while (!isdigit(c) && (c != '-') && (c != EOF)) c = gc();
        if (c == EOF) return 0;
        if (c == '-') f = -1, c = gc();
        while (isdigit(c)) {x = x * 10 + (c & 15); c = gc();}
        x *= f; return 1;
    }
    
    template<typename T, typename... Args>inline bool read(T &x, Args &...args){
        bool res = 1; res &= read(x); res &= read(args...); return res;
    }
    
    inline int gets(char *s){
        char c = gc(); while (blank(c) && c != EOF) c = gc();
        if (c == EOF) return 0; 
        int len = 0; 
        while (!blank(c) && c != EOF) *s++ = c, c = gc(), ++len;
        *s = 0; return len;
    }

    inline void getc(char &c){for (c = gc(); blank(c) && c != EOF; c = gc());}

    /*不能输出(int)(-2^31)*/template<typename T>inline void write(T x){
        if (x < 0) x = -x, pc('-');
        static T sta[233];
        int top = 0;
        do{
            sta[top++] = x % 10, x /= 10;
        } while (x);
        while (top) pc(sta[--top] + '0');
    }

    template <typename T>inline void write(T x, const char &Lastchar){write(x); pc(Lastchar);}

    inline void puts(char *s){while ((*s) != 0)pc(*s++);}

    inline int getline(char *s){
        char c = gc();
        int len = 0;
        while (c != '\n' && c != EOF) *s++ = c, c = gc(), ++len;
        *s = 0; return len;
    }

    inline void putline(char *s){while ((*s) != 0)pc(*s++); pc('\n');}
}IO;
#define read IO.read
#define write IO.write
#define gc IO.gc
#define pc IO.pc
#define gets IO.gets
#define getc IO.getc
#define puts IO.puts
#define getl IO.getline
#define putl IO.putline
```
