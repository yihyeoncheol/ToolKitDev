/****************************************************************************/
/*  TR CODE : BZQ83537 (통합MTS 로그인 처리)                                */
/****************************************************************************/
typedef struct _BZQ83537_IN
{
    char    userid      [ 8];   /* 사용자 ID                    */
    char    userpswd    [ 8];   /* 사용자 PASSWORD              */
    char    meddiv      [ 1];   /* 매체 구분(I:아이폰, A:안드로이드폰, V:시세전용) */
    char    oppsncrtno  [15];   /* IP주소                       */
    char    cmplconndiv [ 1];   /* 강제접속 FLAG                */
} BZQ83537_IN;

typedef struct _BZQ83537_OUT
{
    char    custnm          [40];   /* 고객성명                     */
    char    userdiv         [ 1];   /* 사용자 구분(C:Client,S:STAFF)*/
    char    empno           [ 8];   /* 사원번호                     */
    char    jobbrchno       [ 3];   /* 업무지점번호                 */
    char    screenrgtlmtcd  [ 3];   /* 화면권한코드(101, 109:모든시세권한, 102, 103:주문권한, 199:해외제외시세권한)  */
    char    lgncnt          [ 2];   /* 동일ID 동시 접속자수         */
    char    srvupddiv       [ 1];   /* 서버변경구분(1:변경,2:미변경)*/
    char    svripaddr       [15];   /* 접속서버 IP                  */
    char    pswdupdremdays  [ 2];   /* 비밀번호변경잔존일수(0 ~ 99) */
    char    sysdate         [ 8];   /* SYSTEM 날짜                  */
    char    systime         [ 6];   /* SYSTEM 시간                  */
    char    bizdate         [ 8];   /* BIZ 날짜                     */
    char    teamcd          [ 3];   /* 팀 코드                      */
    char    teamnm          [20];   /* 팀 명                        */
    char    htsipdiv        [ 2];   /* HTS접속서버ip 구분           */
    char    bfmeddiv        [ 1];   /* 직전로그아웃시의 매체구분    */
    char    bflogoutdttime  [14];   /* 직전로그아웃일시(YYYYMMDDHH24MISS) */
    char    useelecsign     [ 1];   /* 공인인증 사용여부 'Y', 'N'   */
    char    query_gb        [ 1];   /* 조회구분 '1':주민번호        */
    /*          '2':법인번호        */
    /*          '3':사원번호        */
    
    char    cust_no         [16];   /* 해당 ID(주민번호, 사업자번호)*/
    char    fundmngrno      [ 3];   /* 펀드매니저 번호(HTS)         */
    char    filler          [15];   /* FILLER                       */
    char    htstermsagreeyn [ 1];   /* HTS약관변경 동의여부(Y/N)
                                     국내정상계좌 미 존재시: Y    */
    char    invtinfocnfmyn [ 1];   /* 투자정보확인 필요여부(Y/N) 법인은: N  */
    char    cmebizdt       [ 8];   /* CME 영업일                    */
    char    cmeyn          [ 1];   /* CME ID여부                    */
    char    frgnbizdt      [ 8];   /* 해외 영업일                   */
} BZQ83537_OUT;


typedef struct _MZQ83537_IN
{
    char    userid      [ 8];   /* 사용자 ID                    */
    char    userpswd    [64];   /* 사용자 PASSWORD              */
    char    meddiv      [ 1];   /* 매체 구분(I:아이폰, A:안드로이드폰, V:시세전용) */
    char    oppsncrtno  [15];   /* IP주소                       */
    char    cmplconndiv [ 1];   /* 강제접속 FLAG                */
} MZQ83537_IN;

typedef struct _MZQ83537_OUT
{
    char    custnm          [40];   /* 고객성명                     */
    char    userdiv         [ 1];   /* 사용자 구분(C:Client,S:STAFF)*/
    char    empno           [ 8];   /* 사원번호                     */
    char    jobbrchno       [ 3];   /* 업무지점번호                 */
    char    screenrgtlmtcd  [ 3];   /* 화면권한코드(101, 109:모든시세권한, 102, 103:주문권한, 199:해외제외시세권한)  */
    char    lgncnt          [ 2];   /* 동일ID 동시 접속자수         */
    char    srvupddiv       [ 1];   /* 서버변경구분(1:변경,2:미변경)*/
    char    svripaddr       [15];   /* 접속서버 IP                  */
    char    pswdupdremdays  [ 2];   /* 비밀번호변경잔존일수(0 ~ 99) */
    char    sysdate         [ 8];   /* SYSTEM 날짜                  */
    char    systime         [ 6];   /* SYSTEM 시간                  */
    char    bizdate         [ 8];   /* BIZ 날짜                     */
    char    teamcd          [ 3];   /* 팀 코드                      */
    char    teamnm          [20];   /* 팀 명                        */
    char    htsipdiv        [ 2];   /* HTS접속서버ip 구분           */
    char    bfmeddiv        [ 1];   /* 직전로그아웃시의 매체구분    */
    char    bflogoutdttime  [14];   /* 직전로그아웃일시(YYYYMMDDHH24MISS) */
    char    useelecsign     [ 1];   /* 공인인증 사용여부 'Y', 'N'   */
    char    query_gb        [ 1];   /* 조회구분 '1':주민번호        */
    /*          '2':법인번호        */
    /*          '3':사원번호        */
    
    char    cust_no         [16];   /* 해당 ID(주민번호, 사업자번호)*/
    char    fundmngrno      [ 3];   /* 펀드매니저 번호(HTS)         */
    char    filler          [15];   /* FILLER                       */
    char    htstermsagreeyn [ 1];   /* HTS약관변경 동의여부(Y/N)
                                     국내정상계좌 미 존재시: Y    */
    char    invtinfocnfmyn [ 1];   /* 투자정보확인 필요여부(Y/N) 법인은: N  */
    char    cmebizdt       [ 8];   /* CME 영업일                    */
    char    cmeyn          [ 1];   /* CME ID여부                    */
    char    frgnbizdt      [ 8];   /* 해외 영업일                   */
} MZQ83537_OUT;

/****************************************************************************/
/*  TR CODE : BAQ18115 (통합MTS 로그인 ID 계좌 정보)                        */
/****************************************************************************/
typedef struct _BAQ18115_IN
{
    char    userid       [ 8];    /* 사용자 ID           */
} BAQ18115_IN;

typedef struct _BAQ18115_OUT
{
    char    display_cnt     [ 5];       /* 조회 리스트 COUNT    */
} BAQ18115_OUT;

typedef struct _BAQ18115_LIST
{
    char    acntdiv      [ 1];    /* 계좌구분(1:국내, 2:해외, 3:FX) */
    char    acntno       [10];    /* 위탁계좌번호(국내: 6자리, 해외/FX:10자리) */
    char    acntnm       [40];    /* 위탁계좌명        */
    char    pswd         [ 8];    /* 비밀번호          */
    char    brchno       [ 3];    /* 지점번호          */
    char    cmssrate     [10];    /* 수수료율          */
    char    fundmngrno   [ 3];    /* 펀드매니저번호    */
    char    fundmngrnm   [30];    /* 펀드매니저명      */
    char    cmeyn        [ 1];    /* CME여부(국내계좌용. 해외/FX:공백) */
} BAQ18115_LIST;

#define     BAQ18115_LIST_SIZE   sizeof(BAQ18115_LIST)
