/****************************************************************************
 *  TR CODE : ATQ39814 ( 금감원 지시로 MTS 기록 남기는 TR, 시세접속시에도 남김 )
 ****************************************************************************/

typedef struct _ATQ39814_CIN
{
    char    meddiv          [ 1];   /* 매체구분 I : 아이폰   */
    char    userid          [ 8];   /* 사용자 ID */
    char    udid            [45];   /* UUID */
    char    systemname      [20];   /* iPhone, iPod Touch 등 기종명*/
    char    osversion       [10];   /* OS Version */
} ATQ39814_CIN;

typedef struct _ATQ39814_COUT
{
    char    smartordyn          [ 1];   /* 서버처리 Y, N */
} ATQ39814_COUT;


/*
 
* 안드로이드의 경우도 매체구분은 I입력.
* 안드로이드의 경우 udid는 usim 정보 등을 적절히 조합해 unique 한 정보를 생성해 사용.
* 안드로이드의 경우 systemname에 ANDROID + 기종명 쓸 것.

*/
