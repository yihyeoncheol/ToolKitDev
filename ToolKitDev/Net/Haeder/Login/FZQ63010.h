/****************************************************************************/
/*  TR CODE : FZQ63010  위변조 토큰 전송 TR            */
/****************************************************************************/
typedef struct _FZQ63010_IN
{
    char    tokenKey          [ 50];   /* 토큰키                              */
} FZQ63010_IN;

typedef struct _FZQ63010_OUT
{
    char    authStr [1];            /* Y: 인증 N:미인증 */
    char    expired [1];            /* Y: 만료 N:미만료 */
    char    createTime[19];         /* 생성날짜 yyyyMMdd/HHmmssSSS */
    char    lastAccessTime[19];     /* 만료날짜 yyyyMMdd/HHmmssSSS */
    char    tokenKey[50];           /* 토큰키 */
} FZQ63010_OUT;
