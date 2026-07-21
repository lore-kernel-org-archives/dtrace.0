Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE14C955A
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647502; cv=none; b=swT/ijIBgb38SsfXzmefbMcJFAnkUah2+0r0jHmRUrxdYZN5Hoc78Tce6/hUikcxixsEb4EqGzlSmdEKYzZ3zExY5YhRY85dSRXqDTeC6UXYNsmB3Vt7Zj3JQegy4+aWicsUmltWFA+f3xWGcKjQ/TchO7vgYVUrHBJFx4u+074=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647502; c=relaxed/simple;
	bh=734cuEZokbKf7YEE5sJ9gcFZ1Yh/jcnRs5+ks9pFFnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzjRj1QfoYJbtob3flIedu4KnTo7RDhGbrlIAOMWfXDC7bkHz2U3bwpU+9i/joV4p5ZhlfcD4akLT2Nv4M8bexbIQMaRQUxcnSBuA6hw8ApVoezIDB619u5792cvzkTs25gIPdivs54Dsq6vv6LTbH7JX5qjk9WkboH7GfYcc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I53hj+ob; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I53hj+ob"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEb7nS362969
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=qakc1
	Dy8qz1lMbRXm1Ynp6i7AwbwbJEQjmyFjDmf/KA=; b=I53hj+obbgsivPJbrARt1
	uHtItDH4uS8Wxvq9FlSymdcMV7dbuTwXT8bnPaHcxdDyLpjAsFZamP3z7q08f62k
	hx6NNXMXUKC2Tr0WvbJ2dmwcN0PgxDZRwGSJ4P+k4Z4D2+MCQp3JkYIyhbYxjmea
	1G8g27n4YnYyuhebhDbcdUN8L8xnsn6wPRSOCu6K/YunmdcYJNiQpTcoXAZEZg+M
	pWbRvaIFxGuvqOLy3bNuRBEUQsWeh/QapF5KQwzQ+yrJbxNGp/TXcUHh+KFsP9yl
	okoqhWfCgnCEpVHcHHp/fPmpC8sNUIinVXsQerGwdSQpEsnyKfkA2p1zBHbumTQ+
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1n3kncc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66LFIiN3036189
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxpw2df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:58 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LFOrpR020536
	for <dtrace@lists.linux.dev>; Tue, 21 Jul 2026 15:24:58 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-223.vpn.oracle.com [10.154.48.223])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4ffyxpw29w-6;
	Tue, 21 Jul 2026 15:24:58 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v3 5/7] dtrace.spec: add python bindings packaging
Date: Tue, 21 Jul 2026 16:24:49 +0100
Message-ID: <20260721152452.184842-6-alan.maguire@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721152452.184842-1-alan.maguire@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2606160000
 definitions=main-2607210162
X-Proofpoint-GUID: Bpo-a-oXliTNVMqM3Z0Q2G9f7Tjy2MI5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfXyxwrTHDjbjBV
 MPipbEx/qBzP49ECkEPQ5zKXwnIfOasqIbouvC7ixLPYQMdIlB/PTw2DlnVb9kRj11LVAXujzn3
 XKxbD5q3v8/5sxPRxTxizr/m0LvNHuJ7qI3xT4TlHyUDSISZiNgL
X-Proofpoint-ORIG-GUID: Bpo-a-oXliTNVMqM3Z0Q2G9f7Tjy2MI5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX8c+H2x19PAUT
 Nfx8/FYWSmm7sJAfYcr1+05pM+8xbMWFfpy73i5f3G2jLMg4ObTL6tBPrk1SxQsio+DeeKlNlrB
 IPHGDKUPxZi+d84chNyPdP/qCTQLItygvUzUNIeyVBPguNF9GYlaC6CDaBVaoiOugF8VpaDt/1O
 jCu5Szl3KpY1heHgYockg13uN+n2F26UBBWD5k31BBCioFPne/YjUdBr0P2p+hWbPXOvXPxE0v/
 eF7IHuu6HWbHVnCDgJP9kUW8oHWK7QWVFfV08ADcwHwUi8BfT3sVvbGsoEs2z9APjMgu9f7EKIY
 9kJhyf+MmOEpq2EIr+TuSPKtiDhiPuypZSrZQboZZ+puznXg6IxJIrcOv0fPQox0kud+SmK6oYP
 B9DjAU/wPqtxECFhUa1Sik1ER9ib1jFlfh7vGCE9Z2Bg2RotqgcU+elMs1WQW3pwIqxDAWK0Zjt
 s2w3N+468Xu8awu6gWVysksF7tlNI20Z2juEynxU=
X-Authority-Analysis: v=2.4 cv=PryjqQM3 c=1 sm=1 tr=0 ts=6a5f8f4b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=xca6tUrTAD3QlTKMASUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12218

Version is derived from libdtrace version.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dtrace.spec | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index d72baf9d..a16cb62a 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -40,12 +40,18 @@
 # Build DTrace without LTO.
 %global _lto_cflags %{nil}
 
+%bcond_without python
+
 BuildRequires: rpm
 Name:         dtrace
 License:      Universal Permissive License (UPL), Version 1.0
 Group:        Development/Tools
 Requires:     cpp elfutils-libelf zlib libpcap libpfm
 BuildRequires: glibc-headers bison flex zlib-devel elfutils-libelf-devel
+
+%if %{with python}
+BuildRequires: python3-devel python3-setuptools
+%endif
 BuildRequires: systemd systemd-devel glibc-static %{glibc32} wireshark
 BuildRequires: libpcap-devel valgrind-devel libpfm-devel libbpf-devel
 %if "%{?dist}" == ".el7"
@@ -128,6 +134,18 @@ Group:	      Development/System
 %description testsuite
 The DTrace testsuite.
 
+%if %{with python}
+%package -n python3-dtrace
+Summary:      Python bindings for libdtrace
+Requires:     python3
+Requires:     %{name}%{?_isa} = %{version}-%{release}
+Group:        Development/Libraries
+
+%description -n python3-dtrace
+Python extension module providing access to libdtrace.
+
+%endif
+
 Installed in /usr/lib64/dtrace/testsuite.
 
 'make check' here is just like 'make check' in the source tree, except that
@@ -137,7 +155,7 @@ it always tests the installed DTrace.
 %setup -q
 
 %build
-make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{?with_python:WITH_PYTHON=y PYTHON=%{__python3}}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
@@ -152,7 +170,7 @@ make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
 mkdir -p $RPM_BUILD_ROOT/usr/sbin
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
-     install install-test
+     install install-test %{?with_python:install-python}      PYTHON=%{__python3}
 
 %if "%{?dist}" == ".el7"
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
@@ -230,6 +248,13 @@ systemctl start dtprobed || :
 %{_includedir}/sys/dtrace.h
 %{_includedir}/sys/dtrace_types.h
 
+
+%if %{with python}
+%files -n python3-dtrace
+%defattr(-,root,root,-)
+%{python3_sitearch}/dtrace*.so
+%doc bindings/python/README.md
+%endif
 %files testsuite
 %defattr(-,root,root,-)
 %{_libdir}/dtrace/testsuite
-- 
2.43.5

