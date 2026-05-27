Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF22FD7BE
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907863; cv=none; b=anzfiMJ7ZZmx1qZVWLbdaCXPNh5yJR8O0tlHkiJugZHXdsLiB4mN5AYoK9TcBCvJclRUJsWoIOvo7UChSkMriwi8U+VbocMs5Py69iMmjevBDXxBtLxtMAAsBE5ZepKI7apuwVYa5pJUSLlpiDLRZJTVfcoJlWZkXEsnl2lCJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907863; c=relaxed/simple;
	bh=Hw29/T8ON0lCjaEwtG5mBu0AVdv+pQyteXKNJpQGefI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKAOa1Pp3sH7f7J661mWYWlADwoqnpvMPMPm8gnlJyW8U64q16R7WRhk4U1Fu7+ImiAwxGCmhw7LETRQMVXfmxvjE92CMcFlGWig9fmghUrXg4yqF+pcorMGRTl3iKSAlKZeYNvK2n/a7lf5pvOeHDNVlme/fbOzFs9sQ5mwQ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o5QTViZs; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o5QTViZs"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64REIc1B1933533
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=JR4rK
	Iq2IEQ5phBmvl2LD36n5C+SzLkiWf6WmTOMr0A=; b=o5QTViZs1tcU3IBLXhqed
	lVKsFOWlbTF4JFgI+wwNRZQ2RLPSLCVm5HEltS9CWXagQ1sReexktiyrAViBVMpg
	La8J2EhadFHAXdzmuttxGfLzXZsb3oJfXfUQZLk9vgAUHLQNdb8OWIm6Q1dv5ErN
	E41Rp351DXmxxtue6h81NWzaw8g/3ajG4xknp1LYr6tk3NCuJZ4UM7rJTQSMFbUk
	M13xpe50MH3O30/SJwG5JizdS9N3Rmlak5iueXq8075Ki5UY3mIf9876+BaPHsvO
	Sfa354jaUa9PDllNnzZLvoIjcWaNmg3FOSQ6OCjUWzepWCFhrZoVIXVdUVKS2aTg
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb49cp6qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIoa3r031343
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4t8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomgd033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:54 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-4;
	Wed, 27 May 2026 18:50:53 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 3/7] libdtrace: Refactor math functions into dt_math.h
Date: Wed, 27 May 2026 19:49:59 +0100
Message-ID: <20260527185004.2267741-4-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260527185004.2267741-1-alan.maguire@oracle.com>
References: <20260527185004.2267741-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2605270189
X-Proofpoint-ORIG-GUID: oURfLY_5Pk20bL3NkZ9coftH1WbnUrVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfX1yf3y1QokzaG
 aJiyv8nX+VeqhjXGcfjRwvpQ7FoaxZJej4bjfHCB/xQf64g2YWFQmpI1Xpv/dLIRks+YUv2g7UP
 YlCwrvgYBQ1Xu/kLbxtEDR8YmZ2Bz0Wt6GdzBCwPRNqNq9SXjwNTGRT6cDG0cvNOYw4T+fXofSX
 55xtEmMiHTGV/P6iABAx069QloMFKfMQRHChU+81I3IeOgfn3F1W1/lS8x7jKE7jzG7T9ud2X6T
 TgWLLSgZ6FyrVOQK2JgrMczrvY3b5vBY4u0l87kIWGQCmFrpvM6xXa5JqP9YPqWGLtdzryRcXMz
 b7IgONAUyThHUNERhePmU7mhqCyPlhPkPMjrvAhsezQWrDVXQhpTtyNQKfOunXvtBHopZAXjUlo
 G7ymsshy/VlhsLQi8m2hzh2jwXXnzpSN4/7MT7/wUkul6AoMA0R2+SwyxhY4z7cq3vGCSRMy/vX
 9gjyif0hS8U3fh9Syt/5ABaCxrgVeGD1m/nhA+Ew=
X-Proofpoint-GUID: oURfLY_5Pk20bL3NkZ9coftH1WbnUrVS
X-Authority-Analysis: v=2.4 cv=LYsMLDfi c=1 sm=1 tr=0 ts=6a173d12 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=kK-Wy82e8qzOnGRpunUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706

No functional change.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_aggregate.c |   1 +
 libdtrace/dt_consume.c   | 340 +------------------------------------
 libdtrace/dt_impl.h      |   2 -
 libdtrace/dt_math.h      | 358 +++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_printf.c    |   1 +
 5 files changed, 361 insertions(+), 341 deletions(-)
 create mode 100644 libdtrace/dt_math.h

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 1fc8294d..00de1e0d 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -18,6 +18,7 @@
 #include <port.h>
 #include <dt_aggregate.h>
 #include <dt_bpf.h>
+#include <dt_math.h>
 
 typedef struct dt_ahashent {
 	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index eca2139f..a66b80e2 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -15,6 +15,7 @@
 #include <alloca.h>
 #include <dt_impl.h>
 #include <dt_aggregate.h>
+#include <dt_math.h>
 #include <dt_dctx.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
@@ -28,8 +29,6 @@
 #include <sys/eventfd.h>
 #include <linux/perf_event.h>
 
-#define	DT_MASK_LO 0x00000000FFFFFFFFULL
-
 typedef struct dt_spec_buf_data {
 	dt_list_t dsbd_list;		/* linked-list forward/back pointers */
 	unsigned int dsbd_cpu;		/* cpu for data */
@@ -48,343 +47,6 @@ typedef struct dt_spec_buf {
 	struct dt_hentry dtsb_he;	/* htab links */
 } dt_spec_buf_t;
 
-/*
- * We declare this here because (1) we need it and (2) we want to avoid a
- * dependency on libm in libdtrace.
- */
-static long double
-dt_fabsl(long double x)
-{
-	if (x < 0)
-		return -x;
-
-	return x;
-}
-
-/*
- * 128-bit arithmetic functions needed to support the stddev() aggregating
- * action.
- */
-static int
-dt_gt_128(uint64_t *a, uint64_t *b)
-{
-	return a[1] > b[1] || (a[1] == b[1] && a[0] > b[0]);
-}
-
-static int
-dt_ge_128(uint64_t *a, uint64_t *b)
-{
-	return a[1] > b[1] || (a[1] == b[1] && a[0] >= b[0]);
-}
-
-static int
-dt_le_128(uint64_t *a, uint64_t *b)
-{
-	return a[1] < b[1] || (a[1] == b[1] && a[0] <= b[0]);
-}
-
-/*
- * Shift the 128-bit value in a by b. If b is positive, shift left.
- * If b is negative, shift right.
- */
-static void
-dt_shift_128(uint64_t *a, int b)
-{
-	uint64_t mask;
-
-	if (b == 0)
-		return;
-
-	if (b < 0) {
-		b = -b;
-		if (b >= 64) {
-			a[0] = a[1] >> (b - 64);
-			a[1] = 0;
-		} else {
-			a[0] >>= b;
-			mask = 1LL << (64 - b);
-			mask -= 1;
-			a[0] |= ((a[1] & mask) << (64 - b));
-			a[1] >>= b;
-		}
-	} else {
-		if (b >= 64) {
-			a[1] = a[0] << (b - 64);
-			a[0] = 0;
-		} else {
-			a[1] <<= b;
-			mask = a[0] >> (64 - b);
-			a[1] |= mask;
-			a[0] <<= b;
-		}
-	}
-}
-
-static int
-dt_nbits_128(uint64_t *a)
-{
-	int nbits = 0;
-	uint64_t tmp[2];
-	uint64_t zero[2] = { 0, 0 };
-
-	tmp[0] = a[0];
-	tmp[1] = a[1];
-
-	dt_shift_128(tmp, -1);
-	while (dt_gt_128(tmp, zero)) {
-		dt_shift_128(tmp, -1);
-		nbits++;
-	}
-
-	return nbits;
-}
-
-static void
-dt_subtract_128(uint64_t *minuend, uint64_t *subtrahend, uint64_t *difference)
-{
-	uint64_t result[2];
-
-	result[0] = minuend[0] - subtrahend[0];
-	result[1] = minuend[1] - subtrahend[1] -
-	    (minuend[0] < subtrahend[0] ? 1 : 0);
-
-	difference[0] = result[0];
-	difference[1] = result[1];
-}
-
-static void
-dt_add_128(uint64_t *addend1, uint64_t *addend2, uint64_t *sum)
-{
-	uint64_t result[2];
-
-	result[0] = addend1[0] + addend2[0];
-	result[1] = addend1[1] + addend2[1] +
-	    (result[0] < addend1[0] || result[0] < addend2[0] ? 1 : 0);
-
-	sum[0] = result[0];
-	sum[1] = result[1];
-}
-
-/*
- * The basic idea is to break the 2 64-bit values into 4 32-bit values,
- * use native multiplication on those, and then re-combine into the
- * resulting 128-bit value.
- *
- * (hi1 << 32 + lo1) * (hi2 << 32 + lo2) =
- *     hi1 * hi2 << 64 +
- *     hi1 * lo2 << 32 +
- *     hi2 * lo1 << 32 +
- *     lo1 * lo2
- */
-static void
-dt_multiply_128(uint64_t factor1, uint64_t factor2, uint64_t *product)
-{
-	uint64_t hi1, hi2, lo1, lo2;
-	uint64_t tmp[2];
-
-	hi1 = factor1 >> 32;
-	hi2 = factor2 >> 32;
-
-	lo1 = factor1 & DT_MASK_LO;
-	lo2 = factor2 & DT_MASK_LO;
-
-	product[0] = lo1 * lo2;
-	product[1] = hi1 * hi2;
-
-	tmp[0] = hi1 * lo2;
-	tmp[1] = 0;
-	dt_shift_128(tmp, 32);
-	dt_add_128(product, tmp, product);
-
-	tmp[0] = hi2 * lo1;
-	tmp[1] = 0;
-	dt_shift_128(tmp, 32);
-	dt_add_128(product, tmp, product);
-}
-
-/*
- * This is long-hand division.
- *
- * We initialize subtrahend by shifting divisor left as far as possible. We
- * loop, comparing subtrahend to dividend:  if subtrahend is smaller, we
- * subtract and set the appropriate bit in the result.  We then shift
- * subtrahend right by one bit for the next comparison.
- */
-static void
-dt_divide_128(uint64_t *dividend, uint64_t divisor, uint64_t *quotient)
-{
-	uint64_t result[2] = { 0, 0 };
-	uint64_t remainder[2];
-	uint64_t subtrahend[2];
-	uint64_t divisor_128[2];
-	uint64_t mask[2] = { 1, 0 };
-	int log = 0;
-
-	assert(divisor != 0);
-
-	divisor_128[0] = divisor;
-	divisor_128[1] = 0;
-
-	remainder[0] = dividend[0];
-	remainder[1] = dividend[1];
-
-	subtrahend[0] = divisor;
-	subtrahend[1] = 0;
-
-	while (divisor > 0) {
-		log++;
-		divisor >>= 1;
-	}
-
-	dt_shift_128(subtrahend, 128 - log);
-	dt_shift_128(mask, 128 - log);
-
-	while (dt_ge_128(remainder, divisor_128)) {
-		if (dt_ge_128(remainder, subtrahend)) {
-			dt_subtract_128(remainder, subtrahend, remainder);
-			result[0] |= mask[0];
-			result[1] |= mask[1];
-		}
-
-		dt_shift_128(subtrahend, -1);
-		dt_shift_128(mask, -1);
-	}
-
-	quotient[0] = result[0];
-	quotient[1] = result[1];
-}
-
-/*
- * This is the long-hand method of calculating a square root.
- * The algorithm is as follows:
- *
- * 1. Group the digits by 2 from the right.
- * 2. Over the leftmost group, find the largest single-digit number
- *    whose square is less than that group.
- * 3. Subtract the result of the previous step (2 or 4, depending) and
- *    bring down the next two-digit group.
- * 4. For the result R we have so far, find the largest single-digit number
- *    x such that 2 * R * 10 * x + x^2 is less than the result from step 3.
- *    (Note that this is doubling R and performing a decimal left-shift by 1
- *    and searching for the appropriate decimal to fill the one's place.)
- *    The value x is the next digit in the square root.
- * Repeat steps 3 and 4 until the desired precision is reached.  (We're
- * dealing with integers, so the above is sufficient.)
- *
- * In decimal, the square root of 582,734 would be calculated as so:
- *
- *     __7__6__3
- *    | 58 27 34
- *     -49       (7^2 == 49 => 7 is the first digit in the square root)
- *      --
- *       9 27    (Subtract and bring down the next group.)
- * 146   8 76    (2 * 7 * 10 * 6 + 6^2 == 876 => 6 is the next digit in
- *      -----     the square root)
- *         51 34 (Subtract and bring down the next group.)
- * 1523    45 69 (2 * 76 * 10 * 3 + 3^2 == 4569 => 3 is the next digit in
- *         -----  the square root)
- *          5 65 (remainder)
- *
- * The above algorithm applies similarly in binary, but note that the
- * only possible non-zero value for x in step 4 is 1, so step 4 becomes a
- * simple decision: is 2 * R * 2 * 1 + 1^2 (aka R << 2 + 1) less than the
- * preceding difference?
- *
- * In binary, the square root of 11011011 would be calculated as so:
- *
- *     __1__1__1__0
- *    | 11 01 10 11
- *      01          (0 << 2 + 1 == 1 < 11 => this bit is 1)
- *      --
- *      10 01 10 11
- * 101   1 01       (1 << 2 + 1 == 101 < 1001 => next bit is 1)
- *      -----
- *       1 00 10 11
- * 1101    11 01    (11 << 2 + 1 == 1101 < 10010 => next bit is 1)
- *       -------
- *          1 01 11
- * 11101    1 11 01 (111 << 2 + 1 == 11101 > 10111 => last bit is 0)
- *
- */
-static uint64_t
-dt_sqrt_128(uint64_t *square)
-{
-	uint64_t result[2] = { 0, 0 };
-	uint64_t diff[2] = { 0, 0 };
-	uint64_t one[2] = { 1, 0 };
-	uint64_t next_pair[2];
-	uint64_t next_try[2];
-	uint64_t bit_pairs, pair_shift;
-	int i;
-
-	bit_pairs = dt_nbits_128(square) / 2;
-	pair_shift = bit_pairs * 2;
-
-	for (i = 0; i <= bit_pairs; i++) {
-		/*
-		 * Bring down the next pair of bits.
-		 */
-		next_pair[0] = square[0];
-		next_pair[1] = square[1];
-		dt_shift_128(next_pair, -pair_shift);
-		next_pair[0] &= 0x3;
-		next_pair[1] = 0;
-
-		dt_shift_128(diff, 2);
-		dt_add_128(diff, next_pair, diff);
-
-		/*
-		 * next_try = R << 2 + 1
-		 */
-		next_try[0] = result[0];
-		next_try[1] = result[1];
-		dt_shift_128(next_try, 2);
-		dt_add_128(next_try, one, next_try);
-
-		if (dt_le_128(next_try, diff)) {
-			dt_subtract_128(diff, next_try, diff);
-			dt_shift_128(result, 1);
-			dt_add_128(result, one, result);
-		} else {
-			dt_shift_128(result, 1);
-		}
-
-		pair_shift -= 2;
-	}
-
-	assert(result[1] == 0);
-
-	return result[0];
-}
-
-uint64_t
-dt_stddev(uint64_t *data, uint64_t normal)
-{
-	uint64_t avg_of_squares[2];
-	uint64_t square_of_avg[2];
-	int64_t norm_avg;
-	uint64_t diff[2];
-
-	/*
-	 * The standard approximation for standard deviation is
-	 * sqrt(average(x**2) - average(x)**2), i.e. the square root
-	 * of the average of the squares minus the square of the average.
-	 */
-	dt_divide_128(data + 2, normal, avg_of_squares);
-	dt_divide_128(avg_of_squares, data[0], avg_of_squares);
-
-	norm_avg = (int64_t)data[1] / (int64_t)normal / (int64_t)data[0];
-
-	if (norm_avg < 0)
-		norm_avg = -norm_avg;
-
-	dt_multiply_128((uint64_t)norm_avg, (uint64_t)norm_avg, square_of_avg);
-
-	dt_subtract_128(avg_of_squares, square_of_avg, diff);
-
-	return dt_sqrt_128(diff);
-}
-
 static uint32_t
 dt_spec_buf_hval(const dt_spec_buf_t *head)
 {
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7db2ba93..540adfed 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -727,8 +727,6 @@ extern void dt_buffered_disable(dtrace_hdl_t *);
 extern void dt_buffered_destroy(dtrace_hdl_t *);
 extern int dt_read_scalar(caddr_t, const dtrace_recdesc_t *, uint64_t *);
 
-extern uint64_t dt_stddev(uint64_t *, uint64_t);
-
 extern void dt_setcontext(dtrace_hdl_t *, const dtrace_probedesc_t *);
 extern void dt_endcontext(dtrace_hdl_t *);
 
diff --git a/libdtrace/dt_math.h b/libdtrace/dt_math.h
new file mode 100644
index 00000000..8ff5c64c
--- /dev/null
+++ b/libdtrace/dt_math.h
@@ -0,0 +1,358 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2009, 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef _DT_MATH_H
+#define _DT_MATH_H
+
+#ifdef  __cplusplus
+extern "C" {
+#endif
+
+#define	DT_MASK_LO 0x00000000FFFFFFFFULL
+
+/*
+ * We declare this here because (1) we need it and (2) we want to avoid a
+ * dependency on libm in libdtrace.
+ */
+static inline long double
+dt_fabsl(long double x)
+{
+	if (x < 0)
+		return -x;
+
+	return x;
+}
+
+/*
+ * 128-bit arithmetic functions needed to support the stddev() aggregating
+ * action.
+ */
+static inline int
+dt_gt_128(uint64_t *a, uint64_t *b)
+{
+	return a[1] > b[1] || (a[1] == b[1] && a[0] > b[0]);
+}
+
+static inline int
+dt_ge_128(uint64_t *a, uint64_t *b)
+{
+	return a[1] > b[1] || (a[1] == b[1] && a[0] >= b[0]);
+}
+
+static inline int
+dt_le_128(uint64_t *a, uint64_t *b)
+{
+	return a[1] < b[1] || (a[1] == b[1] && a[0] <= b[0]);
+}
+
+/*
+ * Shift the 128-bit value in a by b. If b is positive, shift left.
+ * If b is negative, shift right.
+ */
+static inline void
+dt_shift_128(uint64_t *a, int b)
+{
+	uint64_t mask;
+
+	if (b == 0)
+		return;
+
+	if (b < 0) {
+		b = -b;
+		if (b >= 64) {
+			a[0] = a[1] >> (b - 64);
+			a[1] = 0;
+		} else {
+			a[0] >>= b;
+			mask = 1LL << (64 - b);
+			mask -= 1;
+			a[0] |= ((a[1] & mask) << (64 - b));
+			a[1] >>= b;
+		}
+	} else {
+		if (b >= 64) {
+			a[1] = a[0] << (b - 64);
+			a[0] = 0;
+		} else {
+			a[1] <<= b;
+			mask = a[0] >> (64 - b);
+			a[1] |= mask;
+			a[0] <<= b;
+		}
+	}
+}
+
+static inline int
+dt_nbits_128(uint64_t *a)
+{
+	int nbits = 0;
+	uint64_t tmp[2];
+	uint64_t zero[2] = { 0, 0 };
+
+	tmp[0] = a[0];
+	tmp[1] = a[1];
+
+	dt_shift_128(tmp, -1);
+	while (dt_gt_128(tmp, zero)) {
+		dt_shift_128(tmp, -1);
+		nbits++;
+	}
+
+	return nbits;
+}
+
+static inline void
+dt_subtract_128(uint64_t *minuend, uint64_t *subtrahend, uint64_t *difference)
+{
+	uint64_t result[2];
+
+	result[0] = minuend[0] - subtrahend[0];
+	result[1] = minuend[1] - subtrahend[1] -
+	    (minuend[0] < subtrahend[0] ? 1 : 0);
+
+	difference[0] = result[0];
+	difference[1] = result[1];
+}
+
+static inline void
+dt_add_128(uint64_t *addend1, uint64_t *addend2, uint64_t *sum)
+{
+	uint64_t result[2];
+
+	result[0] = addend1[0] + addend2[0];
+	result[1] = addend1[1] + addend2[1] +
+	    (result[0] < addend1[0] || result[0] < addend2[0] ? 1 : 0);
+
+	sum[0] = result[0];
+	sum[1] = result[1];
+}
+
+/*
+ * The basic idea is to break the 2 64-bit values into 4 32-bit values,
+ * use native multiplication on those, and then re-combine into the
+ * resulting 128-bit value.
+ *
+ * (hi1 << 32 + lo1) * (hi2 << 32 + lo2) =
+ *     hi1 * hi2 << 64 +
+ *     hi1 * lo2 << 32 +
+ *     hi2 * lo1 << 32 +
+ *     lo1 * lo2
+ */
+static inline void
+dt_multiply_128(uint64_t factor1, uint64_t factor2, uint64_t *product)
+{
+	uint64_t hi1, hi2, lo1, lo2;
+	uint64_t tmp[2];
+
+	hi1 = factor1 >> 32;
+	hi2 = factor2 >> 32;
+
+	lo1 = factor1 & DT_MASK_LO;
+	lo2 = factor2 & DT_MASK_LO;
+
+	product[0] = lo1 * lo2;
+	product[1] = hi1 * hi2;
+
+	tmp[0] = hi1 * lo2;
+	tmp[1] = 0;
+	dt_shift_128(tmp, 32);
+	dt_add_128(product, tmp, product);
+
+	tmp[0] = hi2 * lo1;
+	tmp[1] = 0;
+	dt_shift_128(tmp, 32);
+	dt_add_128(product, tmp, product);
+}
+
+/*
+ * This is long-hand division.
+ *
+ * We initialize subtrahend by shifting divisor left as far as possible. We
+ * loop, comparing subtrahend to dividend:  if subtrahend is smaller, we
+ * subtract and set the appropriate bit in the result.  We then shift
+ * subtrahend right by one bit for the next comparison.
+ */
+static inline void
+dt_divide_128(uint64_t *dividend, uint64_t divisor, uint64_t *quotient)
+{
+	uint64_t result[2] = { 0, 0 };
+	uint64_t remainder[2];
+	uint64_t subtrahend[2];
+	uint64_t divisor_128[2];
+	uint64_t mask[2] = { 1, 0 };
+	int log = 0;
+
+	assert(divisor != 0);
+
+	divisor_128[0] = divisor;
+	divisor_128[1] = 0;
+
+	remainder[0] = dividend[0];
+	remainder[1] = dividend[1];
+
+	subtrahend[0] = divisor;
+	subtrahend[1] = 0;
+
+	while (divisor > 0) {
+		log++;
+		divisor >>= 1;
+	}
+
+	dt_shift_128(subtrahend, 128 - log);
+	dt_shift_128(mask, 128 - log);
+
+	while (dt_ge_128(remainder, divisor_128)) {
+		if (dt_ge_128(remainder, subtrahend)) {
+			dt_subtract_128(remainder, subtrahend, remainder);
+			result[0] |= mask[0];
+			result[1] |= mask[1];
+		}
+
+		dt_shift_128(subtrahend, -1);
+		dt_shift_128(mask, -1);
+	}
+
+	quotient[0] = result[0];
+	quotient[1] = result[1];
+}
+
+/*
+ * This is the long-hand method of calculating a square root.
+ * The algorithm is as follows:
+ *
+ * 1. Group the digits by 2 from the right.
+ * 2. Over the leftmost group, find the largest single-digit number
+ *    whose square is less than that group.
+ * 3. Subtract the result of the previous step (2 or 4, depending) and
+ *    bring down the next two-digit group.
+ * 4. For the result R we have so far, find the largest single-digit number
+ *    x such that 2 * R * 10 * x + x^2 is less than the result from step 3.
+ *    (Note that this is doubling R and performing a decimal left-shift by 1
+ *    and searching for the appropriate decimal to fill the one's place.)
+ *    The value x is the next digit in the square root.
+ * Repeat steps 3 and 4 until the desired precision is reached.  (We're
+ * dealing with integers, so the above is sufficient.)
+ *
+ * In decimal, the square root of 582,734 would be calculated as so:
+ *
+ *     __7__6__3
+ *    | 58 27 34
+ *     -49       (7^2 == 49 => 7 is the first digit in the square root)
+ *      --
+ *       9 27    (Subtract and bring down the next group.)
+ * 146   8 76    (2 * 7 * 10 * 6 + 6^2 == 876 => 6 is the next digit in
+ *      -----     the square root)
+ *         51 34 (Subtract and bring down the next group.)
+ * 1523    45 69 (2 * 76 * 10 * 3 + 3^2 == 4569 => 3 is the next digit in
+ *         -----  the square root)
+ *          5 65 (remainder)
+ *
+ * The above algorithm applies similarly in binary, but note that the
+ * only possible non-zero value for x in step 4 is 1, so step 4 becomes a
+ * simple decision: is 2 * R * 2 * 1 + 1^2 (aka R << 2 + 1) less than the
+ * preceding difference?
+ *
+ * In binary, the square root of 11011011 would be calculated as so:
+ *
+ *     __1__1__1__0
+ *    | 11 01 10 11
+ *      01          (0 << 2 + 1 == 1 < 11 => this bit is 1)
+ *      --
+ *      10 01 10 11
+ * 101   1 01       (1 << 2 + 1 == 101 < 1001 => next bit is 1)
+ *      -----
+ *       1 00 10 11
+ * 1101    11 01    (11 << 2 + 1 == 1101 < 10010 => next bit is 1)
+ *       -------
+ *          1 01 11
+ * 11101    1 11 01 (111 << 2 + 1 == 11101 > 10111 => last bit is 0)
+ *
+ */
+static inline uint64_t
+dt_sqrt_128(uint64_t *square)
+{
+	uint64_t result[2] = { 0, 0 };
+	uint64_t diff[2] = { 0, 0 };
+	uint64_t one[2] = { 1, 0 };
+	uint64_t next_pair[2];
+	uint64_t next_try[2];
+	uint64_t bit_pairs, pair_shift;
+	uint64_t i;
+
+	bit_pairs = dt_nbits_128(square) / 2;
+	pair_shift = bit_pairs * 2;
+
+	for (i = 0; i <= bit_pairs; i++) {
+		/*
+		 * Bring down the next pair of bits.
+		 */
+		next_pair[0] = square[0];
+		next_pair[1] = square[1];
+		dt_shift_128(next_pair, -pair_shift);
+		next_pair[0] &= 0x3;
+		next_pair[1] = 0;
+
+		dt_shift_128(diff, 2);
+		dt_add_128(diff, next_pair, diff);
+
+		/*
+		 * next_try = R << 2 + 1
+		 */
+		next_try[0] = result[0];
+		next_try[1] = result[1];
+		dt_shift_128(next_try, 2);
+		dt_add_128(next_try, one, next_try);
+
+		if (dt_le_128(next_try, diff)) {
+			dt_subtract_128(diff, next_try, diff);
+			dt_shift_128(result, 1);
+			dt_add_128(result, one, result);
+		} else {
+			dt_shift_128(result, 1);
+		}
+
+		pair_shift -= 2;
+	}
+
+	assert(result[1] == 0);
+
+	return result[0];
+}
+
+static inline uint64_t
+dt_stddev(uint64_t *data, uint64_t normal)
+{
+	uint64_t avg_of_squares[2];
+	uint64_t square_of_avg[2];
+	int64_t norm_avg;
+	uint64_t diff[2];
+
+	/*
+	 * The standard approximation for standard deviation is
+	 * sqrt(average(x**2) - average(x)**2), i.e. the square root
+	 * of the average of the squares minus the square of the average.
+	 */
+	dt_divide_128(data + 2, normal, avg_of_squares);
+	dt_divide_128(avg_of_squares, data[0], avg_of_squares);
+
+	norm_avg = (int64_t)data[1] / (int64_t)normal / (int64_t)data[0];
+
+	if (norm_avg < 0)
+		norm_avg = -norm_avg;
+
+	dt_multiply_128((uint64_t)norm_avg, (uint64_t)norm_avg, square_of_avg);
+
+	dt_subtract_128(avg_of_squares, square_of_avg, diff);
+
+	return dt_sqrt_128(diff);
+}
+
+#ifdef  __cplusplus
+}
+#endif
+
+#endif	/* _DT_MATH_H */
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 4f814c4e..f09e684b 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -16,6 +16,7 @@
 
 #include <dt_impl.h>
 #include <dt_aggregate.h>
+#include <dt_math.h>
 #include <dt_module.h>
 #include <dt_printf.h>
 #include <dt_string.h>
-- 
2.43.5

