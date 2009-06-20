multiskkserv -- simple skk multi-dictionary server
(C)Copyright 2001 by Hiroshi Takekawa <sian@big.or.jp>
Last Modified: Tue Feb 13 11:14:49 2001.
$Id$

multiskkserv��ʣ���μ���򰷤��뼭�񥵡��ФǤ���multiskkserv�ϼ����
�ե����ޥåȤȤ��ơ�Dan  J. Bernstein�ˤ�����ǡ����١���cdb����Ѥ�
�Ƥ��ޤ�������cdb�ϡ������ƥ�˥��󥹥ȡ��뤵�줿���꼭����ݻ������
�˸����Ƥ���Ȼפ��ޤ���

���Υ��եȥ������ϻŪ�ʤ�ΤǤ����Х���ݡ��Ȥ䥳���Ȥʤɤ򤪴ꤤ���ޤ���
���ʤ��Ȥ⡢����README��multiskkserv�򼭽񥵡��ФȤ��ƻȤäƽ񤱤Ƥ��ޤ���

1. ɬ�פʴĶ�

pthread:
 �⤷libc5��ȤäƤ���С�linuxthread�򤤤�Ƥ���������
 http://pauillac.inria.fr/~xleroy/linuxthreads/
 ������ǤߤĤ���Ǥ��礦��

cdb-0.75:
 cdb�Υѥå������򥤥󥹥ȡ���Ϥ��ʤ��Ƥ⤤���Τǡ�����ѥ����������
 �������������󥹥ȡ��뤹��Ф��ä����Ω�ĤȤϻפ��ޤ�����
 http://cr.yp.to/cdb/cdb-0.75.tar.gz �����ꤷ�ơ�
 Ÿ������������˰�ư���ơ�'make it'��¹Ԥ��Ƥ���������
 'make setup check'�Ȥ��ƥ��󥹥ȡ��뤹�뤳�Ȥ�Ǥ��ޤ���

2. ����ѥ��뤪��ӥ��󥹥ȡ���

--with-cdb �� cdb ��Ÿ��������ѥ��뤷���ǥ��쥯�ȥ��ե�ѥ��ǻ��ꤷ
�Ƥ���������

% tar xvzf multiskkserv-2001xxxx.tar.gz
% mkdir multiskkserv.build && cd multiskkserv.build
% ../multiskkserv-2001xxxx/configure --with-cdb=/usr/src/cdb-0.75 && make
% su
# make install
# exit
% cd ..
% rm -rf multiskkserv.build

3. ������Ѵ�

'make install'����ȡ�2�ĤΥХ��ʥ꤬���󥹥ȡ��뤵��ޤ���
multiskkserv��sbin�ˡ�skkdic-p2cdb��bin������ޤ���skkdic-p2cdb��Ȥäƥץ졼��ƥ����Ȥμ����cdb�������Ѵ����ޤ���������ϴ�ñ�Ǥ���

% cd /usr/local/share/skk
% skkdic-p2cdb SKK-JISYO.L.cdb < SKK-JISYO.L.cdb

4. �����Фε�ư

�����Фε�ư���ñ�Ǥ���

# /usr/local/sbin/multiskkserv /usr/local/share/skk/SKK-JISYO.L.cdb &

multiskkserv�ϼ�ư��detach���ʤ��Τ�&��Ĥ���ɬ�פ�����ޤ���
ʣ���μ������ꤹ�뤳�Ȥ�Ǥ��ޤ���

# /usr/local/sbin/multiskkserv /usr/local/share/skk/SKK-JISYO.L.cdb /usr/local/share/skk/SKK-JISYO.zipcode.cdb &

-n��Ȥ���inetd��tcpserver����⤪���餯�Ȥ���Ϥ��Ǥ���(̤��ǧ)

inetd.conf:
skkserv stream  tcp     nowait  nobody  /usr/sbin/tcpd /usr/local/sbin/multiskkserv -n /usr/local/share/skk/SKK-JISYO.L.cdb

tcpserver:
tcpserver -v -R 0 skkserv /usr/local/sbin/multiskkserv -n /usr/local/share/skk/SKK-JISYO.L.cdb

¾�Υ��ץ����ˤĤ��Ƥϡ�

% /usr/local/sbin/multiskkserv -h

�Ȥ����ɽ������ޤ���

5. �饤����

GPL version 2�˽����ޤ����ܺ٤�COPYING(������ COPYING.j)���ɤ�Ǥ���������

6. Ϣ����

E-mail: Hiroshi Takekawa <sian@big.or.jp>
