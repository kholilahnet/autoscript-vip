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
BZh91AY&SYa�  �_�Tp}���~�ގ����  D   � P @�klm�D54)��	�F'�� Ѵ`FA�jz�Ѩ`"jxI��S��觔�i����F#�c@Lq��h�#Md& ��d�D@�'��<"z24��C4�@�i驦���  qow��dvK�)"�<Fy�]Ļ�$"k�R&>�35��]o�4�_:;	C��Hf���'�r��x]�A�oȦ�kS��{z=��Q�gp�ݓ�̈́�T)t2s�?���@�.��ݥ�Ԋjnb���&�ɩm�KDY���l����Y#(��/r�{5��r/襆�%�R0�C�f����r�	��Ǜ��f �e[��O�o�s��DV�+![�#�F��HX"�5�5\�\��&HgBέh�N0�n2QA3�`ئO}I���+�\<���f�ќ$2�0#F���s:�lޚDS�͉\�3��\.o�ԣ�&6��@�u�d�EAo�'�TτAj��B @����*v��5��,e"r��/�#�G�8,��HH85I� ��->�k��(d�����$U�����#)��m�&e�e)�|�Q:��	��^�ע�����*
b?��]�1��R���(/ZS�g
�&���ҙI˸V��	��[��γM>6��(`�۱����k��ջk����"�T^�KT�AJ{�,߳W*�c��Iemۨ���s�������:m�;Q�����&��J�$¡8]�f:�gʧ䔰�H�`-"X��J��m���qX2%�i{�W�VaD���(�Q;,�g�P�QM`|��c�;�/��$	��Ll���t��.4��w$S�	Q�p