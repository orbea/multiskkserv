multiskkserv -- simple skk multi-dictionary server
(C) Copyright 2001, 2002 by Hiroshi Takekawa <sian@big.or.jp>
Last Modified: Wed Jan 30 18:55:27 2002.
$Id$

multiskkserv ��ʣ���μ���򰷤��뼭�񥵡��ФǤ��� multiskkserv �ϼ���
�Υե����ޥåȤȤ��ơ� Dan J. Bernstein �ˤ�����ǡ����١��� cdb ��
���Ѥ��Ƥ��ޤ������� cdb �ϡ������ƥ�˥��󥹥ȡ��뤵�줿���꼭�����
������Τ˸����Ƥ���Ȼפ��ޤ���

���Υ��եȥ������ϻŪ�ʤ�ΤǤ����Х���ݡ��Ȥ䥳���Ȥʤɤ򤪴ꤤ
���ޤ������ʤ��Ȥ⡢���� README �� multiskkserv �򼭽񥵡��ФȤ��ƻȤ�
�ƽ񤱤Ƥ��ޤ���


1. ɬ�פʴĶ�

pthread:
 �⤷ libc5 ��ȤäƤ���С� linuxthread �򤤤�Ƥ���������
 http://pauillac.inria.fr/~xleroy/linuxthreads/
 ������ǤߤĤ���Ǥ��礦��

cdb-0.75:
 cdb �Υѥå������򥤥󥹥ȡ���Ϥ��ʤ��Ƥ⤤���Τǡ�����ѥ��������
 �Ƥ������������󥹥ȡ��뤹��Ф��ä����Ω�ĤȤϻפ��ޤ�����
 http://cr.yp.to/cdb/cdb-0.75.tar.gz �����ꤷ�ơ�
 Ÿ������������˰�ư���ơ�'make it'��¹Ԥ��Ƥ���������
 'make setup check'�Ȥ��ƥ��󥹥ȡ��뤹�뤳�Ȥ�Ǥ��ޤ���


2. ����ѥ��뤪��ӥ��󥹥ȡ���

--with-cdb �� cdb ��Ÿ��������ѥ��뤷���ǥ��쥯�ȥ��ե�ѥ��ǻ��ꤷ
�Ƥ���������

% tar xvzf multiskkserv-2002xxxx.tar.gz
% mkdir multiskkserv.build && cd multiskkserv.build
% ../multiskkserv-2002xxxx/configure --with-cdb=/usr/src/cdb-0.75 && make
% su
# make install
# exit
% cd ..
% rm -rf multiskkserv.build

'make install'����ȡ� 3 �ĤΥХ��ʥ꤬���󥹥ȡ��뤵��ޤ���
multiskkserv, multiskkserv-ctl �� sbin �ˡ� skkdic-p2cdb �� bin ������
�ޤ���


3. ������Ѵ�

skkdic-p2cdb ��Ȥäƥץ졼��ƥ����Ȥμ���� cdb �������Ѵ����ޤ�����
�����ϴ�ñ�Ǥ���

# cd /usr/local/share/skk
# skkdic-p2cdb SKK-JISYO.L.cdb < SKK-JISYO.L


4. �����Фε�ư

�����Фε�ư���ñ�Ǥ���

# /usr/local/sbin/multiskkserv /usr/local/share/skk/SKK-JISYO.L.cdb &

multiskkserv �ϼ�ư�� detach ���ʤ��Τ�&��Ĥ���ɬ�פ�����ޤ���
ʣ���μ������ꤹ�뤳�Ȥ�Ǥ��ޤ���

# /usr/local/sbin/multiskkserv /usr/local/share/skk/SKK-JISYO.L.cdb /usr/local/share/skk/SKK-JISYO.zipcode.cdb &

�������ƥ������ˤʤ�Ȥ������ϡ����̥桼���ǵ�ư��������� chroot ��
���� -r ��Ĥ���Ȥ����Ǥ��礦��

% /usr/local/sbin/multiskkserv -r /usr/local/share/skk SKK-JISYO.L.cdb &

-n ��Ȥ��� inetd �� tcpserver ����⤪���餯�Ȥ���Ϥ��Ǥ��� (̤��ǧ)

inetd.conf:
skkserv stream  tcp     nowait  nobody  /usr/sbin/tcpd /usr/local/sbin/multiskkserv -n /usr/local/share/skk/SKK-JISYO.L.cdb

tcpserver:
tcpserver -v -R 0 skkserv /usr/local/sbin/multiskkserv -n /usr/local/share/skk/SKK-JISYO.L.cdb

¾�Υ��ץ����ˤĤ��Ƥϡ�

% /usr/local/sbin/multiskkserv -h

�Ȥ����ɽ������ޤ���


5. ��Ư����γ�ǧ

% /usr/local/sbin/multiskkserv-ctl -s hostname stat

�Ȥ���ȡ���³����ȸ�����³����Ƥ��륯�饤����Ȥο���ɽ�����ޤ�����
��ˤ� skkserv �� protocol ���ȼ� extension ���Ȥ��Ƥ��ޤ���


6. �饤����

GPL version 2 �˽����ޤ����ܺ٤� COPYING (������ COPYING.j) ���ɤ�Ǥ���������


7. Ϣ����

E-mail: Hiroshi Takekawa <sian@big.or.jp>


8. �ռ�

Eiji Obata <obata@suzuki.kuee.kyoto-u.ac.jp>����:
20020113 ��ɬ�פʥإå��ե����뤬�ޤޤ�Ƥ��ʤ����Ȥ��Ŧ���Ƥ��������ޤ�����
