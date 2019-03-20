typedef struct pointinfo
{
    int x1;
    int y1;
    int x2;
    int y2;
    int x3;
    int y3;
    int dist1;
    int dist2;
    int dist3;
} POINTINFO;

int location(struct pointinfo * pInfo);
int open_serial(char * dev_name);
void get_coordinate(int *x,int *y);
void cal_coordinate(void);
void close_serial(void);
