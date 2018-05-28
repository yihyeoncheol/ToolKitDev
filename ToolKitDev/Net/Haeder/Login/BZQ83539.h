/****************************************************************************/
/*  TR CODE : BZQ83539  통합MTS 세미로그인용 유효ID검증               */
/****************************************************************************/
typedef struct _BZQ83539_IN
{
    char    userid          [ 8];   /* HTS ID                               */
} BZQ83539_IN;

typedef struct _BZQ83539_OUT
{
    char    retflag [1];        /* 구분flag 0:불가 1:가능 */
    char    cmebizdt       [ 8];   /* CME 영업일                   */
    char    frgnbizdt      [ 8];   /* 해외 영업일                   */
    char    bizdate         [ 8];   /* BIZ 날짜 (국내영업일)         */
} BZQ83539_OUT;