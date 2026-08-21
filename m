Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEC14C955A
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328673; cv=none; b=XWQgKNYYJOD7eC+VUHDun2a9JdbM8bUnqNhv5IUtiPwSetZ8pyC1URBVsrh1AW0ON/mtqXdbDNe8C/BoGGxzzSn8bk5rmDvNiUTDrmL9Eki1br/s43gzLQXw/CeVEZIjfZtpDBA/IsNLNzZ0/vdY7XT0Vb+x0RYaLEP037oL+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328673; c=relaxed/simple;
	bh=ITN+sxpYm1yxLLSMcbUAzFQpQ1ob74t71MO+BAmqyUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3p+L2NYiIyr9u4aQnN01MItv/DHEX0Py2gp4VUvlJkn82ckW9E0DoBqQJ4g4xnsA59HbGuX72NNUprc2dkV/SyrWTwVpXrvcFbqs9gDh9T22yxLH7Mmy/fBtaPLrR29QQLF1kIyfgpRALz+EFLqj4Lu7C2H47W7tQCiwGcORko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bkvz9TbJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bkvz9TbJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpHIE2338299
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=g3w0q
	93cDd7tWX3hPQMDusT4vOOyp1Y/xStJw93KMJg=; b=bkvz9TbJdUn4YfpJSwMWO
	bio8LA/+QOoKMhI4fzh/bDW1WLI5AzBymzwJB8fM6bzTfeJzWvwHwJXxIIQo1JSE
	qKnbEjJCVhoRCcbNBjdXqWWksogHhHdMJzaga54/3V43LLLFss2Zd9stFaIZgkKJ
	ciayf3Wf8NK5Jsmv1To+8EPmDLySfEltabX4MEcwd7cUvgaj+i58PH53Q3taTjoX
	LWpl5UN26QVYsHrw3sGkNua1gAttjKSjN/YbJX7RtOoOM1o12NDZBD+GnCpuoxNQ
	+CLLKzhM6TaHxUiz//aIIyZRsIe+6P3shHT7sx+VGqYugZccHoQayiqZENG6Egqn
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4ydbnapk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5Ctr029289
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcmyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:08 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2F6014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:08 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-5;
	Fri, 21 Aug 2026 16:11:07 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 04/11] libdtrace: Add aggregation key/value computation APIs
Date: Fri, 21 Aug 2026 17:10:52 +0100
Message-ID: <20260821161100.41710-5-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260821161100.41710-1-alan.maguire@oracle.com>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608210126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8zm1H4OWchGO
 0DW6Hu3GGuCWSUTqwmubGiPqaV2Gxv7HQHFexMBHeRxDw1DN7vJnw6noIic3v5jVrXY4WqmojDu
 rnOGlu4Ry7GT33SUiILvxGaXFs2Y3rc2OoImhPKbBM9gMFioqK0gV5VaFGH7cyYnG9X8KuDNqAT
 CSgk7c8o1cuGB3SDMK9m358pWQbQSyrvgbt3jvTMQgU2DVwNrYPVJ2LTgLvZ+e+9g+Dn5eA74nU
 Hu4GPZYW7ajGN8sdb/S2gWMj6Q6QUPtj8fN478pYwTU3MWJ3FwDy+1ACrmKmHNP3hAFmHiNugHJ
 u9DkYCeVsuvqO87koP+lFNTWvusm/Bp88sm0KnaBgdakZljmDXT2OnLSJctsP826yyeWHy8vXHY
 /JE6uUgjAUbOCwQIl4eO5ikVCzNUAqLAiMl2Bh1PDYaRJt/yuf35UwhOmYE+f0S/m5pdSS44q1K
 WhDYzwXpQMk/rkTL/XQ==
X-Proofpoint-ORIG-GUID: _w8uVjBZ_RiP6I7jy3KqFPSJm-VzW9j8
X-Proofpoint-GUID: _w8uVjBZ_RiP6I7jy3KqFPSJm-VzW9j8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5RG7rAP1UJgL
 NOZHqOcouAHy+U2hqzbHzZ0v8dhmkK2J/SlMUoXKF+eDK/+NPBoqzIip3QAs4aktDI+4zfpVVy0
 M3hV9PY+1Dcnd4UlxzK/4PdsSzDc/DJDcwZkVTvAekYWRJS+mJQQ
X-Authority-Analysis: v=2.4 cv=GpJyPE1C c=1 sm=1 tr=0 ts=6a88789d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=TCXVto4UxOw6LvX8BHcA:9
 a=WmVTiCyuxqgg3mnwYu6p:22

To provide a way for consumers to emit aggregation keys
and compute aggregation values, provide new APIs in libdtrace:

int dtrace_aggregate_value(const dtrace_aggdata_t *aggdata,
			   dtrace_aggvalue_t *value);
int dtrace_aggregate_keys(const dtrace_aggdata_t *data,
			  dtrace_aggkey_t *keys, size_t num_keys);
void dtrace_aggregate_key_free(dtrace_aggkey_t *key);

These provide a way to compute aggregation values from snapshots,
print them and free the representation used to print them.

This allows consumers like python bindings to avoid having to
understand aggregation internals.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_aggregate.c | 517 +++++++++++++++++++++++++++++++++++++++
 libdtrace/dtrace.h       |  83 +++++++
 libdtrace/libdtrace.ver  |   3 +
 3 files changed, 603 insertions(+)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 1fc8294d..afc6a01a 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -13,11 +13,15 @@
 #include <assert.h>
 #include <alloca.h>
 #include <limits.h>
+#include <stdio.h>
+#include <string.h>
 
 #include <libproc.h>
 #include <port.h>
 #include <dt_aggregate.h>
 #include <dt_bpf.h>
+#include <math.h>
+#include <limits.h>
 
 typedef struct dt_ahashent {
 	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
@@ -44,6 +48,519 @@ struct dt_aggregate {
 
 #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
 
+static int
+dt_aggregate_read_signed(const char *addr, size_t size, int64_t *value)
+{
+	int8_t v8;
+	int16_t v16;
+	int32_t v32;
+	int64_t v64;
+
+	switch (size) {
+	case sizeof(v8):
+		memcpy(&v8, addr, sizeof(v8));
+		*value = v8;
+		return 0;
+	case sizeof(v16):
+		memcpy(&v16, addr, sizeof(v16));
+		*value = v16;
+		return 0;
+	case sizeof(v32):
+		memcpy(&v32, addr, sizeof(v32));
+		*value = v32;
+		return 0;
+	case sizeof(v64):
+		memcpy(&v64, addr, sizeof(v64));
+		*value = v64;
+		return 0;
+	default:
+		return -1;
+	}
+}
+
+static int
+dt_aggregate_read_unsigned(const char *addr, size_t size, uint64_t *value)
+{
+	uint8_t v8;
+	uint16_t v16;
+	uint32_t v32;
+	uint64_t v64;
+
+	switch (size) {
+	case sizeof(v8):
+		memcpy(&v8, addr, sizeof(v8));
+		*value = v8;
+		return 0;
+	case sizeof(v16):
+		memcpy(&v16, addr, sizeof(v16));
+		*value = v16;
+		return 0;
+	case sizeof(v32):
+		memcpy(&v32, addr, sizeof(v32));
+		*value = v32;
+		return 0;
+	case sizeof(v64):
+		memcpy(&v64, addr, sizeof(v64));
+		*value = v64;
+		return 0;
+	default:
+		return -1;
+	}
+}
+
+int
+dtrace_aggregate_value(const dtrace_aggdata_t *aggdata, dtrace_aggvalue_t *value)
+{
+	const dtrace_aggdesc_t *agg;
+	const dtrace_recdesc_t *rec;
+	const char *addr;
+	uint64_t normal;
+
+	if (aggdata == NULL || aggdata->dtada_desc == NULL ||
+	    aggdata->dtada_data == NULL || value == NULL)
+		return aggdata && aggdata->dtada_hdl ?
+			dt_set_errno(aggdata->dtada_hdl, EINVAL) : -1;
+
+	agg = aggdata->dtada_desc;
+	rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
+	addr = aggdata->dtada_data + rec->dtrd_offset;
+	normal = agg->dtagd_normal ? agg->dtagd_normal : 1;
+	value->dtagv_action = rec->dtrd_action;
+	value->dtagv_normal = normal;
+	value->dtagv_bucket_count = 0;
+
+	switch (rec->dtrd_action) {
+	case DT_AGG_AVG: {
+		const int64_t *data = (const int64_t *)addr;
+
+		if (rec->dtrd_size < sizeof(*data) * 2)
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		value->dtagv_kind = DTRACE_AGGVALUE_FLOAT;
+		value->dtagv_value.real = data[0] == 0 ? 0.0 :
+			(double)((long double)data[1] / normal / data[0]);
+		return 0;
+	}
+	case DT_AGG_STDDEV: {
+		uint64_t data[4];
+
+		if (rec->dtrd_size < sizeof(data))
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		memcpy(data, addr, sizeof(data));
+		value->dtagv_kind = DTRACE_AGGVALUE_UNSIGNED;
+		value->dtagv_value.unsigned_integer =
+			data[0] == 0 ? 0 : dt_stddev(data, normal);
+		return 0;
+	}
+	case DT_AGG_SUM:
+	case DT_AGG_MIN:
+	case DT_AGG_MAX:
+		value->dtagv_kind = DTRACE_AGGVALUE_INTEGER;
+		if (dt_aggregate_read_signed(addr, rec->dtrd_size,
+					     &value->dtagv_value.integer) != 0)
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		value->dtagv_value.integer /= (int64_t)normal;
+		return 0;
+	case DT_AGG_COUNT:
+		value->dtagv_kind = DTRACE_AGGVALUE_UNSIGNED;
+		if (dt_aggregate_read_unsigned(addr, rec->dtrd_size,
+			    &value->dtagv_value.unsigned_integer) != 0)
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		value->dtagv_value.unsigned_integer /= normal;
+		return 0;
+	case DT_AGG_QUANTIZE: {
+		const int64_t *data = (const int64_t *)addr;
+		size_t i, nbins = rec->dtrd_size / sizeof(*data);
+
+		if (rec->dtrd_size % sizeof(*data) != 0 ||
+		    value->dtagv_buckets == NULL ||
+		    value->dtagv_bucket_capacity < nbins)
+			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
+		for (i = 0; i < nbins; i++) {
+			if (data[i] < 0)
+				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		}
+		for (i = 0; i < nbins; i++) {
+			if (data[i] == 0)
+				continue;
+			value->dtagv_buckets[value->dtagv_bucket_count].bucket =
+				DTRACE_QUANTIZE_BUCKETVAL((uint64_t)i);
+			value->dtagv_buckets[value->dtagv_bucket_count].count =
+				(uint64_t)(data[i] / (int64_t)normal);
+			if (value->dtagv_buckets[value->dtagv_bucket_count].count != 0)
+				value->dtagv_bucket_count++;
+		}
+		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
+		return 0;
+	}
+	case DT_AGG_LQUANTIZE: {
+		uint16_t levels = DTRACE_LQUANTIZE_LEVELS(agg->dtagd_sig);
+		uint16_t step = DTRACE_LQUANTIZE_STEP(agg->dtagd_sig);
+		int32_t base = DTRACE_LQUANTIZE_BASE(agg->dtagd_sig);
+		size_t i, nbins = (size_t)levels + 2;
+		const int64_t *data = (const int64_t *)addr;
+
+		if (rec->dtrd_size != nbins * sizeof(*data) ||
+		    value->dtagv_buckets == NULL ||
+		    value->dtagv_bucket_capacity < nbins)
+			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
+		for (i = 0; i < nbins; i++) {
+			if (data[i] < 0)
+				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		}
+		for (i = 0; i < nbins; i++) {
+			int64_t count = data[i] / (int64_t)normal;
+			int64_t bucket;
+
+			if (count == 0)
+				continue;
+			if (i == 0)
+				bucket = base - 1;
+			else if (i == levels + 1)
+				bucket = base + (int64_t)levels * step;
+			else
+				bucket = base + (int64_t)(i - 1) * step;
+			value->dtagv_buckets[value->dtagv_bucket_count++] =
+				(dtrace_aggvalue_bucket_t){ bucket, (uint64_t)count };
+		}
+		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
+		return 0;
+	}
+	case DT_AGG_LLQUANTIZE: {
+		int factor = DTRACE_LLQUANTIZE_FACTOR(agg->dtagd_sig);
+		int lmag = DTRACE_LLQUANTIZE_LMAG(agg->dtagd_sig);
+		int hmag = DTRACE_LLQUANTIZE_HMAG(agg->dtagd_sig);
+		int steps = DTRACE_LLQUANTIZE_STEPS(agg->dtagd_sig);
+		int steps_factor, bin0;
+		size_t i, nbins;
+		const int64_t *data = (const int64_t *)addr;
+		long double limit = (long double)INT64_MAX;
+
+		if (factor < 2 || steps < factor || lmag > hmag)
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		steps_factor = steps / factor;
+		bin0 = 1 + (hmag - lmag + 1) * (steps - steps_factor);
+		nbins = (size_t)(hmag - lmag + 1) *
+			(steps - steps_factor) * 2 + 3;
+		if (!isfinite((double)powl(factor, hmag + 1)) ||
+		    powl(factor, hmag + 1) > limit)
+			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+
+		if (rec->dtrd_size != nbins * sizeof(*data) ||
+		    value->dtagv_buckets == NULL ||
+		    value->dtagv_bucket_capacity < nbins)
+			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
+		for (i = 0; i < nbins; i++) {
+			if (data[i] < 0)
+				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
+		}
+		for (i = 0; i < nbins; i++) {
+			int64_t count = data[i] / (int64_t)normal;
+			int64_t bucket;
+			int left, negative, remaining, magnitude;
+
+			if (count == 0)
+				continue;
+			if (i == 0)
+				bucket = -(int64_t)powl(factor, hmag + 1);
+			else if (i == nbins - 1)
+				bucket = (int64_t)powl(factor, hmag + 1);
+			else if (i == (size_t)bin0)
+				bucket = 0;
+			else {
+				left = (int)i - bin0;
+				negative = left < 0;
+				remaining = negative ? bin0 - (int)i : left;
+				magnitude = lmag;
+				if (lmag == 0 && steps > factor) {
+					for (int n = 2; n <= factor && remaining > 0; n++) {
+						remaining -= steps_factor;
+						if (remaining == 0) {
+							bucket = negative ? -n : n;
+							goto ll_have_bucket;
+						}
+					}
+					magnitude++;
+				}
+				bucket = negative ? -1 : 1;
+				while (magnitude <= hmag) {
+					int64_t scale = (int64_t)(powl(factor, magnitude + 1) /
+						(double)steps);
+					int n;
+
+					for (n = steps_factor + 1; n <= steps; n++) {
+						if (--remaining == 0) {
+							bucket = n * scale * (negative ? -1 : 1);
+							goto ll_have_bucket;
+						}
+					}
+					magnitude++;
+				}
+				bucket *= (int64_t)powl(factor, hmag + 1);
+			}
+ll_have_bucket:
+			value->dtagv_buckets[value->dtagv_bucket_count++] =
+				(dtrace_aggvalue_bucket_t){ bucket, (uint64_t)count };
+		}
+		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
+		return 0;
+	}
+	default:
+		value->dtagv_kind = DTRACE_AGGVALUE_RAW;
+		value->dtagv_value.raw.data = addr;
+		value->dtagv_value.raw.size = rec->dtrd_size;
+		return 0;
+	}
+}
+
+void dtrace_aggregate_key_free(dtrace_aggkey_t *key)
+{
+	size_t i;
+
+	if (!key)
+		return;
+	switch (key->dtagk_kind) {
+	case DTRACE_AGGKEY_BYTES:
+		free(key->dtagk_value.bytes.data);
+		break;
+	case DTRACE_AGGKEY_STRING:
+	case DTRACE_AGGKEY_SYMBOL:
+	case DTRACE_AGGKEY_MODULE:
+		free(key->dtagk_value.name);
+		break;
+	case DTRACE_AGGKEY_ADDRESS:
+		break;
+	case DTRACE_AGGKEY_STACK:
+		for (i = 0; i < key->dtagk_value.stack.depth; i++)
+			free(key->dtagk_value.stack.frames[i]);
+		free(key->dtagk_value.stack.frames);
+		break;
+	default:
+		break;
+	}
+	memset(key, 0, sizeof(*key));
+}
+
+int dtrace_aggregate_keys(const dtrace_aggdata_t *data,
+			  dtrace_aggkey_t *keys, size_t num_keys)
+{
+	int error = EDT_NOMEM;
+	dtrace_hdl_t *dtp;
+	size_t i, n;
+
+	if (!data || !data->dtada_desc)
+		return data && data->dtada_hdl ?
+			dt_set_errno(data->dtada_hdl, EINVAL) : -1;
+	dtp = data->dtada_hdl;
+	if (data->dtada_desc->dtagd_nkrecs == 0)
+		return 0;
+	n = data->dtada_desc->dtagd_nkrecs - 1;
+	if (n == 0)
+		return 0;
+	if (!data->dtada_key)
+		return dt_set_errno(dtp, EDT_BADAGG);
+	if (!keys || num_keys < n)
+		return dt_set_errno(dtp, EINVAL);
+	memset(keys, 0, n * sizeof(*keys));
+
+	for (i = 0; i < n; i++) {
+		const dtrace_recdesc_t *rec = &data->dtada_desc->dtagd_krecs[i + 1];
+		char *addr = data->dtada_key + rec->dtrd_offset;
+		if ((size_t)rec->dtrd_offset > data->dtada_desc->dtagd_ksize ||
+		    rec->dtrd_size > data->dtada_desc->dtagd_ksize -
+		    (size_t)rec->dtrd_offset)
+			goto badagg;
+
+		switch (rec->dtrd_action) {
+		case DTRACEACT_STACK:
+		case DTRACEACT_USTACK:
+		case DTRACEACT_JSTACK: {
+			uint32_t depth, max, frames, j, tgid = 0;
+
+			if (rec->dtrd_size < 2 * sizeof(uint64_t) ||
+			    (rec->dtrd_action != DTRACEACT_STACK &&
+			     rec->dtrd_size < 4 * sizeof(uint64_t)))
+				goto badagg;
+			memcpy(&depth, addr, sizeof(depth));
+			max = rec->dtrd_size >= 2 * sizeof(uint64_t) ?
+				rec->dtrd_size / sizeof(uint64_t) - 2 : 0;
+			frames = depth < max ? depth : max;
+			if (rec->dtrd_action != DTRACEACT_STACK) {
+				memcpy(&tgid, addr + 3 * sizeof(uint32_t),
+				       sizeof(tgid));
+			}
+
+			keys[i].dtagk_kind = DTRACE_AGGKEY_STACK;
+			keys[i].dtagk_value.stack.frames = frames == 0 ? NULL :
+				calloc(frames, sizeof(char *));
+			keys[i].dtagk_value.stack.depth = 0;
+			if (frames != 0 && !keys[i].dtagk_value.stack.frames)
+				goto error;
+			for (j = 0; j < frames; j++) {
+				char text[PATH_MAX * 2];
+				uint64_t pc;
+				int rc;
+
+				memcpy(&pc, addr + (j + 2) * sizeof(uint64_t),
+				       sizeof(pc));
+				if (pc == 0)
+					break;
+				rc = rec->dtrd_action == DTRACEACT_STACK ?
+					dtrace_addr2str(dtp, pc, text,
+							sizeof(text)) :
+					dtrace_uaddr2str(dtp, tgid, pc,
+							 text, sizeof(text));
+				if (rc < 0) {
+					error = EDT_BADAGG;
+					goto error;
+				}
+				if (!(keys[i].dtagk_value.stack.frames[j] = strdup(text)))
+					goto error;
+				keys[i].dtagk_value.stack.depth++;
+			}
+			break;
+		}
+		case DTRACEACT_SYM:
+		case DTRACEACT_MOD: {
+			dtrace_syminfo_t info;
+			char text[PATH_MAX * 2];
+			uint64_t pc;
+
+			memcpy(&pc, addr, sizeof(pc));
+
+			if (dtrace_lookup_by_addr(dtp, pc,
+						  NULL, &info) == 0) {
+				snprintf(text, sizeof(text), "%s%s%s",
+					 info.object,
+					 rec->dtrd_action == DTRACEACT_SYM ? "`" : "",
+					 rec->dtrd_action == DTRACEACT_SYM ? info.name : "");
+			} else {
+				snprintf(text, sizeof(text), "0x%llx",
+					(unsigned long long)pc);
+			}
+			keys[i].dtagk_kind = rec->dtrd_action == DTRACEACT_SYM ?
+				DTRACE_AGGKEY_SYMBOL : DTRACE_AGGKEY_MODULE;
+			keys[i].dtagk_value.name = strdup(text);
+			if (!keys[i].dtagk_value.name)
+				goto error;
+			break;
+		}
+		case DTRACEACT_UADDR:
+		case DTRACEACT_USYM:
+		case DTRACEACT_UMOD: {
+			char text[PATH_MAX * 2];
+			uint32_t tgid;
+			uint64_t pc;
+
+			/*
+			 * The target PID occupies the first word and the address
+			 * the second; the record is aligned to 64 bits.
+			 */
+			if (rec->dtrd_size < 2 * sizeof(uint64_t))
+				goto badagg;
+			memcpy(&tgid, addr, sizeof(tgid));
+			memcpy(&pc, addr + sizeof(uint64_t), sizeof(pc));
+			if (rec->dtrd_action == DTRACEACT_UADDR) {
+				keys[i].dtagk_kind = DTRACE_AGGKEY_ADDRESS;
+				keys[i].dtagk_value.user_address.pid = tgid;
+				keys[i].dtagk_value.user_address.address = pc;
+				break;
+			}
+
+			if (dtrace_uaddr2str(dtp, tgid, pc, text,
+				     sizeof(text)) < 0)
+				goto badagg;
+			if (rec->dtrd_action == DTRACEACT_UMOD) {
+				char *tick = strchr(text, '`');
+				if (tick)
+					*tick = '\0';
+			}
+			keys[i].dtagk_kind = rec->dtrd_action == DTRACEACT_USYM ?
+				 DTRACE_AGGKEY_SYMBOL : DTRACE_AGGKEY_MODULE;
+			keys[i].dtagk_value.name = strdup(text);
+			if (!keys[i].dtagk_value.name)
+				goto error;
+			break;
+		}
+		default:
+			keys[i].dtagk_kind = DTRACE_AGGKEY_INTEGER;
+			switch (rec->dtrd_size) {
+			case 1: {
+				int8_t v;
+
+				memcpy(&v, addr, 1);
+				keys[i].dtagk_value.integer = v;
+				break;
+			}
+			case 2: {
+				int16_t v;
+
+				memcpy(&v, addr, 2);
+				keys[i].dtagk_value.integer = v;
+				break;
+			}
+			case 4: {
+				int32_t v;
+
+				memcpy(&v, addr, 4);
+				keys[i].dtagk_value.integer = v;
+				break;
+			}
+			case 8: {
+				int64_t v;
+
+				memcpy(&v, addr, 8);
+				keys[i].dtagk_value.integer = v;
+				break;
+			}
+			default: {
+				char *nul = memchr(addr, '\0', rec->dtrd_size);
+
+				/*
+				 * This is a heuristic: key descriptors do not
+				 * retain type information.  DTrace strings are
+				 * NUL-terminated and padded with zeros to their
+				 * fixed record size.
+				 */
+				if (nul != NULL) {
+					char *p;
+
+					for (p = nul + 1; p < addr + rec->dtrd_size; p++) {
+						if (*p != '\0')
+							break;
+					}
+					if (p == addr + rec->dtrd_size) {
+						keys[i].dtagk_kind = DTRACE_AGGKEY_STRING;
+						keys[i].dtagk_value.name = strndup(addr,
+									   rec->dtrd_size);
+						if (!keys[i].dtagk_value.name)
+							goto error;
+						break;
+					}
+				}
+				keys[i].dtagk_kind = DTRACE_AGGKEY_BYTES;
+				keys[i].dtagk_value.bytes.data = malloc(rec->dtrd_size);
+				if (!keys[i].dtagk_value.bytes.data)
+					goto error;
+				memcpy(keys[i].dtagk_value.bytes.data, addr,
+				       rec->dtrd_size);
+				keys[i].dtagk_value.bytes.size = rec->dtrd_size;
+				break;
+			}
+			}
+			break;
+		}
+	}
+	return (int)n;
+error:
+	for (i = 0; i < n; i++)
+		dtrace_aggregate_key_free(&keys[i]);
+	return dt_set_errno(dtp, error);
+badagg:
+	for (i = 0; i < n; i++)
+		dtrace_aggregate_key_free(&keys[i]);
+	return dt_set_errno(dtp, EDT_BADAGG);
+}
+
 /*
  * Because qsort(3C) does not allow an argument to be passed to a comparison
  * function, the variables that affect comparison must regrettably be global;
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 82965fbd..a108080f 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -379,6 +379,89 @@ struct dtrace_aggdata {
 	caddr_t *dtada_percpu;			/* per CPU data, if avail */
 };
 
+typedef enum dtrace_aggvalue_kind {
+	DTRACE_AGGVALUE_INTEGER,
+	DTRACE_AGGVALUE_UNSIGNED,
+	DTRACE_AGGVALUE_FLOAT,
+	DTRACE_AGGVALUE_RAW,
+	DTRACE_AGGVALUE_QUANTIZED
+} dtrace_aggvalue_kind_t;
+
+typedef struct dtrace_aggvalue_bucket {
+	int64_t bucket;
+	uint64_t count;
+} dtrace_aggvalue_bucket_t;
+
+/* Quantized buckets are supplied by the caller through dtagv_buckets. */
+typedef struct dtrace_aggvalue {
+	dtrace_aggvalue_kind_t dtagv_kind;
+	uint16_t dtagv_action;
+	uint64_t dtagv_normal;
+	dtrace_aggvalue_bucket_t *dtagv_buckets;
+	size_t dtagv_bucket_capacity;
+	size_t dtagv_bucket_count;
+	union {
+		int64_t integer;
+		uint64_t unsigned_integer;
+		double real;
+		struct {
+			const void *data;
+			size_t size;
+		} raw;
+	} dtagv_value;
+} dtrace_aggvalue_t;
+
+typedef enum dtrace_aggkey_kind {
+	DTRACE_AGGKEY_INTEGER,
+	DTRACE_AGGKEY_STRING,
+	DTRACE_AGGKEY_BYTES,
+	DTRACE_AGGKEY_STACK,
+	DTRACE_AGGKEY_SYMBOL,
+	DTRACE_AGGKEY_MODULE,
+	DTRACE_AGGKEY_USER_ADDRESS,
+	DTRACE_AGGKEY_ADDRESS = DTRACE_AGGKEY_USER_ADDRESS
+} dtrace_aggkey_kind_t;
+
+typedef struct dtrace_aggkey {
+	dtrace_aggkey_kind_t dtagk_kind;
+	union {
+		int64_t integer;
+		struct {
+			char *data;
+			size_t size;
+		} bytes;
+		struct {
+			char **frames;
+			size_t depth;
+		} stack;
+		char *name;
+		/* User addresses include the target PID to disambiguate ASLR. */
+		struct {
+			uint32_t pid;
+			uint64_t address;
+		} user_address;
+	} dtagk_value;
+} dtrace_aggkey_t;
+
+/*
+ * Decode all keys in an aggregation snapshot.  The caller supplies an array
+ * with capacity for dtagd_nkrecs - 1 descriptors.  Returned strings, byte
+ * buffers, and stack frames are owned by the caller and must be released
+ * with dtrace_aggregate_key_free().  Zero-key aggregations return zero.
+ */
+extern int dtrace_aggregate_keys(const dtrace_aggdata_t *, dtrace_aggkey_t *,
+				 size_t);
+extern void dtrace_aggregate_key_free(dtrace_aggkey_t *);
+
+/*
+ * Decode one aggregation value.  Integer values can be signed or unsigned.
+ * Raw data points into the snapshot and is valid only while that snapshot
+ * remains valid.  Quantized values require a caller-provided bucket array and
+ * capacity.
+ */
+extern int dtrace_aggregate_value(const dtrace_aggdata_t *,
+				  dtrace_aggvalue_t *);
+
 typedef struct dtrace_print_aggdata {
 	dtrace_hdl_t *dtpa_dtp;			/* handle to DTrace library */
 	dtrace_aggid_t dtpa_id;			/* aggregation variable */
diff --git a/libdtrace/libdtrace.ver b/libdtrace/libdtrace.ver
index edbd5a1d..87d561b2 100644
--- a/libdtrace/libdtrace.ver
+++ b/libdtrace/libdtrace.ver
@@ -8,8 +8,11 @@ LIBDTRACE_1.0 {
     global:
 	dtrace_addr2str;
 	dtrace_aggregate_clear;
+	dtrace_aggregate_keys;
+	dtrace_aggregate_key_free;
 	dtrace_aggregate_print;
 	dtrace_aggregate_snap;
+	dtrace_aggregate_value;
 	dtrace_aggregate_walk;
 	dtrace_aggregate_walk_joined;
 	dtrace_aggregate_walk_keyrevsorted;
-- 
2.43.5

