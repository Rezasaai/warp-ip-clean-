#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '1CFwarp.sh' encrypted at Wed Apr 24 09:22:57 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY}�
� :_�����������������������S^��x�oa� {���b��۫T�=��m����n�=yͷq�nx�[�{��q����3�z�7��0{����g��ڽ��,u��緵����+���Ƕ�=�uw�65�I)T4y8M�Z�nF�SF�"R�5 v2���ݪ)S�J����Z�=��%J-�5�T��{�P���*E*�<y5�Oy��*ۻ"��� A�0bi��@hF�ƌ��b)���S�$���ђx��yO(�!��Q�4� $�� ��4�h	�4���bi�oMS�1M��҃L�j��f��4      d�d�&�C&!���i�&!�Ѡ
 �0&����2d�L�&�P�iOMLѩ<��B25=
F�����<�M��G��L@ @
    (@�&�Q�4�Dh�zM���4��Q�d�Q��M# ��
4d
 �@g��
�! M �@��1&��	�<d������iQ�i�=M=&� h  �4  =���O�N����CG
�H�AUUUUd ��A�~r0�P��%B���R����UTB�i(��?4N�o������A0�gE�&h�@���g���rٷEg�����jf���
���1���}��uf�o"5��%'"�3;�0���U�L���Y|g~��ܡ5�b��r֙9b�z�޳Vo�F��mf���Q�;�}�%ٙ� �IyB�ox*�w�L6G��C��0T���:�wZ�����B�s�4���0q��λ>Xf?\����F��Q�I���q1�wu��"�oPx���t��d�sH�I�h��v�F��yI����b��{w����$����d��`��S�
N�����ܧ*�$l�e�`�S�[1��\3��yИ(� ���_w������(�M�mX�F??�s1�ۊAQ���A����Cg`2y=j|I�\�e����+g!�eQ�-��u�.p�I�X夻���,�j��Bn0�fs�M�0��tnuS@�Q�BNn��*	�ºw^�,9݇*��Y�r3lC�oeچ+�@��;��@12�x�e~�[��"��:�ۙ�0 �20���Yb>�-���{���A���h���X;%�yOJ�����v�c�i�- ��ZU���;�v�mZtm���0�V��sJ̵����+:�<�yH��p�\���b�b��6p���u��W�1Գ�p�e�0X1�Ǻ`9�`�Pu����e�QKl�A��MƒH���v�����qع���'�NϏ7��_8)����?�y^�V7�=o��a�?F�z��C�e��H��\lf�g�}��M�vR�����k[%v�K��Ԅx������̍�1���+/֕Q[����52d�
p����߫��El��t獄������i���Mܩ�A�7xø�Tʏ͸�rw+���R`�����v�����Y��!D�F@��g��ܶ�F�v��#N�Q�/*����d��� �k���tQ� `�m��W�d*�Lc9�X�o����0t4h��/�E�&J�b��¦,C	D�ﵧ�� �����xZCZ*��K-�$`�����6�%�o�����hyf3�)�SE� ��z���_BC�W�2�%����lb�l#��}��iF�-B��-@-�;3�f�����Yrť,-H`h}灥M�R����O��64-Fh�J���yŘ�nŹL�MJ���U�
U�kJD��@jB��P�&V[,X���%ճ
���Zα�9�9������C?<��jϥ#�jS-6��U��֪ZQ�Q�:��rh3�0,d7��X6o�����*B��\���v��p�I@�`1���'��С{�nSY)�P�)/e�a�+�>qtSϟҜ2���d֚�`XAUtL²����B�r$�Ht����bֻ8S�2`�*Ʌ�f
��}���p=Cqx҄�5�J{���]�v
n!�����73�~����gmK���A����E
�ti਑��2���X�O|�N2��<'�@ �� xpj�X�`��)JSK��D�s�hvC����#�F８8�k�@���,~Y�8֍����z'��U4���Vn�_-K�E3I�>^E�B�� ɇhL�g
��j���wٱ��#	<�Z�<�=ͣ#��k7�M����$���`��Oɷ�ègi�Q����N�L|���'�
l8'�ÚG�V{l�t�"3�
�zY�{������9ٖG.);�T�,�r#��	���D�&������U�F�֦�k�yh�00���p�I=���D�N��ts;��"���v�zczIr�Y�ps��(���7��*N2�;���ĳ�k)�)s����jr&v:����1_N&x��bD��)j֕��4�K��	ƃB(�9q�d2��(�4�{銽UQ�0��iv9�Ԗn�s������*1x9\
	��稨ʬh�V���u$�Lܼv*RdO`p�4�g ��	�89�9��a>�8}x��bPf 9+��:d\H�M�Nj1�4����b�����KލEE�ZT�I����ҥ����a�L=pǄ�Y�X���]-羙�ˬۧ}����>'ZtЊ��پ�,�]�	;����jxˡ9
rdi�X㭈�J�%��H����ihy`y`}��*�;��Zwx��1�e1�v.OS�ۜ�
S��-�@� p9F�	.d�(Db$��9�G ,T,f�R5�m
ZQ�22��89x1i��^bխf<z\N��dC"�]]��8�TŮ^�������cUW �iē�Hz�gފ܂�/�_������ �\�+�����m�&*�چ���s��b�����/�����1�V��& ���OT�f�A@�[2�3�*�l��o���ES�^�F��.�AQP�"��0*B*In�>����!Zz�-$�h�!��[��x \C�s���~�!��	.еm΃���6�zh�oHߨ3�n��K,=*w�d����f(�2��#~���5�l����
 '#ԯ�R�S���s���V�k�^�0z�j
���x���� 7E�iԶ;h@��֓$VK�,j������-�D�q
�^�?�z_<�"-.��52�H(m�B����&P,�@R�~�y�4�DDL�ũ�46i�C`�#%
SA�/S��o���<r���a7>��b��p3F���x3ŕ��W�)��x+��n�U�Ij�]A���u��v_��c@Ί[�o�U��C�,0�4X&�d0�7@h�!���j�vκ1�f�(�c�4)�!�+�sa�-ϒ-Ρ�'h9yy���+m"�J#�ZZF�$%�Ktd��w=)� �	$GX�㕏ysk3)�[;=��ԘMU[�xw��!f�.�G���Y��f�3F��8R����4�y�̾M�J\q�B���O.�g����j"D}@��*�8�_`�Ň;�h��*8�M0��i�;xIO+��{Vk��IRT����AS>ڪ��+Ts���(� 0t`Z$�@����B�cQ�]�X�qO$'����'�sh;�v^O�;��{��!D#������W�NQcD�vu�^�� �?c_6	a;��$b��8>��2�e2*A�t�%�s~:���_Jp��_�9i����fQ��-�r��/�Gܩ9BM���_���z�VF��?�k(#IM�,�M!dƿB�}�s�R/C� �?�����h���2ʣ��h���ޑ����E�@�Nʈ���,S�2iP'�ƮM�/W�8�x��Մ����QO5	�1���S���iz
vG3�v)/Y*Ҡ��y	�#��1�c:&���	�7d��̄���5�Lߤ�;8���ʪ���jd�D�6F�h�Ÿ����' �!�
���ܞ,�0I�<A�pt�!b�إM6O��F*�س՚8d���n}�Z�Y�t�F���( '��F�5n-?�?ػ�h=�C(��fjuXgtl�NacT:�ҼY�N���/���Qp�1yօƣ2T/�������I�(�ĩZ�R���5�2mP����[@�1=�a�x��:G��KZޖa�Z�@v�HDKnw���3����[2�����bs�U�WiTF	z%# D��d�%��p�m"��EBo�`%�B�U&1
��@V��,b�����]hg�2j�1�X��Qb�rމ＆2��IA��G�T?�Z�"�TGUT~�7��0�H�f�-�t�Km/4���ib�0;���c+-�iF �`�hTRS-4^˄��(.�dR��b�Lij�v�xo0,��Eh�`�Z��*^%L�,%=��@���ZЂ(P�QJ��w5�ʧJ¢�:LN"е.M,�#`���l#{�;���!�6���9P˨��� ��	$��Iv3��M̸w����7^5v�����p�r���|^is�Bτp�0��w��E�:��rp�򵷧f�W{�fo���|Ia�D�JK#�^"�*�zO,P�E�zl��,�����3O�i
Tb��Oz(Q#z�J	R(E#P"'2L�2@c�@�ox�{�j�l���~C�Ph�|[�O?m��g����=�ٵ�K�If�O;
S��x�׎w���
F\�~3��y�������) �@�N�A���<d�����#��Jd�����_���i	���:�3�uK~F��kcGW�e��,�<2즻*�Ͱ���0��JLf��ȭZGSL_�'��'C�En�g�D����swV6["~��H���Hr�&
7�����XL&����P���.\���P ��e৉S���@��$Y����N��<�ۮ�;�v^��D�^n��Lr-E2`��pEU$��-�����c<3)�x���9`�
�ʝ
ٸC ��$���DH
,QV=ȾaB�-3O����R�LlB=��!P�$X��u(�0R}�$�e�(:΢�H&���詥������jc���X4i��	-N�UIE�Z����.:�H�F���,��x��B�7��ݐ�Ԭ԰�h,�QT�H�d]�!g´Ґ��ȕ8׺$�`�TCZ����c���Bl/(��#�+7���h�z���.��
�S�8i	 ��UC���A��.%9b��["�!(��&-}O��/���!���9��P�ZD1��H��vu%Z�R��)u���8�?d��� xD;OD8���8�O~Z�URN(�X���ة��[v÷�/��_�ð�m.�u��;��Z^Exp`��l�wh�3�ZֵQe�J"��kIa��".P����Ld�Kа�0[��djMG\�1щ��	##0j:K%�u/�Ɩ�`�J������'�������
.��3�3�
$�K�k���F�:4��%Wi��4[cK���,tP��?6L,�G�|t���Bn8.7?���:����E4�+bq��aN(�m����Vgh�p40�g�5o��a&C@����8��}��:��គ�$=H���>�)�9��
��2L��L��l(T�>�b ��[ʪ-?�4�t'����O�fkOX.@�V�h�e�7)��NO2�h�S�"S�z�IP�&�0�d��d� G���}��z��� $8+������`�1�1r����,�b����ǭ`$��
Y�6&��
��A*C̐Q�\�s�A��!Uڪ�BA��0F�d�y�op@�>�x�aۥ��۸R��׶��F��&�2�X����2̠iM��5��\fA�����,D��DMp�����cūAJ��t�'�
����6�#Fqҽ�	Aq���r;�p��0ѶR$: �6g�C|�f%��~�0�/-6)K����
IћX��&�UDQ��W�@�N y��l�B�b��OAx>�y`��1>c�q͠�P��Η�~��c6Uט�Ǽdi��Y�@杩�m$f��5v�\��,%�+�U����;��Z �q�EYOA��8�]Z���G��
#G�Fv��gӊ>#S�=�b����2�Jg*����D�xɄ�17������~΃�4�%Bl�1G�:ۜCON�v����C��k"���P<L�v/�����\~MG"�����
0�eT�Q<�XR�/R
�J�F@��+�14��[�Uo���Xw�%��$���C��+�G����3	@aj�=+�$��&@8pR��S��~�>-Rh��˥�� ~��]*�33]�\@
��@<W��ϙ���|A�ؽ��Ժ����d�0�!�)a
m��٩
�.+��J咴B�Nq���AQ�Po���,� �	��ǘ�RrZ�5@�O<��P�A�m��^:E�~��R�B%<H�)�&Ub ��S�uC��ǻ�i0e����,Q���@����u�xq���"���;�g���p�#���6��o��qϪ���
�X+��
+����.{W"��S*�e����z�x��/{�::N��r0F��v��s����%�:�Q�JT�V-��LS����i�)nF��ʙ��׻`�Uä^T�v��yw���mV�+�r�]B�ĘL��-;s�'��6��8W�[|���G�)��9N?6q�Ot����z�7pc�}��1���2&a�#�(�`���ZH�
Y#<oG���^������zq���i���z�s׿���?[��*N��|�fIc��g�
����gD��\E)l0@�l	����y��y�Y�
��Cd�Z��%Y>����4�{'F��rN�X��q��p6j���&����S$�n�����
�)Q`$cC�!d!Gx|T�9bq��;�j���.P\��Ɵ�-<>��&��=�Z�J�D���������wcy�������U8-,�f��l7��|�Ufo�f,k &e���̚6E͝ۯu�n���h5�u��su��lq���cN�w�~Ex�(Q���-�i[r"X��V���+��ʓTM]"��=S��I!��!�t�
P_��
*� �0�mԎ+g'�6���
��9�ʪ��T@R���|��`p�#�����!�}�8�'�?i�����J�\��(����W\_f���F4���� ��{��&:���zAu����B���z�$��zL��v���%����L>��`�A�&zG�lE�_�T�ky��f�3�$sj��iw\ ���*�����T��tg�cJv&��$L
�O��&�O������
T�A�~s��r9~�U�ڐ_c�ށD��;B�7�YD������"��[&�L̓`zG�;��NO��EJ�iS�y�P7>�ss�-�Ș?V�£!�`��3�S�
[F`�y��Ӏ��|�_=͙�R��*l]c�ˮ]��=��PWW[�Vu�� �8�[�E�`�%�L,��yu�g#lR���<����t�$�q?���$��w�4}f2����K��6�y��/�ݖM	"�6!ۛI���e��7ӑ8�˕j��J!�<+��+�Q�p]�Sg�HI)c���}�����)�����TZ�,��U��ͪ�&���Θ۔&��w�N�T�؟�,ixT�)JwM�}��dc(X��~\��P0H�b�DDH��!"D����*s-�\� !�cW��o՘�<��/��Fs���*�J���,��r"���K
`��Q�8�U�2n�=�O�'O�<s��m;|G�I��yBy�E��kj�l�fD�op�
}9���{��	�!�%0S�ŨP��:�Ƒq|��|��>ҍos�|	.��]����VYܻ�z\rM�1jq��UKj R��� ������/��w4�.�X��0k�+�o6f�q�y��,E��4۔U"w8E.^�.��1��h���M�a�H��x�Rl�n{l�^��_�� �#f}Ay�p��+�
,�*(��������;B5�N�?��,]#}�0nA���x�7�����ss���ɻgѐ�����lC�����VWs��SQ�#�������	�|��9=
��!D����Q$���%~���v!�������G�t�
���dh��,J0�
#DH�"x�J�T�A�0D@@�CA���v�Ag�qY�d7��B`���0��RH�b&g��ϔ~��<�,��Q�v>�ط��:���P�oh`�	�g����C�e,��/Z+�����P�D`(1RB"*��%)U%'�d����sk��@�c(q\��g��z��zK�*ו��{�WC��_����r���
>���mC�Ō�(�,�KdǏQXp�1R��c<C)�AJJg]C��GjI�Q��@�fDU:\��i��U8�:�b�X��~�ue2��`�5`��A>B�$p���������͆���b}6	�S5" �������/K��0d�q�(f��W�D�B�`��,��$�ī��0zOi}���.�T7@QdW]6�F^!ئ�����@�kAN��RL���i�'^��V�N�b6K���s�^U�^����2�煙��a:����Ie�*V�D�,�vGB�
����\k ��S � |=v�#�f��!f���(�#�x��s�G�m�>�~ �wMOA�XZъ���u�2 �!8�Y<�m3 ML�y͡
�?�2��Yqw '�cu�$'�}��CR�B�eiH�<Dt����R�z��*���0��
��Y/x�����'2:�n01 �d���FGd�k��L��6�!AP����(�r,�Œ%l%\�ͨ�E<�fEE�=N��fY�΍�=Ѐ�JPF��G(��qRp*>#!pI�^K��V+�x��"-�峄�*"�(�YJQQT���1@X(C��<},�1�!>z���+qDD� m��_&f)�=Q����O�xg��A�f����
����Z�nR�)M#<F�,:�)9���ǅ1�wPB��!�92qXv��W��'j	�,u��t��h�n
�鄣�(�Y����m0/I	�*;Ed�=bD����$W����n	��ӎT�� ���=x�D��,�1�����2\lF@RR�#A��Ub%(����� �)݀�(7
�[�uE��I .
l
-���F��kl0���E!Tb���"�YLU9�V
t!�^[qIT|��H������VYp�QT��/י�lˀ��4[���x�W��sE�������AH�D=ч��)Lǰ��C�)�^TT-G�P���.��P��ko�|i@�N���v�H�(
BJS�l7�q�B\�&R!����LH��x�/
�!�U����D�C��$x�,I�#l��]%�vH"�E�����z�gW�\�h��2��������E3~9TFe-3t�L��	���qbg"帋sz���y�ʇDN"DrrR*��`���<+����h��
\2�m��0�x��Ć4R��Yd������TI�*l)QpН*�r�1.b���Z�
�r�oa�D`D���Ȍ`�&��0w�(7�E�$I �HQ����PB��*[XԪQ�)��JZ��2ZFɄ$	Q%)k�(e�(abL������A(E�쉋�
fn�7#�{ōoZz�f=j�$U�T����`�Ƃq(x�B�o�SD�`'W�b��I�(����V��<�(7ARXKqT��LL����
S+�2��;��Trp �-ҳQ�|(�ix�H��"�	�����rŐ�3�K�,�͚B���oN8C�~Rbi@ڻ+�8!D#E�H�H�$���5��ʹ�n��#��P�(DX�$*�C
�Ê�ءXT����7r/-W�U6� �7���?������-�"҃�R<�#��Z�t�At'<DM�I,,�pu���b8�f�[�����	�@� ��M:9��B0AРء
=��,�j��fRai��*EE�:��
yw����;�>ڦ��̕ ��"|!�������`���|�
�H�B$�$�d""D�2REJ���E�:��2�y�>87���!��>{�9"v(V	"A!FFz�A�����h��έOh�~`���ur�����`�~��z�
	���A8y��!&��2 ��	6)��=qsaH�fp!�fO+r-*��w�bI/D�Ķvq�k\��JR�R��UK|���%�0Ѭ�w�Gs��}���:�7>ɰ7�Ƿ��G�P�B�$���T��2���Y�%QDv��7򚌄oS�{��hN�qU�&��u���i;P���8xC�rʕ��%i
�y9ŔhT��1R�x�"�o�/y�J�g+%褓�����+9!0�t*��R*��'��M������l�4��s �:�{TCd��d";˓F���o��:��P#�M�]�H�U��E����)JY+�L�d���0�]j�� ����<n`O�Wr q���
�@qŁ��(��]���#�SP�ʀ8��ʵ �����ZIQ����}߯���}Tk��Q�#��u������k�=��h��;���N�ڠx����ŦļT�O"��1���CK���8�w�TYV�2f5�����F	%yЀ�g=,0W����C�Z����0���X�IX����$�+�\AD���2B+ul70��s�sr^^]j�%��ɓ�3)�Ze����:��V�[��� aQ+Q�W �,�`�^,��/q�ڰ_(�҆XQ4�4&1~Zlcm1nc]�슚6�]��^?>*(�yM�i�'�Ts*y'�)��ZH�H��l[J�QTj�Q��d�Ա��ZZ}{a~�����qɪL��V�\m]��D�5����0*�R!UJ�-!PX,UT�-2B�Y0
F"ax��7���k�Ǔc:ji���c) 1���(���ER����b�B	P̢�
N	!A`��*�	}���זL`���!t��Om�SyPI� �jS̈f��w��^2�Y�S�iI4�1Zo@�-��VQU*�JW|�i
�,nTaZ�(w=�Eq��B�!�U)��j�H�*B�D)RB���h-=!�/�k��A��)��H= eR��)�`m
��vp��J���"�J�H�"hDx��.��G@Z29S	R!�M%�jc��5���3�X�D�Na��)`'`��R/����Ԩd���������eHK��C�,#	��=��?�ӆ>�!�Z�P���k�����uH�͢8�c.@�USǐl#`3^�w�
	H@U
+V �
�bʥ`D�aH�18�yy(��Bx#j��H�`���lJh��S$�7�=�ٸ]�u�m��Lje
Ȋ�dy�s���p��_���	�y8|��2E�X�} �/HE��M&#҆��!%M��󧄅B�'���/��^�}9,ƫ?��
1+�(-�q��A�+�8��d;�� ����^$�
!p����*�IU�d{n��ET�;�Þo�56�$2Tl��d�"ζ�qD1�5Ue(P�1kh��Pd���K���x��4ˬ�P�
IR���M�dd�m�ۃAh �"1C�AL�l���U�a��۝�;'D�9�)UR���ҒGn�&-!&k�NW�QF�
DÉ텄�	��TԄ,����
`<���zsV��8�:�:ԁ�2@Ӥ��U��l�J�΃�i��16�E!��"��*CZ|�V������&�}���4F�7�A)H��m����L�	�n����)0��>eq���V4<��x����W���{3��:�{����R s\Kyvȶ�^�G���c7�����r�NRj�QJ���U�MO��4�Mdh�܈�v�N*��tQ:eO�-F�*xȓ�OL��
��yM�H��d^��<��Tr;�Χg��]�����Gj���&~ۯ�A��MfH@���%�Ƙ�
��.���,���7����v� N`j�IQ���\l��.�X-J��YBʉD�s���_��G�5xX�"�	e��MGu��l0��'�w���N �}�H����;R9MR=��;L�1Z*�6r�����JH�"��58���	���
��Ӥ��ڗם��`޽ܜ��p��$$���U#L�kuW��m�ޏ+��E����nV���j�X"aD�F�j�H8f2�*n�TI�Y��*�V�V�a����Ʀi
ilY��-�ؒ��)�B�g�ƙ��Қ��:	ff%g�mX��P�@}�1�B�r�XJԪ, .�o�U4��4
��A�S� Đ���š\���؅j^�T�J�d�%��!�̌��a6��@����:!�4��
��f�1F�(m���	�3ϡ��i������F)s�z�Lf1
R�Б�J�ݛ�d�m���uvӟa�GK�rč��CGH7�]���[1�#�O.�Z6B�8��+ m���� L !�&�14h}]<)�KHb�R��:�9�Cl׺��1A�f�ݾffj�<6��*1Jh��7!B�j����s�M���/Ip��gZ�BO9R�'@wPߕ,��TF���#d��
f��`��lQ0*t�n�r]�rm��B�3����pi��U)eÖ1Z'rK1c�Tv�KW�b�7�E��I�A)H�hPڔ��z`��E�P	���(��$26�&�}�]t�Q�+��FIb_��nq=t��~�0���9���39�ĳ&rg]R��`�����}ɍR� � ��E/[327�~M	`6#8�&�0-���3C7:��P�چIi`��U�#���]g4ϔ���QЇ�]�0ۏy�y��8�o`CrnMI9����&ˣE@HS�d��(�G�\�̧d`�NZI8�������e1B�wf餗�y���S��A0FP�בB��1O?�\oD @���%�P=�X8����ɼ���zg8�$9Ӹ��a�?(��E��8T`P,AGj���"З0X�N^��j�C�g/�:�b�nWu$�z�,h�%8���4�D��EA`��+='�R1H�EI�%#���
�$#� �q���3$υ�BD$)�Ng{����W��n/�S�Xt���R��3]}��@1,��_�E@�A�\���{�"BH���X�,�	*�ت�K�y�Z�6��5��QA@�`$�;S�І�tP�jo�o~z�X��xL�N�Rw�l����S�-Bi�hv��t���J�ķ��<m���"mHk�	EW���\�R�@J�,���
DD�bH  �!?�t�O�\ΏwƢP�<t�A�P
�a!��h�c��%ZF`��=�����v�����(*�p�<����F ����Z�oi2�?���U�j��\|\�`�x��?�+�'��|_�?�`�)
�T(D�?���#�E�������?�V
�D�	���d�e@�X��%\)%�h�w@Ӑd�)��Fo�u�Ė��~B?b��ܡI�4C��2)_���(^܃���������,V��F
r��։%�� �fQ��̈́X`)�tTnķ����s��X?f]�:�����`)�+���w����V��
���E?|�zʨ�����P6�� �, $����ܿ�����q���Ir��T�B���m5�}
��E)H��a}3���:�d��47� 0W$B�x�|ɪ�^�]�u�T��Ĵ��@xaT���~���$hoRRa�0�AJPN�Z*]I���+F�lR�HA���"'N)�K��0��!�Z`Cy�akC	b�Q(Q�C�!�t(\¬�/�����DM��~I1ŪUAf�!K�d���\Xط���t�T*��{�T��7��B������Dn]��|Œ!���<��;�ȑB~��h�zC)2�EM�� 
}��O#͚�ȷ��k�씺�NIV�1��
,�x��Jzd<��w��#��"܉B�tw1aS2s��$tkԓ��i1.b�Ǚ5
������aaNv7��&XL�ĵ���B�m)N!Q-(UD���o3CiN�8���
{=�&>QnL���S/;e�(�x�]�?�Sz�'*�c�#3TD�rO�����R�Ҫe��!B	��L��3�ɇ�rIQ�I��5sI�З�GQضa���x�#����JF�Wb��X1�� �Y��͇�a� �qi�;R�#K�z*5/�Ԣֆ�L
%B��	؇8nt��ȣw��"�!)~ܚm=����j��[3{���D�F9�R���Oj+}��T�X��
$4��z.�p(�-4�>Q����
	�!� ^
4� �E�v�)x��1B��\<H�U+KV@�b��'<(�bE{��K�y2�g�Z�;��+E�K�T�֛$p��Yݎ�͚E�I�-ᒜ���lN�%�K�NoCJ�̈́��8���J�
��/t)��c"���)Μ��=��"�-H7�ۤ���XΈeۉ��qŒ{�{���P���,��<�,4���D#oy1�y@)� 7�	ʊg�	k$C�V�@���H@$���1|��cWD����3qd�> b=H%��3�N��&�
iB�@�互�<��p-�Չdh�D�LE���O�{�nkz!0vzt���H��)RK�����l3Id�GvLD�0\��QF�(�0H	����8�aA/$(	�d�+>QJI�N��V�1�b��c��
X�`�1���`�������66��؅�1�6l76B�����8?}�������
U��~����
W��;�4���X'����?0����t��}LO�}D"��F7�ύP[�Kz�H�R�Ȣ>�T�v&-��n�C4�M ���2zm�ہ���V���`�ao�����TQ�3��Z�H�I�����'�9Ψ�"&\nZN�T;g�bj=��̙�a����2[I���S�΀9z�K������34�ٷ�%�R�E��%"RT�%̿x@�~��F�^��oXc{��M�`��uxAw�FNhu���䦞�8R��	�CJ(B99�$��헔s�->T����_UxY�8Y�UQQEMS���G�o�y����M�g�<W��̪�
�%TJ���SDӇvf���m+�[f�|]��ʅ�f�+�o�1&~F��q�A�%Z��;M�	���
.�'F���d��b��8���V"'�܄��"S�#��ј��Y�i�΋�T�pO���A8��|Kx��+Ԇ��7R��z���$���늊CԷ���v�¦*�41�x^0��rt��@��y�=ɶ �Qd�?#R��g;qD�WR��HJ�T7Ra��������l`���1�9\C���M3�z\d�hTTeuҁ^$S�a!���f
��*@BF��;c�w?l�o!���l�̺��r�^	rҦKr^�u�ىaę��tDmP��>ûf��Q�LVar�DY�h.�;�L�$�n V�(������G�%s1�ZC��*�Ѩ�=�M5q`-�X�y��Nq̣a�L}Y7����j�3Ʀ:_	��ۜ�)`�g�%�C��nc�@��G#}[�݄�̆e~>i�Y�|��L�6�G�'�_R��Nq=���La�a�	hQc�@%�v�3���1���*,����
I�נ7�,QUb�UR* ����}м:p��Ǧ��[����%l�R�S����1~�
�x	N�Q�;��G�*���1u3Hu��I(;��ZTwG>/�^�<����âfCǎ����c���D0�� ��QBF~�	1��X�e|���l��R[�0�us7���쑬Oؔ�H�U+W�iso�t�م�i�)27��i#�Y�ܠm���7��0�J�'�W��4�U#ohr�1��}b���$~�1�w��
(�1-��G�?S�x�$�,ײ�Y4�V]�O7�����Z��4�GSW�cȆfC����P�#�zf�62�C�@FH�)Ð�����bY�	L9E�:M�9`�m5^���u
;yB�%Px���ŧ���G�**(��,Z��~�1��m��2-{��/"S%����M}�ͦ�h����Vp��$5���Q��2s�M��B�g����ɓ�� �p���(m[�J۵/`B����(�kϳ7u��3�ty#ʤ25R��\ᨐ��!*�8�p�G��.�/���� �ĥ[5�.�z�m�geLQ�=��7}0C�r��~vf�}1��RO{�i������?��z���<�'��Q㒅�\�A�̖:���b7	q"3�;d�>G����<zZw�7-�4T�mbߓI�6Bl=VQ��,��s�y=Ńc_ݟ<�:Y&�:�r��p8����ڱ��vt+
U�3�5�f�M�/'��kd�\-̂C�V��Ƕx��ʑ6�îD�"&2�T�Z�#�hY�s����ڒ�Ut^�x��h��&�VL��Wy�V�g����]��BA��7<
