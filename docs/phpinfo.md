# PHP Info

## PHP Modules

`docker-compose run --rm php php -m`

```
[PHP Modules]
apcu
bcmath
calendar
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
gearman
hash
iconv
imagick
imap
intl
json
libxml
mailparse
mbstring
memcached
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
soap
sodium
SPL
sqlite3
ssh2
standard
tidy
tokenizer
v8js
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
```

## PHP Info

`docker-compose run --rm php php -i`

```
phpinfo()
PHP Version => 7.3.22

System => Linux b72c1a8c3031 4.15.0-62-generic #69-Ubuntu SMP Wed Sep 4 20:55:53 UTC 2019 x86_64
Build Date => Sep 10 2020 14:57:51
Configure Command =>  './configure'  '--build=x86_64-linux-gnu' '--with-config-file-path=/usr/local/etc/php' '--with-config-file-scan-dir=/usr/local/etc/php/conf.d' '--enable-option-checking=fatal' '--with-mhash' '--enable-ftp' '--enable-mbstring' '--enable-mysqlnd' '--with-password-argon2' '--with-sodium=shared' '--with-pdo-sqlite=/usr' '--with-sqlite3=/usr' '--with-curl' '--with-libedit' '--with-openssl' '--with-zlib' '--with-libdir=lib/x86_64-linux-gnu' '--enable-fpm' '--with-fpm-user=www-data' '--with-fpm-group=www-data' '--disable-cgi' 'build_alias=x86_64-linux-gnu'
Server API => Command Line Interface
Virtual Directory Support => disabled
Configuration File (php.ini) Path => /usr/local/etc/php
Loaded Configuration File => (none)
Scan this dir for additional .ini files => /usr/local/etc/php/conf.d
Additional .ini files parsed => /usr/local/etc/php/conf.d/base.ini,
/usr/local/etc/php/conf.d/docker-php-ext-apcu.ini,
/usr/local/etc/php/conf.d/docker-php-ext-bcmath.ini,
/usr/local/etc/php/conf.d/docker-php-ext-calendar.ini,
/usr/local/etc/php/conf.d/docker-php-ext-exif.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gd.ini,
/usr/local/etc/php/conf.d/docker-php-ext-gearman.ini,
/usr/local/etc/php/conf.d/docker-php-ext-imagick.ini,
/usr/local/etc/php/conf.d/docker-php-ext-imap.ini,
/usr/local/etc/php/conf.d/docker-php-ext-intl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-mailparse.ini,
/usr/local/etc/php/conf.d/docker-php-ext-memcached.ini,
/usr/local/etc/php/conf.d/docker-php-ext-mysqli.ini,
/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pcntl.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini,
/usr/local/etc/php/conf.d/docker-php-ext-pdo_pgsql.ini,
/usr/local/etc/php/conf.d/docker-php-ext-soap.ini,
/usr/local/etc/php/conf.d/docker-php-ext-sodium.ini,
/usr/local/etc/php/conf.d/docker-php-ext-ssh2.ini,
/usr/local/etc/php/conf.d/docker-php-ext-tidy.ini,
/usr/local/etc/php/conf.d/docker-php-ext-zip.ini,
/usr/local/etc/php/conf.d/v8js.ini

PHP API => 20180731
PHP Extension => 20180731
Zend Extension => 320180731
Zend Extension Build => API320180731,NTS
PHP Extension Build => API20180731,NTS
Debug Build => no
Thread Safety => disabled
Zend Signal Handling => enabled
Zend Memory Manager => enabled
Zend Multibyte Support => provided by mbstring
IPv6 Support => enabled
DTrace Support => disabled

Registered PHP Streams => https, ftps, compress.zlib, php, file, glob, data, http, ftp, phar, ssh2.shell, ssh2.exec, ssh2.tunnel, ssh2.scp, ssh2.sftp, zip
Registered Stream Socket Transports => tcp, udp, unix, udg, ssl, tls, tlsv1.0, tlsv1.1, tlsv1.2
Registered Stream Filters => zlib.*, convert.iconv.*, string.rot13, string.toupper, string.tolower, string.strip_tags, convert.*, consumed, dechunk

This program makes use of the Zend Scripting Language Engine:
Zend Engine v3.3.22, Copyright (c) 1998-2018 Zend Technologies
    with Zend OPcache v7.3.22, Copyright (c) 1999-2018, by Zend Technologies


 _______________________________________________________________________


Configuration

apcu

APCu Support => Disabled
Version => 5.1.19
APCu Debugging => Disabled
MMAP Support => Enabled
MMAP File Mask =>  
Serialization Support => Disabled
Build Date => Oct 13 2020 00:57:54

Directive => Local Value => Master Value
apc.coredump_unmap => Off => Off
apc.enable_cli => Off => Off
apc.enabled => On => On
apc.entries_hint => 4096 => 4096
apc.gc_ttl => 3600 => 3600
apc.mmap_file_mask => no value => no value
apc.preload_path => no value => no value
apc.serializer => php => php
apc.shm_segments => 1 => 1
apc.shm_size => 32M => 32M
apc.slam_defense => Off => Off
apc.smart => 0 => 0
apc.ttl => 0 => 0
apc.use_request_time => Off => Off

bcmath

BCMath support => enabled

Directive => Local Value => Master Value
bcmath.scale => 0 => 0

calendar

Calendar support => enabled

Core

PHP Version => 7.3.22

Directive => Local Value => Master Value
allow_url_fopen => On => On
allow_url_include => Off => Off
arg_separator.input => & => &
arg_separator.output => & => &
auto_append_file => no value => no value
auto_globals_jit => On => On
auto_prepend_file => no value => no value
browscap => no value => no value
default_charset => UTF-8 => UTF-8
default_mimetype => text/html => text/html
disable_classes => no value => no value
disable_functions => no value => no value
display_errors => STDOUT => STDOUT
display_startup_errors => Off => Off
doc_root => no value => no value
docref_ext => no value => no value
docref_root => no value => no value
enable_dl => On => On
enable_post_data_reading => On => On
error_append_string => no value => no value
error_log => no value => no value
error_prepend_string => no value => no value
error_reporting => 32767 => 32767
expose_php => Off => Off
extension_dir => /usr/local/lib/php/extensions/no-debug-non-zts-20180731 => /usr/local/lib/php/extensions/no-debug-non-zts-20180731
file_uploads => On => On
hard_timeout => 2 => 2
highlight.comment => <font style="color: #FF8000">#FF8000</font> => <font style="color: #FF8000">#FF8000</font>
highlight.default => <font style="color: #0000BB">#0000BB</font> => <font style="color: #0000BB">#0000BB</font>
highlight.html => <font style="color: #000000">#000000</font> => <font style="color: #000000">#000000</font>
highlight.keyword => <font style="color: #007700">#007700</font> => <font style="color: #007700">#007700</font>
highlight.string => <font style="color: #DD0000">#DD0000</font> => <font style="color: #DD0000">#DD0000</font>
html_errors => Off => Off
ignore_repeated_errors => Off => Off
ignore_repeated_source => Off => Off
ignore_user_abort => Off => Off
implicit_flush => On => On
include_path => .:/usr/local/lib/php => .:/usr/local/lib/php
input_encoding => no value => no value
internal_encoding => no value => no value
log_errors => On => On
log_errors_max_len => 1024 => 1024
mail.add_x_header => Off => Off
mail.force_extra_parameters => no value => no value
mail.log => no value => no value
max_execution_time => 0 => 0
max_file_uploads => 20 => 20
max_input_nesting_level => 64 => 64
max_input_time => -1 => -1
max_input_vars => 10000 => 10000
memory_limit => 128M => 128M
open_basedir => no value => no value
output_buffering => 0 => 0
output_encoding => no value => no value
output_handler => no value => no value
post_max_size => 512M => 512M
precision => 14 => 14
realpath_cache_size => 4096K => 4096K
realpath_cache_ttl => 120 => 120
register_argc_argv => On => On
report_memleaks => On => On
report_zend_debug => Off => Off
request_order => no value => no value
sendmail_from => no value => no value
sendmail_path => /usr/sbin/sendmail -t -i => /usr/sbin/sendmail -t -i
serialize_precision => -1 => -1
short_open_tag => On => On
SMTP => localhost => localhost
smtp_port => 25 => 25
sys_temp_dir => /tmp => /tmp
syslog.facility => LOG_USER => LOG_USER
syslog.filter => no-ctrl => no-ctrl
syslog.ident => php => php
track_errors => Off => Off
unserialize_callback_func => no value => no value
upload_max_filesize => 512M => 512M
upload_tmp_dir => /tmp => /tmp
user_dir => no value => no value
user_ini.cache_ttl => 300 => 300
user_ini.filename => .user.ini => .user.ini
variables_order => EGPCS => EGPCS
xmlrpc_error_number => 0 => 0
xmlrpc_errors => Off => Off
zend.assertions => 1 => 1
zend.detect_unicode => On => On
zend.enable_gc => On => On
zend.multibyte => Off => Off
zend.script_encoding => no value => no value
zend.signal_check => Off => Off

ctype

ctype functions => enabled

curl

cURL support => enabled
cURL Information => 7.52.1
Age => 3
Features
AsynchDNS => Yes
CharConv => No
Debug => No
GSS-Negotiate => No
IDN => Yes
IPv6 => Yes
krb4 => No
Largefile => Yes
libz => Yes
NTLM => Yes
NTLMWB => Yes
SPNEGO => Yes
SSL => Yes
SSPI => No
TLS-SRP => Yes
HTTP2 => Yes
GSSAPI => Yes
KERBEROS5 => Yes
UNIX_SOCKETS => Yes
PSL => Yes
HTTPS_PROXY => Yes
Protocols => dict, file, ftp, ftps, gopher, http, https, imap, imaps, ldap, ldaps, pop3, pop3s, rtmp, rtsp, scp, sftp, smb, smbs, smtp, smtps, telnet, tftp
Host => x86_64-pc-linux-gnu
SSL Version => OpenSSL/1.0.2u
ZLib Version => 1.2.8
libSSH Version => libssh2/1.7.0

Directive => Local Value => Master Value
curl.cainfo => no value => no value

date

date/time support => enabled
timelib version => 2018.03
"Olson" Timezone Database Version => 2020.1
Timezone Database => internal
Default timezone => UTC

Directive => Local Value => Master Value
date.default_latitude => 31.7667 => 31.7667
date.default_longitude => 35.2333 => 35.2333
date.sunrise_zenith => 90.583333 => 90.583333
date.sunset_zenith => 90.583333 => 90.583333
date.timezone => UTC => UTC

dom

DOM/XML => enabled
DOM/XML API Version => 20031129
libxml Version => 2.9.4
HTML Support => enabled
XPath Support => enabled
XPointer Support => enabled
Schema Support => enabled
RelaxNG Support => enabled

exif

EXIF Support => enabled
Supported EXIF Version => 0220
Supported filetypes => JPEG, TIFF
Multibyte decoding support using mbstring => enabled
Extended EXIF tag formats => Canon, Casio, Fujifilm, Nikon, Olympus, Samsung, Panasonic, DJI, Sony, Pentax, Minolta, Sigma, Foveon, Kyocera, Ricoh, AGFA, Epson

Directive => Local Value => Master Value
exif.decode_jis_intel => JIS => JIS
exif.decode_jis_motorola => JIS => JIS
exif.decode_unicode_intel => UCS-2LE => UCS-2LE
exif.decode_unicode_motorola => UCS-2BE => UCS-2BE
exif.encode_jis => no value => no value
exif.encode_unicode => ISO-8859-15 => ISO-8859-15

fileinfo

fileinfo support => enabled
libmagic => 533

filter

Input Validation and Filtering => enabled

Directive => Local Value => Master Value
filter.default => unsafe_raw => unsafe_raw
filter.default_flags => no value => no value

ftp

FTP support => enabled
FTPS support => enabled

gd

GD Support => enabled
GD Version => bundled (2.1.0 compatible)
FreeType Support => enabled
FreeType Linkage => with freetype
FreeType Version => 2.6.3
GIF Read Support => enabled
GIF Create Support => enabled
JPEG Support => enabled
libJPEG Version => 6b
PNG Support => enabled
libPNG Version => 1.6.28
WBMP Support => enabled
XBM Support => enabled

Directive => Local Value => Master Value
gd.jpeg_ignore_warning => 1 => 1

gearman

gearman support => enabled
extension version => 2.0.6
libgearman version => 1.0.6
Default TCP Host => localhost
Default TCP Port => 4730

hash

hash support => enabled
Hashing Engines => md2 md4 md5 sha1 sha224 sha256 sha384 sha512/224 sha512/256 sha512 sha3-224 sha3-256 sha3-384 sha3-512 ripemd128 ripemd160 ripemd256 ripemd320 whirlpool tiger128,3 tiger160,3 tiger192,3 tiger128,4 tiger160,4 tiger192,4 snefru snefru256 gost gost-crypto adler32 crc32 crc32b fnv132 fnv1a32 fnv164 fnv1a64 joaat haval128,3 haval160,3 haval192,3 haval224,3 haval256,3 haval128,4 haval160,4 haval192,4 haval224,4 haval256,4 haval128,5 haval160,5 haval192,5 haval224,5 haval256,5 

MHASH support => Enabled
MHASH API Version => Emulated Support

iconv

iconv support => enabled
iconv implementation => glibc
iconv library version => 2.24

Directive => Local Value => Master Value
iconv.input_encoding => no value => no value
iconv.internal_encoding => no value => no value
iconv.output_encoding => no value => no value

imagick

imagick module => enabled
imagick module version => 3.4.4
imagick classes => Imagick, ImagickDraw, ImagickPixel, ImagickPixelIterator, ImagickKernel
Imagick compiled with ImageMagick version => ImageMagick 6.9.7-4 Q16 x86_64 20170114 http://www.imagemagick.org
Imagick using ImageMagick library version => ImageMagick 6.9.7-4 Q16 x86_64 20170114 http://www.imagemagick.org
ImageMagick copyright => © 1999-2017 ImageMagick Studio LLC
ImageMagick release date => 20170114
ImageMagick number of supported formats:  => 236
ImageMagick supported formats => 3FR, AAI, AI, ART, ARW, AVI, AVS, BGR, BGRA, BGRO, BIE, BMP, BMP2, BMP3, BRF, CAL, CALS, CANVAS, CAPTION, CIN, CIP, CLIP, CMYK, CMYKA, CR2, CRW, CUR, CUT, DATA, DCM, DCR, DCX, DDS, DFONT, DJVU, DNG, DOT, DPX, DXT1, DXT5, EPDF, EPI, EPS, EPS2, EPS3, EPSF, EPSI, EPT, EPT2, EPT3, ERF, EXR, FAX, FILE, FITS, FRACTAL, FTP, FTS, G3, G4, GIF, GIF87, GRADIENT, GRAY, GROUP4, GV, H, HALD, HDR, HISTOGRAM, HRZ, HTM, HTML, HTTP, HTTPS, ICB, ICO, ICON, IIQ, INFO, INLINE, IPL, ISOBRL, ISOBRL6, J2C, J2K, JBG, JBIG, JNG, JNX, JP2, JPC, JPE, JPEG, JPG, JPM, JPS, JPT, JSON, K25, KDC, LABEL, M2V, M4V, MAC, MAGICK, MAP, MASK, MAT, MATTE, MEF, MIFF, MKV, MNG, MONO, MOV, MP4, MPC, MPEG, MPG, MRW, MSL, MSVG, MTV, MVG, NEF, NRW, NULL, ORF, OTB, OTF, PAL, PALM, PAM, PANGO, PATTERN, PBM, PCD, PCDS, PCL, PCT, PCX, PDB, PDF, PDFA, PEF, PES, PFA, PFB, PFM, PGM, PICON, PICT, PIX, PJPEG, PLASMA, PNG, PNG00, PNG24, PNG32, PNG48, PNG64, PNG8, PNM, PPM, PREVIEW, PS, PS2, PS3, PSB, PSD, PTIF, PWP, RADIAL-GRADIENT, RAF, RAS, RAW, RGB, RGBA, RGBO, RGF, RLA, RLE, RMF, RW2, SCR, SCT, SFW, SGI, SHTML, SIX, SIXEL, SPARSE-COLOR, SR2, SRF, STEGANO, SUN, SVG, SVGZ, TEXT, TGA, THUMBNAIL, TIFF, TIFF64, TILE, TIM, TTC, TTF, TXT, UBRL, UBRL6, UIL, UYVY, VDA, VICAR, VID, VIFF, VIPS, VST, WBMP, WMF, WMV, WMZ, WPG, X, X3F, XBM, XC, XCF, XPM, XPS, XV, XWD, YCbCr, YCbCrA, YUV

Directive => Local Value => Master Value
imagick.locale_fix => 0 => 0
imagick.progress_monitor => 0 => 0
imagick.skip_version_check => 0 => 0

imap

IMAP c-Client Version => 2007f
SSL Support => enabled
Kerberos Support => enabled

Directive => Local Value => Master Value
imap.enable_insecure_rsh => Off => Off

intl

Internationalization support => enabled
ICU version => 57.1
ICU Data version => 57.1
ICU TZData version => 2016b
ICU Unicode version => 8.0

Directive => Local Value => Master Value
intl.default_locale => no value => no value
intl.error_level => 0 => 0
intl.use_exceptions => 0 => 0

json

json support => enabled
json version => 1.7.0

libxml

libXML support => active
libXML Compiled Version => 2.9.4
libXML Loaded Version => 20904
libXML streams => enabled

mailparse

mailparse support => enabled
Extension Version => 3.1.1

Directive => Local Value => Master Value
mailparse.def_charset => us-ascii => us-ascii

mbstring

Multibyte Support => enabled
Multibyte string engine => libmbfl
HTTP input encoding translation => disabled
libmbfl version => 1.3.2
oniguruma version => 6.9.4

mbstring extension makes use of "streamable kanji code filter and converter", which is distributed under the GNU Lesser General Public License version 2.1.

Multibyte (japanese) regex support => enabled
Multibyte regex (oniguruma) backtrack check => On
Multibyte regex (oniguruma) version => 6.9.4

Directive => Local Value => Master Value
mbstring.detect_order => no value => no value
mbstring.encoding_translation => Off => Off
mbstring.func_overload => 0 => 0
mbstring.http_input => no value => no value
mbstring.http_output => no value => no value
mbstring.http_output_conv_mimetypes => ^(text/|application/xhtml\+xml) => ^(text/|application/xhtml\+xml)
mbstring.internal_encoding => no value => no value
mbstring.language => neutral => neutral
mbstring.regex_stack_limit => 100000 => 100000
mbstring.strict_detection => Off => Off
mbstring.substitute_character => no value => no value

memcached

memcached support => enabled
Version => 3.1.5
libmemcached version => 1.0.18
SASL support => yes
Session support => yes
igbinary support => no
json support => no
msgpack support => no

Directive => Local Value => Master Value
memcached.compression_factor => 1.3 => 1.3
memcached.compression_threshold => 2000 => 2000
memcached.compression_type => fastlz => fastlz
memcached.default_binary_protocol => Off => Off
memcached.default_connect_timeout => 0 => 0
memcached.default_consistent_hash => Off => Off
memcached.serializer => php => php
memcached.sess_binary_protocol => On => On
memcached.sess_connect_timeout => 0 => 0
memcached.sess_consistent_hash => On => On
memcached.sess_consistent_hash_type => ketama => ketama
memcached.sess_lock_expire => 0 => 0
memcached.sess_lock_max_wait => not set => not set
memcached.sess_lock_retries => 5 => 5
memcached.sess_lock_wait => not set => not set
memcached.sess_lock_wait_max => 150 => 150
memcached.sess_lock_wait_min => 150 => 150
memcached.sess_locking => On => On
memcached.sess_number_of_replicas => 0 => 0
memcached.sess_persistent => Off => Off
memcached.sess_prefix => memc.sess.key. => memc.sess.key.
memcached.sess_randomize_replica_read => Off => Off
memcached.sess_remove_failed_servers => Off => Off
memcached.sess_sasl_password => no value => no value
memcached.sess_sasl_username => no value => no value
memcached.sess_server_failure_limit => 0 => 0
memcached.store_retry_count => 2 => 2

mysqli

MysqlI Support => enabled
Client API library version => mysqlnd 5.0.12-dev - 20150407 - $Id: 7cc7cc96e675f6d72e5cf0f267f48e167c2abb23 $
Active Persistent Links => 0
Inactive Persistent Links => 0
Active Links => 0

Directive => Local Value => Master Value
mysqli.allow_local_infile => Off => Off
mysqli.allow_persistent => On => On
mysqli.default_host => no value => no value
mysqli.default_port => 3306 => 3306
mysqli.default_pw => no value => no value
mysqli.default_socket => no value => no value
mysqli.default_user => no value => no value
mysqli.max_links => Unlimited => Unlimited
mysqli.max_persistent => Unlimited => Unlimited
mysqli.reconnect => Off => Off
mysqli.rollback_on_cached_plink => Off => Off

mysqlnd

mysqlnd => enabled
Version => mysqlnd 5.0.12-dev - 20150407 - $Id: 7cc7cc96e675f6d72e5cf0f267f48e167c2abb23 $
Compression => supported
core SSL => supported
extended SSL => supported
Command buffer size => 4096
Read buffer size => 32768
Read timeout => 86400
Collecting statistics => Yes
Collecting memory statistics => No
Tracing => n/a
Loaded plugins => mysqlnd,debug_trace,auth_plugin_mysql_native_password,auth_plugin_mysql_clear_password,auth_plugin_sha256_password
API Extensions => mysqli,pdo_mysql

mysqlnd statistics =>  
bytes_sent => 0
bytes_received => 0
packets_sent => 0
packets_received => 0
protocol_overhead_in => 0
protocol_overhead_out => 0
bytes_received_ok_packet => 0
bytes_received_eof_packet => 0
bytes_received_rset_header_packet => 0
bytes_received_rset_field_meta_packet => 0
bytes_received_rset_row_packet => 0
bytes_received_prepare_response_packet => 0
bytes_received_change_user_packet => 0
packets_sent_command => 0
packets_received_ok => 0
packets_received_eof => 0
packets_received_rset_header => 0
packets_received_rset_field_meta => 0
packets_received_rset_row => 0
packets_received_prepare_response => 0
packets_received_change_user => 0
result_set_queries => 0
non_result_set_queries => 0
no_index_used => 0
bad_index_used => 0
slow_queries => 0
buffered_sets => 0
unbuffered_sets => 0
ps_buffered_sets => 0
ps_unbuffered_sets => 0
flushed_normal_sets => 0
flushed_ps_sets => 0
ps_prepared_never_executed => 0
ps_prepared_once_executed => 0
rows_fetched_from_server_normal => 0
rows_fetched_from_server_ps => 0
rows_buffered_from_client_normal => 0
rows_buffered_from_client_ps => 0
rows_fetched_from_client_normal_buffered => 0
rows_fetched_from_client_normal_unbuffered => 0
rows_fetched_from_client_ps_buffered => 0
rows_fetched_from_client_ps_unbuffered => 0
rows_fetched_from_client_ps_cursor => 0
rows_affected_normal => 0
rows_affected_ps => 0
rows_skipped_normal => 0
rows_skipped_ps => 0
copy_on_write_saved => 0
copy_on_write_performed => 0
command_buffer_too_small => 0
connect_success => 0
connect_failure => 0
connection_reused => 0
reconnect => 0
pconnect_success => 0
active_connections => 0
active_persistent_connections => 0
explicit_close => 0
implicit_close => 0
disconnect_close => 0
in_middle_of_command_close => 0
explicit_free_result => 0
implicit_free_result => 0
explicit_stmt_close => 0
implicit_stmt_close => 0
mem_emalloc_count => 0
mem_emalloc_amount => 0
mem_ecalloc_count => 0
mem_ecalloc_amount => 0
mem_erealloc_count => 0
mem_erealloc_amount => 0
mem_efree_count => 0
mem_efree_amount => 0
mem_malloc_count => 0
mem_malloc_amount => 0
mem_calloc_count => 0
mem_calloc_amount => 0
mem_realloc_count => 0
mem_realloc_amount => 0
mem_free_count => 0
mem_free_amount => 0
mem_estrndup_count => 0
mem_strndup_count => 0
mem_estrdup_count => 0
mem_strdup_count => 0
mem_edupl_count => 0
mem_dupl_count => 0
proto_text_fetched_null => 0
proto_text_fetched_bit => 0
proto_text_fetched_tinyint => 0
proto_text_fetched_short => 0
proto_text_fetched_int24 => 0
proto_text_fetched_int => 0
proto_text_fetched_bigint => 0
proto_text_fetched_decimal => 0
proto_text_fetched_float => 0
proto_text_fetched_double => 0
proto_text_fetched_date => 0
proto_text_fetched_year => 0
proto_text_fetched_time => 0
proto_text_fetched_datetime => 0
proto_text_fetched_timestamp => 0
proto_text_fetched_string => 0
proto_text_fetched_blob => 0
proto_text_fetched_enum => 0
proto_text_fetched_set => 0
proto_text_fetched_geometry => 0
proto_text_fetched_other => 0
proto_binary_fetched_null => 0
proto_binary_fetched_bit => 0
proto_binary_fetched_tinyint => 0
proto_binary_fetched_short => 0
proto_binary_fetched_int24 => 0
proto_binary_fetched_int => 0
proto_binary_fetched_bigint => 0
proto_binary_fetched_decimal => 0
proto_binary_fetched_float => 0
proto_binary_fetched_double => 0
proto_binary_fetched_date => 0
proto_binary_fetched_year => 0
proto_binary_fetched_time => 0
proto_binary_fetched_datetime => 0
proto_binary_fetched_timestamp => 0
proto_binary_fetched_string => 0
proto_binary_fetched_json => 0
proto_binary_fetched_blob => 0
proto_binary_fetched_enum => 0
proto_binary_fetched_set => 0
proto_binary_fetched_geometry => 0
proto_binary_fetched_other => 0
init_command_executed_count => 0
init_command_failed_count => 0
com_quit => 0
com_init_db => 0
com_query => 0
com_field_list => 0
com_create_db => 0
com_drop_db => 0
com_refresh => 0
com_shutdown => 0
com_statistics => 0
com_process_info => 0
com_connect => 0
com_process_kill => 0
com_debug => 0
com_ping => 0
com_time => 0
com_delayed_insert => 0
com_change_user => 0
com_binlog_dump => 0
com_table_dump => 0
com_connect_out => 0
com_register_slave => 0
com_stmt_prepare => 0
com_stmt_execute => 0
com_stmt_send_long_data => 0
com_stmt_close => 0
com_stmt_reset => 0
com_stmt_set_option => 0
com_stmt_fetch => 0
com_deamon => 0
bytes_received_real_data_normal => 0
bytes_received_real_data_ps => 0

openssl

OpenSSL support => enabled
OpenSSL Library Version => OpenSSL 1.1.0l  10 Sep 2019
OpenSSL Header Version => OpenSSL 1.1.0l  10 Sep 2019
Openssl default config => /usr/lib/ssl/openssl.cnf

Directive => Local Value => Master Value
openssl.cafile => no value => no value
openssl.capath => no value => no value

pcntl

pcntl support => enabled

pcre

PCRE (Perl Compatible Regular Expressions) Support => enabled
PCRE Library Version => 10.32 2018-09-10
PCRE Unicode Version => 11.0.0
PCRE JIT Support => enabled
PCRE JIT Target => x86 64bit (little endian + unaligned)

Directive => Local Value => Master Value
pcre.backtrack_limit => 1000000 => 1000000
pcre.jit => 1 => 1
pcre.recursion_limit => 100000 => 100000

PDO

PDO support => enabled
PDO drivers => sqlite, mysql, pgsql

pdo_mysql

PDO Driver for MySQL => enabled
Client API version => mysqlnd 5.0.12-dev - 20150407 - $Id: 7cc7cc96e675f6d72e5cf0f267f48e167c2abb23 $

Directive => Local Value => Master Value
pdo_mysql.default_socket => no value => no value

pdo_pgsql

PDO Driver for PostgreSQL => enabled
PostgreSQL(libpq) Version => 9.6.19

pdo_sqlite

PDO Driver for SQLite 3.x => enabled
SQLite Library => 3.16.2

Phar

Phar: PHP Archive support => enabled
Phar API version => 1.1.1
Phar-based phar archives => enabled
Tar-based phar archives => enabled
ZIP-based phar archives => enabled
gzip compression => enabled
bzip2 compression => disabled (install ext/bz2)
Native OpenSSL support => enabled


Phar based on pear/PHP_Archive, original concept by Davey Shafik.
Phar fully realized by Gregory Beaver and Marcus Boerger.
Portions of tar implementation Copyright (c) 2003-2009 Tim Kientzle.
Directive => Local Value => Master Value
phar.cache_list => no value => no value
phar.readonly => On => On
phar.require_hash => On => On

posix

POSIX support => enabled

readline

Readline Support => enabled
Readline library => EditLine wrapper

Directive => Local Value => Master Value
cli.pager => no value => no value
cli.prompt => \b \>  => \b \> 

Reflection

Reflection => enabled

session

Session Support => enabled
Registered save handlers => files user memcached 
Registered serializer handlers => php_serialize php php_binary 

Directive => Local Value => Master Value
session.auto_start => Off => Off
session.cache_expire => 180 => 180
session.cache_limiter => nocache => nocache
session.cookie_domain => no value => no value
session.cookie_httponly => 0 => 0
session.cookie_lifetime => 0 => 0
session.cookie_path => / => /
session.cookie_samesite => no value => no value
session.cookie_secure => 0 => 0
session.gc_divisor => 100 => 100
session.gc_maxlifetime => 1440 => 1440
session.gc_probability => 1 => 1
session.lazy_write => On => On
session.name => PHPSESSID => PHPSESSID
session.referer_check => no value => no value
session.save_handler => files => files
session.save_path => no value => no value
session.serialize_handler => php => php
session.sid_bits_per_character => 4 => 4
session.sid_length => 32 => 32
session.upload_progress.cleanup => On => On
session.upload_progress.enabled => On => On
session.upload_progress.freq => 1% => 1%
session.upload_progress.min_freq => 1 => 1
session.upload_progress.name => PHP_SESSION_UPLOAD_PROGRESS => PHP_SESSION_UPLOAD_PROGRESS
session.upload_progress.prefix => upload_progress_ => upload_progress_
session.use_cookies => 1 => 1
session.use_only_cookies => 1 => 1
session.use_strict_mode => 0 => 0
session.use_trans_sid => 0 => 0

SimpleXML

SimpleXML support => enabled
Schema support => enabled

soap

Soap Client => enabled
Soap Server => enabled

Directive => Local Value => Master Value
soap.wsdl_cache => 1 => 1
soap.wsdl_cache_dir => /tmp => /tmp
soap.wsdl_cache_enabled => 1 => 1
soap.wsdl_cache_limit => 5 => 5
soap.wsdl_cache_ttl => 86400 => 86400

sodium

sodium support => enabled
libsodium headers version => 1.0.11
libsodium library version => 1.0.11

SPL

SPL support => enabled
Interfaces => OuterIterator, RecursiveIterator, SeekableIterator, SplObserver, SplSubject
Classes => AppendIterator, ArrayIterator, ArrayObject, BadFunctionCallException, BadMethodCallException, CachingIterator, CallbackFilterIterator, DirectoryIterator, DomainException, EmptyIterator, FilesystemIterator, FilterIterator, GlobIterator, InfiniteIterator, InvalidArgumentException, IteratorIterator, LengthException, LimitIterator, LogicException, MultipleIterator, NoRewindIterator, OutOfBoundsException, OutOfRangeException, OverflowException, ParentIterator, RangeException, RecursiveArrayIterator, RecursiveCachingIterator, RecursiveCallbackFilterIterator, RecursiveDirectoryIterator, RecursiveFilterIterator, RecursiveIteratorIterator, RecursiveRegexIterator, RecursiveTreeIterator, RegexIterator, RuntimeException, SplDoublyLinkedList, SplFileInfo, SplFileObject, SplFixedArray, SplHeap, SplMinHeap, SplMaxHeap, SplObjectStorage, SplPriorityQueue, SplQueue, SplStack, SplTempFileObject, UnderflowException, UnexpectedValueException

sqlite3

SQLite3 support => enabled
SQLite Library => 3.16.2

Directive => Local Value => Master Value
sqlite3.extension_dir => no value => no value

ssh2

SSH2 support => enabled
extension version => 1.2
libssh2 version => 1.7.0
banner => SSH-2.0-libssh2_1.7.0

standard

Dynamic Library Support => enabled
Path to sendmail => /usr/sbin/sendmail -t -i

Directive => Local Value => Master Value
assert.active => 1 => 1
assert.bail => 0 => 0
assert.callback => no value => no value
assert.exception => 0 => 0
assert.quiet_eval => 0 => 0
assert.warning => 1 => 1
auto_detect_line_endings => 0 => 0
default_socket_timeout => 60 => 60
from => no value => no value
session.trans_sid_hosts => no value => no value
session.trans_sid_tags => a=href,area=href,frame=src,form= => a=href,area=href,frame=src,form=
url_rewriter.hosts => no value => no value
url_rewriter.tags => form= => form=
user_agent => no value => no value

tidy

Tidy support => enabled
libTidy Version => 5.2.0
libTidy Release => 2016/04/07

Directive => Local Value => Master Value
tidy.clean_output => 0 => 0
tidy.default_config => no value => no value

tokenizer

Tokenizer Support => enabled

v8js

V8 Javascript Engine => enabled
V8 Engine Compiled Version => 7.5.288.23
V8 Engine Linked Version => 7.5.288.23
Version => 2.1.2

Directive => Local Value => Master Value
v8js.flags => no value => no value
v8js.icudtl_dat_path => no value => no value
v8js.use_array_access => 0 => 0
v8js.use_date => 0 => 0

xml

XML Support => active
XML Namespace Support => active
libxml2 Version => 2.9.4

xmlreader

XMLReader => enabled

xmlwriter

XMLWriter => enabled

Zend OPcache

Opcode Caching => Up and Running
Optimization => Enabled
SHM Cache => Enabled
File Cache => Disabled
Startup => OK
Shared memory model => mmap
Cache hits => 0
Cache misses => 0
Used memory => 8770936
Free memory => 125446792
Wasted memory => 0
Interned Strings Used memory => 477864
Interned Strings Free memory => 5813168
Cached scripts => 0
Cached keys => 0
Max keys => 7963
OOM restarts => 0
Hash keys restarts => 0
Manual restarts => 0

Directive => Local Value => Master Value
opcache.blacklist_filename => no value => no value
opcache.consistency_checks => 0 => 0
opcache.dups_fix => Off => Off
opcache.enable => On => On
opcache.enable_cli => On => On
opcache.enable_file_override => Off => Off
opcache.error_log => no value => no value
opcache.file_cache => no value => no value
opcache.file_cache_consistency_checks => On => On
opcache.file_cache_only => Off => Off
opcache.file_update_protection => 2 => 2
opcache.force_restart_timeout => 180 => 180
opcache.huge_code_pages => Off => Off
opcache.interned_strings_buffer => 8 => 8
opcache.lockfile_path => /tmp => /tmp
opcache.log_verbosity_level => 1 => 1
opcache.max_accelerated_files => 4000 => 4000
opcache.max_file_size => 0 => 0
opcache.max_wasted_percentage => 5 => 5
opcache.memory_consumption => 128 => 128
opcache.opt_debug_level => 0 => 0
opcache.optimization_level => 0x7FFEBFFF => 0x7FFEBFFF
opcache.preferred_memory_model => no value => no value
opcache.protect_memory => Off => Off
opcache.restrict_api => no value => no value
opcache.revalidate_freq => 2 => 2
opcache.revalidate_path => Off => Off
opcache.save_comments => On => On
opcache.use_cwd => On => On
opcache.validate_permission => Off => Off
opcache.validate_root => Off => Off
opcache.validate_timestamps => On => On

zip

Zip => enabled
Zip version => 1.15.4
Libzip version => 1.1.2

zlib

ZLib Support => enabled
Stream Wrapper => compress.zlib://
Stream Filter => zlib.inflate, zlib.deflate
Compiled Version => 1.2.8
Linked Version => 1.2.8

Directive => Local Value => Master Value
zlib.output_compression => Off => Off
zlib.output_compression_level => -1 => -1
zlib.output_handler => no value => no value

Additional Modules

Module Name

Environment

Variable => Value
HOSTNAME => b72c1a8c3031
PHP_USER_ID => 33
PHPIZE_DEPS => autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c
GPG_KEYS => CBAF69F173A0FEA4B537F470D66C9593118BCCB6 F38252826ACD957EF380D39F2F7956BC5DA04B5D
PHP_EXTRA_CONFIGURE_ARGS => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --disable-cgi
PHP_ASC_URL => https://www.php.net/distributions/php-7.3.22.tar.xz.asc
PHP_CFLAGS => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
COMPOSER_ALLOW_SUPERUSER => 1
PWD => /app
HOME => /root
PHP_LDFLAGS => -Wl,-O1 -pie
DEBIAN_FRONTEND => noninteractive
PHP_INI_DIR => /usr/local/etc/php
PHP_URL => https://www.php.net/distributions/php-7.3.22.tar.xz
PHP_CPPFLAGS => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
TERM => linux
PHP_ENABLE_XDEBUG => 0
PHP_VERSION => 7.3.22
SHLVL => 0
PHP_MD5 =>  
PATH => /app:/app/vendor/bin:/root/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PHP_SHA256 => 0e66606d3bdab5c2ae3f778136bfe8788e574913a3d8138695e54d98562f1fb5

PHP Variables

Variable => Value
$_SERVER['HOSTNAME'] => b72c1a8c3031
$_SERVER['PHP_USER_ID'] => 33
$_SERVER['PHPIZE_DEPS'] => autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c
$_SERVER['GPG_KEYS'] => CBAF69F173A0FEA4B537F470D66C9593118BCCB6 F38252826ACD957EF380D39F2F7956BC5DA04B5D
$_SERVER['PHP_EXTRA_CONFIGURE_ARGS'] => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --disable-cgi
$_SERVER['PHP_ASC_URL'] => https://www.php.net/distributions/php-7.3.22.tar.xz.asc
$_SERVER['PHP_CFLAGS'] => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
$_SERVER['COMPOSER_ALLOW_SUPERUSER'] => 1
$_SERVER['PWD'] => /app
$_SERVER['HOME'] => /root
$_SERVER['PHP_LDFLAGS'] => -Wl,-O1 -pie
$_SERVER['DEBIAN_FRONTEND'] => noninteractive
$_SERVER['PHP_INI_DIR'] => /usr/local/etc/php
$_SERVER['PHP_URL'] => https://www.php.net/distributions/php-7.3.22.tar.xz
$_SERVER['PHP_CPPFLAGS'] => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
$_SERVER['TERM'] => linux
$_SERVER['PHP_ENABLE_XDEBUG'] => 0
$_SERVER['PHP_VERSION'] => 7.3.22
$_SERVER['SHLVL'] => 0
$_SERVER['PHP_MD5'] => 
$_SERVER['PATH'] => /app:/app/vendor/bin:/root/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
$_SERVER['PHP_SHA256'] => 0e66606d3bdab5c2ae3f778136bfe8788e574913a3d8138695e54d98562f1fb5
$_SERVER['PHP_SELF'] => 
$_SERVER['SCRIPT_NAME'] => 
$_SERVER['SCRIPT_FILENAME'] => 
$_SERVER['PATH_TRANSLATED'] => 
$_SERVER['DOCUMENT_ROOT'] => 
$_SERVER['REQUEST_TIME_FLOAT'] => 1602555425.1821
$_SERVER['REQUEST_TIME'] => 1602555425
$_SERVER['argv'] => Array
(
)

$_SERVER['argc'] => 0
$_ENV['HOSTNAME'] => b72c1a8c3031
$_ENV['PHP_USER_ID'] => 33
$_ENV['PHPIZE_DEPS'] => autoconf 		dpkg-dev 		file 		g++ 		gcc 		libc-dev 		make 		pkg-config 		re2c
$_ENV['GPG_KEYS'] => CBAF69F173A0FEA4B537F470D66C9593118BCCB6 F38252826ACD957EF380D39F2F7956BC5DA04B5D
$_ENV['PHP_EXTRA_CONFIGURE_ARGS'] => --enable-fpm --with-fpm-user=www-data --with-fpm-group=www-data --disable-cgi
$_ENV['PHP_ASC_URL'] => https://www.php.net/distributions/php-7.3.22.tar.xz.asc
$_ENV['PHP_CFLAGS'] => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
$_ENV['COMPOSER_ALLOW_SUPERUSER'] => 1
$_ENV['PWD'] => /app
$_ENV['HOME'] => /root
$_ENV['PHP_LDFLAGS'] => -Wl,-O1 -pie
$_ENV['DEBIAN_FRONTEND'] => noninteractive
$_ENV['PHP_INI_DIR'] => /usr/local/etc/php
$_ENV['PHP_URL'] => https://www.php.net/distributions/php-7.3.22.tar.xz
$_ENV['PHP_CPPFLAGS'] => -fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
$_ENV['TERM'] => linux
$_ENV['PHP_ENABLE_XDEBUG'] => 0
$_ENV['PHP_VERSION'] => 7.3.22
$_ENV['SHLVL'] => 0
$_ENV['PHP_MD5'] => 
$_ENV['PATH'] => /app:/app/vendor/bin:/root/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
$_ENV['PHP_SHA256'] => 0e66606d3bdab5c2ae3f778136bfe8788e574913a3d8138695e54d98562f1fb5

PHP License
This program is free software; you can redistribute it and/or modify
it under the terms of the PHP License as published by the PHP Group
and included in the distribution in the file:  LICENSE

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

If you did not receive a copy of the PHP license, or have any
questions about PHP licensing, please contact license@php.net.
```