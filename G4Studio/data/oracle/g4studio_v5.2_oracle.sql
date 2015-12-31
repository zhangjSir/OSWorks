pprompt PL/SQL Developer import file
prompt Created on 2013��4��6�� by Administrator
set feedback off
set define off
prompt Creating EACODE...
create table EACODE
(
  field     VARCHAR2(15) not null,
  fieldname VARCHAR2(20) not null,
  code      VARCHAR2(10) not null,
  codedesc  VARCHAR2(100) not null,
  enabled   VARCHAR2(2) default '1' not null,
  editmode  VARCHAR2(2) default '1' not null,
  sortno    NUMBER,
  remark    VARCHAR2(200),
  codeid    VARCHAR2(8) not null
)
;
comment on table EACODE
  is '������ձ�';
comment on column EACODE.field
  is '�����ֶ�';
comment on column EACODE.fieldname
  is '�����ֶ�����';
comment on column EACODE.code
  is '����';
comment on column EACODE.codedesc
  is '��������';
comment on column EACODE.enabled
  is '����״̬(0:����;1:����)';
comment on column EACODE.editmode
  is '�༭ģʽ(0:ֻ��;1:�ɱ༭)';
comment on column EACODE.sortno
  is '�����';
comment on column EACODE.remark
  is '��ע';
comment on column EACODE.codeid
  is '����ID';
create unique index INDEX_EACODE on EACODE (FIELD, CODE);
alter table EACODE
  add constraint PK_EACODE primary key (CODEID);

prompt Creating EADEPT...
create table EADEPT
(
  deptid   VARCHAR2(100) not null,
  deptname VARCHAR2(50) not null,
  parentid VARCHAR2(100) not null,
  customid VARCHAR2(20),
  sortno   NUMBER(4),
  leaf     VARCHAR2(2) default '0' not null,
  remark   VARCHAR2(100),
  enabled  NVARCHAR2(2) default '1' not null
)
;
comment on table EADEPT
  is '������Ϣ��';
comment on column EADEPT.deptid
  is '���ű��';
comment on column EADEPT.deptname
  is '��������';
comment on column EADEPT.parentid
  is '�ϼ����ű��';
comment on column EADEPT.customid
  is '�Զ��岿�ű��';
comment on column EADEPT.sortno
  is '�����';
comment on column EADEPT.leaf
  is 'Ҷ�ӽڵ�(0:��֦�ڵ�;1:Ҷ�ӽڵ�)';
comment on column EADEPT.remark
  is '��ע';
comment on column EADEPT.enabled
  is '����״̬(1:����;0:ͣ��)';
alter table EADEPT
  add constraint PK_EADEPT primary key (DEPTID);

prompt Creating EAEVENT...
create table EAEVENT
(
  eventid     VARCHAR2(20) not null,
  userid      VARCHAR2(8),
  account     VARCHAR2(30),
  username    VARCHAR2(20),
  description VARCHAR2(100),
  activetime  NUMBER(14),
  requestpath VARCHAR2(200),
  methodname  VARCHAR2(50),
  costtime    NUMBER
)
;
comment on table EAEVENT
  is '����Ա�¼���';
comment on column EAEVENT.eventid
  is '�¼�ID';
comment on column EAEVENT.userid
  is '�û�ID';
comment on column EAEVENT.account
  is '��¼�˺�';
comment on column EAEVENT.username
  is '�û���';
comment on column EAEVENT.description
  is '�¼�����';
comment on column EAEVENT.activetime
  is '�ʱ��';
comment on column EAEVENT.requestpath
  is '����·��';
comment on column EAEVENT.methodname
  is 'Action������';
comment on column EAEVENT.costtime
  is '��ʱ';
alter table EAEVENT
  add constraint PK_EAEVENT primary key (EVENTID);

prompt Creating EAEXCEPTION...
create table EAEXCEPTION
(
  exceptionid VARCHAR2(20) not null,
  clazz       VARCHAR2(200),
  methodname  VARCHAR2(50),
  exception   VARCHAR2(2000),
  activetime  NUMBER(14)
)
;
comment on table EAEXCEPTION
  is 'ϵͳ�쳣��ر�';
comment on column EAEXCEPTION.exceptionid
  is '�쳣ID';
comment on column EAEXCEPTION.clazz
  is '�쳣��';
comment on column EAEXCEPTION.methodname
  is '�쳣����';
comment on column EAEXCEPTION.exception
  is '�쳣��Ϣ';
comment on column EAEXCEPTION.activetime
  is '����ʱ��';
alter table EAEXCEPTION
  add constraint PK_EABEANMONITOR primary key (EXCEPTIONID);

prompt Creating EAHELP...
create table EAHELP
(
  helpid  VARCHAR2(8) not null,
  menuid  VARCHAR2(8) not null,
  content VARCHAR2(4000)
)
;
comment on table EAHELP
  is '������Ϣ��';
comment on column EAHELP.helpid
  is '����ģ��������
';
comment on column EAHELP.menuid
  is '�˵����';
comment on column EAHELP.content
  is '��������';
create unique index INDEX_MENUID on EAHELP (MENUID);
alter table EAHELP
  add constraint PK_EAHELP primary key (HELPID);

prompt Creating EAHTTPSESSION...
create table EAHTTPSESSION
(
  sessionid  VARCHAR2(100) not null,
  username   VARCHAR2(20),
  account    VARCHAR2(30),
  createtime VARCHAR2(20),
  loginip    VARCHAR2(15),
  userid     VARCHAR2(8),
  explorer   VARCHAR2(15)
)
;
comment on table EAHTTPSESSION
  is 'HTTP�Ự��Դ����';
comment on column EAHTTPSESSION.sessionid
  is '�ỰID';
comment on column EAHTTPSESSION.username
  is '�û���';
comment on column EAHTTPSESSION.account
  is '��¼�˻�';
comment on column EAHTTPSESSION.createtime
  is '�Ự����ʱ��';
comment on column EAHTTPSESSION.loginip
  is '��¼IP';
comment on column EAHTTPSESSION.userid
  is '�û����';
comment on column EAHTTPSESSION.explorer
  is '�ͻ��������';
alter table EAHTTPSESSION
  add constraint PK_EAHTTPSESSION primary key (SESSIONID);

prompt Creating EAICON...
create table EAICON
(
  iconid   VARCHAR2(8) not null,
  filename VARCHAR2(50) not null,
  cssname  VARCHAR2(50) not null
)
;
comment on table EAICON
  is 'ϵͳͼ���';
comment on column EAICON.iconid
  is 'ͼ����';
comment on column EAICON.filename
  is '�ļ���';
comment on column EAICON.cssname
  is 'CSS����';
alter table EAICON
  add constraint PK_EAICON primary key (ICONID);
alter table EAICON
  add constraint UK1_EAICON unique (FILENAME);
alter table EAICON
  add constraint UK2_EAICON unique (CSSNAME);

prompt Creating EAJDBCMONITOR...
create table EAJDBCMONITOR
(
  monitorid  NUMBER(20) not null,
  sqltext    VARCHAR2(2000),
  starttime  NUMBER(14),
  costtime   NUMBER(8),
  effectrows NUMBER(8),
  type       VARCHAR2(1)
)
;
comment on table EAJDBCMONITOR
  is 'JDBC�����Ϣ��';
comment on column EAJDBCMONITOR.monitorid
  is '���ID';
comment on column EAJDBCMONITOR.sqltext
  is 'SQL���';
comment on column EAJDBCMONITOR.starttime
  is 'ִ�п�ʼʱ��';
comment on column EAJDBCMONITOR.costtime
  is 'ִ���ܺ�ʱ';
comment on column EAJDBCMONITOR.effectrows
  is 'Ӱ������';
comment on column EAJDBCMONITOR.type
  is '���ݲ�������(1:INSERT;2:UPDATE;3:DELETE;4:SELECT;5:CALLPRC)';
alter table EAJDBCMONITOR
  add primary key (MONITORID);

prompt Creating EAMENU...
create table EAMENU
(
  menuid    VARCHAR2(60) not null,
  menuname  VARCHAR2(50) not null,
  parentid  VARCHAR2(60) not null,
  iconcls   VARCHAR2(50),
  expanded  VARCHAR2(2) default '0',
  request   VARCHAR2(100),
  leaf      VARCHAR2(2) default '0' not null,
  sortno    NUMBER(4),
  remark    VARCHAR2(200),
  icon      VARCHAR2(50),
  menutype  VARCHAR2(2) default '0',
  shortcut  VARCHAR2(50),
  width     NUMBER(4),
  height    NUMBER(4),
  scrollbar VARCHAR2(2) default '0'
)
;
comment on table EAMENU
  is '�˵���Դ��Ϣ��';
comment on column EAMENU.menuid
  is '�˵����';
comment on column EAMENU.menuname
  is '�˵�����';
comment on column EAMENU.parentid
  is '�ϼ��˵����';
comment on column EAMENU.iconcls
  is '�ڵ�ͼ��CSS����';
comment on column EAMENU.expanded
  is 'չ��״̬(1:չ��;0:����)';
comment on column EAMENU.request
  is '�����ַ';
comment on column EAMENU.leaf
  is 'Ҷ�ӽڵ�(0:��֦�ڵ�;1:Ҷ�ӽڵ�)';
comment on column EAMENU.sortno
  is '�����';
comment on column EAMENU.remark
  is '��ע';
comment on column EAMENU.icon
  is '�ڵ�ͼ��';
comment on column EAMENU.menutype
  is '�˵�����(1:ϵͳ�˵�;0:ҵ��˵�)';
comment on column EAMENU.shortcut
  is '����ͼ���ļ�';
comment on column EAMENU.width
  is '���洰�ڿ��';
comment on column EAMENU.height
  is '���洰�ڸ߶�';
comment on column EAMENU.scrollbar
  is '���洰�ڹ�����(1���У�0����)';
alter table EAMENU
  add constraint PK_EAMENU primary key (MENUID);

prompt Creating EAMENUPART...
create table EAMENUPART
(
  partid  VARCHAR2(8) not null,
  menuid  VARCHAR2(60) not null,
  cmpid   VARCHAR2(20) not null,
  cmptype VARCHAR2(2) not null,
  remark  VARCHAR2(100) default ''
)
;
comment on table EAMENUPART
  is 'UI�й����';
comment on column EAMENUPART.partid
  is 'UI������';
comment on column EAMENUPART.menuid
  is '�˵�ID';
comment on column EAMENUPART.cmpid
  is 'UI���ID';
comment on column EAMENUPART.cmptype
  is 'UI�������(1:��ť���;2:���������;3:����������)';
comment on column EAMENUPART.remark
  is '��ע';
alter table EAMENUPART
  add constraint PK_EAMENUPART primary key (PARTID);

prompt Creating EAPARAM...
create table EAPARAM
(
  paramid    VARCHAR2(8) not null,
  paramkey   VARCHAR2(50) not null,
  paramvalue VARCHAR2(1000) not null,
  remark     VARCHAR2(200)
)
;
comment on table EAPARAM
  is 'ȫ�ֲ�����';
comment on column EAPARAM.paramid
  is '�������';
comment on column EAPARAM.paramkey
  is '��������';
comment on column EAPARAM.paramvalue
  is '������ֵ';
comment on column EAPARAM.remark
  is '��ע';
alter table EAPARAM
  add constraint PK_EAPARAM primary key (PARAMID);
alter table EAPARAM
  add constraint UK_EAPARAM unique (PARAMKEY);

prompt Creating EAROLE...
create table EAROLE
(
  roleid   VARCHAR2(8) not null,
  rolename VARCHAR2(50) not null,
  deptid   VARCHAR2(100) not null,
  roletype VARCHAR2(2) default '1' not null,
  remark   VARCHAR2(2),
  locked   VARCHAR2(2) default '0'
)
;
comment on table EAROLE
  is '��ɫ��Ϣ��';
comment on column EAROLE.roleid
  is '��ɫ���';
comment on column EAROLE.rolename
  is '��ɫ����';
comment on column EAROLE.deptid
  is '�������ű��';
comment on column EAROLE.roletype
  is '��ɫ����(1:ҵ���ɫ;2:�����ɫ ;3:ϵͳ���ý�ɫ)';
comment on column EAROLE.remark
  is '��ע';
comment on column EAROLE.locked
  is '������־(1:����;0:����)';
alter table EAROLE
  add constraint PK_EAROLE primary key (ROLEID);

prompt Creating EAROLEAUTHORIZE...
create table EAROLEAUTHORIZE
(
  roleid         VARCHAR2(8) not null,
  menuid         VARCHAR2(60) not null,
  authorizelevel VARCHAR2(2) default '1' not null,
  authorizeid    VARCHAR2(8) not null
)
;
comment on table EAROLEAUTHORIZE
  is '��ɫ��Ȩ��';
comment on column EAROLEAUTHORIZE.roleid
  is '��ɫ���';
comment on column EAROLEAUTHORIZE.menuid
  is '�˵����';
comment on column EAROLEAUTHORIZE.authorizelevel
  is 'Ȩ�޼���(1:����Ȩ��;2:����Ȩ��)';
comment on column EAROLEAUTHORIZE.authorizeid
  is '��ȨID';
alter table EAROLEAUTHORIZE
  add constraint PK_EARWAUTHORIZE primary key (AUTHORIZEID);
alter table EAROLEAUTHORIZE
  add constraint UK_EARWAUTHORIZE unique (ROLEID, MENUID, AUTHORIZELEVEL);

prompt Creating EAROLEMENUPART...
create table EAROLEMENUPART
(
  authorizeid  VARCHAR2(8) not null,
  roleid       VARCHAR2(8) not null,
  menuid       VARCHAR2(60) not null,
  partid       VARCHAR2(8) not null,
  partauthtype VARCHAR2(1) not null
)
;
comment on table EAROLEMENUPART
  is 'UIԪ�ؽ�ɫ��Ȩ��';
comment on column EAROLEMENUPART.authorizeid
  is '��ȨID';
comment on column EAROLEMENUPART.roleid
  is '��ɫID';
comment on column EAROLEMENUPART.menuid
  is '�˵�ID';
comment on column EAROLEMENUPART.partid
  is 'UIԪ��ID';
comment on column EAROLEMENUPART.partauthtype
  is 'UIԪ����Ȩ����';
alter table EAROLEMENUPART
  add constraint PK_EAROLEMENUPART primary key (AUTHORIZEID);

prompt Creating EASEQUENCE...
create table EASEQUENCE
(
  sequenceid VARCHAR2(4) not null,
  fieldname  VARCHAR2(50) not null,
  maxid      VARCHAR2(50) not null,
  remark     VARCHAR2(100),
  pattern    VARCHAR2(50) not null,
  idtype     VARCHAR2(2) default 2 not null
)
;
comment on table EASEQUENCE
  is '���к�������';
comment on column EASEQUENCE.sequenceid
  is '���';
comment on column EASEQUENCE.fieldname
  is '�ֶ���';
comment on column EASEQUENCE.maxid
  is '��ǰ���ֵ';
comment on column EASEQUENCE.remark
  is '��ע';
comment on column EASEQUENCE.pattern
  is '��ʽ';
comment on column EASEQUENCE.idtype
  is 'ID����(1:ϵͳ����;2:�û��Զ���)';
create unique index INDEX_EASEQUENCE on EASEQUENCE (FIELDNAME);
alter table EASEQUENCE
  add constraint PK_EASEQUENCE primary key (SEQUENCEID);

prompt Creating EAUSER...
create table EAUSER
(
  userid   VARCHAR2(8) not null,
  username VARCHAR2(20) not null,
  account  VARCHAR2(30) not null,
  password VARCHAR2(50) not null,
  sex      VARCHAR2(2) default '0' not null,
  deptid   VARCHAR2(100) not null,
  locked   VARCHAR2(2) default '0' not null,
  remark   VARCHAR2(50),
  usertype VARCHAR2(2) default '1',
  enabled  VARCHAR2(2) default '1' not null
)
;
comment on table EAUSER
  is '�û���Ϣ��';
comment on column EAUSER.userid
  is '�û����';
comment on column EAUSER.username
  is '�û���';
comment on column EAUSER.account
  is '��½�ʻ�';
comment on column EAUSER.password
  is '����';
comment on column EAUSER.sex
  is '�Ա�(0:δ֪;1:��;2:Ů)';
comment on column EAUSER.deptid
  is '���ű��';
comment on column EAUSER.locked
  is '������־(1:����;0:����)';
comment on column EAUSER.remark
  is '��ע';
comment on column EAUSER.usertype
  is '��Ա����(1:����Ա;2:����Ա;3:ϵͳ������Ա;4;��Ŀ��վע���û�)';
comment on column EAUSER.enabled
  is '����״̬(1:����;0:ͣ��)';
create unique index UK_EAUSER on EAUSER (ACCOUNT);
alter table EAUSER
  add constraint PK_EAUSER primary key (USERID);

prompt Creating EAUSERAUTHORIZE...
create table EAUSERAUTHORIZE
(
  userid      VARCHAR2(8) not null,
  roleid      VARCHAR2(8) not null,
  authorizeid VARCHAR2(8) not null
)
;
comment on table EAUSERAUTHORIZE
  is '�û���Ȩ��';
comment on column EAUSERAUTHORIZE.userid
  is '�û����';
comment on column EAUSERAUTHORIZE.roleid
  is '��ɫ���';
comment on column EAUSERAUTHORIZE.authorizeid
  is '��ȨID';
alter table EAUSERAUTHORIZE
  add constraint PK_EAUSERAUTHORIZE primary key (AUTHORIZEID);

prompt Creating EAUSERMENUMAP...
create table EAUSERMENUMAP
(
  userid         VARCHAR2(8) not null,
  menuid         VARCHAR2(60) not null,
  authorizeid    VARCHAR2(8) not null,
  authorizelevel VARCHAR2(2) not null
)
;
comment on table EAUSERMENUMAP
  is '�û��˵�ӳ���';
comment on column EAUSERMENUMAP.userid
  is '��Ա���';
comment on column EAUSERMENUMAP.menuid
  is '�˵����';
comment on column EAUSERMENUMAP.authorizeid
  is '��Ȩ���';
comment on column EAUSERMENUMAP.authorizelevel
  is 'Ȩ�޼���(1:����Ȩ��;2:����Ȩ��)';
alter table EAUSERMENUMAP
  add constraint PK_EAUSERMENUMAP primary key (AUTHORIZEID);
alter table EAUSERMENUMAP
  add constraint UK_EAUSERMENUMAP unique (MENUID, USERID, AUTHORIZELEVEL);

prompt Creating EAUSERMENUPART...
create table EAUSERMENUPART
(
  authorizeid  VARCHAR2(8) not null,
  userid       VARCHAR2(8) not null,
  menuid       VARCHAR2(60) not null,
  partid       VARCHAR2(8) not null,
  partauthtype VARCHAR2(1) not null
)
;
comment on table EAUSERMENUPART
  is 'UIԪ����Ա��Ȩ��';
comment on column EAUSERMENUPART.authorizeid
  is '��ȨID';
comment on column EAUSERMENUPART.userid
  is '��ԱID';
comment on column EAUSERMENUPART.menuid
  is '�˵�ID';
comment on column EAUSERMENUPART.partid
  is 'UIԪ��ID';
comment on column EAUSERMENUPART.partauthtype
  is 'UIԪ����Ȩ����';
alter table EAUSERMENUPART
  add constraint PK_EAUSERMENUPART primary key (AUTHORIZEID);
alter table EAUSERMENUPART
  add constraint UK_EAUSERMENUPART unique (USERID, MENUID, PARTID);

prompt Creating EAUSERSUBINFO...
create table EAUSERSUBINFO
(
  userid     VARCHAR2(8) not null,
  theme      VARCHAR2(50),
  layout     VARCHAR2(1),
  background VARCHAR2(50)
)
;
comment on table EAUSERSUBINFO
  is '��Ա��Ϣ�������Ա�';
comment on column EAUSERSUBINFO.userid
  is '��Ա���';
comment on column EAUSERSUBINFO.theme
  is '�Զ�������Ƥ��';
comment on column EAUSERSUBINFO.layout
  is 'ϵͳ��ȱʡ�����沼��ģʽ��1:��ͳ���䲼��;2:�������沼�֡�';
comment on column EAUSERSUBINFO.background
  is '�Զ������汳��';
alter table EAUSERSUBINFO
  add constraint PK_EAUSERSUBINFO primary key (USERID);

prompt Creating EA_DEMO_BYJSB...
create table EA_DEMO_BYJSB
(
  sxh  VARCHAR2(20) not null,
  dwmc VARCHAR2(100),
  grbm VARCHAR2(20),
  xm   VARCHAR2(20),
  xb   VARCHAR2(3),
  xnl  NUMBER,
  fyze NUMBER(14,2),
  zfje NUMBER(14,2),
  ybbx NUMBER(14,2),
  jssj DATE,
  yymc VARCHAR2(50),
  jbr  VARCHAR2(20)
)
;
comment on table EA_DEMO_BYJSB
  is '��ʾ��(��Ա������ϸ)';
alter table EA_DEMO_BYJSB
  add constraint PK_EZ_BYJSB primary key (SXH);

prompt Creating EA_DEMO_BYMXB...
create table EA_DEMO_BYMXB
(
  sxh    VARCHAR2(20) not null,
  xh     VARCHAR2(20) not null,
  zflb   VARCHAR2(10),
  grbm   VARCHAR2(20),
  xm     VARCHAR2(20),
  sfdlmc VARCHAR2(20),
  sfxmmc VARCHAR2(100),
  sl     NUMBER(8,2),
  sjjg   NUMBER(14,3),
  fyze   NUMBER(14,2),
  cd     VARCHAR2(128),
  gg     VARCHAR2(50),
  sfsj   DATE,
  sfy    VARCHAR2(20)
)
;
comment on table EA_DEMO_BYMXB
  is '��ʾ��(��Ա������ϸ)';
alter table EA_DEMO_BYMXB
  add constraint PK_EZ_BYMXB primary key (SXH, XH);

prompt Creating EA_DEMO_CHINAAREA...
create table EA_DEMO_CHINAAREA
(
  areacode VARCHAR2(12),
  areaname VARCHAR2(50)
)
;
comment on table EA_DEMO_CHINAAREA
  is '��ʾ��(�й���������)';
comment on column EA_DEMO_CHINAAREA.areacode
  is '��������';
comment on column EA_DEMO_CHINAAREA.areaname
  is '��������';

prompt Creating EA_DEMO_FCF...
create table EA_DEMO_FCF
(
  name     VARCHAR2(20),
  value    VARCHAR2(10),
  color    VARCHAR2(10),
  alpha    VARCHAR2(10),
  issliced VARCHAR2(1) default 0,
  product  VARCHAR2(1),
  fcfid    NUMBER(10) not null
)
;
comment on table EA_DEMO_FCF
  is '��ʾ��(FlashReport����Դ)';
comment on column EA_DEMO_FCF.name
  is '����';
comment on column EA_DEMO_FCF.value
  is 'ֵ';
comment on column EA_DEMO_FCF.color
  is '��ɫ';
comment on column EA_DEMO_FCF.alpha
  is '͸����';
comment on column EA_DEMO_FCF.issliced
  is '�Ƿ񸡶�(���Ա�ͼ��Ч)';
comment on column EA_DEMO_FCF.product
  is '��Ʒ';

prompt Creating EA_DEMO_SFXM...
create table EA_DEMO_SFXM
(
  xmid   VARCHAR2(20) not null,
  sfdlbm VARCHAR2(20),
  xmmc   VARCHAR2(100),
  xmrj   VARCHAR2(20),
  gg     VARCHAR2(50),
  dw     VARCHAR2(20),
  zfbl   NUMBER,
  jx     VARCHAR2(50),
  cd     VARCHAR2(100),
  qybz   VARCHAR2(3),
  yybm   VARCHAR2(8),
  ggsj   DATE
)
;
comment on table EA_DEMO_SFXM
  is '��ʾ��(ҽԺ�շ���Ŀ)';
alter table EA_DEMO_SFXM
  add constraint PK_EZ_SFXM primary key (XMID);

prompt Creating EA_DEMO_UPLOAD...
create table EA_DEMO_UPLOAD
(
  fileid   VARCHAR2(8) not null,
  title    VARCHAR2(100),
  path     VARCHAR2(100),
  filesize NUMBER(12),
  remark   VARCHAR2(200)
)
;
comment on table EA_DEMO_UPLOAD
  is '��ʾ��(�ļ�����)';
comment on column EA_DEMO_UPLOAD.fileid
  is '�ļ�ID';
comment on column EA_DEMO_UPLOAD.title
  is '�ļ�����';
comment on column EA_DEMO_UPLOAD.path
  is '�ļ��洢���·��';
comment on column EA_DEMO_UPLOAD.filesize
  is '�ļ���С';
comment on column EA_DEMO_UPLOAD.remark
  is '�ļ�����';
alter table EA_DEMO_UPLOAD
  add constraint PK_EA_DEMO_UPLOAD primary key (FILEID);
alter table EA_DEMO_UPLOAD
  add constraint UK_EA_DEMO_UPLOAD unique (PATH);

prompt Disabling triggers for EACODE...
alter table EACODE disable all triggers;
prompt Disabling triggers for EADEPT...
alter table EADEPT disable all triggers;
prompt Disabling triggers for EAEVENT...
alter table EAEVENT disable all triggers;
prompt Disabling triggers for EAEXCEPTION...
alter table EAEXCEPTION disable all triggers;
prompt Disabling triggers for EAHELP...
alter table EAHELP disable all triggers;
prompt Disabling triggers for EAHTTPSESSION...
alter table EAHTTPSESSION disable all triggers;
prompt Disabling triggers for EAICON...
alter table EAICON disable all triggers;
prompt Disabling triggers for EAJDBCMONITOR...
alter table EAJDBCMONITOR disable all triggers;
prompt Disabling triggers for EAMENU...
alter table EAMENU disable all triggers;
prompt Disabling triggers for EAMENUPART...
alter table EAMENUPART disable all triggers;
prompt Disabling triggers for EAPARAM...
alter table EAPARAM disable all triggers;
prompt Disabling triggers for EAROLE...
alter table EAROLE disable all triggers;
prompt Disabling triggers for EAROLEAUTHORIZE...
alter table EAROLEAUTHORIZE disable all triggers;
prompt Disabling triggers for EAROLEMENUPART...
alter table EAROLEMENUPART disable all triggers;
prompt Disabling triggers for EASEQUENCE...
alter table EASEQUENCE disable all triggers;
prompt Disabling triggers for EAUSER...
alter table EAUSER disable all triggers;
prompt Disabling triggers for EAUSERAUTHORIZE...
alter table EAUSERAUTHORIZE disable all triggers;
prompt Disabling triggers for EAUSERMENUMAP...
alter table EAUSERMENUMAP disable all triggers;
prompt Disabling triggers for EAUSERMENUPART...
alter table EAUSERMENUPART disable all triggers;
prompt Disabling triggers for EAUSERSUBINFO...
alter table EAUSERSUBINFO disable all triggers;
prompt Disabling triggers for EA_DEMO_BYJSB...
alter table EA_DEMO_BYJSB disable all triggers;
prompt Disabling triggers for EA_DEMO_BYMXB...
alter table EA_DEMO_BYMXB disable all triggers;
prompt Disabling triggers for EA_DEMO_CHINAAREA...
alter table EA_DEMO_CHINAAREA disable all triggers;
prompt Disabling triggers for EA_DEMO_FCF...
alter table EA_DEMO_FCF disable all triggers;
prompt Disabling triggers for EA_DEMO_SFXM...
alter table EA_DEMO_SFXM disable all triggers;
prompt Disabling triggers for EA_DEMO_UPLOAD...
alter table EA_DEMO_UPLOAD disable all triggers;
prompt Loading EACODE...
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '�Ա�', '0', 'δ֪', '1', '0', 1, null, '10000000');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '�Ա�', '1', '��', '1', '0', 2, null, '10000001');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('SEX', '�Ա�', '2', 'Ů', '1', '0', 3, null, '10000002');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LOCKED', '����', '0', '����', '1', '0', 2, null, '10000003');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LOCKED', '����', '1', '����', '1', '0', 1, null, '10000004');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '��ɫ����', '2', '�����ɫ', '1', '0', 2, null, '10000005');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '��ɫ����', '1', 'ҵ���ɫ', '1', '0', 1, null, '10000006');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LEAF', '�ڵ�����', '1', 'Ҷ�ӽڵ�`', '1', '0', 1, null, '10000007');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('LEAF', '�ڵ�����', '0', '��֦�ڵ�', '1', '0', 2, null, '10000008');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EDITMODE', '�༭ģʽ', '0', 'ֻ��', '1', '0', 1, null, '10000009');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EDITMODE', '�༭ģʽ', '1', '�ɱ༭', '1', '0', 2, null, '10000010');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ENABLED', '����״̬', '0', '����', '1', '0', 1, null, '10000011');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ENABLED', '����״̬', '1', '����', '1', '0', 2, null, '10000012');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('AUTHORIZELEVEL', 'Ȩ�޼���', '1', '����Ȩ��', '1', '0', 1, null, '10000015');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('AUTHORIZELEVEL', 'Ȩ�޼���', '2', '����Ȩ��', '1', '0', 2, null, '10000016');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ROLETYPE', '��ɫ����', '3', 'ϵͳ���ý�ɫ', '1', '0', 3, null, '10000018');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('MENUTYPE', '�˵�����', '1', 'ϵͳ�˵�', '1', '0', 1, null, '10000039');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('MENUTYPE', '�˵�����', '0', 'ҵ��˵�', '1', '0', 2, null, '10000040');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '��Ա����', '1', '����Ա', '1', '0', 1, null, '10000041');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '��Ա����', '2', '����Ա', '1', '0', 2, null, '10000042');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('USERTYPE', '��Ա����', '3', 'ϵͳ�����û�', '1', '0', 3, null, '10000043');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('QYBZ', '���ñ�־', '1', '����', '1', '1', 1, '�����ʾ������ʹ��', '10000044');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('QYBZ', '���ñ�־', '0', 'ͣ��', '1', '1', 2, '�����ʾ������ʹ��', '10000047');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UIԪ������', '1', '��ť', '1', '0', 1, null, '10000048');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UIԪ������', '2', '������(textField|textArea|comboBox|checkBox|radioBox|htmlEditor)', '1', '0', 2, null, '10000049');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('CMPTYPE', 'UI�������', '3', '�������(Panel|TabPanel|GridPanel|FormPanel|TreePanel)', '1', '0', 3, null, '10000050');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '1', '����', '1', '0', 2, null, '10000051');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '3', 'ֻ��', '1', '0', 3, null, '10000052');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '4', '�༭', '1', '0', 4, null, '10000053');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '5', '��ʾ', '1', '0', 5, null, '10000054');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '6', '����', '1', '0', 6, null, '10000055');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '0', '����', '1', '0', 1, null, '10000056');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('PARTAUTHTYPE', 'UIԪ����Ȩ����', '2', '����', '1', '0', 4, null, '10000057');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ADVISETYPE', '֪ͨ����', '1', '��������', '1', '0', 1, null, '10000058');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('ADVISETYPE', '֪ͨ����', '2', '�쳣����', '1', '0', 2, null, '10000059');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EXPAND', '�ڵ�״̬', '1', 'չ��', '1', '0', null, null, '10000062');
insert into EACODE (field, fieldname, code, codedesc, enabled, editmode, sortno, remark, codeid)
values ('EXPAND', 'չ��״̬', '0', '����', '1', '0', null, null, '10000063');
commit;
prompt 37 records loaded
prompt Loading EADEPT...
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001', 'G4Stuido����ƽ̨', '0', '01        ', 1, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001001', '�з�����', '001', '0101      ', 2, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001001001', '�з�1��', '001001', null, 1, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002', '���ҽ𱣹���', '001', '0         ', 2, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001', '�籣�����������', '001002', '01        ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001', '�������籣��', '001002001', '0101      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001001', '�������籣��', '001002001001', '010101    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001002', '�������籣��', '001002001001', '010102    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001003', '�������籣��', '001002001001', '010103    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001004', '�������籣��', '001002001001', '010104    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001005', '�������籣��', '001002001001', '010105    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001006', '�������籣��', '001002001001', '010106    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001007', '�������籣��', '001002001001', '010107    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001001008', 'ʯ��ɽ���籣��', '001002001001', '010108    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002', '�Ϻ����籣��', '001002001', '0102      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002001', '�������籣��', '001002001002', '010201    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002002', '¬�����籣��', '001002001002', '010202    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002003', '������籣��', '001002001002', '010203    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002004', '������籣��', '001002001002', '010204    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002005', '�ֶ������籣��', '001002001002', '010205    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001002006', '�ɽ����籣��', '001002001002', '010206    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003', '������籣��', '001002001', '0103      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003001', '��ƽ���籣��', '001002001003', '010301    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003002', '�������籣��', '001002001003', '010302    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003003', '������籣��', '001002001003', '010303    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003004', '�������籣��', '001002001003', '010304    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001003005', '�������籣��', '001002001003', '010305    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004', '�������籣��', '001002001', '0104      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004001', '�������籣��', '001002001004', '010401    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004002', '�������籣��', '001002001004', '010402    ', 0, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001004003', '�������籣��', '001002001004', '010403    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005', '�㶫ʡ�籣��', '001002001', '0105      ', 0, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005003', '�������籣��', '001002001005', '010503    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005004', '��ɽ���籣��', '001002001005', '010504    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001005005', '�������籣��', '001002001005', '010501    ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006', '����ʡ�籣��', '001002001', '0106      ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001', '�������籣��', '001002001006', '010601    ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001001', '�廪���籣��', '001002001006001', '01060101  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001002', '�������籣��', '001002001006001', '01060102  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001003', '�������籣��', '001002001006001', '01060103  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006001004', '�������籣��', '001002001006001', '01060104  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002', '�������籣��', '001002001006', '010602    ', null, '0', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002001', '�ֶ����籣��', '001002001006002', '01060201  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002002', '�������籣��', '001002001006002', '01060202  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002003', '�¹����籣��', '001002001006002', '01060203  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006002004', '�������籣��', '001002001006002', '01060204  ', null, '1', null, '1');
insert into EADEPT (deptid, deptname, parentid, customid, sortno, leaf, remark, enabled)
values ('001002001006003', '�������籣��', '001002001006', null, 0, '1', null, '1');
commit;
prompt 47 records loaded
prompt Loading EAEVENT...
prompt Table is empty
prompt Loading EAEXCEPTION...
prompt Table is empty
prompt Loading EAHELP...
prompt Table is empty
prompt Loading EAHTTPSESSION...
prompt Table is empty
prompt Loading EAICON...
insert into EAICON (iconid, filename, cssname)
values ('10000018', 'accept.png', 'acceptIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000046', 'add.png', 'addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000008', 'application.png', 'applicationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000010', 'application_cascade.png', 'application_cascadeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000009', 'application_double.png', 'application_doubleIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000005', 'application_home.png', 'application_homeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000028', 'application_view_list.png', 'application_view_listIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000063', 'app_boxes.png', 'app_boxesIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000064', 'app_left.png', 'app_leftIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000065', 'app_right.png', 'app_rightIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000022', 'arrow_refresh.png', 'arrow_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000066', 'arrow_switch.png', 'arrow_switchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000048', 'award_star_silver_3.png', 'award_star_silver_3Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000025', 'book_previous.png', 'book_previousIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000053', 'bug.png', 'bugIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000033', 'building.png', 'buildingIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000032', 'chart_organisation.png', 'chart_organisationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000037', 'collapse-all.gif', 'collapse-allIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000007', 'comments.png', 'commentsIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000012', 'comments_add.png', 'comments_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000017', 'comment_add.png', 'comment_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000054', 'config.png', 'configIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000004', 'cup.png', 'cupIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000051', 'database_connect.png', 'database_connectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000056', 'database_refresh.png', 'database_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000019', 'delete.png', 'deleteIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000049', 'disconnect.png', 'disconnectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000058', 'docs.gif', 'docsIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000062', 'download.png', 'downloadIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000047', 'edit1.png', 'edit1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000052', 'exclamation.png', 'exclamationIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000036', 'expand-all.gif', 'expand-allIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000001', 'folder_camera.png', 'folder_cameraIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000003', 'folder_feed.png', 'folder_feedIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000002', 'folder_user.png', 'folder_userIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000000', 'folder_wrench.png', 'folder_wrenchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000006', 'group.png', 'groupIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000039', 'group_link.png', 'group_linkIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000027', 'image.png', 'imageIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000029', 'key.png', 'keyIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000031', 'layout_content.png', 'layout_contentIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000023', 'lock.png', 'lockIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000041', 'medal_gold_1.png', 'medal_gold_1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000040', 'medal_silver_3.png', 'medal_silver_3Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000060', 'message_edit.png', 'message_editIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000013', 'page_add.png', 'page_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000015', 'page_del.png', 'page_delIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000014', 'page_edit_1.png', 'page_edit_1Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000044', 'page_excel.png', 'page_excelIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000030', 'page_find.png', 'page_findIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000016', 'page_refresh.png', 'page_refreshIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000045', 'plugin.png', 'pluginIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000043', 'preview.png', 'previewIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000042', 'printer.png', 'printerIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000055', 'server_connect.png', 'server_connectIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000020', 'status_away.png', 'status_awayIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000021', 'status_busy.png', 'status_busyIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000035', 'status_online.png', 'status_onlineIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000050', 'table.png', 'tableIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000011', 'tbar_synchronize.png', 'tbar_synchronizeIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000059', 'theme2.png', 'theme2Icon');
insert into EAICON (iconid, filename, cssname)
values ('10000061', 'upload.png', 'uploadIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000038', 'user.png', 'userIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000057', 'user_comment.png', 'user_commentIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000034', 'user_female.png', 'user_femaleIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000026', 'window_caise_list.png', 'window_caise_listIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000024', 'wrench.png', 'wrenchIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000067', 'plugin_add.png', 'plugin_addIcon');
insert into EAICON (iconid, filename, cssname)
values ('10000068', 'plugin_edit.png', 'plugin_editIcon');
commit;
prompt 69 records loaded
prompt Loading EAJDBCMONITOR...
prompt Table is empty
prompt Loading EAMENU...
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021316', 'ͼ���ۺϷ���һ(��̬����Դ)', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport1Init', '1', 16, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021317', 'ͼ���ۺϷ�����(��̬����Դ)', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport2Init', '1', 17, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010214', 'ҳ�沼��', '0102', null, '0', null, '0', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021401', 'Form����', '010214', null, '0', 'demo/formDemo.do?reqCode=formLayoutInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021402', 'Column����', '010214', null, '0', 'demo/formDemo.do?reqCode=columnLayoutInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021403', '���ۺϲ���1', '010214', null, '0', 'demo/formDemo.do?reqCode=complexLayoutInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021404', '���ۺϲ���2', '010214', null, '0', 'demo/formDemo.do?reqCode=complexLayout2Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021405', 'Viewport����', '010214', null, '0', 'demo/commonUiDemo.do?reqCode=viewportLayoutInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021406', 'ViewportǶ�ײ���', '010214', null, '0', 'demo/commonUiDemo.do?reqCode=viewportComplexLayoutInit', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010215', '�ۺ�', '0102', null, '0', null, '0', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021501', '�ۺ�ʵ��1', '010215', null, '0', 'demo/integrateDemo.do?reqCode=queryDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021502', '�ۺ�ʵ��2', '010215', null, '0', 'demo/integrateDemo.do?reqCode=queryDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021503', '�ۺ�ʵ��3', '010215', null, '0', 'demo/integrateDemo.do?reqCode=collectDataInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021504', '�ۺ�ʵ��4', '010215', null, '0', 'demo/integrateDemo.do?reqCode=collectDataByWindowInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021505', '�ۺ�ʵ��5', '010215', null, '0', 'demo/integrateDemo.do?reqCode=manageDataInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021506', '�ۺ�ʵ��6', '010215', null, '0', 'demo/integrateDemo.do?reqCode=manageData4In1Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010216', '����', '0102', null, '0', null, '0', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021601', '�洢���̵���', '010216', null, '0', 'demo/integrateDemo.do?reqCode=callPrcInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021602', '�ļ�����(�ϴ�����)', '010216', null, '0', 'demo/otherDemo.do?reqCode=uploadInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021603', '��ʾUIԪ����Ȩ', '010216', null, '0', 'demo/integrateDemo.do?reqCode=manageData4In1Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0103', '������Ա������', '01', 'configIcon', '0', null, '0', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010301', '����', '0103', null, '0', null, '0', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030101', 'ϵͳԤ��ͼ��', '010301', 'imagesIcon', '0', 'resource.do?reqCode=iconInit', '1', 1, null, 'images.png', '0', 'shortcut_9.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010302', '����', '0103', null, '0', null, '0', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030201', '����ҳ��1', '010302', null, '0', 'demo/test.do?reqCode=test1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030202', '����ҳ��2', '010302', null, '0', 'demo/test.do?reqCode=test2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030203', '����ҳ��3', '010302', null, '0', 'demo/test.do?reqCode=test3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030204', '����ҳ��4', '010302', null, '0', 'demo/test.do?reqCode=test4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01030205', '����ҳ��5', '010302', null, '0', 'demo/test.do?reqCode=test5Initt', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021318', '�������ͼ��˫Y�ᣩ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineMs2YInit', '1', 19, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021319', '��̬�л�ͼ������', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=integrateFlashReport3Init', '1', 18, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021604', '����Excel�ļ�(xls��ʽ)', '010216', null, '0', 'demo/excelReportDemo.do?reqCode=importInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021605', '�ͻ��������쳣����', '010216', null, '0', 'demo/otherDemo.do?reqCode=exceptionInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01', 'G4Stuido����ƽ̨', '0', null, '0', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0101', 'ϵͳ����', '01', 'folder_wrenchIcon', '0', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010102', 'Ȩ�޹���', '0101', null, '1', null, '0', 1, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010201', '��֯��������', '010102', 'chart_organisationIcon', '0', 'organization.do?reqCode=departmentInit', '1', 1, null, 'chart_organisation.png', '1', 'onebit_18.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010202', '��Ա��������Ȩ', '010102', 'group_linkIcon', '0', 'user.do?reqCode=userInit', '1', 3, null, 'group_link.png', '1', 'groupofusers.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010204', '��ɫ��������Ȩ', '010102', 'award_star_silver_3Icon', '0', 'role.do?reqCode=roleInit', '1', 2, null, 'award_star_silver_3.png', '1', 'favbadd.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010205', '�˵���Դ����', '010102', 'arrow_switchIcon', '0', 'resource.do?reqCode=menuResourceInit', '1', 4, null, 'arrow_switch.png', '1', 'documentsorcopy.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010206', 'UIԪ���й�', '010102', 'app_boxesIcon', '0', 'part.do?reqCode=init', '1', 5, null, 'app_boxes.png', '1', 'file.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010207', 'UIԪ�ؽ�ɫ��Ȩ', '010102', 'app_leftIcon', '0', 'rolePart.do?reqCode=init', '1', 6, null, 'app_left.png', '1', 'filelocked.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010208', 'UIԪ����Ա��Ȩ', '010102', 'app_rightIcon', '0', 'userPart.do?reqCode=init', '1', 7, null, 'app_right.png', '1', 'addfile.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010103', '��������ά��', '0101', null, '1', null, '0', 2, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010301', '�ֵ�ά��', '010103', 'application_view_listIcon', '0', 'resource.do?reqCode=codeTableInit', '1', 1, null, 'application_view_list.png', '1', 'shortcut_11.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010303', 'ȫ�ֲ�����ά��', '010103', 'configIcon', '0', 'param.do?reqCode=init', '1', 2, null, 'config.png', '1', 'textfile.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010104', '���м��', '0101', null, '1', null, '0', 3, null, null, '1', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010401', 'Session�Ự���', '010104', 'user_commentIcon', '0', 'sessionMonitor.do?reqCode=init', '1', 2, null, 'user_comment.png', '1', 'onebit_22.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010403', 'Requst�������', '010104', 'bugIcon', '0', 'eventTrack.do?reqCode=init', '1', 1, null, 'bug.png', '1', 'onebit_08.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010405', 'JDBCִ�м��', '010104', 'database_refreshIcon', '0', 'jdbcMonitor.do?reqCode=jdbcInit', '1', 3, null, 'database_refresh.png', '1', 'shortcut_8.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010406', 'ϵͳ�쳣���', '010104', 'disconnectIcon', '0', 'beanMonitor.do?reqCode=init', '1', 4, null, 'disconnect.png', '1', 'close.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01010407', '��������Ϣ', '010104', 'server_connectIcon', '0', 'serverInfo.do?reqCode=init', '1', 5, null, 'server_connect.png', '1', 'onebit_12.png', null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('0102', '��׼������ϵͳ', '01', 'folder_cameraIcon', '0', null, '0', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010208', '������Ԫ��', '0102', null, '0', null, '0', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020801', '��������(��������)', '010208', null, '0', 'demo/formDemo.do?reqCode=basicInput4PropertyInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020802', '��������(������Ϊ)', '010208', null, '0', 'demo/formDemo.do?reqCode=basicInput4MethodInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020803', '����ѡ���(���ڡ�ʱ��)', '010208', null, '0', 'demo/formDemo.do?reqCode=dataTimeInputInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020804', '����ѡ���(��������Դ)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedLocalDataSourceInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020805', '����ѡ���(�ֵ�����Դ)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedCodeTableDataSourceInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020806', '����ѡ���(Զ������Դ)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedRemoteDataSourceInit', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020807', '����ѡ���(N������)', '010208', null, '0', 'demo/formDemo.do?reqCode=selectInputBasedMultilevelInit', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020808', '��ѡ�򡢸�ѡ��', '010208', null, '0', 'demo/formDemo.do?reqCode=radioCheckBoxInit', '1', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020809', '���첽����(�ύ���������)', '010208', null, '0', 'demo/formDemo.do?reqCode=formSubmitInit', '1', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020810', '��ͬ���ύ', '010208', null, '0', 'demo/formDemo.do?reqCode=formSynSubmitInit', '1', 10, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020813', '���������˵���', '010208', null, '0', 'demo/formDemo.do?reqCode=toobarDemo1Init', '1', 11, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020814', '��Ϣ�Ի���', '010208', null, '0', 'demo/formDemo.do?reqCode=msgDemo1Init', '1', 12, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020815', '���ı������', '010208', null, '0', 'demo/formDemo.do?reqCode=htmlEditorInit', '1', 13, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020816', '���ı������(��չ)', '010208', null, '0', 'demo/formDemo.do?reqCode=htmlEditor2Init', '1', 14, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010209', '���ڼ����', '0102', null, '0', null, '0', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020901', '��巶��һ', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=panelDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020902', '���ڷ���һ', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=windowDemo1Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01020903', 'Tab��ǩ������һ', '010209', null, '0', 'demo/commonUiDemo.do?reqCode=tabPanelDemo1Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010210', '���', '0102', null, '0', null, '0', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021001', '�����һ(��������)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021002', '�������(�м�չ��)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021003', '�������(�ɱ༭���)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021004', '�������(������)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021005', '�������(������)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo5Init', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021006', '�������(�ϼƱ��)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo6Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021007', '�������(��ͷ����)', '010210', null, '0', 'demo/gridDemo.do?reqCode=gridDemo7Init', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010211', '��', '0102', null, '0', null, '0', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021101', '������һ(��ͨ��)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo1Init', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021102', '��������(�첽��)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo2Init', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021103', '��������(��ѡ��)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo3Init', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021104', '��������(������ѡ��)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo4Init', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021105', '��������(������)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo5Init', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021106', '��������(�첽�����)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo6Init', '1', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021107', '��������(������2)', '010211', null, '0', 'demo/treeDemo.do?reqCode=treeDemo8Init', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010212', '����', '0102', null, '0', null, '0', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021201', 'Applet����', '010212', null, '0', 'demo/jasperReportDemo.do?reqCode=appletInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021202', 'PDF����', '010212', null, '0', 'demo/jasperReportDemo.do?reqCode=pdfInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021203', 'Excel����', '010212', null, '0', 'demo/excelReportDemo.do?reqCode=exportInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('010213', 'ͼ��', '0102', null, '0', null, '0', 6, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021301', '2D��״ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DColumnInit', '1', 1, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021302', '3D��״ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DColumnInit', '1', 2, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021303', '2D��ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DPieInit', '1', 3, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021304', '3D��ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DPieInit', '1', 4, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021305', '2D��״���ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DColumnMsInit', '1', 5, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021306', '3D��״���ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DColumnMsInit', '1', 6, null, null, '0', null, null, null, '0');
commit;
prompt 100 records committed...
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021307', '����ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineInit', '1', 7, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021308', '�������ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfLineMsInit', '1', 8, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021309', '���ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAreaInit', '1', 9, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021310', '������ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAreaMsInit', '1', 10, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021311', '��״ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfCircularityInit', '1', 11, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021312', '3D������״����ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf3DLineColumnInit', '1', 12, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021313', '2D��λͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DBarInit', '1', 13, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021314', '2D��λ���ͼ', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcf2DBarMsInit', '1', 14, null, null, '0', null, null, null, '0');
insert into EAMENU (menuid, menuname, parentid, iconcls, expanded, request, leaf, sortno, remark, icon, menutype, shortcut, width, height, scrollbar)
values ('01021315', '����ͼ(JS����|����[������])', '010213', null, '0', 'demo/flashReportDemo.do?reqCode=fcfAdvancedInit', '1', 15, null, null, '0', null, null, null, '0');
commit;
prompt 109 records loaded
prompt Loading EAMENUPART...
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000116', '01021603', 'id_tbi_add', '1', '������������ť');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000107', '0102071803', 'id_txt_xmid', '2', '��ĿID�����');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000108', '0102071803', 'id_btn_print', '1', '��ӡ��ť');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000109', '0102071803', 'id_grid_sfxm', '3', 'ҽԺ�շ���Ŀ���');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000113', '01021603', 'id_txt_xmid', '2', '��ĿID�ı������');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000114', '01021603', 'id_btn_print', '1', '��ӡ��ť');
insert into EAMENUPART (partid, menuid, cmpid, cmptype, remark)
values ('10000115', '01021603', 'id_grid_sfxm', '3', '�շ���Ŀ���');
commit;
prompt 7 records loaded
prompt Loading EAPARAM...
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000008', 'SYS_DEFAULT_THEME', 'default', 'ϵͳĬ������Ƥ��');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000009', 'DEFAULT_ADMIN_ACCOUNT', 'super', 'Ĭ�ϳ�������Ա�ʻ�');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000010', 'DEFAULT_DEVELOP_ACCOUNT', 'developer', 'ϵͳĬ�Ͽ���ר���ʻ�');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000017', 'SYS_TITLE', 'G4Studio��JavaEE��ҵӦ�ö��ο��ٿ���ƽ̨V5.2', 'ϵͳ����');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000018', 'LOGIN_WINDOW_TITLE', 'G4Studio - JavaEE��ҵӦ�ö��ο��ٿ���ƽ̨V5.2', '��¼���ڱ���');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000019', 'LOGIN_WINDOW_BANNER', '/resource/image/login_banner.png', '��¼���ڵ�BannerͼƬ���ߴ���:450 X 70');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000020', 'WEST_NAVIGATE_TITLE', 'ϵͳ����', '��߲˵�����������');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000021', 'BOTTOM_COPYRIGHT', 'Copyright 2008 XiongChun �й�.�Ϻ�', '���½ǵİ�Ȩ��Ϣ');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000022', 'MENU_FIRST', 'G4Studio', '������嵼���˵��ĵ�һ���ڵ���');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000023', 'WELCOME_PAGE_TITLE', '�ҵĹ���̨', 'ȱʡ��ӭҳ��ı���');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000024', 'INDEX_BANNER', '/resource/image/title_banner.png', '��ҳBannerͼƬ,����Ϊ͸����PNGͼƬ,����ߴ�:600 X 58');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000025', 'PAGE_LOAD_MSG', 'G4ģ�����������������ҳ��,���Ե�...', 'ҳ����صȴ���ʾ��Ϣ');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000027', 'MULTI_SESSION', '1', '�Ƿ�����ͬһ���ʻ���������Ự���ӡ�1:����;0:������');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000028', 'WEST_CARDMENU_ACTIVEONTOP', '1', '��࿨Ƭ���˵���ǰ���Ƭ�Ƿ��ö�1:�ö�;0:���ö�');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000029', 'TITLE_ICON', 'g4.ico', '��ʾ�����������ǰ���Сͼ��(ע:����Ϊ.ico��ʽ)');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000031', 'EXCEPTION_CLIENT_WIN_SIZE', '400,150', '�ͻ����쳣��Ϣ���ڿ�ȸ߶�����');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000030', 'EXCEPTION_CLIENT_MSG', 'ϵͳ����������͹���Ա��ϵ��', '�ͻ����쳣��Ӧ��Ҫ��Ϣ');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000033', 'APP_LAYOUT', '1', 'ϵͳ��ȱʡ�����沼��ģʽ��1:��ͳ���䲼��;2:�������沼�֡�');
insert into EAPARAM (paramid, paramkey, paramvalue, remark)
values ('10000034', 'DESKTOP_BACKGROUND', 'desktop2.jpg', 'ϵͳȱʡ���汳��ͼƬ');
commit;
prompt 19 records loaded
prompt Loading EAROLE...
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000069', '�������籣�ֹ����ɫ', '001002001006001', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000070', '�������籣��ҵ�񾭰��ɫ', '001002001006001', '1', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000071', '�廪���籣�ֹ����ɫ', '001002001006001001', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000072', '�廪���籣��ҵ���ɫ', '001002001006001001', '1', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000073', '�������籣�ֹ����ɫ', '001002001006001002', '2', null, '0');
insert into EAROLE (roleid, rolename, deptid, roletype, remark, locked)
values ('10000074', '�������籣��ҵ�񾭰��ɫ', '001002001006001002', '1', null, '0');
commit;
prompt 6 records loaded
prompt Loading EAROLEAUTHORIZE...
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01', '2', '10001340');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '0102', '2', '10001341');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '010215', '2', '10001342');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021501', '2', '10001343');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021502', '2', '10001344');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021503', '2', '10001345');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021504', '2', '10001346');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021505', '2', '10001347');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01021506', '2', '10001348');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01', '1', '10001349');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '0101', '1', '10001350');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '010102', '1', '10001351');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010201', '1', '10001352');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010202', '1', '10001353');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01010204', '1', '10001354');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01', '2', '10001355');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '0102', '2', '10001356');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '010216', '2', '10001357');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021601', '2', '10001358');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021602', '2', '10001359');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000071', '01021603', '2', '10001360');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01', '1', '10001368');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '0101', '1', '10001369');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010102', '1', '10001370');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010201', '1', '10001371');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010202', '1', '10001372');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010204', '1', '10001373');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010207', '1', '10001374');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01010208', '1', '10001375');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01', '1', '10001386');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '0102', '1', '10001387');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '010215', '1', '10001388');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01021505', '1', '10001389');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000070', '01021506', '1', '10001390');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01', '1', '10001395');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '0102', '1', '10001396');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '010216', '1', '10001397');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021601', '1', '10001398');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021602', '1', '10001399');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000072', '01021603', '1', '10001400');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01', '2', '10001413');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '0102', '2', '10001414');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010210', '2', '10001415');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021001', '2', '10001416');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021002', '2', '10001417');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021003', '2', '10001418');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021004', '2', '10001419');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021005', '2', '10001420');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021006', '2', '10001421');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021007', '2', '10001422');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '010216', '2', '10001423');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021601', '2', '10001424');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021602', '2', '10001425');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000073', '01021603', '2', '10001426');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01', '1', '10001427');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '0102', '1', '10001428');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '010210', '1', '10001429');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021001', '1', '10001430');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021002', '1', '10001431');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021003', '1', '10001432');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021004', '1', '10001433');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021005', '1', '10001434');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021006', '1', '10001435');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021007', '1', '10001436');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '010216', '1', '10001437');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021601', '1', '10001438');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021602', '1', '10001439');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000074', '01021603', '1', '10001440');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01', '1', '10001441');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '0101', '1', '10001442');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '010102', '1', '10001443');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010201', '1', '10001444');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010202', '1', '10001445');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010204', '1', '10001446');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010207', '1', '10001447');
insert into EAROLEAUTHORIZE (roleid, menuid, authorizelevel, authorizeid)
values ('10000069', '01010208', '1', '10001448');
commit;
prompt 76 records loaded
prompt Loading EAROLEMENUPART...
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000006', '10000074', '01021603', '10000115', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000007', '10000074', '01021603', '10000114', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000008', '10000074', '01021603', '10000113', '3');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000009', '10000072', '01021603', '10000115', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000010', '10000072', '01021603', '10000114', '1');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000011', '10000072', '01021603', '10000113', '3');
insert into EAROLEMENUPART (authorizeid, roleid, menuid, partid, partauthtype)
values ('10000012', '10000074', '01021603', '10000116', '1');
commit;
prompt 7 records loaded
prompt Loading EASEQUENCE...
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1000', 'CODEID', '10000063', '�����ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1001', 'ROLEID', '10000074', '��ɫID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1002', 'USERID', '10004890', '�û�ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1003', 'PARAMID', '10000034', '����ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1004', 'EXCEPTIONID', '10000067', '�쳣ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1005', 'AUTHORIZEID_ROLE', '10001448', '��ɫ��ȨID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1006', 'AUTHORIZEID_USER', '10004856', '��Ա��ȨID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1007', 'AUTHORIZEID_USERMENUMAP', '10000343', '��Ա�˵�ӳ��ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1008', 'XMID', '1000341254', '��ʾ��(EZ_CHARGECATALOG)��ĿID', '0000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1009', 'EVENTID', '100000000034826', '�¼�ID', '000000000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1010', 'MONITORID', '100000000058564', 'SpringBean���ID', '000000000000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1011', 'FILEID', '10000111', '�ļ�ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1012', 'PARTID', '10000116', 'UIԪ��ID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1013', 'AUTHORIZEID_EAUSERAUTHORIZE', '10000000', 'UIԪ����Ա��ȨID', '00000000', '1');
insert into EASEQUENCE (sequenceid, fieldname, maxid, remark, pattern, idtype)
values ('1014', 'AUTHORIZEID_EAROLEAUTHORIZE', '10000012', 'UIԪ�ؽ�ɫ��ȨID', '00000000', '1');
commit;
prompt 15 records loaded
prompt Loading EAUSER...
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10000000', '�����û�', 'super', 'RPEobhXzwig=', '1', '001', '0', '�����û�,����ϵͳ��߹���Ȩ��', '3', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10000001', '������Ա', 'developer', 'RPEobhXzwig=', '0', '001', '0', '1', '3', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004885', '�ܴ�_a_1', 'xiongchun_a_1', 'RPEobhXzwig=', '0', '001002001006001', '0', '�������籣�ֹ���Ա', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004886', '�ܴ�_b_1', 'xiongchun_b_1', 'RPEobhXzwig=', '0', '001002001006001', '0', null, '1', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004887', '�ܴ�_a_2', 'xiongchun_a_2', 'RPEobhXzwig=', '0', '001002001006001001', '0', '�廪���籣�ֹ���Ա', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004888', '�ܴ�_b_2', 'xiongchun_b_2', 'RPEobhXzwig=', '0', '001002001006001001', '0', '�廪���籣��ҵ�񾭰�Ա', '1', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004889', '�ܴ�_a_3', 'xiongchun_a_3', 'RPEobhXzwig=', '0', '001002001006001002', '0', '�������籣�ֹ���Ա', '2', '1');
insert into EAUSER (userid, username, account, password, sex, deptid, locked, remark, usertype, enabled)
values ('10004890', '�ܴ�_b_3', 'xiongchun_b_3', 'RPEobhXzwig=', '0', '001002001006001002', '0', '�������籣��ҵ�񾭰�Ա', '1', '1');
commit;
prompt 8 records loaded
prompt Loading EAUSERAUTHORIZE...
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004885', '10000069', '10004851');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004887', '10000071', '10004852');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004889', '10000073', '10004853');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004888', '10000072', '10004854');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004886', '10000070', '10004855');
insert into EAUSERAUTHORIZE (userid, roleid, authorizeid)
values ('10004890', '10000074', '10004856');
commit;
prompt 6 records loaded
prompt Loading EAUSERMENUMAP...
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000022', '01', '10000163', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01', '10000157', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01', '10000179', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '01', '10000185', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '01', '10000189', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '01', '10000193', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000040', '01', '10000308', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '0101', '10000158', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '0101', '10000180', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '0101', '10000186', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '0101', '10000190', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '0101', '10000194', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '010103', '10000159', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '010103', '10000181', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '010103', '10000187', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '010103', '10000191', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '010103', '10000195', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010301', '10000160', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010301', '10000182', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000030', '01010301', '10000188', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000031', '01010301', '10000192', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000032', '01010301', '10000196', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010302', '10000162', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010302', '10000184', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000027', '01010303', '10000161', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000029', '01010303', '10000183', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000022', '0102', '10000164', '1');
insert into EAUSERMENUMAP (userid, menuid, authorizeid, authorizelevel)
values ('10000040', '0102', '10000309', '1');
commit;
prompt 28 records loaded
prompt Loading EAUSERMENUPART...
prompt Table is empty
prompt Loading EAUSERSUBINFO...
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10000000', 'lightRed', null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10000001', 'default', '1', 'desktop1.jpg');
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004885', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004886', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004887', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004888', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004889', null, null, null);
insert into EAUSERSUBINFO (userid, theme, layout, background)
values ('10004890', null, null, null);
commit;
prompt 8 records loaded
prompt Loading EA_DEMO_BYJSB...
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001042', '����������', '001999', '����', 'Ů', 77, 20101.29, 0, 20101.29, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004561', '����������', '000410', '������', '��', 85, 27803.35, 13.84, 27789.51, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004306', '����������', '002618', '����', '��', 80, 29354.35, 0, 29354.35, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004236', '����������', '003521', '����', '��', 79, 3551.82, 0, 3551.82, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004277', '����������', '001758', '�ܹ⻪', '��', 81, 10455.43, 41.52, 10413.91, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004435', '����������', '000698', '������', '��', 85, 50253.03, 138.4, 50114.63, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004335', '����������', '000992', '���ھ�', '��', 84, 38700.92, 0, 38700.92, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004223', '����������', '002614', '�����', '��', 88, 8771.32, 0, 8771.32, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004326', '����������', '000643', '����', '��', 81, 15085.67, 0, 15085.67, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002919', '����������', '000871', '�����', '��', 86, 20628.03, 0, 20628.03, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001150', '����������', '001841', '³��Ӣ', 'Ů', 79, 18398.57, 0, 18398.57, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002554', '����������', '000478', '�Ÿ���', '��', 81, 28484.7, 41.52, 28443.18, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002366', '����������', '000554', '������', 'Ů', 82, 22886.96, 0, 22886.96, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000001132', '����������', '002215', '�����', '��', 78, 46600.76, 33.08, 46567.68, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004363', '����������', '001614', '��־��', '��', 76, 9200.76, 0, 9200.76, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003304', '����������', '000169', '��ϲ��', '��', 80, 33303.11, 0, 33303.11, to_date('31-03-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005510', '����������', '000282', '�����', 'Ů', 81, 76.95, 0, 76.95, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005514', '����������', '002585', '����', '��', 77, 253.72, 0, 253.72, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005515', '����������', '002585', '����', '��', 77, 315.45, 0, 315.45, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005516', '����������', '002585', '����', '��', 77, 185, 0, 185, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005520', '����������', '002585', '����', '��', 77, 107.6, 0, 107.6, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145620');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005205', '����������', '001858', '������', '��', 78, 144.5, 0, 144.5, to_date('07-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005217', '����������', '001737', '����Ԫ', '��', 86, 314.86, 0, 314.86, to_date('07-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005269', '����������', '002569', '�����', '��', 79, 172.68, 0, 172.68, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005289', '����������', '004077', '��ҫ��', '��', 75, 164.16, 0, 164.16, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005293', '����������', '003568', '�ܵ��', '��', 81, 145.95, 0, 145.95, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005297', '����������', '002521', '������', 'Ů', 79, 144.49, 0, 144.49, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005300', '����������', '004077', '��ҫ��', '��', 75, 3.84, 0, 3.84, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005302', '����������', '002521', '������', 'Ů', 79, 148.68, 0, 148.68, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005713', '����������', '001731', '�˱�����', '��', 79, 102.53, 0, 102.53, to_date('15-04-2009 10:12:10', 'dd-mm-yyyy hh24:mi:ss'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005714', '����������', '001006', '��͢��', '��', 80, 290.58, 0, 290.58, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005720', '����������', '005147', '�ⶨ��', '��', 76, 68.88, 0, 68.88, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005874', '����������', '002639', '�̻���', '��', 79, 63.18, 0, 63.18, to_date('14-05-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11130085');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003900', '����������', '001587', '������', '��', 76, 14645.51, 0, 14645.51, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000000935', '����������', '001420', '������', '��', 81, 34113.88, 1.38, 34112.5, to_date('08-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005374', '����������', '003886', '���ƹ�', '��', 81, 133.63, 0, 133.63, to_date('09-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005376', '����������', '001514', '������', '��', 77, 218.95, 0, 218.95, to_date('09-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005395', '����������', '000630', '��ͬ��', '��', 80, 149.09, 0, 149.09, to_date('09-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003894', '����������', '000873', '�����', '��', 82, 17959.09, 0, 17959.09, to_date('09-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005425', '����������', '000120', '��Ʒ��', '��', 77, 502.48, 0, 502.48, to_date('09-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005433', '����������', '002557', '������', '��', 80, 214.57, 0, 214.57, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005440', '����������', '001324', '������', 'Ů', 74, 74, 0, 74, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005444', '����������', '004077', '��ҫ��', '��', 75, 305, 0, 305, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005445', '����������', '001324', '������', 'Ů', 74, 27, 0, 27, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145599');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005449', '����������', '002472', '�����', '��', 82, 132.26, 0, 132.26, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005450', '����������', '002472', '�����', '��', 82, 95.94, 5.76, 90.18, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005451', '����������', '002472', '�����', '��', 82, 166.44, 0, 166.44, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004571', '����������', '000842', '���Ĺ�', '��', 84, 7025.69, 0, 7025.69, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005458', '����������', '002137', '���׹�', '��', 78, 197.06, 0, 197.06, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005459', '����������', '002137', '���׹�', '��', 78, 356.17, 0, 356.17, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005463', '����������', '001093', '������', '��', 81, 212.61, 0, 212.61, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005464', '����������', '004763', '�ӿ�̩', '��', 80, 200.4, 0, 200.4, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005465', '����������', '001997', '������', '��', 74, 381.28, 0, 381.28, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004466', '����������', '002804', '���峬', '��', 77, 14178.69, 0, 14178.69, to_date('10-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005473', '����������', '000871', '�����', '��', 86, 207.84, 0, 207.84, to_date('11-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005475', '����������', '000871', '�����', '��', 86, 274.07, 0, 274.07, to_date('11-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005490', '����������', '000853', '������', '��', 75, 208.52, 0, 208.52, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004023', '����������', '000589', '������', 'Ů', 81, 11115.78, 4.58, 11111.2, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005499', '����������', '001888', '������', '��', 83, 102.03, 29.47, 72.56, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005506', '����������', '000282', '�����', 'Ů', 81, 358.84, 0, 358.84, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005508', '����������', '000282', '�����', 'Ů', 81, 209.19, 0, 209.19, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005509', '����������', '000630', '��ͬ��', '��', 80, 50.43, 0, 50.43, to_date('13-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005651', '����������', '000602', '���', '��', 82, .49, 0, .49, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005652', '����������', '000602', '���', '��', 82, 172.91, 0, 172.91, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005658', '����������', '000630', '��ͬ��', '��', 80, 155.21, 0, 155.21, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005659', '����������', '000630', '��ͬ��', '��', 80, 69.85, 0, 69.85, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005743', '����������', '001517', '����', '��', 75, 15, 0, 15, to_date('18-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005744', '����������', '001517', '����', '��', 75, 80, 0, 80, to_date('18-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145634');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005746', '����������', '001234', '��Ӧ��', 'Ů', 77, 38.21, 0, 38.21, to_date('18-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005747', '����������', '001234', '��Ӧ��', 'Ů', 77, 370.34, 0, 370.34, to_date('18-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005765', '����������', '000853', '������', '��', 75, 248.61, 0, 248.61, to_date('20-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005569', '����������', '000768', '����ϲ', '��', 86, 56.54, 0, 56.54, to_date('14-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005583', '����������', '001514', '������', '��', 77, 82, 0, 82, to_date('14-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005597', '����������', '000979', '�·���', 'Ů', 73, 221.58, 0, 221.58, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145608');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005605', '����������', '001008', '������', '��', 77, 304.24, 0, 304.24, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005623', '����������', '000966', '���˻�', '��', 84, 208.18, 0, 208.18, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004218', '����������', '005145', 'ʯ�ʽ�', '��', 76, 22657, 0, 22657, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004620', '����������', '000124', '���շ�', 'Ů', 78, 44522.13, .24, 44521.89, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005631', '����������', '000416', '����Ӣ', 'Ů', 76, 70, 10, 60, to_date('15-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145608');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005640', '����������', '004133', '�Ź�ά', '��', 75, 169.12, 0, 169.12, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005642', '����������', '002557', '������', '��', 80, 139.48, 0, 139.48, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005780', '����������', '000282', '�����', 'Ů', 81, 121.11, 0, 121.11, to_date('20-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005783', '����������', '000979', '�·���', 'Ů', 73, 101.38, 0, 101.38, to_date('20-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145593');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005675', '����������', '002149', '��ܲ', 'Ů', 79, 173.53, 0, 173.53, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005676', '����������', '002149', '��ܲ', 'Ů', 79, 94.2, 0, 94.2, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005677', '����������', '002149', '��ܲ', 'Ů', 79, 416.7, 0, 416.7, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005678', '����������', '002149', '��ܲ', 'Ů', 79, 150, 0, 150, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005682', '����������', '001093', '������', '��', 81, 232.98, 0, 232.98, to_date('16-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005696', '����������', '001308', '����', 'Ů', 77, .49, 0, .49, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005697', '����������', '001308', '����', 'Ů', 77, 204.96, 0, 204.96, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145612');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005704', '����������', '004077', '��ҫ��', '��', 75, 50, 0, 50, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005706', '����������', '004077', '��ҫ��', '��', 75, 225, 10, 215, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005709', '����������', '004077', '��ҫ��', '��', 75, 15, 0, 15, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005717', '����������', '005147', '�ⶨ��', '��', 76, 79.79, 0, 79.79, to_date('17-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145640');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005553', '����������', '004416', '���ɶ�', 'Ů', 78, 237.02, 0, 237.02, to_date('14-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145606');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000002646', '����������', '002451', '��ϲ', '��', 77, 10788.07, 90.11, 10697.96, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005095', '����������', '000943', '������', '��', 80, 967.12, 0, 967.12, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145624');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000005097', '����������', '002343', '�����', '��', 78, 170.93, 0, 170.93, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11145597');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000004260', '����������', '002776', 'ԭ����', 'Ů', 76, 6272.9, 62.6, 6210.3, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
insert into EA_DEMO_BYJSB (sxh, dwmc, grbm, xm, xb, xnl, fyze, zfje, ybbx, jssj, yymc, jbr)
values ('BJLK1000000003906', '����������', '004961', '�Ž���', '��', null, 27195.52, 27.68, 27167.84, to_date('03-04-2009', 'dd-mm-yyyy'), '�����е�һ����ҽԺ', '11138416');
commit;
prompt 100 records loaded
prompt Loading EA_DEMO_BYMXB...
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063409', 'סԺ', '000768', '����ϲ', '��Ѫ�ܽ�������', '��Ƥѡ����ǳ�����ù���', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063410', 'סԺ', '000768', '����ϲ', 'һ��������', '��ͨ��Һ����Һ(��һ��)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063411', 'סԺ', '000768', '����ϲ', '���Ϸ�', 'BD������', 1, 17.43, 17.43, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063412', 'סԺ', '000768', '����ϲ', '���Ϸ�', 'һ����ӲĤ�������(����AS-E)', 1, 42, 42, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063413', 'סԺ', '000768', '����ϲ', '���Ϸ�', 'ҽ�ÿ����շ����(ǿ��ޱ��J397G4/0)', 1, 49.71, 49.71, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063414', 'סԺ', '000768', '����ϲ', '��������', 'ӲĤ����������(2Сʱ������)', 1, 180, 180, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063415', 'סԺ', '000768', '����ϲ', '��ҩ', '�Ȼ�����500ml����', 2, 2.07, 4.14, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063416', 'סԺ', '000768', '����ϲ', '��ҩ', '�������ָ���', 2, 6.27, 12.54, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063417', 'סԺ', '000768', '����ϲ', 'һ��������', '��������(��ͨ����)', 2.5, 3, 7.5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063418', 'סԺ', '000768', '����ϲ', '��������', '�����м��', 2.5, 50, 125, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063419', 'סԺ', '000768', '����ϲ', '��ҩ', '���ȿ�����', 3, .91, 2.73, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063420', 'סԺ', '000768', '����ϲ', '��ҩ', '�������', 6, 2.67, 16.02, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063421', 'סԺ', '000768', '����ϲ', 'һ��������', '������Һ(�ڶ�����', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063422', 'סԺ', '000768', '����ϲ', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063423', 'סԺ', '000768', '����ϲ', '��ҩ', '������', 1, 45.53, 45.53, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063424', 'סԺ', '000768', '����ϲ', '���������뿵��', '��ѹ����', 2, 15, 30, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063425', 'סԺ', '000768', '����ϲ', 'һ��ҽ�Ʒ���', 'סԺ����', 1, 3, 3, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063426', 'סԺ', '000768', '����ϲ', '��λ��', '������һ��', 1, 40, 40, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063427', 'סԺ', '000169', '��ϲ��', '��ҩ', '����������', 2, 16.07, 32.14, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063428', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063429', 'סԺ', '000169', '��ϲ��', '��ҩ', '�������Ƭ', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063430', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063431', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063432', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063433', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063434', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063435', 'סԺ', '000169', '��ϲ��', '��ҩ', '�������Ƭ', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063436', 'סԺ', '000169', '��ϲ��', 'һ��������', '������', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063437', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063438', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����100ml(ֱ�����)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063439', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����100ml(ֱ�����)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063440', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������', 1, 6.79, 6.79, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063441', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063442', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����ò����ε»���Һ', 1, 19.47, 19.47, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063443', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063444', 'סԺ', '000169', '��ϲ��', '��ҩ', 'ͷ����뿷���', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063445', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ100', 1, .11, .11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063446', 'סԺ', '000169', '��ϲ��', '�ٴ���ϵͳ����', 'Ѫ�����Ͷȼ��', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063447', 'סԺ', '000169', '��ϲ��', '��ҩ', '������͡�ƽ���', 1, 4.7, 4.7, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063448', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063449', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063450', 'סԺ', '000169', '��ϲ��', 'һ��ҽ�Ʒ���', 'סԺ����', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063451', 'סԺ', '000169', '��ϲ��', '��λ��', '������һ��', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063452', 'סԺ', '000169', '��ϲ��', '��ҩ', '��˾ƥ�ֳ���Ƭ(J)', 1, .5, .5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063453', 'סԺ', '000169', '��ϲ��', '��ҩ', '������������Ƭ', 1, 3.07, 3.07, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063454', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063455', 'סԺ', '000169', '��ϲ��', '��ҩ', '����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063456', 'סԺ', '000169', '��ϲ��', '��ҩ', '������Ƭ', 1, .11, .11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063457', 'סԺ', '000169', '��ϲ��', '���Ϸ�', 'һ����˫��������', 1, .9, .9, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063458', 'סԺ', '000169', '��ϲ��', '��ҩ', '�������Ƭ', 1, 1, 1, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063459', 'סԺ', '000169', '��ϲ��', '��ҩ', '�������Ƭ(J)', 1, 3.45, 3.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063460', 'סԺ', '000169', '��ϲ��', '��ҩ', '�ǻ���������', 1, 4.97, 4.97, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063461', 'סԺ', '000169', '��ϲ��', '��ҩ', '���ȵ�ƽƬ(J)', 1, 5.84, 5.84, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063462', 'סԺ', '000169', '��ϲ��', '��ҩ', '����������', 2, 16.07, 32.14, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063463', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063464', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063465', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063466', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063467', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063468', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063469', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063470', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063471', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063472', 'סԺ', '000169', '��ϲ��', '��ҩ', 'ͷ����뿷���', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063473', 'סԺ', '000169', '��ϲ��', '��ҩ', '������͡�ƽ���', 1, 4.7, 4.7, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063474', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063475', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063476', 'סԺ', '000169', '��ϲ��', 'һ��ҽ�Ʒ���', 'סԺ����', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063477', 'סԺ', '000169', '��ϲ��', '��λ��', '������һ��', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063478', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063479', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063480', 'סԺ', '000169', '��ϲ��', '��ҩ', '��ù�ص���Һ', 1, 2.88, 2.88, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063481', 'סԺ', '000169', '��ϲ��', 'һ��������', '�򼶻���', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063482', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063483', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����100ml(ֱ�����)', 1, 5.11, 5.11, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063484', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����250ml(ֱ�����)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063485', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����250ml(ֱ�����)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063486', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063487', 'סԺ', '000169', '��ϲ��', 'һ��������', '������', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063488', 'סԺ', '000169', '��ϲ��', '�ٴ���ϵͳ����', 'Ѫ�����Ͷȼ��', 1, 2, 2, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063489', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063490', 'סԺ', '000169', '��ϲ��', 'һ��������', '�򼶻���', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063491', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063492', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ե���ˮ�������60', 3, 59.22, 177.66, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063493', 'סԺ', '000169', '��ϲ��', '��ҩ', 'ͷ����뿷���', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063494', 'סԺ', '000169', '��ϲ��', '��ҩ���г�ҩ', '��Ѫ����2ml', 10, 11.75, 117.5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063495', 'סԺ', '000169', '��ϲ��', '�ٴ���ϵͳ����', 'Ѫ�����Ͷȼ��', 24, 2, 48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063496', 'סԺ', '000169', '��ϲ��', 'һ��������', '��������(��ͨ����)', 24, 3, 72, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063497', 'סԺ', '000842', '���Ĺ�', '����', '���͸��׿���ⶨ(���Բⶨ)(��Ѫǰ����)', 1, 20, 20, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063498', 'סԺ', '000842', '���Ĺ�', '����', '������ȱ�ݲ�������ⶨ������ѧ����(��Ѫǰ����)', 1, 25, 25, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063499', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063500', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�Ӱ��������˸���Ƭ��', 2, 3.22, 6.44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063501', 'סԺ', '000842', '���Ĺ�', '��ҩ', '���ϰ�ҩ��', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063502', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����͡��', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063503', 'סԺ', '000842', '���Ĺ�', '��ҩ��Ƭ', '������*', 10, .84, 8.4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063504', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063505', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063506', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '��ζ�ػ�Ũ����200', 2, 11.22, 22.44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063507', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', 'Ѫ��ͨ����', 2, 38.28, 76.56, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063508', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
commit;
prompt 100 records committed...
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063509', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����͡��', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063510', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063511', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ǻ���������', 2, 49.7, 99.4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063512', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�������Ƭ', 2, 53.98, 107.96, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063513', 'סԺ', '000842', '���Ĺ�', '�ٴ���ϵͳ����', 'ѪҺ͸���˹�', 2, 500, 1000, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063514', 'סԺ', '000842', '���Ĺ�', 'һ��������', '��ͨ��Һ����Һ(��һ��)', 6, 5, 30, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063515', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������10ml', 6, 16.48, 98.88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063516', 'סԺ', '000842', '���Ĺ�', 'һ��������', '����ע��', 13, 4, 52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063517', 'סԺ', '000842', '���Ĺ�', '�ٴ���ϵͳ����', 'ѪҺ͸��', 17, 400, 6800, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063518', 'סԺ', '000842', '���Ĺ�', '�ٴ���ϵͳ����', 'Ѫ͸���', 19, 120, 2280, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063519', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������ὺ��', 2, 27.79, 55.58, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063520', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063521', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063522', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '�����', 2, 36.5, 73, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063523', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����͡��', 2, 44, 88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063524', 'סԺ', '000842', '���Ĺ�', '����', '���زⶨ��ø�ٶ���ѧ����(������1)��10�', 1, 8, 8, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063525', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ������ⶨ(������1)��10�', 1, 8, 8, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063526', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�Ȼ�����100ml(ֱ�����)', 1, 5.11, 5.11, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063527', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063528', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063529', 'סԺ', '000842', '���Ĺ�', '��ҩ', '���δ�ܺ���', 2, 42.02, 84.04, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063530', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063531', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063532', 'סԺ', '000842', '���Ĺ�', '��ҩ', 'ͷ���ǰ���Ƭ', 2, 28.58, 57.16, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063533', 'סԺ', '000842', '���Ĺ�', '��ҩ', '���ϰ�ҩ��', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063534', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����������(pls)', 2, 58.3, 116.6, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063535', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����͡��', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063536', 'סԺ', '000842', '���Ĺ�', '�ٴ���ϵͳ����', 'ʮ��ͨ���ĵ�ͼ���Լ��', 1, 25, 25, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063537', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063538', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', 1, 103.95, 103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063539', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '��������Ƭ', 2, 1.04, 2.08, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063540', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '��Ѫ������', 2, 7.76, 15.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063541', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', -1, -26.62, -26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), null);
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063542', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '������100ml', -1, -103.95, -103.95, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), null);
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063216', 'סԺ', '000768', '����ϲ', '����', 'Ѫ��ǰ�׵��ײⶨ�����߱��Ƿ��ȣ�(�ι���1)', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063217', 'סԺ', '000768', '����ϲ', '����', 'Ѫ����֬����A��ⶨ', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063218', 'סԺ', '000768', '����ϲ', '����', 'Ѫ����֬����B�ⶨ(�ι���1)', 1, 10, 10, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063219', 'סԺ', '000768', '����ϲ', '����', 'Ѫ�弡�ἤø��MBͬ��ø�����ⶨ(�ι���1)', 1, 50, 50, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063347', 'סԺ', '000169', '��ϲ��', 'һ��ҽ�Ʒ���', 'סԺ����', 1, 3, 3, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063348', 'סԺ', '000169', '��ϲ��', '��λ��', '������һ��', 1, 40, 40, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063349', 'סԺ', '000169', '��ϲ��', '��ҩ', '�����Ƭ', 1, .02, .02, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063350', 'סԺ', '000169', '��ϲ��', '��ҩ', '��������Ƭ(J)', 1, 2.48, 2.48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063351', 'סԺ', '000169', '��ϲ��', 'һ��������', '�򼶻���', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063352', 'סԺ', '000169', '��ϲ��', 'һ��������', '��̵����', 1, 5, 5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063353', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ȼ�����250ml(ֱ�����)', 1, 5.45, 5.45, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063354', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 1, 10, 10, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063355', 'סԺ', '000169', '��ϲ��', '���������뿵��', '����������', 2, 10, 20, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063356', 'סԺ', '000169', '��ϲ��', '��ҩ', '�Ե���ˮ�������60', 3, 59.22, 177.66, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063357', 'סԺ', '000169', '��ϲ��', '�����Ʒ�', '������������', 1, 25, 25, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063358', 'סԺ', '000169', '��ϲ��', '���������뿵��', '��ѹ����', 2, 15, 30, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063359', 'סԺ', '000169', '��ϲ��', '��ҩ', 'ͷ����뿷���', 4, 43.67, 174.68, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063360', 'סԺ', '000169', '��ϲ��', '��ҩ���г�ҩ', '��Ѫ����2ml', 10, 11.75, 117.5, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063361', 'סԺ', '000169', '��ϲ��', '�ٴ���ϵͳ����', 'Ѫ�����Ͷȼ��', 24, 2, 48, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063362', 'סԺ', '000169', '��ϲ��', 'һ��������', '��������(��ͨ����)', 24, 3, 72, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063363', 'סԺ', '000169', '��ϲ��', '�ٴ���ϵͳ����', 'ң���ĵ�໤', 24, 6, 144, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000003304', 'BJ1000063364', 'סԺ', '000169', '��ϲ��', '��ҩ', '̼���D3Ƭ', 1, .95, .95, null, null, to_date('24-03-2009', 'dd-mm-yyyy'), '11145566');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063365', 'סԺ', '000842', '���Ĺ�', '��ҩ', '���ϰ�ҩ��', 2, 29.76, 59.52, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063366', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063367', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063368', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063369', 'סԺ', '000842', '���Ĺ�', '��ҩ', '��������ɽ��������Ƭ(J)', 2, 16.27, 32.54, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063370', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '��Ч������120', 2, 20.33, 40.66, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063371', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '�������ε���', 2, 23.93, 47.86, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063372', 'סԺ', '000842', '���Ĺ�', '��ҩ', '����͡��', 5, 44, 220, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063373', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063374', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '�������ε���', 2, 23.93, 47.86, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063375', 'סԺ', '000842', '���Ĺ�', '��ҩ���г�ҩ', '�������Խ���', 2, 27.94, 55.88, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063376', 'סԺ', '000842', '���Ĺ�', '����', '�޻��ײⶨ(������1)��10�', 1, 4, 4, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063377', 'סԺ', '000842', '���Ĺ�', '����', '�����ⶨ��ø�ٶ���ѧ���ȣ�(������1)��10�', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063378', 'סԺ', '000842', '���Ĺ�', '����', '�����ǲⶨ(������1)��10�', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063379', 'סԺ', '000842', '���Ĺ�', '����', '��������ø�ⶨ�����ʷ��ȣ�(�ι���1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063380', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���-�Ȱ�����ת��ø�ⶨ(�ֹ��������ʷ���)g1', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063381', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ��׵��ײⶨ����ѧ���ȣ�(�ι���1��', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063382', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ������ᰱ��ת��ø�ⶨ(�ֹ��������ʷ���)�ι���', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063383', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ����������ⶨ����ѧ����ø���ȣ�(�ι���1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063384', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���ӵ����زⶨ���ֹ��������ʷ��ȣ�(�ι���1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063385', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���������ø�ⶨ���ֹ��������ʷ��ȣ�(�ι���1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063386', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ�����Ŷ����ᰱ��ת��ø�ⶨ���ֹ��������ʷ��ȣ�', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063387', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ��ֱ�ӵ����زⶨ����ѧ����ø�ٷ��ȣ�(�ι���1��', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063388', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���ܵ��̴��ⶨ����ѧ����ø���ȣ�(�ι���1)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063389', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���ܵ����زⶨ����ѧ����ø�ٷ���)���ι���1��', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063390', 'סԺ', '000842', '���Ĺ�', '����', 'Ѫ���ܵ��ײⶨ����ѧ���ȣ�(�ι���1��', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063391', 'סԺ', '000842', '���Ĺ�', '����', '���͸���e����ⶨ(�����ⶨ)(��Ѫǰ����)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063392', 'סԺ', '000842', '���Ĺ�', '����', '���͸���e��ԭ�ⶨ(�����ⶨ)(��Ѫǰ����)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063393', 'סԺ', '000842', '���Ĺ�', '����', '���͸��ױ��濹��ⶨ(�����ⶨ)(��Ѫǰ����)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063394', 'סԺ', '000842', '���Ĺ�', '����', '���͸��ױ��濹ԭ(�����ⶨ)(��Ѫǰ����)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063395', 'סԺ', '000842', '���Ĺ�', '����', '���͸��׺��Ŀ���ⶨ(�����ⶨ)(��Ѫǰ����)', 1, 18, 18, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063396', 'סԺ', '000842', '���Ĺ�', 'һ��������', '��������(��ͨ����)', 35.5, 3, 106.5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063397', 'סԺ', '000842', '���Ĺ�', '��ҩ', '�ͷ����������Ʒ��루skn��', 1, 26.62, 26.62, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000001672', 'BJ1000063398', 'סԺ', '000842', '���Ĺ�', '��ҩ', '��ŵ��������Һ', 2, 15.14, 30.28, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11145556');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063399', 'סԺ', '000768', '����ϲ', '��ҩ', '�Ȼ�����', 1, .5, .5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063400', 'סԺ', '000768', '����ϲ', 'һ��������', '������Һ(�ڶ�����', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063401', 'סԺ', '000768', '����ϲ', '��ҩ', '10%��������500ml����', 1, 3.28, 3.28, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063402', 'סԺ', '000768', '����ϲ', 'һ��������', '��ͨ��Һ����Һ(��һ��)', 1, 5, 5, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063403', 'סԺ', '000768', '����ϲ', '��ҩ', '�Ȼ�����250ml(ֱ�����)', 1, 5.45, 5.45, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063404', 'סԺ', '000768', '����ϲ', '��ҩ', 'ͷ���氲����0.5', 6, 45.1, 270.6, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063405', 'סԺ', '000768', '����ϲ', '��������', '׵��������2Сʱ���ϣ�', .5, 40, 20, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063406', 'סԺ', '000768', '����ϲ', '��ҩ', '���࿨����', 1, .44, .44, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063407', 'סԺ', '000768', '����ϲ', 'һ��������', '������Һ(�ڶ�����', 1, 1, 1, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
insert into EA_DEMO_BYMXB (sxh, xh, zflb, grbm, xm, sfdlmc, sfxmmc, sl, sjjg, fyze, cd, gg, sfsj, sfy)
values ('BJLK1000000004028', 'BJ1000063408', 'סԺ', '000768', '����ϲ', '��ҩ', '����������', 1, 2, 2, null, null, to_date('23-03-2009', 'dd-mm-yyyy'), '11147023');
commit;
prompt 200 records loaded
prompt Loading EA_DEMO_CHINAAREA...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230804', 'ǰ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230805', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230811', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230826', '�봨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230828', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230833', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230881', 'ͬ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230882', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230903', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230904', '���Ӻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231004', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231005', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231025', '�ֿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231081', '��Һ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231083', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231084', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231085', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231121', '�۽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231123', 'ѷ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231182', '���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231223', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231224', '�찲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231225', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231226', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231282', '�ض���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('231283', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('232723', 'Į����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310103', '¬����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310104', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310108', 'բ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310109', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310110', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310113', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310114', '�ζ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310115', '�ֶ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310116', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310117', '�ɽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310118', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310119', '�ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310120', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('310230', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320104', '�ػ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320106', '��¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320107', '�¹���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320111', '�ֿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320113', '��ϼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320114', '�껨̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320116', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320124', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320125', '�ߴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320202', '�簲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320203', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320205', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320206', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320211', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320282', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320302', '��¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320311', 'Ȫɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320321', '�ᡡ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320322', '�桡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320323', 'ͭɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320324', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320382', '������');
commit;
prompt 100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320404', '��¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320405', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320411', '�±���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320412', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320482', '��̳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320503', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320504', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320505', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320506', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320507', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320581', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320582', '�żҸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320583', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320584', '�⽭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320585', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320602', '�紨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320611', '��բ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320623', '�綫��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320682', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320683', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320684', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320705', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320706', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320802', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320803', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320804', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320811', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320826', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320829', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320830', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320831', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320902', 'ͤ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320903', '�ζ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320921', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320981', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('320982', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321011', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321023', '��Ӧ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321084', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321088', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321112', '��ͽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321203', '�߸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321281', '�˻���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321282', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321283', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321284', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321302', '�޳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321311', '��ԥ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('321324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330102', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330103', '�³���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330109', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330110', '�ຼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330122', 'ͩ®��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330127', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330185', '�ٰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330203', '������');
commit;
prompt 200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330205', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330206', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330211', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330212', '۴����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330225', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330226', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330281', '��Ҧ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330282', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330283', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330302', '¹����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330304', '걺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330322', '��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330326', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330328', '�ĳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330329', '̩˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330381', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330382', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330402', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330411', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330482', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330483', 'ͩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330503', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330602', 'Խ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330624', '�²���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330682', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330683', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330702', '�ĳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330703', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330726', '�ֽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330727', '�Ͱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330781', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330782', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330783', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330784', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330802', '�³���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330803', '�齭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330822', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330824', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330881', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330903', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330921', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('330922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331004', '·����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331021', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331023', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331024', '�ɾ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331082', '�ٺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331123', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331125', '�ƺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331126', '��Ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331127', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('331181', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340103', '®����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340104', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340122', '�ʶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340207', '𯽭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340221', '�ߺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340222', '������');
commit;
prompt 300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340302', '���Ӻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340303', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340304', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340311', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340321', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340322', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340402', '��ͨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340403', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340404', 'л�Ҽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340405', '�˹�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340406', '�˼���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340421', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340502', '���ׯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340503', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340504', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340521', '��Ϳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340602', '�ż���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340603', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340604', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340621', '�Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340702', 'ͭ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340703', 'ʨ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340711', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340721', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340802', 'ӭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340803', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340811', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340824', 'Ǳɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340825', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340826', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340827', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340828', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('340881', 'ͩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341002', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341003', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341004', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341021', '쨡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341023', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341124', 'ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341125', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341181', '�쳤��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341202', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341203', '򣶫��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341204', '�Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341221', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341222', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341226', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341282', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341302', 'ܭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341321', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341323', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341402', '�ӳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341421', '®����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341422', '��Ϊ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341423', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341424', '�͡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341502', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341503', 'ԣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341521', '�١���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341523', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341524', '��կ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341525', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341602', '�۳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341622', '�ɳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341702', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341722', 'ʯ̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341801', '��Ͻ��');
commit;
prompt 400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341821', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341822', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341824', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341825', '캵���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('341881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350102', '��¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350103', '̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350104', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350105', '��β��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350123', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350125', '��̩��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350128', 'ƽ̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350203', '˼����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350205', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350206', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350211', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350212', 'ͬ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350213', '�谲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350304', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350402', '÷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350403', '��Ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350421', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350426', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350427', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350429', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350502', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350504', '�彭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350505', 'Ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350521', '�ݰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350524', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350526', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350581', 'ʯʨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350582', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350583', '�ϰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350602', 'ܼ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350603', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350624', 'گ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350625', '��̩��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350626', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350627', '�Ͼ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350628', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350629', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350702', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350721', '˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350722', '�ֳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350724', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350782', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350783', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350784', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350821', '��͡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350823', '�Ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350824', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350881', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350921', 'ϼ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350926', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350981', '������');
commit;
prompt 500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('350982', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360104', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360111', '��ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360121', '�ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360122', '�½���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360203', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360281', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360302', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360313', '�涫��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360323', '«Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360402', '®ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360403', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360421', '�Ž���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360424', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360426', '�°���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360427', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360481', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360502', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360602', '�º���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360622', '�཭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360681', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360702', '�¹���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360721', '�ӡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360722', '�ŷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360726', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360727', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360728', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360729', 'ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360730', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360731', '�ڶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360732', '�˹���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360733', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360734', 'Ѱ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360735', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360781', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360782', '�Ͽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360803', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360822', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360823', 'Ͽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360824', '�¸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360826', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360827', '�촨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360828', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360829', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360830', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360881', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360902', 'Ԭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360923', '�ϸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360924', '�˷���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360926', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360981', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360982', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('360983', '�߰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361002', '�ٴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361021', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361022', '�质��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361023', '�Ϸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361025', '�ְ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361026', '�˻���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361027', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361028', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361029', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361030', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361102', '������');
commit;
prompt 600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361122', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361123', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361124', 'Ǧɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361125', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361126', '߮����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361127', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361128', '۶����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361129', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361130', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('361181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370124', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370126', '�̺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370203', '�б���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370205', '�ķ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370211', '�Ƶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370212', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370213', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370214', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370282', '��ī��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370283', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370284', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370285', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370302', '�ʹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370303', '�ŵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370304', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370306', '�ܴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370321', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370323', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370403', 'Ѧ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370404', 'ỳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370405', '̨��ׯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370406', 'ɽͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370502', '��Ӫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370503', '�ӿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370602', '֥���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370611', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370612', 'Ĳƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370613', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370634', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370682', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370683', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370684', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370685', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370686', '��ϼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370687', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370702', 'Ϋ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370703', '��ͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370704', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370705', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370782', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370783', '�ٹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370784', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370785', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370786', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370811', '�γ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370826', '΢ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370827', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370828', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370829', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370830', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370831', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370832', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370882', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370883', '�޳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370902', '̩ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370903', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370921', '������');
commit;
prompt 700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370923', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370982', '��̩��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('370983', '�ʳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371081', '�ĵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371082', '�ٳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371083', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371103', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371122', '�졡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371203', '�ֳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371302', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371311', '��ׯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371312', '�Ӷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371322', '۰����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371323', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371324', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371325', '�ѡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371326', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371328', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371402', '�³���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371421', '�ꡡ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371425', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371426', 'ƽԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371427', '�Ľ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371428', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371482', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371502', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371522', 'ݷ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371523', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371525', '�ڡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371526', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371581', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371623', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371624', 'մ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371626', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371702', 'ĵ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371721', '�ܡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371724', '��Ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371725', '۩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371726', '۲����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371727', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('371728', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410102', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410104', '�ܳǻ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410105', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410106', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410108', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410122', '��Ĳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410184', '��֣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410185', '�Ƿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410202', '��ͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410203', '˳�ӻ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410204', '��¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410205', '�Ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410211', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410221', '轡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410222', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410223', 'ξ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410302', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410304', '�ܺӻ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410307', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410322', '�Ͻ���');
commit;
prompt 800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410323', '�°���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410324', '�ﴨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410325', '�ԡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410328', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410381', '��ʦ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410402', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410404', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410411', 'տ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410422', 'Ҷ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410423', '³ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410425', 'ۣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410481', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410482', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410502', '�ķ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410505', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410506', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410526', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410527', '�ڻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410581', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410602', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410603', 'ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410611', '俱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410622', '信���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410704', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410711', '��Ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410724', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410725', 'ԭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410726', '�ӽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410727', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410728', '��ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410782', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410802', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410803', '��վ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410804', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410811', 'ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410825', '�¡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410881', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410882', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410883', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410922', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410926', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410927', '̨ǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('410928', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411002', 'κ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411023', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411024', '۳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411025', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411082', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411102', 'Դ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411103', '۱����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411122', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411221', '�ų���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411222', '�¡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411224', '¬����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411282', '�鱦��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411302', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411323', '��Ͽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411324', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411325', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411328', '�ƺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411329', '��Ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411330', 'ͩ����');
commit;
prompt 900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411402', '��԰��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411403', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411421', '��Ȩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411422', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411424', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411425', '�ݳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411426', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411502', 'ʦ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411503', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411521', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411522', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411523', '�¡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411524', '�̳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411525', '��ʼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411526', '�괨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411528', 'Ϣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411623', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411627', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411628', '¹����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411681', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411702', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411721', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411722', '�ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411723', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411725', 'ȷɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411726', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411727', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411728', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('411729', '�²���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420104', '�ǿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420106', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420107', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420111', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420112', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420114', '�̵���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420116', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420117', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420202', '��ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420203', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420204', '��½��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420205', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420281', '��ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420302', 'é����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420321', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420323', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420324', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420325', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420381', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420503', '��Ҹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420504', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420505', '�Vͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420506', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420525', 'Զ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420526', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420528', '����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420529', '���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420581', '�˶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420582', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420583', '֦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420602', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420606', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420607', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420625', '�ȳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420682', '�Ϻӿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420683', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420684', '�˳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420702', '���Ӻ���');
commit;
prompt 1000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420704', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420804', '�޵���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420821', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420822', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420902', 'Т����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420921', 'Т����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420981', 'Ӧ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420982', '��½��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('420984', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421002', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421081', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421083', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421087', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421121', '�ŷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421122', '�찲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421124', 'Ӣɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421125', '�ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421126', 'ޭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421127', '��÷��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421181', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421182', '��Ѩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421202', '�̰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421222', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421224', 'ͨɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421281', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('421381', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422801', '��ʩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422822', '��ʼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422823', '�Ͷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422826', '�̷���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422827', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('422828', '�׷���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429004', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429005', 'Ǳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429006', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('429021', '��ũ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430102', 'ܽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430104', '��´��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430111', '�껨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430121', '��ɳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430181', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430203', '«����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430204', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430211', '��Ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430302', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430321', '��̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430382', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430405', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430406', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430407', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430408', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430412', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430423', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430424', '�ⶫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430426', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430482', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430502', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430503', '������');
commit;
prompt 1100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430511', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430521', '�۶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430524', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430528', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430529', '�ǲ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430581', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430602', '����¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430603', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430611', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430626', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430682', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430723', '墡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430724', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430725', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430726', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430811', '����Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430822', 'ɣֲ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430903', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430921', '�ϡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430922', '�ҽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150404', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150421', '��³�ƶ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150422', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150423', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150425', '��ʲ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150426', '��ţ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150428', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150502', '�ƶ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150521', '�ƶ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150522', '�ƶ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150523', '��³��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150526', '��³����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150581', '���ֹ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150602', '��ʤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150621', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150622', '׼�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150623', '���п�ǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150624', '���п���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150627', '���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150702', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150722', 'Ī�����ߴ��Ӷ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150723', '���״�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150724', '���¿���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150725', '�°Ͷ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150726', '�°Ͷ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150727', '�°Ͷ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150781', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150782', '����ʯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150783', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150784', '���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150785', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150802', '�ٺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150821', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150822', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150823', '������ǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150824', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150825', '�����غ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150826', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150921', '׿����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150923', '�̶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150924', '�˺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150926', '���������ǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150927', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150928', '������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150929', '��������');
commit;
prompt 1200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150981', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152201', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152202', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152221', '�ƶ�������ǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152222', '�ƶ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152223', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152224', 'ͻȪ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152501', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152502', '���ֺ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152522', '���͸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152523', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152524', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152525', '������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152526', '������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152527', '̫������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152528', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152529', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152530', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152531', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152921', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152922', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('152923', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210102', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210103', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210104', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210105', '�ʹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210111', '�ռ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210113', '�³�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210114', '�ں���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210123', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210202', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210204', 'ɳ�ӿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210211', '�ʾ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210212', '��˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210213', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210281', '�߷�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210282', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210283', 'ׯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210304', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210311', 'ǧɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210321', '̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210323', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210402', '�¸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210404', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210411', '˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210421', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210422', '�±�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210423', '��ԭ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210502', 'ƽɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210503', 'Ϫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210504', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210505', '�Ϸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210521', '��Ϫ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210522', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210602', 'Ԫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210603', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210604', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210624', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210682', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210703', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210711', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210726', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210727', '�塡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210781', '�躣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210782', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210802', 'վǰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210803', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210804', '����Ȧ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210811', '�ϱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210882', '��ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210903', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210904', '̫ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210905', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210911', 'ϸ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210921', '�����ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('210922', '������');
commit;
prompt 1300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211003', '��ʥ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211004', '��ΰ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211005', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211011', '̫�Ӻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211102', '˫̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211103', '��¡̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211122', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211204', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211224', '��ͼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211281', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211282', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211302', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211322', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211324', '�����������ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211381', '��Ʊ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211382', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211402', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211404', '��Ʊ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('211481', '�˳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220102', '�Ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220103', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220106', '��԰��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220112', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220122', 'ũ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220181', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220183', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220203', '��̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220204', '��Ӫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220211', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220281', '�Ժ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220282', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220283', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220284', '��ʯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220323', '��ͨ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220381', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220382', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220402', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220503', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220521', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220581', '÷�ӿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220582', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220602', '�˵�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220623', '���׳�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220625', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220681', '�ٽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220721', 'ǰ������˹�ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220723', 'Ǭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220802', '䬱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220822', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220881', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('220882', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222401', '�Ӽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222402', 'ͼ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222403', '�ػ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222404', '������');
commit;
prompt 1400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222405', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222406', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('222426', '��ͼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230103', '�ϸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230106', '�㷻��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230108', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230109', '�ɱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230127', 'ľ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230128', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230129', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230182', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230183', '��־��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230184', '�峣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230202', '��ɳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230205', '����Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230206', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230207', '����ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230208', '÷��˹���Ӷ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230224', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230227', '��ԣ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230229', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230230', '�˶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230231', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230281', 'ګ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230303', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230304', '�ε���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230306', '���Ӻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230307', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230382', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230403', '��ũ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230404', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230405', '�˰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230406', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230407', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230421', '�ܱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230422', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230502', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230503', '�붫��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230505', '�ķ�̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230506', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230524', '�ĺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230602', '����ͼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230603', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230604', '�ú�·��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230605', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230606', '��ͬ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230622', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230623', '�ֵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230624', '�Ŷ������ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230703', '�ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230704', '�Ѻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230705', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230706', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230707', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230708', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230709', '��ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230710', '��Ӫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230711', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230712', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230713', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230714', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230715', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230716', '�ϸ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('230803', '������');
commit;
prompt 1500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110106', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110107', 'ʯ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110109', '��ͷ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110111', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110112', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110113', '˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110114', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110116', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110117', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110228', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('110229', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120101', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120102', '�Ӷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120104', '�Ͽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120105', '�ӱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120109', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120110', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120114', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('120225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130103', '�Ŷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130105', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130107', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130108', 'ԣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130124', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130127', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130128', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130129', '�޻���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130130', '�޼���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130131', 'ƽɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130132', 'Ԫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130133', '�ԡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130182', '޻����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130184', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130185', '¹Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130202', '·����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130203', '·����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130204', '��ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130205', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130207', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130208', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130223', '�С���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130225', '��ͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130227', 'Ǩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130229', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130230', '�ƺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130281', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130283', 'Ǩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130303', 'ɽ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130304', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130321', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130324', '¬����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130402', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130403', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130404', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130406', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130424', '�ɰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130426', '�桡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130427', '�š���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130430', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130431', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130432', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130433', '������');
commit;
prompt 1600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130434', 'κ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130435', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130481', '�䰲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130502', '�Ŷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130521', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130522', '�ٳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130525', '¡Ң��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130526', '�Ρ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130527', '�Ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130528', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130529', '��¹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130530', '�º���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130531', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130532', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130533', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130534', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130535', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130581', '�Ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130582', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130603', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130604', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130622', '��Է��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130623', '�ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130624', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130625', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130627', '�ơ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130628', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130629', '�ݳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130630', '�Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130631', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130632', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130633', '�ס���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130634', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130635', '󻡡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130636', '˳ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130637', '��Ұ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130638', '�ۡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130682', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130683', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130684', '�߱�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130702', '�Ŷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130705', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130706', '�»�԰��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130722', '�ű���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130724', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130726', 'ε����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130727', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130728', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130729', '��ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130730', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130731', '��¹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130732', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130733', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130802', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130803', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130804', 'ӥ��Ӫ�ӿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130821', '�е���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130822', '��¡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130823', 'ƽȪ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130824', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130825', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130826', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130827', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130828', 'Χ�������ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130902', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130903', '�˺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130921', '�ס���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130922', '�ࡡ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130925', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130926', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130927', '��Ƥ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130928', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130929', '�ס���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130930', '�ϴ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130981', '��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130982', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130983', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('130984', '�Ӽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131022', '�̰���');
commit;
prompt 1700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131024', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131025', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131026', '�İ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131028', '�󳧻���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131082', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131102', '�ҳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131121', '��ǿ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131123', '��ǿ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131125', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131126', '�ʳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131127', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131128', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('131182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140105', 'С����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140106', 'ӭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140107', '�ӻ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140108', '���ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140109', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140110', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140123', '¦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140181', '�Ž���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140202', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140203', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140211', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140212', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140225', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140226', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140227', '��ͬ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140302', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140303', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140311', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140321', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140322', '�ۡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140402', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140411', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140423', '��ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140425', 'ƽ˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140426', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140427', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140430', '�ߡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140431', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140481', 'º����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140502', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140521', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140524', '�괨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140581', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140602', '˷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140603', 'ƽ³��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140621', 'ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140622', 'Ӧ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140702', '�ܴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140722', '��Ȩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140723', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140726', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140727', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140728', 'ƽң��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140729', '��ʯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140802', '�κ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140821', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140823', '��ϲ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140824', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140825', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140826', '筡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140827', 'ԫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140828', '�ġ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140829', 'ƽ½��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140830', '�ǳ���');
commit;
prompt 1800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140882', '�ӽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140902', '�ø���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140922', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140926', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140927', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140928', '��կ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140929', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140930', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140931', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140932', 'ƫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('140981', 'ԭƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141002', 'Ң����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141022', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141023', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141024', '�鶴��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141025', '�š���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141026', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141027', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141028', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141029', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141030', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141031', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141032', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141033', '�ѡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141034', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141082', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141102', '��ʯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141121', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141123', '�ˡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141124', '�١���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141126', 'ʯ¥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141127', 'ᰡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141128', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141129', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141130', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141181', 'Т����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('141182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150102', '�³���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150104', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150121', '��Ĭ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150122', '�п�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150123', '���ָ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150124', '��ˮ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150125', '�䴨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150203', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150204', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150205', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150206', '���ƿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150207', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150221', '��Ĭ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150223', '�����ï����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150302', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150304', '�ڴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150402', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('150403', 'Ԫ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450205', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450223', '¹կ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450224', '�ڰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450225', '��ˮ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450226', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450302', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450304', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450311', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450321', '��˷��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450322', '�ٹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450323', '�鴨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450324', 'ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450325', '�˰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450328', '��ʤ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450329', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450330', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450331', '������');
commit;
prompt 1900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450332', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450404', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450405', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450422', '�١���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450423', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450481', '�Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450512', '��ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450602', '�ۿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450603', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450621', '��˼��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450681', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450703', '�ձ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450721', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450722', '�ֱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450802', '�۱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450803', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450804', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450821', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450881', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450921', '�ݡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450922', '½����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450924', '��ҵ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450981', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451002', '�ҽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451022', '�ﶫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451023', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451024', '�±���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451026', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451027', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451028', '��ҵ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451029', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451030', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451031', '¡�ָ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451102', '�˲���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451121', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451122', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451123', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451202', '��ǽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451221', '�ϵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451222', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451223', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451225', '�޳�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451226', '����ë����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451227', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451228', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451229', '������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451281', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451302', '�˱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451321', '�ó���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451324', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451381', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451425', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('451481', 'ƾ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460105', '��Ӣ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460107', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('460201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469001', '��ָɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469002', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469005', '�Ĳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469006', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469007', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469026', '�Ͳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469027', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469028', '�ٸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469030', '��ɳ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469031', '��������������');
commit;
prompt 2000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469033', '�ֶ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469034', '��ˮ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469035', '��ͤ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469036', '������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469037', '��ɳȺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469038', '��ɳȺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('469039', '��ɳȺ���ĵ������亣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500104', '��ɿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500106', 'ɳƺ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500107', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500108', '�ϰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500109', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500110', '��ʢ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500111', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500112', '�山��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500114', 'ǭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500222', '�뽭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500224', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500226', '�ٲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500227', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500228', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500229', '�ǿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500230', '�ᶼ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500231', '�潭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500232', '��¡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500233', '�ҡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500234', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500235', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500236', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500237', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500238', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500240', 'ʯ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500241', '��ɽ����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500242', '��������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500243', '��ˮ����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500382', '�ϴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500383', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('500384', '�ϴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510106', '��ţ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510107', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510108', '�ɻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510112', '��Ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510113', '��׽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510114', '�¶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510115', '�½���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510122', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510124', 'ۯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510129', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510131', '�ѽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510132', '�½���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510181', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510182', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510184', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510302', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510304', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510311', '��̲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510321', '�١���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510322', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510411', '�ʺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510422', '�α���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510503', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510504', '����̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510521', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510522', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510603', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510623', '�н���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510626', '�޽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510681', '�㺺��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510682', 'ʲ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510683', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510703', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510704', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510722', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510723', '��ͤ��');
commit;
prompt 2100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510726', '����Ǽ��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510727', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510811', 'Ԫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510812', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510822', '�ന��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510824', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510903', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510904', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510921', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510922', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('510923', '��Ӣ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511011', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511024', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511028', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511111', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511112', '��ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511113', '��ں���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511123', '��Ϊ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511126', '�н���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511129', '�崨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511132', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511133', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511181', '��üɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511302', '˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511303', '��ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511321', '�ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511322', 'Ӫɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511323', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511324', '��¤��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511325', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511422', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511521', '�˱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511522', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511525', '�ߡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511526', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511528', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511529', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511602', '�㰲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511622', '��ʤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511623', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511681', '��Ө��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511702', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511721', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511725', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511781', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511802', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511821', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511823', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511824', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511825', '��ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511826', '«ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511827', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511921', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511922', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('511923', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512002', '�㽭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('512081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513221', '�봨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513222', '����');
commit;
prompt 2200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513223', 'ï����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513225', '��կ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513226', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513227', 'С����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513228', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513229', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513230', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513231', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513232', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513233', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513322', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513325', '�Ž���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513327', '¯����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513328', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513330', '�¸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513331', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513332', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513333', 'ɫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513334', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513335', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513336', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513337', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513338', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513401', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513422', 'ľ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513423', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513424', '�²���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513426', '�ᶫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513427', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513428', '�ո���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513431', '�Ѿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513432', 'ϲ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513433', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513434', 'Խ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513435', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513436', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('513437', '�ײ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520111', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520112', '�ڵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520114', 'С����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520122', 'Ϣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520201', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520203', '��֦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520221', 'ˮ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520222', '�̡���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520302', '�컨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520303', '�㴨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520322', 'ͩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520325', '��������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520326', '������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520327', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520328', '��̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520330', 'ϰˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520381', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520382', '�ʻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520421', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520422', '�ն���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520423', '��������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520424', '���벼��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('520425', '�������岼����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522201', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522223', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522224', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522225', '˼����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522226', 'ӡ������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522227', '�½���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522228', '�غ�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522229', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522230', '��ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522323', '�հ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522324', '��¡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522325', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522327', '�����');
commit;
prompt 2300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522328', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522401', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522422', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522423', 'ǭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522424', '��ɳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522425', '֯����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522426', '��Ӻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522427', '���������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522601', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522622', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522623', 'ʩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522625', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522626', '᯹���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522627', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522628', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522629', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522630', '̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522631', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522632', '�Ž���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522633', '�ӽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522634', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522635', '�齭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522636', '��կ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522701', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522702', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522722', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522723', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522725', '�Ͱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522726', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522727', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522728', '�޵���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522729', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522730', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522731', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('522732', '����ˮ��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530102', '�廪��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530111', '�ٶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530112', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530121', '�ʹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530126', 'ʯ������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530127', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530128', '»Ȱ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530129', 'Ѱ���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530322', '½����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530323', 'ʦ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530324', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530325', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530328', 'մ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530381', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530422', '�ν���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530423', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530426', '��ɽ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530427', '��ƽ�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530428', 'Ԫ���������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530502', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530521', 'ʩ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530522', '�ڳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530621', '³����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530622', '�ɼ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530623', '�ν���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530624', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530626', '�罭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530627', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530628', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530629', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530630', 'ˮ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530702', '�ų���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530721', '����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530722', '��ʤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530723', '��ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530724', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530821', '�ն�����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530822', 'ī��������������');
commit;
prompt 2400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530823', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530824', '���ȴ�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530825', '�������������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530826', '���ǹ���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530827', '������������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530828', '����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530829', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530922', '�ơ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530924', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530925', '˫�����������岼�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530926', '�����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('530927', '��Դ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532322', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532323', 'Ĳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532324', '�ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532325', 'Ҧ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532326', '��Ҧ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532328', 'Ԫı��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532329', '�䶨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532331', '»����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532501', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532502', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532523', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532524', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532525', 'ʯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532526', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532528', 'Ԫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532529', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532530', '��ƽ�����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532531', '�̴���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532532', '�ӿ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532621', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532622', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532624', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532625', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532626', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532627', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532628', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532801', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532822', '�º���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532901', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532922', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532925', '�ֶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532926', '�Ͻ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532927', 'Ρɽ�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532928', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532929', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532930', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532931', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('532932', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533103', 'º����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533123', 'ӯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533124', '¤����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533321', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533324', '��ɽ������ŭ��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533325', '��ƺ����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533421', '���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('533423', 'ά��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540102', '�ǹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540123', '��ľ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540124', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540125', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('540127', 'ī�񹤿���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542124', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542127', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542128', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542129', 'â����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542132', '��¡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542133', '�߰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542221', '�˶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542224', 'ɣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542225', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542226', '������');
commit;
prompt 2500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542227', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542228', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542229', '�Ӳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542231', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542232', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542233', '�˿�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542301', '�տ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542322', '��ľ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542325', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542326', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542327', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542328', 'лͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542330', '�ʲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542331', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542332', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542333', '�ٰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542334', '�Ƕ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542335', '��¡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542336', '����ľ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542337', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542338', '�ڰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542421', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542424', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542426', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542427', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542428', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542429', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542523', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542525', '�Ｊ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542526', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542527', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542621', '��֥��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542622', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542623', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542624', 'ī����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('542627', '�ʡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610102', '�³���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610111', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610112', 'δ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610114', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610116', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610203', 'ӡ̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610204', 'ҫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610222', '�˾���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610302', 'μ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610303', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610304', '�²���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610323', '�ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610326', 'ü����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610327', '¤����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610328', 'ǧ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610329', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610330', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610331', '̫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610402', '�ض���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610404', 'μ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610422', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610423', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610424', 'Ǭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610425', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610426', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610427', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610428', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610429', 'Ѯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610430', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610431', '�书��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610481', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610502', '��μ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610522', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610523', '������');
commit;
prompt 2600 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610524', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610525', '�γ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610526', '�ѳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610527', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610528', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610581', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610582', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610621', '�ӳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610622', '�Ӵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610623', '�ӳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610625', '־����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610626', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610627', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610628', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610629', '�崨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610630', '�˴���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610631', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610632', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610702', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610721', '��֣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610722', '�ǹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610723', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610724', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610725', '�㡡��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610726', '��ǿ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610727', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610728', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610729', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610730', '��ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610802', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610821', '��ľ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610823', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610824', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610826', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610827', '��֬��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610828', '�ѡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610829', '�Ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610830', '�彧��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610831', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610922', 'ʯȪ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610924', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610925', '᰸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610926', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610927', '��ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610928', 'Ѯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('610929', '�׺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611024', 'ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611025', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('611026', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620102', '�ǹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620103', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620111', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620123', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620302', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620403', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620421', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620423', '��̩��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620502', '�س���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620521', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620522', '�ذ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620523', '�ʹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620524', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620525', '�żҴ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620623', '��ף����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620721', '����ԣ����������');
commit;
prompt 2700 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620724', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620725', 'ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620802', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620822', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620823', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620824', '��ͤ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620825', 'ׯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620826', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620902', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620923', '�౱�ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620924', '��������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620981', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('620982', '�ػ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621021', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621024', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621026', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621027', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621121', 'ͨμ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621122', '¤����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621123', 'μԴ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621124', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621125', '�ġ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621126', 'ạ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621202', '�䶼��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621221', '�ɡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621222', '�ġ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621223', '崲���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621226', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621227', '�ա���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('621228', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622901', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622921', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622924', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622925', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622926', '������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('622927', '��ʯɽ�����嶫����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623001', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623021', '��̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623022', '׿����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623026', 'µ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('623027', '�ĺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630102', '�Ƕ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630105', '�Ǳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630121', '��ͨ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('630123', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632121', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632122', '��ͻ�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632123', '�ֶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632126', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632127', '��¡����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632128', 'ѭ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632221', '��Դ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632224', '�ղ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632321', 'ͬ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632323', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632324', '�����ɹ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632522', 'ͬ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632523', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632524', '�˺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632525', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632621', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632623', '�ʵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632624', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632625', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632626', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632722', '�Ӷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632723', '�ƶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632724', '�ζ���');
commit;
prompt 2800 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632725', '��ǫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632726', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632801', '���ľ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632802', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632821', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632822', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('632823', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640106', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640181', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640202', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640205', '��ũ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640221', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640302', '��ͨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640323', '�γ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640324', 'ͬ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640381', '��ͭϿ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640402', 'ԭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640423', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640424', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640425', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640502', 'ɳ��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('640522', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650102', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650103', 'ɳ���Ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650105', 'ˮĥ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650106', 'ͷ�ͺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650107', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650108', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650121', '��³ľ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650202', '��ɽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650203', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650204', '�׼�̲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('650205', '�ڶ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652101', '��³����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652122', '۷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652123', '�п�ѷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652222', '������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652303', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652323', '��ͼ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652324', '����˹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652325', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652327', '��ľ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652328', 'ľ�ݹ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652701', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652722', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652723', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652801', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652822', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652823', 'ξ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652824', '��Ǽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652825', '��ĩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652826', '���Ȼ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652827', '�;���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652828', '��˶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652829', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652901', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652922', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652923', '�⳵��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652924', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652925', '�º���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652926', '�ݳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652927', '��ʲ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652928', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('652929', '��ƺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653001', '��ͼʲ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653022', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653023', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653024', '��ǡ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653101', '��ʲ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653121', '�踽��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653123', 'Ӣ��ɳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653125', 'ɯ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653126', 'Ҷ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653127', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653128', '���պ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653129', '٤ʦ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653130', '�ͳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653131', '��ʲ�����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653221', '������');
commit;
prompt 2900 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653222', 'ī����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653223', 'Ƥɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653225', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653226', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('653227', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654022', '�첼�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654024', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654025', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654026', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654027', '�ؿ�˹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654028', '���տ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654221', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654223', 'ɳ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654225', 'ԣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654226', '�Ͳ��������ɹ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654301', '����̩��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654321', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654323', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654324', '���ͺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654325', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('654326', '��ľ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659001', 'ʯ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659002', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659003', 'ͼľ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('659004', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1102', '��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1202', '��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1301', 'ʯ��ׯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1302', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1303', '�ػʵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1305', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1307', '�żҿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1308', '�е���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1309', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1310', '�ȷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1311', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1401', '̫ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1402', '��ͬ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1403', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1404', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1405', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1406', '˷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1407', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1408', '�˳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1409', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1410', '�ٷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1411', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1501', '���ͺ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1502', '��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1503', '�ں���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1504', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1505', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1506', '������˹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1507', '���ױ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1508', '�����׶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1509', '�����첼��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1522', '�˰���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1525', '���ֹ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('1529', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2103', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2104', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2105', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2108', 'Ӫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2109', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2110', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2111', '�̽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2114', '��«����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2203', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2204', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2205', 'ͨ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2206', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2207', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2208', '�׳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2224', '�ӱ߳�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2301', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2302', '���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2304', '�׸���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2305', '˫Ѽɽ��');
commit;
prompt 3000 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2307', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2308', '��ľ˹��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2309', '��̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2310', 'ĵ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2311', '�ں���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2312', '�绯��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('2327', '���˰������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3102', '��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3201', '�Ͼ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3205', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3206', '��ͨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3207', '���Ƹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3208', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3209', '�γ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3210', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3211', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3212', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3213', '��Ǩ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3307', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3308', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3309', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3310', '̨����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3311', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3401', '�Ϸ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3402', '�ߺ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3404', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3405', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3406', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3407', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3408', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3410', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3411', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3412', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3413', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3414', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3415', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3416', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3417', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3418', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3501', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3504', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3505', 'Ȫ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3506', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3507', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3508', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3509', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3601', '�ϲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3602', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3603', 'Ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3604', '�Ž���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3605', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3606', 'ӥ̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3607', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3608', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3609', '�˴���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3610', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3611', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3701', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3702', '�ൺ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3703', '�Ͳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3704', '��ׯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3705', '��Ӫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3706', '��̨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3707', 'Ϋ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3708', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3709', '̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3710', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3711', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3712', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3713', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3714', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3715', '�ĳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3716', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('3717', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4101', '֣����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4104', 'ƽ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4106', '�ױ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4109', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4110', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4111', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4112', '����Ͽ��');
commit;
prompt 3100 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4113', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4114', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4115', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4116', '�ܿ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4117', 'פ�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4201', '�人��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4202', '��ʯ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4203', 'ʮ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4205', '�˲���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4206', '�差��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4207', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4208', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4209', 'Т����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4210', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4211', '�Ƹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4212', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4213', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4228', '��ʩ����������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4290', 'ʡֱϽ������λ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4301', '��ɳ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4302', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4303', '��̶��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4305', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4307', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4308', '�żҽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4309', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4310', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4311', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4312', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4313', '¦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4331', '��������������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4401', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4402', '�ع���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4404', '�麣��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4405', '��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4406', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4407', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4408', 'տ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4409', 'ï����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4412', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4413', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4414', '÷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4415', '��β��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4416', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4417', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4418', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4419', '��ݸ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4420', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4451', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4452', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4453', '�Ƹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4501', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4502', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4503', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4504', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4505', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4506', '���Ǹ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4507', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4508', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4509', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4510', '��ɫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4511', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4512', '�ӳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4513', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4514', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4601', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4602', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('4690', 'ʡֱϽ�ؼ�������λ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5002', '��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5003', '��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5101', '�ɶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5103', '�Թ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5104', '��֦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5106', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5108', '��Ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5109', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5110', '�ڽ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5111', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5113', '�ϳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5114', 'üɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5115', '�˱���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5116', '�㰲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5117', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5118', '�Ű���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5119', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5120', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5132', '���Ӳ���Ǽ��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5133', '���β���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5134', '��ɽ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5202', '����ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5204', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5222', 'ͭ�ʵ���');
commit;
prompt 3200 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5223', 'ǭ���ϲ���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5224', '�Ͻڵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5226', 'ǭ�������嶱��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5227', 'ǭ�ϲ���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5304', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5305', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5306', '��ͨ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5307', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5308', '˼é��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5309', '�ٲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5323', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5325', '��ӹ���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5326', '��ɽ׳������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5328', '��˫���ɴ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5329', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5331', '�º���徰����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5333', 'ŭ��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5334', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5401', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5421', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5422', 'ɽ�ϵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5423', '�տ������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5424', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5425', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('5426', '��֥����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6102', 'ͭ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6104', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6105', 'μ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6106', '�Ӱ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6109', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6110', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6201', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6202', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6203', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6204', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6205', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6206', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6207', '��Ҵ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6208', 'ƽ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6209', '��Ȫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6210', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6211', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6212', '¤����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6229', '���Ļ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6230', '���ϲ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6301', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6321', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6322', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6323', '���ϲ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6325', '���ϲ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6326', '�������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6327', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6328', '�����ɹ������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6401', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6402', 'ʯ��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6403', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6404', '��ԭ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6405', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6501', '��³ľ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6502', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6521', '��³������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6522', '���ܵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6523', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6527', '���������ɹ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6528', '���������ɹ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6529', '�����յ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6530', '�������տ¶�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6531', '��ʲ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6532', '�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6540', '���������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6542', '���ǵ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6543', '����̩����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('6590', 'ʡֱϽ������λ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('11', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('12', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('13', '�ӱ�ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('14', 'ɽ��ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('15', '���ɹ�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('21', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('22', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('23', '������ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('31', '�Ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('32', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('33', '�㽭ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('34', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('35', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('36', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('37', 'ɽ��ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('41', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('42', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('43', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('44', '�㶫ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('45', '����׳��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('46', '����ʡ');
commit;
prompt 3300 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('50', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('51', '�Ĵ�ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('52', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('53', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('54', '����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('61', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('62', '����ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('63', '�ຣʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('64', '���Ļ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('65', '�½�ά���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('71', '̨��ʡ');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('81', '����ر�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('82', '�����ر�������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430923', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('430981', '�佭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431001', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431002', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431003', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431021', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431022', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431023', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431024', '�κ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431025', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431026', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431027', '����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431028', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431081', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431102', '֥ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431103', '��ˮ̲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431123', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431124', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431126', '��Զ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431127', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431128', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431129', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431202', '�׳���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431221', '�з���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431223', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431225', '��ͬ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431226', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431227', '�»ζ���������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431228', '�ƽ�����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431229', '�������嶱��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431230', 'ͨ������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431281', '�齭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431302', '¦����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431321', '˫����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431322', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431381', '��ˮ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('431382', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433101', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433122', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433123', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433124', '��ԫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433127', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('433130', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440102', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440104', 'Խ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440106', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440107', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440111', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440112', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440113', '��خ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440114', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440183', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440184', '�ӻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440203', '�佭��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440204', '䥽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440205', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440222', 'ʼ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440224', '�ʻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440229', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440232', '��Դ����������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440233', '�·���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440281', '�ֲ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440282', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440303', '�޺���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440304', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440305', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440306', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440307', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440308', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440402', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440403', '������');
commit;
prompt 3400 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440404', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440507', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440511', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440512', '婽���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440513', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440514', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440515', '�κ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440523', '�ϰ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440604', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440605', '�Ϻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440606', '˳����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440607', '��ˮ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440608', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440703', '���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440704', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440705', '�»���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440781', '̨ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440783', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440784', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440785', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440802', '�࿲��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440803', 'ϼɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440804', '��ͷ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440811', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440823', '��Ϫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440825', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440881', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440882', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440883', '�⴨��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440901', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440902', 'ï����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440903', 'ï����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440923', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440981', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440982', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('440983', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441203', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441223', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441225', '�⿪��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441226', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441283', '��Ҫ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441284', '�Ļ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441302', '�ݳ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441303', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441323', '�ݶ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441324', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441401', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441402', '÷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441421', '÷����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441422', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441423', '��˳��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441424', '�廪��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441426', 'ƽԶ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441427', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441481', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441501', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441502', '�ǡ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441521', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441523', '½����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441581', '½����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441601', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441602', 'Դ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441621', '�Ͻ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441622', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441623', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441624', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441625', '��Դ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441701', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441702', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441721', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441723', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441781', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441801', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441802', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441821', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441823', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441825', '��ɽ׳������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441826', '��������������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441827', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441881', 'Ӣ����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('441882', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445121', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445122', '��ƽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445202', '�ų���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445221', '�Ҷ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445222', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445224', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445281', '������');
commit;
prompt 3500 records committed...
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445301', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445302', '�Ƴ���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445321', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445322', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445323', '�ư���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('445381', '�޶���');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450101', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450102', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450103', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450105', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450107', '��������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450108', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450109', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450122', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450123', '¡����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450124', '��ɽ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450125', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450126', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450127', '�ᡡ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450201', '��Ͻ��');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450202', '������');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450203', '�����');
insert into EA_DEMO_CHINAAREA (areacode, areaname)
values ('450204', '������');
commit;
prompt 3523 records loaded
prompt Loading EA_DEMO_FCF...
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('һ��', '1098', 'AFD8F8', null, '0', '1', 1);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '40000', 'F6BD0F', null, '0', '1', 2);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '99999', '8BBA00', null, '0', '1', 3);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '109000', '008E8E', null, '0', '1', 4);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '35000', 'D64646', null, '1', '1', 5);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '90000', '8E468E', '60', '0', '1', 6);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '50000', '588526', null, '0', '1', 7);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '63000', 'B3AA00', null, '1', '1', 8);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '152000', '008ED6', null, '0', '1', 9);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮ��', '122000', '9D080D', null, '0', '1', 10);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮһ��', '30000', 'A186BE', null, '0', '1', 11);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮ����', '50000', '1EBE38', null, '0', '1', 12);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('һ��', '150000', 'AFD8F8', null, '0', '2', 1);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '20000', 'F6BD0F', null, '0', '2', 2);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '50000', 'FF8E46', null, '0', '2', 3);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '9000', '008E8E', null, '0', '2', 4);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '85000', 'D64646', null, '1', '2', 5);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '10000', '8E468E', '60', '0', '2', 6);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '40000', '588526', null, '0', '2', 7);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '78000', 'B3AA00', null, '1', '2', 8);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('����', '112000', '008ED6', null, '0', '2', 9);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮ��', '172000', '9D080D', null, '0', '2', 10);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮһ��', '10000', 'A186BE', null, '0', '2', 11);
insert into EA_DEMO_FCF (name, value, color, alpha, issliced, product, fcfid)
values ('ʮ����', '50000', '1EBE38', null, '0', '2', 12);
commit;
prompt 24 records loaded
prompt Loading EA_DEMO_SFXM...
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105703', '02', '���ͳ�ݾ��۽���', 'fjccjfjn', '0.25g��50��', 'ƿ', .9, '���Ҽ�', '�����ϰ�����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105704', '01', 'ע���ü׻������ɳ��', 'zsyjhspfsx', '0.2g', '��', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105705', '01', 'ע���ü׻������ɳ��', 'zsyjhspfsx', '0.4g', '��', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105706', '01', 'ע���ü׻������ɳ��', 'zsyjhspfsx', '0.2g', '��', .9, '�����', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105707', '01', 'ע���ü׻������ɳ��', 'zsyjhspfsx', '0.4g', '��', .9, '�����', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105708', '01', '�׻������ɳ��ע��Һ', 'jhspfsxzsy', '5ml:0.4g', '֧', .9, 'ע��Һ', '�����ҽ�ƴ�ѧ��ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105709', '01', '�׻������ɳ��ע��Һ', 'jhspfsxzsy', '5ml:0.4g', '��', .9, 'ע���', '�����ҽ�ƴ�ѧ��ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105710', '01', 'ע��������������ɳ��', 'zsyyszyfsx', '0.3g', '֧', .9, 'ע���', 'ɽ�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105711', '01', 'ע��������������ɳ��', 'zsyyszyfsx', '0.4g', '֧', .9, 'ע���', 'ɽ�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105712', '01', 'ע���ü׻���������ɳ��', 'zsyjhszyfsx', '0.1g', '֧', .9, 'ע���', '����ʡ����ҩҵ�Ƽ���չ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105713', '01', 'ע���ü׻���������ɳ��', 'zsyjhszyfsx', '0.2g', '֧', .9, 'ע���', '����ʡ����ҩҵ�Ƽ���չ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105714', '01', '����������ɳ��ע���', 'rszyfsxzsj', '100ml:0.2g', 'ƿ', .9, 'ע��Һ', '����������ҩҵ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105715', '01', '����������ɳ���Ȼ���ע��Һ', 'yszyfsxlhnzsy', '100ml:0.3g', 'ƿ', .9, 'ע���', '�㶫�˵�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105716', '01', '����������ɳ��ע��Һ', 'yszyfsxzsy', '10ml:0.3g', '��', .9, 'ע���', '�����ҽ�ƴ�ѧ��ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105717', '01', '�׻�������ɳ���Ȼ���ע��Һ', 'jhspzsxlhnzsy', '100ml:0.5g', 'ƿ', .9, 'ע��Һ', 'ɽ������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105718', '01', '������ע��Һ', 'axzzsy', '10ml:0.5g', '��', .9, 'ע���', 'ɽ���յ�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105719', '01', '����ƽע��Һ', 'lfpzsy', '5ml��0.3g', '��', .9, 'ע��Һ', '����˫����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105720', '01', '����ù����ע��Һ', 'lfmsnzsy', '5ml��0.25g', '��', .9, 'ע��Һ', '����˫����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105721', '01', 'ע��������ù����', 'zsylfmsn', '250mg', '֧', .9, '���ɷ���', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105722', '01', '��������', 'fkzjn', '0.15g��3��', '��', .9, '���Ҽ�', '���ϸ�������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105723', '01', '��������', 'fkzjn', '0.1g��6S��', '��', .9, '���Ҽ�', '�㶫�˵�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105724', '01', 'ע���ÿ���ù��������', 'zsyklmslsz', '1.2g', '֧', .9, '���ɷ���', '���ɹŰ�ҽ��ҩ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105725', '01', 'ͷ����ͪ�����̹��ע���', 'tbptnsbtnzsj', '1.0g', '֧', .9, 'ע���', '���ݶ�Ҷ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105726', '01', 'ע����ͷ����ͪ�����̹��(2:1', 'zsytbptnsbtn(2', '1.5g', '֧', .9, 'ע���', '���ݶ�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105727', '01', 'ע����ͷ����ͪ�����̹��(2:2', 'zsytbptnsbtn(2', '3g', '֧', .9, 'ע���', '���ݶ�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105728', '01', 'ע����ͷ����ͪ�����̹��', 'zsytbptnsbtn', '1.0g', '��', .9, 'ע���', '��������ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105729', '01', 'ע����ͷ����ͪ�����̹��', 'zsytbptnsbtn', '2.0g', '��', .9, 'ע���', '��������ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105730', '01', 'ע����ͷ����ͪ�����̹��(2.1', 'zsytbptnsbtn(2', '2.25g', 'ƿ', .9, 'ע���', '���ݹ���ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105731', '01', '�⺣����Һ', 'dhcry', '50ml*32.4g', 'ƿ', .9, '��Һ��', '���ӽ�ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105732', '01', '�⺣��ע��Һ', 'dhczsy', '300mg*20ml', 'ƿ', .9, 'ע��Һ', '�Ϻ��ο�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105733', '01', '�⺣��ע��Һ', 'dhczsy', '32.4g*50ml', 'ƿ', .9, 'ע���', '���պ���ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105734', '01', '��άA�ὺ��', 'ywasjw', '10mg*15��/��', '��', .9, '����', '�Ϻ����������﹤�̹ɷ����޹�˾������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105735', '01', '����ɳ̹֬����', 'kdstzjn', '4ml*14��', '��', .9, '���Ҽ�', '��������ҩҵ���Źɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105736', '01', '����ɳ̹Ƭ', 'tmstp', '40mg*20Ƭ/��', '��', .9, 'Ƭ��', '���쿵����ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105737', '01', '��ɳ̹��ɢƬ', 'xstfsp', '80mg��7Ƭ', '��', .9, '��ɢƬ��', '���ϻ�¡��ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105738', '01', '��ɳ̹��ɢƬ', 'xstfsp', '80mg��14Ƭ', '��', .9, '��ɢƬ��', '���ϻ�¡��ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105739', '01', 'ע����������', 'zsyxpn', '50mg', '��', 1, '���ɷ���', '���⿵ŵҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105740', '01', '���ᴨܺ�ע��Һ', 'lscxqzsy', '2ml��50mg', '��', .9, 'ע���', '�����췽ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105741', '01', '���ᴨܺ�������ע��Һ', 'lscxqpttzsy', '100ml:0.1g', 'ƿ', .9, 'ע��Һ', '����˧����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105742', '01', 'ע�������ᴨܺ�', 'zsylscxq', '0.1g/ƿ', 'ƿ', .9, '�����', '����ʡ��������Ѹҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105743', '01', '��������ɽ����ע��Һ', 'dxsyslzzsy', '2ml��25mg', '֧', .9, 'ע���', '������Ҷҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105744', '01', 'ע���õ�������ɽ����', 'zsydxsyslz', '25mg', '֧', .9, 'ע��Һ', '�人����������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105745', '01', '�����ǰ��ׇf��Ƭ', 'ffhajzp', '0.5g', 'ƿ', 1, 'Ƭ��', '������گҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105746', '01', '�ǰ������ע��Һ', 'hamdnzsy', '2ml��0.4g', '֧', 1, 'ע��Һ', '������ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105747', '01', '���ỷ��ɳ��ע��Һ', 'rshbsxzsy', '100ml*0.2g', '��', 1, 'ע��Һ', '�Ĵ�����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105748', '01', '����ɳ�ǵζ�Һ', 'yfsxdey', '5ml.15mg', '֧', 1, '�ζ�Һ', '֣��׿����ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105749', '01', '����ɳ�ǵ���Һ', 'yfsxdyy', '15mg/5ml', '֧', .9, '���ü�', '�ձ�������ҩ��ʽ����', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105750', '01', '����ɳ���۸�', 'yfsxyg', '3.5g', '֧', .9, '�۸��', '�ձ�������ҩ��ʽ����', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105751', '01', '����ɳ��Ƭ', 'yfsxp', '0.1g*12Ƭ', '��', .9, 'Ƭ��', '�����ϲ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105752', '01', '����ɳ��Ƭ', 'yfsxp', '0.1��12Ƭ', '��', .9, 'Ƭ��', '�㽭�ö�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105753', '01', '����ɳ���Ȼ���ע��Һ', 'yfsxlhnzsy', '100ml', 'ƿ', 1, 'ע���', '��֦���󣨼��Ŵ�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105754', '01', '����ɳ���Ȼ���ע��Һ', 'yfsxlhnzsy', '100ml', 'ƿ', 1, 'ע���', '��֦���󣨼��Ŵ�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105755', '01', '����ɳ��ע��Һ', 'flsxzsy', '100ml:0.4g', '��', .9, 'ע���', '�Ĵ����󿵼���ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105756', '01', '����ɳ��ע���', 'jtsxzsj', '0.2g', '֧', .9, '�����', '�㽭��̫ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105757', '01', '�������ɳ���Ȼ���ע���', 'ysjtsxlhnzsj', '0.2g*100ml', 'ƿ', .9, 'ע��Һ', '������ԣ��ҩ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105758', '01', '����ɳ��ע��Һ', 'jtsxzsy', '0.2g', '��', .9, 'ע��Һ', '��������ҩҵ��������������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105759', '01', '����ɳ�ǽ���', 'jtsxjn', '200mg��8��', '��', .9, '���Ҽ�', '����ʡ�濵��ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105760', '01', '����ɳ��Ƭ', 'jtsxp', '0.2g*12Ƭ', '��', .9, 'Ƭ��', '������¡��ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105761', '01', '����ɳ��ע���', 'jtsxzsj', '10ml:200mg', '��', .9, 'ע���', '���մ󶫷�ҩҵ' || chr(10) || '�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105762', '01', '����ɳ��ע���', 'lmsxzsj', '0.1g*12', '��', .9, 'ע��Һ', '�㽭����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105763', '01', '�Ŷ���������ɳ��ע��Һ', 'mdaslmsxzsy', '10ml:0.2g', '֧', .9, 'ע���', '�����������ʾ�ó(������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105764', '01', '��������ɳ��Ƭ', 'yslmsxp', '0.3g*6Ƭ', '��', .9, 'Ƭ��', '����ŷ��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105765', '01', '��������ɳ��Ƭ', 'yslmsxp', '0.1g*12Ƭ', '��', .9, 'Ƭ��', '����ŷ��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105766', '01', 'ע���ÿ���ù��������', 'zsyklmslsz', '0.15g', 'ƿ', .9, 'ע���', '�㽭����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105767', '01', 'ע�������ᰱ����', 'zsyysaxs', '30mg', 'ƿ', .9, '���ɷ����', '�Ͼ�������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105768', '01', '�ӵ���øע���', 'mdbmzsj', '5mg*5ml', '��', .9, 'ע���', '�Ϻ���һ������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105769', '01', '�������װ��ὺ��', 'yxbgasjn', '0.2g', '��', .9, '���Ҽ�', '�㶫���˿�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105770', '01', '�����ʲݺϼ�', 'ffgchj', '180ml', 'ƿ', 1, '�ڷ���Һ��', '�Ͼ��׾�����ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105771', '01', '�����ʲݺϼ�', 'ffgchj', '100ml', 'ƿ', 1, '�ڷ���Һ��', '�Ͼ��׾�����ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105772', '01', '��������ɴ�����Һ', 'fflskdyry', '60ml', 'ƿ', .9, '��Һ��', '��������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105773', '01', 'ע��������������ɳ��', 'zsyqxsymsf', '5mg', '֧', .9, '���ɷ�', '���ս�˿��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105774', '91', '��׽���', 'jbjn', '0.4g��20', '��', .9, '���Ҽ�', '���ݺ�ʢ����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105775', '91', '��ζ��������', 'lwaxjn', '0.5g*36��', '��', .9, '���Ҽ�', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105776', '91', 'ŵ�Ͽ�����', 'ndkjn', '10��/��', '��', .9, '���Ҽ�', '�ɶ�ŵ�Ͽ�������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105777', '91', '������ʹ����', 'qzxttg', '5��', '��', .9, '���ø�', '����������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105778', '02', '����¶��¶Ƭ', 'cxlblp', '100Ƭ', 'ƿ', .9, 'Ƭ��', '����ҽҩ��ҵ�ɷ����޹�˾��������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105779', '02', '����¶��¶Ƭ', 'cxlblp', '100��1ƿ', 'ƿ', .9, 'Ƭ��', '����йڷ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105780', '02', '����¶��¶Ƭ', 'cxlblp', '0.3��100', 'ƿ', .9, 'Ƭ��', '�Ĵ���������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105781', '02', '����¶��¶Ƭ', 'cxlblp', '0.3��100s', 'ƿ', .9, 'Ƭ��', '����ǧ����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105782', '02', '�����޲���Ƭ', 'fflbmp', '100��1', 'ƿ', .9, 'Ƭ��', '��֥��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105783', '02', '�˲�������', 'rczzw', '3.0g*10��', '��', 1, '���', '�ڳ���ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105784', '02', '��ʦ��ע��Һ', 'zsmzsy', '2ml��10֧', '��', .9, 'ע��Һ', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105785', '02', '��ʦ��ע��Һ', 'zsmzsy', '2ml��10', '��', .9, 'ע��Һ', '������ҩҩҵ�����������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105786', '02', '������ζƬ', 'syswp', '360mg*100Ƭ', 'ƿ', 1, 'Ƭ��', '������������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105787', '02', '���ְ�Ƭ', 'plap', '0.5g��60Ƭ', '��', 1, 'Ƭ��', '�����ϰ�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105788', '02', '�����ʪҺ', 'bgfsy', '100ml*2ƿ/��', '��', 1, '�ڷ�Һ', '�㶫�޸�ɽҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105789', '02', '��������Ƭ', 'xyldp', '12Ƭ*3��', '��', 1, 'Ƭ��', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105790', '02', '��������', 'jwhrg', '10g/֧', '֧', 1, '����', '�������ô��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105791', '02', '����˨', 'hzs', '10ö', 'ƿ', .9, '˨��', '���ݾ�����ҩҵ�ɷ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105792', '02', '��̩˨', 'gts', '0.5g*4s', '��', .9, '˨��', '��̨�ٲ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105793', '02', '��̩˨', 'gts', '12g*6ö', '��', .9, '˨��', '��̨�ٲ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105794', '02', '�Ż��̴�˨', 'jhzcs', '2.1*5ö', '��', .9, '˨��', '�����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105795', '02', '�̴�˨', 'zcs', '10��/��', '��', .9, '˨��', '��������ҩҵ���޹�˾��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105796', '02', '��Ǯ�ݿ���', 'jqckl', '15g*10��', '��', .9, '������', '��������ά����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105797', '01', '�����ε��濵�����', 'qandykzrg', '15g:0.15g', '֧', .9, '����', '���ϵ�ŵ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105798', '01', 'ͷ�����ע��Һ', 'tbbwzsy', '2.0g', 'ƿ', .9, 'ע���', '����̫��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105799', '01', 'ͷ�������ע��Һ', 'tbzwnzsy', '2.0g', '֧', .9, 'ע���', '���ݶ�Ҷ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105800', '01', 'ע����ͷ����ͪ�����̹�ƣ�2��1', 'zsytbptnsbtn21', '0.75g', '��', .9, '�����', '�����л�������ҵ��ҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105801', '01', 'ע����������ڼ�', 'zsyysysj', '30mg', '֧', .9, '�����', '��������Ͽ��ҩ��ҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105802', '01', '�Ե���ˮ����ע��Һ', 'ndbsjwzsy', '5ml��5֧', '֧', .9, 'ע��Һ', '������̩��ҩ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105803', '01', 'ע�����Ե���ˮ����', 'zsyndbsjw', '������350mg���ܵ�60mg', '��', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105804', '01', 'ע�����Ե���ˮ����', 'zsyndbsjw', '������700mg���ܵ�120mg', '��', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105805', '01', 'ע�����Ե���ˮ����', 'zsyndbsjw', '������700mg;�ܵ�120mg', 'ƿ', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105806', '01', 'ע�����Ե���ˮ����(����', 'zsyndbsjw(dg', '���백����350mg+�ܵ�60mg', '֧', .9, 'ע���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105807', '01', '�Ե���ˮ����ע��Һ', 'ndbsjwzsy', '20m1/֧', '֧', .9, 'ע���', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105808', '01', 'СţѪȥ������ȡ��ע��Һ', 'xnxqdbtqwzsy', '2ml:80mg', '��', .9, 'ע���', '�人�˸�ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105809', '01', 'СţѪȥ������ȡ��ע��Һ', 'xnxqdbtqwzsy', '5ml:0.2g', '��', .9, 'ע���', '�人�˸�ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105810', '01', 'ע����������̹', 'zsyblxt', '8g', '��', .9, '���ɷ���', '���ڿ���Ԫ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105811', '01', '��������ע���', 'ysblczsj', '0.2g', '��', .9, 'ע���', '�㶫˳��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105812', '01', 'ע������������', 'zsyysblc', '0.2g��4֧', '֧', .9, '���ɷ���', '�����Ļ��Ʊ���ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105813', '01', '������̹Ƭ', 'hlxtp', '100mg/Ƭ', '��', .9, 'Ƭ��', '����������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105814', '01', 'ע����������ȷ���', 'zsyysjlfz', '0.1g', 'ƿ', .9, '���ɷ���', '�㶫������ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105815', '01', 'ע����������ȷ���', 'zsyysjlfz', '0.25g', 'ƿ', .9, '���ɷ���', '�㶫������ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105816', '01', 'ע����������ȷ���', 'zsyysjlfz', '0.1g', 'ƿ', .9, '�����', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105817', '01', '������ע��Һ', 'alszsy', '5ml:1g', '��', .9, 'ע���', '��������ͨҩҵ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105818', '01', 'ע���ð�����', 'zsyals', '1g', '֧', .9, '�����', '����������ҩҵ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105819', '01', 'ע���ð�����', 'zsyals', '0.5g', 'ƿ', .9, '���ɷ���', '�㶫������ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105820', '01', 'ע���ð�����', 'zsyals', '1.0g', 'ƿ', .9, '���ɷ���', '�㶫������ҩ�����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105821', '01', 'ע���ñ��ͱ�����', 'zsybbbtn', '0.1g', 'ƿ', 1, 'ע���', '����ʡ��������Ѹҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105822', '01', '��ƥ��¡Ƭ', 'zpklp', '7.5mg��12', '��', .9, 'Ƭ��', '��³��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105823', '01', '���͹���ע��Һ', 'gygtzsy', '250ml:25g', 'ƿ', 1, 'ע���', '�㶫�˵�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105824', '01', '������ע��Һ', 'tmszsy', '0.2g:2ml', '֧', .9, 'ע��Һ', '�ÿ�ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105825', '01', '������ע��Һ', 'tmszsy', '2ml:0.2g', '֧', .9, 'ע���', '������ɭ������ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105826', '01', '���ᶡ���ض�ע���', 'ysdkdezsj', '0.2g', '֧', .9, 'ע���', '���ݶ�Ҷ��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105827', '01', '������ע��Һ', 'xxtzsy', '2ml:10mg', '��', .9, 'ע���', '�人�˸�ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105828', '01', 'ע����������', 'zsyxxt', '20mg', '֧', .9, '���ɷ���', '���ɹŰ�ҽ��ҩ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105829', '01', '������ע���', 'xxtzsj', '5ml��50mg', '֧', .9, 'ע���', '�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105830', '01', '������ע���', 'xxtzsj', '10ml��80mg', '֧', .9, 'ע���', '�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105831', '01', 'ע����ͷ����ŵ��', 'zsytbmnn', '1.0g��ÿ��һƿ�����װ�װ0.9%������ע��Һ1', '��', .9, 'ע���', '�����л�������ҩ��ҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105832', '01', 'ע����ͷ����ŵ', 'zsytbmn', '0.5g*1֧/��', '��', .9, 'ע���', '���ݶ�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105833', '01', 'ע����ͷ����ŵ', 'zsytbmn', '1g*1֧/��', '��', .9, 'ע���', '���ݶ�����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105634', '01', '�����ĳ���Ƭ', 'xxtcrp', '20mg��6Ƭ', '��', .9, 'Ƭ��', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105635', '01', '�����ĳ���Ƭ', 'xxtcrp', '20mg��10Ƭ', '��', .9, 'Ƭ��', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105636', '01', '̥�̶���ע��Һ', 'tpdtzsy', '4ml', '֧', .9, 'ע��Һ', '����ǭ��������Ʒ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105637', '01', '��������Ƭ', 'lslzp', '30mg*14Ƭ', '��', .9, '����Ƭ', '�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105638', '01', '��ø����Ƭ', 'ymcrp', '0.3g*12Ƭ*2��', '��', .9, 'Ƭ��', 'ɽ��.��������������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105639', '01', '����Ʒע��Һ', 'atpzsy', '0.5mg', '��', 1, 'ע��Һ', '����ҫ���������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105640', '01', '����Ʒע��Һ', 'atpzsy', '5mg', '��', 1, 'ע��Һ', '����ҫ���������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105641', '01', '���ᰢ��Ʒע���', 'lsatpzsj', '0.5mg/1ml/10', '��', 1, 'ע���', '���ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105642', '01', '���ᰢ��Ʒע���', 'lsatpzsj', '1mg/1ml/10', '��', 1, 'ע���', '���ҩҵ������֣�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105643', '01', '���ᰢ��Ʒע��Һ', 'lsatpzsy', '1ml��0.5g��10֧', '��', 1, 'ע��Һ', '���ҩҵ������֣�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105644', '01', '������ɽݹ�м�(654-2��ע���', 'qxssldj(654-2z', '10mg/1ml/10', '��', 1, 'ע���', '֣��׿����ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105645', '01', '������ɽݹ�м�ע��Һ', 'qxssldjzsy', '10mg*1ml', '��', 1, 'ע��Һ', '��ˮϣ������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105646', '01', 'ɽݹ�м�ע��Һ', 'sldjzsy', '1ml*10֧*10mg', '��', 1, 'ע���', 'ϣ������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105647', '01', '��������ݹ�м�', 'ysxxldj', '10mg:1ml', '��', 1, 'ע��Һ', '֣��׿����ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105648', '01', '��������ɽݹ�м�', 'ysxxsldj', '10mg��10', '��', 1, 'ע��Һ', '֣��׿����ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105649', '01', '��������ɽݹ�м�ע��Һ', 'ysxxsldjzsy', '1ml��10mg��10֧', '��', 1, 'ע���', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105650', '01', 'ע���ö��嶫ݹ�м�', 'zsydxdldj', null, 'ƿ', .9, 'ע���', '����˫��ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105651', '01', '����������հ�ע���', 'ysjylpazsj', '10mg/1ml/10', '��', 1, 'ע���', '��������˹ҩҵ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105652', '01', '����������հ�ע���', 'ysjylpazsj', '10mg/1ml', '֧', 1, 'ע���', '��ͬ������ҩ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105653', '01', '����������հ�ע���', 'ysjylpazsj', '10mg 10֧* 1ml', 'ƿ', 1, '���', '���ҩҵ������֣�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105654', '01', '����������հ�ע���', 'ysjylpazsj', '1ml��10', '��', 1, 'ע��Һ', '֣��������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105655', '01', '����˾��ע��Һ', 'adsqzsy', '4mg:2ml', '֧', .9, 'ע��Һ', '����ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105656', '01', '���᰺��˾��ע��Һ', 'ysadsqzsy', '4mg*2ml*6֧', '֧', .9, 'ע���', '��³��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105657', '01', '����˾��ע��Һ', 'adsqzsy', '8mg*4ml', '��', .9, 'ע��Һ', '���Ϻϳ���ҩ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105658', '01', '����˾��ע��Һ', 'adsqzsy', '4mg:2ml', '֧', .9, 'ע��Һ', 'ɽ����³��ҩ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105659', '01', 'ע�����������˾��', 'zsyysglsq', '3mg', '��', .9, '���ɷ�', '����ʡ��̩ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105660', '01', '����˾���Ȼ���ע��Һ', 'glsqlhnzsy', '100ml:3mg', 'ƿ', .9, 'ע���', '����������ҩ��', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105661', '01', '���ᰢ��˾���Ȼ���ע��Һ', 'ysazsqlhnzsy', '50ml:10mg', 'ƿ', .9, 'ע���', 'ɽ��³������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105662', '01', '���ᰱ����������ע��Һ', 'ysaxspttzsy', '100ml:30mg', 'ƿ', .9, 'ע��Һ', '����˧����ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105663', '01', 'ע�������ᰱ����', 'zsyysaxs', '15mg', '֧', .9, '���ɷ����', 'ɽ������ҩҵ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105664', '01', 'ע�������ᰱ����', 'zsyysaxs', '15mg', 'ƿ', .9, '���ɷ����', '�Ͼ�������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105665', '01', '����ɳ���Ȼ���ע��Һ', 'jtsxlhnzsy', '100ml:0.2g', 'ƿ', .9, 'ע���', '��������ả��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105666', '01', '����ɳ��ע���', 'jtsxzsj', '0.2g:100ml', 'ƿ', .9, 'ע���', '����˫��ҩҵ�ɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105667', '01', '�Ŷ���������ɳ��ע��Һ', 'mdaslmsxzsy', '10ml:0.2g', '֧', .9, 'ע���', '�����������ʾ�ó��������ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105668', '01', '�������ͳ���Ӫ����', 'zdbxcnyyj', '40g*6��', '��', .9, '�ɻ�����', '�Ϻ�����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105669', '01', '�������ͳ���Ӫ����', 'zdbxcnyyj', '40g', '��', .9, '������', '�Ϻ���������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105670', '01', '�������ͳ���Ӫ����', 'zdbxcnyyj', '80g', '��', .9, '������', '�Ϻ���������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105671', '01', '�������ͳ���Ӫ����', 'zdbxcnyyj', '30ml', 'ƿ', .9, '�ڷ�Һ���', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105672', '01', 'ά����CƬ', 'wsscp', '100mg*100Ƭ', 'ƿ', .9, 'Ƭ��', 'ɽ���ٷ�����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105673', '01', '���˽�Ƭ', 'anjp', '0.25g', 'ƿ', .9, 'Ƭ��', '������گҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105674', '01', '���˽�Ƭ', 'anjp', '0.5g', 'ƿ', .9, 'Ƭ��', '������گҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105675', '01', '����ע��Һ', 'gtzsy', '10ml:50mg', '֧', .9, 'ע��Һ', 'ŵ����ҩ���������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105676', '01', '����ע��Һ', 'gtzsy', '20ml:100mg', '֧', .9, 'ע��Һ', 'ŵ����ҩ���������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105677', '01', '����ע��Һ', 'gtzsy', '2ml', '֧', .9, 'ע���', '�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105678', '01', '����ע��Һ', 'gtzsy', '10ml:50mg', '֧', .9, 'ע��Һ', 'ŵ����ҩ���������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105679', '01', '����ע��Һ', 'gtzsy', '10ml:50mg', '֧', .9, 'ע���', '���߿ư����ҩҵ�������޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105680', '01', '����ע��Һ', 'gtzsy', '2ml:10mg', 'ƿ', .9, 'ע���', '�Ͼ��°�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105681', '01', '�����Ȼ���ע��Һ', 'gtlhnzsy', '100ML:0.1G�������Ȼ���0.87G', 'ƿ', .9, 'ע��Һ', '����������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105682', '01', '����ע��Һ', 'gtzsy', '2ml:10mg', '֧', .9, 'ע���', '������گҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105683', '01', '���ӿ���Ƭ', 'lfkmp', '6Ƭ/��', '��', .9, 'Ƭ��', '�������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105684', '01', '������������', 'akhmjn', '����', '��', .9, '���Ҽ�', '������گҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105685', '01', '�������Ƭ', 'lslfp', '60mg*10S', '��', .9, 'Ƭ��', '�˰�ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105686', '02', '�൨��Ƭ', 'kdcp', '16��1', '��', .9, 'Ƭ��', '���ϵ���ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105687', '01', '��Ѫ�׵���', 'rxbdb', '10g:50ml', 'ƿ', .9, 'ע��Һ', '�㶫������ҩ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105688', '01', '������ע���', 'sgszsj', '10u:1ml', '��', 1, 'ע��Һ', '�Ϻ�һ����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105689', '01', '˫��̩˨', 'szts', '7ö', '��', .9, '˨��', '���ݾ�̩ҩҵ', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105690', '01', '��[131I]���ƽ���', 'd[131i]hnjn', null, null, 1, '����', '�к˸�ͨͬλ�عɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105691', '01', '�[99mTc]��������', 'd[99mtc]jyyj', null, null, .9, 'ע���', '�к˸�ͨͬλ�عɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105692', '01', '�[99mTc]�Ǽ׻��������', 'd[99mtc]yjjels', null, null, .9, 'ע���', '�к˸�ͨͬλ�عɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105693', '01', '��[125I]����', 'd[125i]zz', null, null, .9, '����Դ', '����ԭ����˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105694', '01', '��[153Sm]��������', 's[153sm]lxjn', null, null, .9, 'ע��Һ', '�к˸�ͨͬλ�عɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105695', '01', '��[89Sr]���Ȼ���', 's[89sr]elhs', null, null, .9, 'ע���', '�к˸�ͨͬλ�عɷ����޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105696', '01', '���������', 'ldlsn', '0.64g', 'ƿ', 1, '�������ø�ᾧ', '�Ϻ�����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105697', '01', '����׶�ע��Һ', 'djldzsy', '0.5g5*20ml', '��', 1, 'ע��Һ', '������ҩ����', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105698', '01', '��������ͪע��Һ', 'ysnltzsy', '0.4mg*10ml', '��', 1, 'ע��Һ', '����(����)��ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105699', '02', '��ʯ����', 'pskl', '20g��10��', '��', .9, '������', '�㶫�������ҩ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105700', '02', 'С����', 'xjw', '0.6g��4ƿ', '��', .9, '���', '�Ĵ�����������ҩ�������ι�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105701', '02', '�������ע��Һ', 'ffkczsy', '5ml', '��', .9, 'ע��Һ', 'ɽ����ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
insert into EA_DEMO_SFXM (xmid, sfdlbm, xmmc, xmrj, gg, dw, zfbl, jx, cd, qybz, yybm, ggsj)
values ('1000105702', '02', '���ע��Һ', 'cszsy', '10ml', '֧', .9, 'ע��Һ', '��������ҩҵ���޹�˾', '1', '03010001', to_date('16-10-2008', 'dd-mm-yyyy'));
commit;
prompt 200 records loaded
prompt Loading EA_DEMO_UPLOAD...
prompt Table is empty
prompt Enabling triggers for EACODE...
alter table EACODE enable all triggers;
prompt Enabling triggers for EADEPT...
alter table EADEPT enable all triggers;
prompt Enabling triggers for EAEVENT...
alter table EAEVENT enable all triggers;
prompt Enabling triggers for EAEXCEPTION...
alter table EAEXCEPTION enable all triggers;
prompt Enabling triggers for EAHELP...
alter table EAHELP enable all triggers;
prompt Enabling triggers for EAHTTPSESSION...
alter table EAHTTPSESSION enable all triggers;
prompt Enabling triggers for EAICON...
alter table EAICON enable all triggers;
prompt Enabling triggers for EAJDBCMONITOR...
alter table EAJDBCMONITOR enable all triggers;
prompt Enabling triggers for EAMENU...
alter table EAMENU enable all triggers;
prompt Enabling triggers for EAMENUPART...
alter table EAMENUPART enable all triggers;
prompt Enabling triggers for EAPARAM...
alter table EAPARAM enable all triggers;
prompt Enabling triggers for EAROLE...
alter table EAROLE enable all triggers;
prompt Enabling triggers for EAROLEAUTHORIZE...
alter table EAROLEAUTHORIZE enable all triggers;
prompt Enabling triggers for EAROLEMENUPART...
alter table EAROLEMENUPART enable all triggers;
prompt Enabling triggers for EASEQUENCE...
alter table EASEQUENCE enable all triggers;
prompt Enabling triggers for EAUSER...
alter table EAUSER enable all triggers;
prompt Enabling triggers for EAUSERAUTHORIZE...
alter table EAUSERAUTHORIZE enable all triggers;
prompt Enabling triggers for EAUSERMENUMAP...
alter table EAUSERMENUMAP enable all triggers;
prompt Enabling triggers for EAUSERMENUPART...
alter table EAUSERMENUPART enable all triggers;
prompt Enabling triggers for EAUSERSUBINFO...
alter table EAUSERSUBINFO enable all triggers;
prompt Enabling triggers for EA_DEMO_BYJSB...
alter table EA_DEMO_BYJSB enable all triggers;
prompt Enabling triggers for EA_DEMO_BYMXB...
alter table EA_DEMO_BYMXB enable all triggers;
prompt Enabling triggers for EA_DEMO_CHINAAREA...
alter table EA_DEMO_CHINAAREA enable all triggers;
prompt Enabling triggers for EA_DEMO_FCF...
alter table EA_DEMO_FCF enable all triggers;
prompt Enabling triggers for EA_DEMO_SFXM...
alter table EA_DEMO_SFXM enable all triggers;
prompt Enabling triggers for EA_DEMO_UPLOAD...
alter table EA_DEMO_UPLOAD enable all triggers;
set feedback on
set define on
prompt Done.

-- Create sequence 
create sequence G4_SEQ_EAJDBCMONITOR_MONITORID
minvalue 1
maxvalue 9999999999
start with 5381
increment by 1
nocache;
--
create or replace trigger "G4_TRIGGER_EAJDBCMONITOR"
before insert on EAJDBCMONITOR
for each row
begin
select G4_SEQ_EAJDBCMONITOR_MONITORID.nextval into :new.monitorid from dual;
end ;
/

create or replace procedure g4_prc_cursor_demo(prm_Xm       IN VARCHAR2,
                                               prm_Cur      OUT sys_refcursor,
                                               prm_AppCode  OUT VARCHAR2,
                                               prm_ErrorMsg OUT VARCHAR2) is
begin
  prm_AppCode := 1;
  open prm_Cur for
    select xm, fyze from ea_demo_byjsb where xm like '%' || prm_Xm || '%';
EXCEPTION
  WHEN OTHERS THEN
    prm_AppCode  := -1;
    prm_ErrorMsg := '����' || SQLERRM;
end g4_prc_cursor_demo;

/

create or replace procedure g4_prc_demo(prm_myname   IN VARCHAR2,
                                        prm_number1  IN NUMBER,
                                        prm_number2  IN NUMBER,
                                        prm_sum      OUT NUMBER,
                                        prm_result   OUT VARCHAR2,
                                        prm_AppCode  OUT VARCHAR2,
                                        prm_ErrorMsg OUT VARCHAR2) is
begin
  prm_sum      := prm_number1 + prm_number2;
  prm_result   := 'hello, ' || prm_myname || '!';
  prm_AppCode  := 1;
  prm_ErrorMsg := '';
end g4_prc_demo;
/
