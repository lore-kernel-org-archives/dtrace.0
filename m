Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF13E95B1
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110198; cv=none; b=nFeFb09nQeIToUgLpAtx8PZRpltVKgi0Ly0eb1buHcQQ2JfCGCXj1ka4oq7mZJvhNkUBvqekVzdEzZ8I9kgHAfnD5PssAalLyYJf6gIso4+Di5Yj/dzOS+ESSrwHKTeNl+PdW8x8b0MQWOH21my7Ledl+pQVyIGb+Wj0oyctdbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110198; c=relaxed/simple;
	bh=mWry7jH1OMnielNRlrpArHKEQYnaObpM/jhfrpKcnwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LrZ4A6Frq8e73vV44ifL90jLWUWTVsrFYsq5vPrWEYLhz6uNvf+QWKFuxrkPzx45lA8JP2rqV0pylEij3ZdDxzP5oyRt+3DFG3Ft4UHRL72BlVOorLnaCXh+MdMnkpKpZP++IZDJSRIqxeLC+athoBbKaOAHawuPgoeOcwgeLhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RylCkusp; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RylCkusp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677D4Uv21046513
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=bfIwOAyjXuulod5T
	fi1VJqIutDuTrgsn5Wbacz7szT8=; b=RylCkuspABbb4J82GsfI7kabAxwTbpTM
	PoQrS94ujS1WgGP2dUs6V3/Wru9Vh7UJZqku+WtxyilbJkXfsJ+mT+6Ke8fea2yO
	a2Qws913wwNbKReRgu0vCZQm5wGG6OYUdjqFT5/2UzPGVgr3VmKzkwZbg4Kd3cyG
	goC1+swiasHY2bWgHmfww1TBqyu0Mu9b4lzuSNiuvhiZmw4qXyf0RrqRwWVr+C9d
	o3WQgv1AtIA4qda1+OmkOP0/2C0xPUursjdvaXQjHwFPfvbXUvkv/TBN9cNFBHPw
	cHufMxIaj0e8yCnEC4sJ2oz2QALKZ52576xSTr0UxgvVxLkNXvn6Hw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fs7cyfyt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 13:43:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 677DUV2I013853
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 13:43:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ftpyw3mhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 13:43:12 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 677DhBud018587
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 13:43:12 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-54-230.vpn.oracle.com [10.154.54.230])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ftpyw3mgw-1;
	Fri, 07 Aug 2026 13:43:11 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH] libdtrace: Fix switch statement errors for older compilers
Date: Fri,  7 Aug 2026 14:43:10 +0100
Message-ID: <20260807134310.1741839-1-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608070106
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEwNyBTYWx0ZWRfXzuVZkFrWtk10
 GIfDo5+33RbPMLeVK0LvNLoWT2ASA8D+BCGNV/2rBU7kLNteH0psfnfvkQ7B+2mtUl/8Dz5DRx0
 3yz4SFlMoFxndZXf7Yexi8r8+cljErCNrhveJa2xDP4gn+mwc/df
X-Proofpoint-ORIG-GUID: M2vU07aaj5C_91fCcrMGoMKqUvuCVW8W
X-Proofpoint-GUID: M2vU07aaj5C_91fCcrMGoMKqUvuCVW8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEwNyBTYWx0ZWRfX2g2oUKlSZpIg
 XPiPeJcLURh1BymIvL+TpD3pEeG29HWGl3+6EuGTekEqBcvasoh80Ewmm7JqOMRBaHE71hy7SSh
 qnTPbxsKTGOLhJSXFpUtIQMWg7dYw/kSKhAE5ELOGFnhqUlkiessy1/f+Bp5k8NgnuTl1J4Z9mM
 5/qmSF1u9YtWvcJkN4c4qEoSnBJXvS48Ux3OP8jzQpbxQgRs96Wkj8tr/d1hwqz///IToCzN2Af
 CdP/SeS2a9PzmAVt6U3I77/lRRA474/YPXawgZdkOFXqby2F21sxub5qRW4wEXvsksFMDjtSuGY
 q2VkMXWHabIzKrDeCYe4YsKsRK9PAClUPp0BxTWxdCi6hwWhY+EnVfAAT2et1LJxDgsg/jqfpA2
 ADWak9qQmhzamSzjdw8fdqI/Uymt+8AFUfh6n/if8Rjhf7aY0F9DyVWgvQ/yeXN2v3ltYdXjSBJ
 6VS02MCImf7b3FgKoKA==
X-Authority-Analysis: v=2.4 cv=TsPWQjXh c=1 sm=1 tr=0 ts=6a75e0f1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=yBDfAJNfk496BoTXJHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

For older gcc we see

CC: libdtrace/dt_btf.c
libdtrace/dt_btf.c: In function ‘dt_btf_func_is_traceable’:
libdtrace/dt_btf.c:1053:3: error: label at end of compound statement
   default:
   ^~~~~~~
libdtrace/dt_btf.c:1081:4: error: label at end of compound statement
    default:
    ^~~~~~~
make: *** [Makerules:14: /home/almagui/src/dtrace/build/libdtrace--dt_btf.o] Error 1

This is because a statement is required in the default: label.
Add a break statement to suppress the error.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_btf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 1f793397..9715cc3f 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -1052,6 +1052,7 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 			return 0;
 		default:
 			/* fall-through */
+			break;
 		}
 	}
 
@@ -1080,6 +1081,7 @@ dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 					return 0;
 			default:
 				/* fall-through */
+				break;
 			}
 		}
 	}
-- 
2.43.5

