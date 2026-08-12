Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AE44A3F2
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540947; cv=none; b=G7Soqhfc5F5nYiPAWdVEeoZ4CKahFv6mx8nzkRmrPO3ekf3GvDxjPSjt77+j+o7NH8Ok9RiHl1amvCH8FaRDoig6X961wo4HGxP1dahfQ6VIsTdBxoYM1Z/ZP/0uuyKCv3tKRytfsDG98j8FXUsuJnHSaANaAU2p9pDeHXqpoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540947; c=relaxed/simple;
	bh=LYro2+CuwfAqK2MYKsAtvKNR+Fn23dv+LHumrgAY8y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0/XRcF0CNQwlHJCVH0PGO635G7ezXiAsQEQpwPS6ZpESDNGEx6LjxR3xSXZYS0jCkLFvR4xRKkL8cnRmzXtwSJyUYgCyoBX83COYr8Bf71+ypH7lEjxKize34pqSGmCMKlpdq8q4AwE+or4SlCQp55nxwiGQliWTLDMcawrE+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j8qo74g5; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j8qo74g5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C1GhFd3692993
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=qBEmF
	hNb/m40pvdswocTkuhBFPp4aB6dxNvdavk49UM=; b=j8qo74g5EgUlumCauM/zB
	D4sLXvaZ21Bn4lzL6PFKV4Mge7RQZJDyp+CGIXvy5pDZj2O05fqdN2T5rPnOkq4C
	JfJJBf25hOdZwlqZObBFdU3UvnHypys7aDZAMSb8WusBnCIklqkPzG9Wz+0Tvno2
	Sn+Fs6wAi+7JdanZE6WNnBN/Q1OEw7BmSQwpE14+nIx/eYmKS1OY8LijJ4FeNC/F
	pzWGStD3L0xQpYf4R7MTqXG45VMpCtF57BxuCj8zHMxpaLN+mTLp7jbks2pXV0W4
	khQAigBk7Oy6ooUl4bEK3kgEAl/KpQu7+MFW/v0XPQob82s9NRfD6D45gRscF4Cd
	A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fwvk6epqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKf1d002432
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:24 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEC5010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:23 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-10;
	Wed, 12 Aug 2026 13:22:23 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 9/9] dtrace.spec: Add optional PCP PMDA packaging pcp-pmda-dtrace
Date: Wed, 12 Aug 2026 14:22:10 +0100
Message-ID: <20260812132212.527871-10-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260812132212.527871-1-alan.maguire@oracle.com>
References: <20260812132212.527871-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608120109
X-Authority-Analysis: v=2.4 cv=GaknWwXL c=1 sm=1 tr=0 ts=6a7c7391 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=rg5LQmnNqVTPA77dX7AA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-ORIG-GUID: FoKHf9_oN3ODgnzmbOuCl1YSjY_dSaJz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOCBTYWx0ZWRfX9QQkMyMU1eYh
 udpbcF3ljl/Z0VTNeqi9VwcNcB7Bs63KN9SpIALqznFJS2D4/z4Ha8D+2oj9/0At2zPq9VOlGwQ
 xLAYb9ectIGXdgGtPAGvWGNfBVZDIaawJn8uBR2PG15JcXkGpb+m
X-Proofpoint-GUID: FoKHf9_oN3ODgnzmbOuCl1YSjY_dSaJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOCBTYWx0ZWRfX+uBR5oCSmqay
 bFpmocrxJY6H9KoduzcYewFKrM46HJcltXSW8ZYYgDDH8duq0UdJE0lz9TDyckG2Swl63IYAH6x
 wV95/VFDp7fm7xvTt8YO7oU6wVYJCcO8NeVDd6n3d4ZnmxXHZG0aX6i84DQn8tmL8wAEgCd5QwO
 VCBUiQ1deGDOn4QQigigJEfcZoxhsXmp3Hu4aWKAqK/51VhcnkP4UgSDiQqJs3BjAOqJzD7zKSh
 F3c9wDgKv8+8EQI50WxvWsAGCoge5MO9PyXfZvnLIWhcbBEgJjQAGMHW7gwRSyyJZmu2rk8hyvn
 ccePEiJXpTuy5CEvXHji2M3L2PaiobXJ4aEOp/azRab+8q5f1WSWItRi4I86+uSUVT/KRLE1OzU
 KiGKirSTAXGJ9W3LVmeN4aO4ZqPVQWAtWMJ13MZQhaa95Y9zpqFpw/WTIEdDksgtUuanKdp2ef/
 KnYRwbr59OTFkz5XIyvhQ8hTAQub93hYkLAbMq50=

Add a PCP build conditional and package the DTrace PMDA when PCP and
Python support are enabled.  Install it under an overridable PCP target
directory, defaulting to /var/lib/pcp/pmdas/dtrace, and require
python3-pcp at runtime.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dtrace.spec | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/dtrace.spec b/dtrace.spec
index a16cb62a..5747665c 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -29,6 +29,9 @@
 # By default, do not build with 32-on-64 support.
 %define glibc32 %{nil}
 
+# Directory in which to install the DTrace PCP PMDA.
+%global pcp_targetdir %{?pcp_targetdir}%{!?pcp_targetdir:/var/lib/pcp/pmdas/dtrace}
+
 # Enable it for non-ARM64 builds excpet for OL10.
 # ARM64 does not support 32-on-64 either.
 %ifnarch aarch64
@@ -41,6 +44,7 @@
 %global _lto_cflags %{nil}
 
 %bcond_without python
+%bcond_without pcp
 
 BuildRequires: rpm
 Name:         dtrace
@@ -146,6 +150,18 @@ Python extension module providing access to libdtrace.
 
 %endif
 
+%if %{with pcp} && %{with python}
+%package -n pcp-pmda-dtrace
+Summary:      PCP PMDA for DTrace
+Requires:     python3-dtrace = %{version}-%{release}
+Requires:     python3-pcp
+Group:        Applications/System
+
+%description -n pcp-pmda-dtrace
+Performance Co-Pilot PMDA for exposing DTrace data as metrics.
+
+%endif
+
 Installed in /usr/lib64/dtrace/testsuite.
 
 'make check' here is just like 'make check' in the source tree, except that
@@ -170,8 +186,16 @@ make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{?with_python:W
 mkdir -p $RPM_BUILD_ROOT/usr/sbin
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
+     PMDA_OBJDIR="$RPM_BUILD_ROOT%{pcp_targetdir}" \
      install install-test %{?with_python:install-python}      PYTHON=%{__python3}
 
+%if %{without pcp}
+rm -rf "$RPM_BUILD_ROOT%{pcp_targetdir}"
+%endif
+%if %{without python}
+rm -rf "$RPM_BUILD_ROOT%{pcp_targetdir}"
+%endif
+
 %if "%{?dist}" == ".el7"
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
 %endif
@@ -255,6 +279,11 @@ systemctl start dtprobed || :
 %{python3_sitearch}/dtrace*.so
 %doc bindings/python/README.md
 %endif
+%if %{with pcp} && %{with python}
+%files -n pcp-pmda-dtrace
+%defattr(-,root,root,-)
+%{pcp_targetdir}
+%endif
 %files testsuite
 %defattr(-,root,root,-)
 %{_libdir}/dtrace/testsuite
-- 
2.43.5

