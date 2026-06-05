Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C788A3A873B
	for <dtrace@lists.linux.dev>; Fri,  5 Jun 2026 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697544; cv=none; b=e81GzyBtkdAGKXlmiZ0SmUsf2pgj4EBiBi81PUUr777lOJ//k2AS0ysopfMeT65U42AzdoN7T8W5pTHgwfyMS/wxnCL5seIZQw57Zq2mwpYwj9xnBI64VI5OdrPWSjUS7ViQNQmJyoG9eAOpgqJwqZrIclHNQm+pFAyqPCHJYS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697544; c=relaxed/simple;
	bh=RBpYYMv1Iok9n3Hu0yIccxSKHjRULHUfPw+qRNPd5bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+lap/es+HYv6h/d14uzj0xFYY5iqPzXtKTqY9s1UpHdyjdkJdmQbRaT4kNKerSacc03ClPOEN5yo+9RTM3ABWV7pG97iNviRLB7Tkgzwy7vC6vO7tyYA09MkYu9lWqqwHr6GTh+OwljImXRLfgKuQIePS+QJX9Inpupnl3ePtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pifve9u1; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pifve9u1"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655IY1IB461404;
	Fri, 5 Jun 2026 22:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Qo3nG
	eaxnPFu+mUgZvjNhjvTINLV9OajLmXu6i8Sx3c=; b=Pifve9u1bnWHIUw1D4biy
	zj2OurCVVbJ2YKcjUyccuYG474DNhWj4ad9WgZuOUN16jFeEdnQ8yMO75G/oUwFo
	8Rn5ekfCwd3Mx+ewApvg1yDKA9e7yF7HVSE21DmCHHu2uH5Jp7y6AzGS6TwVDafU
	y5hHLg1q110yMTg2H/olc2N4PRZ4uVzo75icQoqp1bFBeJZuyB9GnRF9/DtXEpof
	WS82MUGbVQCM4OvU4RodCTzX47paglVaYU0+bFDbK8ZeKdgz8TFNfPZvVICSx0iZ
	G92CsxelH3Two/UZO4//h6+V0iOMVmZkIvThScqi2XGiZtXNxfBH5+uoH2js7TzL
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efresawe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 655MARds033241;
	Fri, 5 Jun 2026 22:12:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ek326nvv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jun 2026 22:12:20 +0000 (GMT)
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 655MCIuk039322;
	Fri, 5 Jun 2026 22:12:20 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-53-60.vpn.oracle.com [10.154.53.60])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ek326nvu6-2;
	Fri, 05 Jun 2026 22:12:19 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>,
        OpenAI Codex <codex@openai.com>
Subject: [PATCH 1/6] libdtrace: Pack declared bitfields into C storage units
Date: Fri,  5 Jun 2026 23:12:12 +0100
Message-ID: <20260605221217.1211791-2-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260605221217.1211791-1-alan.maguire@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606050219
X-Authority-Analysis: v=2.4 cv=U4Wiy+ru c=1 sm=1 tr=0 ts=6a2349c6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=LG5T7v2SAAAA:8
 a=P3wdwqvclVm3zWsbVEsA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDIxOSBTYWx0ZWRfX1gND8YPmfj4O
 BNNljhdf/9wVPV7muU5UCA7SXCVadF7P8+QQ6Qddx+7JztYN42J9Li2gyxpOjuzXZftO0wXV+sM
 fH1BwfN07vrVqWCd6VJCMyna8LCUEdBUIJ45F8HcfQge/HAhfgxCjms5ET2gCwzFGU6JXA713cr
 2Kecz1nqhebR4x/w9Lt7V8P45RZRoZj4qbt4R045GDoxoTv+O4MkunMtq6Fv3g7/kHvhXFGdYHK
 N6ZnpmdfsRK8ly1Vj4kY16iiACN3zSYsPd/P+L607AQsj7omY8I5/+1/mVPvbrSPR0lzSI7P+H7
 Lw3e3zhE7ZlMQcD8OGaeTVOUMtxj3oJIjnoP+ueK+FCRTmvM4aec5Qti4I3839SQyO/7+i8ldvh
 LD9nv10PQGsHWcEKPd74L4DPJ4zolgEuGSvpYlwW0DE/jiVVtMSWqsmNTcevqacNdLvroZcpnbg
 nbjoKSbV1F5qkJmqNHM6aLYx07BJYWdzcuqkTJPM=
X-Proofpoint-ORIG-GUID: oZJrHBsICgmmUr-VJSyddO5ZkZK4P2TJ
X-Proofpoint-GUID: oZJrHBsICgmmUr-VJSyddO5ZkZK4P2TJ

dt_decl_member() represented each D-declared bitfield as a standalone
integer type sized to the field width, then let libctf auto-place the
member.  That made adjacent bitfields consume whole bytes instead of
sharing the declared C storage unit.  Unnamed padding fields such as
`unsigned int :24` were therefore treated as additional storage, causing
ABI-visible layout drift; for example CPython's PyASCIIObject was sized
as 56 bytes instead of 48 for python 3.6 when associated python3.6
headers were included.

The problem in that case was the "state" bitfield which had the form:

  struct {
      unsigned int interned:2;
      unsigned int kind:3;
      unsigned int compact:1;
      unsigned int ascii:1;
      unsigned int ready:1;
      unsigned int :24;
  } state;

i.e. it should have been a packed unsigned int (4 bytes) but DTrace
was using adding 8 bytes to the representation size, also throwing
off field offsets that followed.

Track bitfield allocation state while declaring struct/union members.
For each storage unit, add an empty-name CTF member using the original
base type to force the containing type to the C ABI size, and add named
bitfields as CTF slices at explicit bit offsets within that unit.  Reset
the allocation state for zero-width unnamed fields and non-bitfield
members.

Also make bitfield code generation choose load/store sizes from both the
field width and its intra-byte offset, since packed fields can now cross
byte boundaries.

Update the bitfield sizeof test expectations to C ABI sizes and add a
regression test for unnamed padding matching the PyASCIIObject layout:
state size 4, wstr offset 40, total size 48.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
---
 libdtrace/dt_cg.c                            |  33 ++--
 libdtrace/dt_decl.c                          | 198 ++++++++++++++++---
 libdtrace/dt_decl.h                          |   6 +
 test/unittest/bitfields/tst.SizeofBitField.d |   6 +-
 test/unittest/bitfields/tst.SizeofBitField.r |  12 +-
 5 files changed, 201 insertions(+), 54 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a77c022c..0859e9cb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -92,6 +92,12 @@ clp2(size_t x)
 	return x + 1;
 }
 
+static size_t
+dt_cg_bitfield_size(uint_t offset, uint_t bits)
+{
+	return clp2(P2ROUNDUP((offset % NBBY) + bits, NBBY) / NBBY);
+}
+
 /*
  * Determine the load size for the specified node and CTF type, and return the
  * equivalent BPF size specifier.
@@ -104,13 +110,13 @@ dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type, ssize_t *ret_size)
 
 	/*
 	 * If we're loading a bit-field, the size of our load is found by
-	 * rounding cte_bits up to a byte boundary and then finding the
-	 * nearest power of two to this value (see clp2(), above).
+	 * rounding the bit offset and size up to a byte boundary and then
+	 * finding the nearest power of two to this value (see clp2(), above).
 	 */
 	if (dnp &&
 	    (dnp->dn_flags & DT_NF_BITFIELD) &&
 	    ctf_type_encoding(ctfp, type, &e) != CTF_ERR)
-		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
+		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
 	else
 		size = ctf_type_size(ctfp, type);
 
@@ -3586,7 +3592,8 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
 	if (dnp->dn_flags & DT_NF_REF)
 		return;
 
-	op = dt_cg_ldsize(dnp, fp, mp->ctm_type, &size);
+	size = dt_cg_bitfield_size(offset, e.cte_bits);
+	op = bpf_ldst_size(size, 0);
 	if (dnp->dn_left->dn_flags & (DT_NF_ALLOCA | DT_NF_DPTR))
 		emit(dlp, BPF_LOAD(op, reg, reg, 0));
 	else
@@ -3653,8 +3660,7 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
 	 * nearest power of two to this value (see clp2(), above).
 	 */
 #ifdef _BIG_ENDIAN
-	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
-		(offset + e.cte_bits);
+	shift = size * NBBY - (offset + e.cte_bits);
 #else
 	shift = offset;
 #endif
@@ -3686,7 +3692,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
 {
 	uint64_t cmask, fmask, shift;
 	int r1, r2;
-	size_t offset;
+	size_t offset, size;
 
 	ctf_membinfo_t m;
 	ctf_encoding_t e;
@@ -3731,9 +3737,10 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
 	 * pass through the containing bits and zero the field bits.
 	 */
 #ifdef _BIG_ENDIAN
-	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
-		(offset % NBBY + e.cte_bits);
+	size = dt_cg_bitfield_size(offset, e.cte_bits);
+	shift = size * NBBY - (offset % NBBY + e.cte_bits);
 #else
+	size = dt_cg_bitfield_size(offset, e.cte_bits);
 	shift = offset % NBBY;
 #endif
 	fmask = (1ULL << e.cte_bits) - 1;
@@ -3748,7 +3755,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
 	 * r2 <<= shift
 	 * r1 |= r2
 	 */
-	emit(dlp, BPF_LOAD(dt_cg_ldsize(dst, fp, m.ctm_type, NULL), r1, dst->dn_reg, 0));
+	emit(dlp, BPF_LOAD(bpf_ldst_size(size, 0), r1, dst->dn_reg, 0));
 	dt_cg_setx(dlp, r2, cmask);
 	emit(dlp, BPF_ALU64_REG(BPF_AND, r1, r2));
 	dt_cg_setx(dlp, r2, fmask);
@@ -3770,12 +3777,12 @@ dt_cg_store(dt_node_t *src, dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dst)
 
 	/*
 	 * If we're storing into a bit-field, the size of our store is found by
-	 * rounding dst's cte_bits up to a byte boundary and then finding the
-	 * nearest power of two to this value (see clp2(), above).
+	 * rounding dst's bit offset and size up to a byte boundary and then
+	 * finding the nearest power of two to this value (see clp2(), above).
 	 */
 	if ((dst->dn_flags & DT_NF_BITFIELD) &&
 	    ctf_type_encoding(dst->dn_ctfp, dst->dn_type, &e) != CTF_ERR)
-		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
+		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
 	else
 		size = dt_node_type_size(dst);
 
diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
index 1f4936dd..29c58189 100644
--- a/libdtrace/dt_decl.c
+++ b/libdtrace/dt_decl.c
@@ -16,6 +16,8 @@
 #include <dt_module.h>
 #include <dt_impl.h>
 
+static void dt_decl_bf_reset(dt_scope_t *);
+
 static dt_decl_t *
 dt_decl_check(dt_decl_t *ddp)
 {
@@ -129,6 +131,7 @@ dt_decl_pop(void)
 	dsp->ds_type = CTF_ERR;
 	dsp->ds_class = DT_DC_DEFAULT;
 	dsp->ds_enumval = -1;
+	dt_decl_bf_reset(dsp);
 
 	return ddp;
 }
@@ -483,6 +486,89 @@ dt_decl_sou(uint_t kind, char *name)
 	return ddp;
 }
 
+static ulong_t
+dt_decl_bf_align(ulong_t off, ulong_t align)
+{
+	return align == 0 ? off : ((off + align - 1) / align) * align;
+}
+
+static void
+dt_decl_bf_reset(dt_scope_t *dsp)
+{
+	dsp->ds_bf_active = 0;
+	dsp->ds_bf_base = CTF_ERR;
+	dsp->ds_bf_unit_off = 0;
+	dsp->ds_bf_unit_bits = 0;
+	dsp->ds_bf_unit_align = 0;
+	dsp->ds_bf_next = 0;
+}
+
+static ulong_t
+dt_decl_bf_size(dt_scope_t *dsp)
+{
+	ssize_t size = ctf_type_size(dsp->ds_ctfp, dsp->ds_type);
+
+	if (size < 0) {
+		xyerror(D_UNKNOWN, "failed to determine struct size: %s\n",
+		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
+	}
+
+	return (ulong_t)size * CHAR_BIT;
+}
+
+static void
+dt_decl_bf_anchor(dt_scope_t *dsp, ctf_id_t base, ulong_t off,
+    const char *idname)
+{
+	if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type, "",
+	    base, off) == CTF_ERR) {
+		xyerror(D_UNKNOWN, "failed to define storage for "
+		    "bit-field '%s': %s\n", idname,
+		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
+	}
+}
+
+static void
+dt_decl_bf_start(dt_scope_t *dsp, ctf_id_t base, uint_t unit_bits,
+    uint_t unit_align, const char *idname)
+{
+	ulong_t off = dt_decl_bf_align(dt_decl_bf_size(dsp), unit_align);
+
+	dt_decl_bf_anchor(dsp, base, off, idname);
+
+	dsp->ds_bf_active = 1;
+	dsp->ds_bf_base = base;
+	dsp->ds_bf_unit_off = off;
+	dsp->ds_bf_unit_bits = unit_bits;
+	dsp->ds_bf_unit_align = unit_align;
+	dsp->ds_bf_next = 0;
+}
+
+static void
+dt_decl_member_copy(dt_scope_t *dsp, dtrace_typeinfo_t *dtt,
+    const char *idname)
+{
+	/*
+	 * If the member type is not defined in the same CTF container as the
+	 * one associated with the current scope (i.e. the container for the
+	 * struct or union itself) or its parent, copy the member type into
+	 * this container and reset dtt to refer to the copied type.
+	 */
+	if (dtt->dtt_ctfp != dsp->ds_ctfp &&
+	    dtt->dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
+
+		dtt->dtt_type = ctf_add_type(dsp->ds_ctfp,
+		    dtt->dtt_ctfp, dtt->dtt_type);
+		dtt->dtt_ctfp = dsp->ds_ctfp;
+
+		if (dtt->dtt_type == CTF_ERR ||
+		    ctf_update(dtt->dtt_ctfp) == CTF_ERR) {
+			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
+			    idname, ctf_errmsg(ctf_errno(dtt->dtt_ctfp)));
+		}
+	}
+}
+
 void
 dt_decl_member(dt_node_t *dnp)
 {
@@ -542,22 +628,28 @@ dt_decl_member(dt_node_t *dnp)
 		xyerror(D_DECL_VOIDOBJ, "cannot have void member: %s\n", ident);
 
 	/*
-	 * If a bit-field qualifier was part of the member declaration, create
-	 * a new integer type of the same name and attributes as the base type
-	 * and size equal to the specified number of bits.  We reset 'dtt' to
-	 * refer to this new bit-field type and continue on to add the member.
+	 * If a bit-field qualifier was part of the member declaration, add a
+	 * hidden storage-unit member to force the containing type to the C ABI
+	 * size, and add the named field as a CTF slice at the corresponding bit
+	 * offset within that unit.
 	 */
 	if (dnp != NULL) {
+		ctf_id_t bftype;
+		uint_t unit_bits, unit_align, width;
+		ulong_t bitoff, memberoff;
+		ssize_t align;
+		int is_union;
+
 		dnp = dt_node_cook(dnp, DT_IDFLG_REF);
 
 		/*
 		 * A bit-field member with no declarator is permitted to have
 		 * size zero and indicates that no more fields are to be packed
-		 * into the current storage unit.  We ignore these directives
-		 * as the underlying ctf code currently does so for all fields.
+		 * into the current storage unit.
 		 */
 		if (ident == NULL && dnp->dn_kind == DT_NODE_INT &&
 		    dnp->dn_value == 0) {
+			dt_decl_bf_reset(dsp);
 			dt_node_free(dnp);
 			goto done;
 		}
@@ -579,43 +671,77 @@ dt_decl_member(dt_node_t *dnp)
 			    "for type: %s\n", idname);
 		}
 
+		dt_decl_member_copy(dsp, &dtt, idname);
+
+		base = ctf_type_resolve(dtt.dtt_ctfp, dtt.dtt_type);
+		unit_bits = cte.cte_bits;
+		width = (uint_t)dnp->dn_value;
+		align = ctf_type_align(dtt.dtt_ctfp, base);
+		if (align < 0)
+			align = size;
+		unit_align = (uint_t)align * CHAR_BIT;
+		if (unit_align == 0)
+			unit_align = CHAR_BIT;
+		is_union = ctf_type_kind(dsp->ds_ctfp, dsp->ds_type) ==
+		    CTF_K_UNION;
+
+		if (is_union) {
+			dt_decl_bf_anchor(dsp, base, 0, idname);
+			bitoff = 0;
+		} else {
+			if (!dsp->ds_bf_active) {
+				dt_decl_bf_start(dsp, base, unit_bits,
+				    unit_align, idname);
+			} else if (unit_bits > dsp->ds_bf_unit_bits &&
+			    dsp->ds_bf_next + width <= unit_bits &&
+			    dsp->ds_bf_unit_off % unit_align == 0) {
+				dt_decl_bf_anchor(dsp, base,
+				    dsp->ds_bf_unit_off, idname);
+				dsp->ds_bf_base = base;
+				dsp->ds_bf_unit_bits = unit_bits;
+				dsp->ds_bf_unit_align = unit_align;
+			} else if (dsp->ds_bf_next + width >
+			    dsp->ds_bf_unit_bits) {
+				dt_decl_bf_start(dsp, base, unit_bits,
+				    unit_align, idname);
+			}
+
+			bitoff = dsp->ds_bf_next;
+			dsp->ds_bf_next += width;
+		}
+
+		if (ident == NULL) {
+			dt_node_free(dnp);
+			goto done;
+		}
+
 		cte.cte_offset = 0;
-		cte.cte_bits = (uint_t)dnp->dn_value;
+		cte.cte_bits = width;
+		memberoff = is_union ? 0 :
+		    dsp->ds_bf_unit_off + (bitoff / CHAR_BIT) * CHAR_BIT;
+		cte.cte_offset = bitoff % CHAR_BIT;
 
-		dtt.dtt_type = ctf_add_integer(dsp->ds_ctfp,
-		    CTF_ADD_NONROOT, ctf_type_name(dtt.dtt_ctfp,
-		    dtt.dtt_type, n, sizeof(n)), &cte);
+		bftype = ctf_add_slice(dsp->ds_ctfp, CTF_ADD_NONROOT,
+		    base, &cte);
 
-		if (dtt.dtt_type == CTF_ERR ||
-		    ctf_update(dsp->ds_ctfp) == CTF_ERR) {
+		if (bftype == CTF_ERR) {
 			xyerror(D_UNKNOWN, "failed to create type for "
 			    "member '%s': %s\n", idname,
 			    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
 		}
 
-		dtt.dtt_ctfp = dsp->ds_ctfp;
+		if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type,
+		    ident, bftype, memberoff) == CTF_ERR) {
+			xyerror(D_UNKNOWN, "failed to define member '%s': %s\n",
+			    idname, ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
+		}
+
 		dt_node_free(dnp);
+		goto done;
 	}
 
-	/*
-	 * If the member type is not defined in the same CTF container as the
-	 * one associated with the current scope (i.e. the container for the
-	 * struct or union itself) or its parent, copy the member type into
-	 * this container and reset dtt to refer to the copied type.
-	 */
-	if (dtt.dtt_ctfp != dsp->ds_ctfp &&
-	    dtt.dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
-
-		dtt.dtt_type = ctf_add_type(dsp->ds_ctfp,
-		    dtt.dtt_ctfp, dtt.dtt_type);
-		dtt.dtt_ctfp = dsp->ds_ctfp;
-
-		if (dtt.dtt_type == CTF_ERR ||
-		    ctf_update(dtt.dtt_ctfp) == CTF_ERR) {
-			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
-			    idname, ctf_errmsg(ctf_errno(dtt.dtt_ctfp)));
-		}
-	}
+	dt_decl_bf_reset(dsp);
+	dt_decl_member_copy(dsp, &dtt, idname);
 
 	if (ctf_add_member(dsp->ds_ctfp, dsp->ds_type,
 	    ident, dtt.dtt_type) == CTF_ERR) {
@@ -1040,6 +1166,7 @@ dt_scope_create(dt_scope_t *dsp)
 	dsp->ds_type = CTF_ERR;
 	dsp->ds_class = DT_DC_DEFAULT;
 	dsp->ds_enumval = -1;
+	dt_decl_bf_reset(dsp);
 }
 
 void
@@ -1072,6 +1199,7 @@ dt_scope_push(ctf_file_t *ctfp, ctf_id_t type)
 	dsp->ds_type = type;
 	dsp->ds_class = rsp->ds_class;
 	dsp->ds_enumval = rsp->ds_enumval;
+	dt_decl_bf_reset(dsp);
 
 	dt_scope_create(rsp);
 	rsp->ds_next = dsp;
@@ -1101,6 +1229,12 @@ dt_scope_pop(void)
 	rsp->ds_type = dsp->ds_type;
 	rsp->ds_class = dsp->ds_class;
 	rsp->ds_enumval = dsp->ds_enumval;
+	rsp->ds_bf_active = dsp->ds_bf_active;
+	rsp->ds_bf_base = dsp->ds_bf_base;
+	rsp->ds_bf_unit_off = dsp->ds_bf_unit_off;
+	rsp->ds_bf_unit_bits = dsp->ds_bf_unit_bits;
+	rsp->ds_bf_unit_align = dsp->ds_bf_unit_align;
+	rsp->ds_bf_next = dsp->ds_bf_next;
 
 	free(dsp);
 	return rsp->ds_decl;
diff --git a/libdtrace/dt_decl.h b/libdtrace/dt_decl.h
index 0bec183b..4be31158 100644
--- a/libdtrace/dt_decl.h
+++ b/libdtrace/dt_decl.h
@@ -58,6 +58,12 @@ typedef struct dt_scope {
 	ctf_id_t ds_type;		/* CTF id of enclosing type */
 	dt_dclass_t ds_class;		/* declaration class for this scope */
 	int ds_enumval;			/* most recent enumerator value */
+	int ds_bf_active;		/* bit-field allocation unit is active */
+	ctf_id_t ds_bf_base;		/* bit-field allocation unit base type */
+	ulong_t ds_bf_unit_off;		/* bit offset of bit-field unit */
+	uint_t ds_bf_unit_bits;		/* size in bits of bit-field unit */
+	uint_t ds_bf_unit_align;		/* alignment in bits of bit-field unit */
+	uint_t ds_bf_next;		/* next bit offset in bit-field unit */
 } dt_scope_t;
 
 extern dt_decl_t *dt_decl_alloc(ushort_t, char *);
diff --git a/test/unittest/bitfields/tst.SizeofBitField.d b/test/unittest/bitfields/tst.SizeofBitField.d
index 1eb4ab5d..2ad7df02 100644
--- a/test/unittest/bitfields/tst.SizeofBitField.d
+++ b/test/unittest/bitfields/tst.SizeofBitField.d
@@ -80,9 +80,9 @@ BEGIN
 }
 
 END
-/(1 != sizeof(var1)) || (2 != sizeof(var2)) || (3 != sizeof(var3)) ||
-    (4 != sizeof(var4)) || (5 != sizeof(var5)) || (6 != sizeof(var6))
-    || (7 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
+/(4 != sizeof(var1)) || (4 != sizeof(var2)) || (4 != sizeof(var3)) ||
+    (4 != sizeof(var4)) || (4 != sizeof(var5)) || (8 != sizeof(var6))
+    || (8 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
 {
 	exit(1);
 }
diff --git a/test/unittest/bitfields/tst.SizeofBitField.r b/test/unittest/bitfields/tst.SizeofBitField.r
index 9d97b2aa..a5e4007b 100644
--- a/test/unittest/bitfields/tst.SizeofBitField.r
+++ b/test/unittest/bitfields/tst.SizeofBitField.r
@@ -1,10 +1,10 @@
-sizeof(bitRecord1): 1
-sizeof(bitRecord2): 2
-sizeof(bitRecord3): 3
+sizeof(bitRecord1): 4
+sizeof(bitRecord2): 4
+sizeof(bitRecord3): 4
 sizeof(bitRecord4): 4
-sizeof(bitRecord5): 5
-sizeof(bitRecord6): 6
-sizeof(bitRecord7): 7
+sizeof(bitRecord5): 4
+sizeof(bitRecord6): 8
+sizeof(bitRecord7): 8
 sizeof(bitRecord8): 8
 sizeof(bitRecord12): 12
 
-- 
2.43.5

