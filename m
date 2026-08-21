Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB12494802
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328675; cv=none; b=C7oyA5O4fKc3i9XzyplE1+usCMlb9I7/OvbaIeBBa6BlNSOLcsd59n6dBFrKHh1t9qibETEi6kdGGzkrzz45gZM4aji14MXfcZb0SxwQBLxsdwR/5iJx1VPYdcKV8qx8yLx+8HePVyT/t1G7ABJVfftqN3OOIZvQYQdrE7E0n8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328675; c=relaxed/simple;
	bh=ykBllaE2ZuS0SD7iI0zjfAmyNDJQK9fOt8ZJjTTZ8z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUecnNmckhSr8x6QVP5CQmjKBvWeI63BtGG8jI6SuzpwAI9dSD6Ij4Q0WAPMZxevJLXpLyceGxzcunL4SitwDlo7068YDr6vvlfg+Xl3S0ugSQBBxhDscIPdDgYfmWf9WPEoXInMiK+NS+UZ84NE+3LpjciPfAeUYXhCFM2Pep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c7k+aCPJ; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c7k+aCPJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCpPO13706410
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=oxLPe
	tJQXa+wUXwOnwZACz0+uiFqFmhOoBbIhFKoq1E=; b=c7k+aCPJEbLbu7cVJLjJD
	YH0OeUaFzHIljUiqgHBndIX8uy9OXoHsNNoHbzZKOsakgFV3ryWnf0bG1iY7w5iQ
	Lqje/eoGWudiNdWj4se5cJ3yjuLuLNptcq8N6BJMvTHAnujIUoLzsOiDc9OurZ/i
	lDQ0MCFue7S8iJKh43P0FSNBUN11nHj10H3YU0CjRWGmVtYYe2pHKlzajiVzlFGv
	tKU4/upYgpxrFFcAr1jMVgC8/GBWVbzYtSs0xZNgtVqKxXqV5uFLXKTj8b9PBo/U
	P+oEKkr0vedX5Y2GE04blS2ElaiMK+EPEyvTGp+YmkpxYHyThpv8LpC8sN9r+Rc0
	A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9derf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5CpA029278
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:11 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FC014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:10 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-7;
	Fri, 21 Aug 2026 16:11:10 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 06/11] dtrace.spec: add python bindings packaging
Date: Fri, 21 Aug 2026 17:10:54 +0100
Message-ID: <20260821161100.41710-7-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8LtbJi5r1UFs
 rcCit+vOUZmFTEzfbGES5zXxB2nwjnkzRLo3H2FKfVz2g/eILeQcnGD2zneJsADEX0hC6LdzWT7
 CdjFFrwC18LMVlU1GmsKTIGuvv4wgwiN7uYlBmBxkoQg+8SveVBf
X-Proofpoint-GUID: 6nEgKNzjYHthCApOGoOMQCsl81zBYKYv
X-Proofpoint-ORIG-GUID: 6nEgKNzjYHthCApOGoOMQCsl81zBYKYv
X-Authority-Analysis: v=2.4 cv=fbCdDUQF c=1 sm=1 tr=0 ts=6a8878a0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=xca6tUrTAD3QlTKMASUA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4aOoce04bWCi
 qSiXg7Kc5gVzTXRiX8A+kxTIGQLI71oaHSMaeigvYzwJH2jOt0waGQqs6kb6CWdW46WoGeuH/V5
 vwIVPwKewJTlTkB/aoJLB8ahqYOh3AA2YjpHjW/mn30+jz2jyXT1nk2WV6JEU3SgEzUchbpdI0Y
 yz2h76LnTMeZvhDcVLbzQ2mksXPY0vAtHGlIW/ayEcXIVegVwdaJ2l6zr/DmLCC9f6ceJTzVo/b
 YKtS/ze+Cx3d4TCJfUD5iu9vSoRrrE00J0mn0jfJXxnaXHCAj3R4a3tbkyUcEHl8uHBPOabxHOl
 fVwuNIxb20cBQnuC2S4jQVSpo0uzEWL09s6JxU7l3ZEO5rZ3bnHuMA7ZV5x99ykkohvTrAJBxOx
 UoxHkd3oWS+cMXK/9etqOT2gsi6uFwVksHm8CW/5ym6TN9zuuH9YA4QLonMaBXYk/JGbnd2Dt/A
 Ogchdz8b1ArfTW9PA4Q==

Version is derived from libdtrace version.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dtrace.spec | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index d72baf9d..bc738c4f 100644
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
@@ -137,7 +155,12 @@ it always tests the installed DTrace.
 %setup -q
 
 %build
-make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
+%if %{with python}
+%global python_build_args WITH_PYTHON=y PYTHON=%{__python3}
+%else
+%global python_build_args %{nil}
+%endif
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{python_build_args}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
@@ -150,9 +173,14 @@ make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
 %install
 
 mkdir -p $RPM_BUILD_ROOT/usr/sbin
+%if %{with python}
+%global python_install_args install-python PYTHON=%{__python3}
+%else
+%global python_install_args %{nil}
+%endif
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
-     install install-test
+     install install-test %{python_install_args}
 
 %if "%{?dist}" == ".el7"
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
@@ -230,6 +258,13 @@ systemctl start dtprobed || :
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

