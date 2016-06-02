/*
 * Compile-in this chunk of code unless we've turned it off specifically
 * or in general (id=_iso_8859_8).
 */

#ifndef INCL_CHARSET_iso_8859_8
#define INCL_CHARSET_iso_8859_8 1

/*ifdef NO_CHARSET*/
#ifdef  NO_CHARSET
#undef  NO_CHARSET
#endif
#define NO_CHARSET 0 /* force default to always be active */

/*ifndef NO_CHARSET_iso_8859_8*/
#ifndef NO_CHARSET_iso_8859_8

#if    ALL_CHARSETS
#define NO_CHARSET_iso_8859_8 0
#else
#define NO_CHARSET_iso_8859_8 1
#endif

#endif /* ndef(NO_CHARSET_iso_8859_8) */

#if NO_CHARSET_iso_8859_8
#define UC_CHARSET_SETUP_iso_8859_8 /*nothing*/
#else

/*
 *  uni_hash.tbl
 *
 *  Do not edit this file; it was automatically generated by
 *
 *  ./makeuctb ./iso08_uni.tbl
 *
 */

static const u8 dfont_unicount_iso_8859_8[256] = 
{
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  1,   0,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   0,
	  0,   0,   0,   0,   0,   0,   0,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   1,   1,   1,   1,   1,
	  1,   1,   1,   0,   0,   1,   1,   0
};

static const u16 dfont_unitable_iso_8859_8[155] = 
{
	0x0020, 0x0021, 0x0022, 0x0023, 0x0024, 0x0025, 0x0026, 0x0027,
	0x0028, 0x0029, 0x002a, 0x002b, 0x002c, 0x002d, 0x002e, 0x002f,
	0x0030, 0x0031, 0x0032, 0x0033, 0x0034, 0x0035, 0x0036, 0x0037,
	0x0038, 0x0039, 0x003a, 0x003b, 0x003c, 0x003d, 0x003e, 0x003f,
	0x0040, 0x0041, 0x0042, 0x0043, 0x0044, 0x0045, 0x0046, 0x0047,
	0x0048, 0x0049, 0x004a, 0x004b, 0x004c, 0x004d, 0x004e, 0x004f,
	0x0050, 0x0051, 0x0052, 0x0053, 0x0054, 0x0055, 0x0056, 0x0057,
	0x0058, 0x0059, 0x005a, 0x005b, 0x005c, 0x005d, 0x005e, 0x005f,
	0x0060, 0x0061, 0x0062, 0x0063, 0x0064, 0x0065, 0x0066, 0x0067,
	0x0068, 0x0069, 0x006a, 0x006b, 0x006c, 0x006d, 0x006e, 0x006f,
	0x0070, 0x0071, 0x0072, 0x0073, 0x0074, 0x0075, 0x0076, 0x0077,
	0x0078, 0x0079, 0x007a, 0x007b, 0x007c, 0x007d, 0x007e, 0x00a0,
	0x00a2, 0x00a3, 0x00a4, 0x00a5, 0x00a6, 0x00a7, 0x00a8, 0x00a9,
	0x00d7, 0x00ab, 0x00ac, 0x00ad, 0x00ae, 0x00af, 0x00b0, 0x00b1,
	0x00b2, 0x00b3, 0x00b4, 0x00b5, 0x00b6, 0x00b7, 0x00b8, 0x00b9,
	0x00f7, 0x00bb, 0x00bc, 0x00bd, 0x00be, 0x2017, 0x05d0, 0x05d1,
	0x05d2, 0x05d3, 0x05d4, 0x05d5, 0x05d6, 0x05d7, 0x05d8, 0x05d9,
	0x05da, 0x05db, 0x05dc, 0x05dd, 0x05de, 0x05df, 0x05e0, 0x05e1,
	0x05e2, 0x05e3, 0x05e4, 0x05e5, 0x05e6, 0x05e7, 0x05e8, 0x05e9,
	0x05ea, 0x200e, 0x200f
};

static struct unipair_str repl_map_iso_8859_8[22] = 
{
	{0x5b0,""}, {0x5b1,""}, {0x5b2,""}, {0x5b3,""},
	{0x5b4,""}, {0x5b5,""}, {0x5b6,""}, {0x5b7,""},
	{0x5b8,""}, {0x5b9,""}, {0x5ba,""}, {0x5bb,""},
	{0x5bc,""}, {0x5bd,""}, {0x5be,""}, {0x5bf,""},
	{0x5c0,""}, {0x5c1,""}, {0x5c2,""}, {0x5f0,"\345\345"},
	{0x5f1,"\351\345"}, {0x5f2,"\351\351"}
};

static const struct unimapdesc_str dfont_replacedesc_iso_8859_8 = {22,repl_map_iso_8859_8,0,1};
#define UC_CHARSET_SETUP_iso_8859_8 UC_Charset_Setup("iso-8859-8",\
"Hebrew (ISO-8859-8)",\
dfont_unicount_iso_8859_8,dfont_unitable_iso_8859_8,155,\
dfont_replacedesc_iso_8859_8,160,2,916)

#endif /* NO_CHARSET_iso_8859_8 */

#endif /* INCL_CHARSET_iso_8859_8 */
