(好文，笔记都是精髓)[https://github.com/JeremyLiao/android-gradle-study]


int f(int i,int m){
    if(a[i][m]==1){
        return 0;
    }
    int num = 0;
    if(a[1][m-1]==0){
        num += f(1,m-1)
    }
    if(a[0][m-1]==0){
        num += f(0,m-1)
    }
    return num; 
}
