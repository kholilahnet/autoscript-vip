#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�"�  T��}�sF�� ?���  D  � P @s��� �Q h��4 4  4� ��H�������� h Ѡ0	�2 	�`  $��m54z���	2z5=M4P�3Pڒ�7Aۗi�iY'MQD/Fk|*:�ɥ�0+<������)�<x���pV{�j�����i�ȿ����7�����ٻ;���_����QT�����٠̜]1YUUUl��3���u��ݯO��o���������߳
�߀�xS�=c�{~��X9薮���5�6)�5�
��B	@S��Ok-�FX���hP��]��q�Яz�hDສ���0(�
yn����}V��U&<��qv�M���8]�����'Ed�7ɻh�,�M,m��d5d������^�)!�K�@b-��dI��:��(�{�ˌr�k���0�M�(q�1�=@vC��A �*��-��)K��4��M�ٝ��l�$�)0;���Yk90'^)0��93rUq�rbt��B���ǥ�p�Rtp�*���V�����*�?A��yk�~#�?ט��<��ө�HK?�w$S�	".��