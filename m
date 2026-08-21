Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247744D8DB6
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328679; cv=none; b=lIdacPTC0GbV2Jb8+47GxRbCDWbELMfvPWkfCOBo94npbWdBjDhRzF+y4cCMrCy6sgcb0cfkPe9/rjQx+X1GaSHyElHRGnfVpf8wQR8eUmJVUPrWrOjykKf+j9DuuQSSITH+3IBJlNekUgpLyx/rmkMdv+k7pfLwcJXVYOcQSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328679; c=relaxed/simple;
	bh=4FnEAMBZkOB40eymQvyHMOifx6I+hkiOcTONr/nl7ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqshJn1R3MRdoJYScyHxbtTW0DvtfalZu2+KioIpQ+DmTlAEyXtclnJRH/rNYA2ONk+/3gteqx9OAtMVdJGd4+dZPLWH5KRK35po8bz1XvNvm7XGkSrPF2tyYeWahUgBeqvR9WYCM47u9N59h/O2DbD1FQ3X4cAUGOqFxYk0VYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d+JiUzwA; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d+JiUzwA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCtcbk2330729
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=5NOZu
	ijk7jAxussecBPkVI/mHQJc8xfjRDbjL72sj6Y=; b=d+JiUzwAcy8UWNkNW5rTW
	HXssG8Tx+YEGzcTnjMl633vyKNRGTVx/MSV2CE20Ja2rP55DUj/2UBWNjV5JosvX
	8k7dP3jbn42JBCZvdBrgyCQw9K2O+eFZZioSByklqYe5DyYrUO4AYV4E8MlvpmxC
	TwP5Dq1N9uij2d3hBpRDnlhZXNRkJ1ELzv6DcNjUdt6QgInwtP1ynQ8Z/RhQBuR/
	hQfvuGEaGgU1zWFck3zCg1O69cHoYGXNUR6jx49oilc4MPbJhJmzcsph8I4/oB0Z
	DcZhZ3NYj2oAmzEj87r/jhf5wRflThJ3o6VbozZFU4G9g634h3YVC4VXgAOBOCOs
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g4yd9nadc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67LG5D1I029335
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g2ejgcn3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:16 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67LGB2FO014592
	for <dtrace@lists.linux.dev>; Fri, 21 Aug 2026 16:11:16 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-51-128.vpn.oracle.com [10.154.51.128])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4g2ejgcmux-11;
	Fri, 21 Aug 2026 16:11:15 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v5 10/11] dtrace.spec: Add PCP PMDA packaging pcp-pmda-dtrace
Date: Fri, 21 Aug 2026 17:10:58 +0100
Message-ID: <20260821161100.41710-11-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX0xRXoVlpBAde
 UInhywyH/+NmQ98AdhmH0AeecJ8fdra0w/Dwg4IQ/GA2MSh5xYmSJehIKjvmKMLD/wyHGPJ84ot
 wmN+olgDF2q30e4evNOXB0SHdXIX82L+M0Ep+bpcEFyIKbEDNZ3vMT9HpfIoKJ0hq+/BbExDycS
 peoF3tLNgfeA39cqisCcXSpBrMGV+uQAyOeozNCxTlEYUB/N+bG2nOFh0iCuQGdSxBMovQR91tb
 F+yjqg7y/xitPziKRaljbYXLsSuLwbppKhB4/1HE+ITyo2cvCs6gJnauR8fAtBhwhcei0s7NL3G
 QAceIEkpjCgCUvoWQpU8Gbi/OD5G3Wo7b/akvJeRr439G9YPc7081MYR8mGnG3VCLpcJbPjELWm
 60lUIHB8jWQu7iUucLvnYW9QSkgLC8BDgyz00CLCsgdf+1FsD8Hh4hanECY+ZVJE3BnU0lSsPFn
 6B+ZVtBIGdQoqQrAKGg==
X-Authority-Analysis: v=2.4 cv=a7wAM0SF c=1 sm=1 tr=0 ts=6a8878a5 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=TEtWH8rrOYz-JMQxAZQA:9
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: L4J45rSkyXqdijkVeWNOoeUeog8de1Es
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX6e01dCkOg+yG
 hrsnq4c+l/Z9c/JIyfmwf+1fTbE4+6/Xg+h+bV5+CE3Z18oRddAWPF3DDJjdxEOZgkXVH0+bQbv
 zfwYQq3d/QxHWAANJRvJCeZhy1M9rLAbtv79EiZd1IcMwmgc2K6u
X-Proofpoint-ORIG-GUID: L4J45rSkyXqdijkVeWNOoeUeog8de1Es

Add a PCP build conditional and package the DTrace PMDA when PCP and
Python support are enabled.  Install it under an overridable PCP target
directory, defaulting to /var/lib/pcp/pmdas/dtrace and require
python3-pcp at runtime.

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
---
 dtrace.spec | 57 +++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index bc738c4f..0a17b00c 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -29,6 +29,8 @@
 # By default, do not build with 32-on-64 support.
 %define glibc32 %{nil}
 
+%global pcp_targetdir %{?pcp_targetdir}%{!?pcp_targetdir:/var/lib/pcp/pmdas/dtrace}
+
 # Enable it for non-ARM64 builds excpet for OL10.
 # ARM64 does not support 32-on-64 either.
 %ifnarch aarch64
@@ -41,6 +43,7 @@
 %global _lto_cflags %{nil}
 
 %bcond_without python
+%bcond_without pcp
 
 BuildRequires: rpm
 Name:         dtrace
@@ -146,6 +149,17 @@ Python extension module providing access to libdtrace.
 
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
+%endif
+
 Installed in /usr/lib64/dtrace/testsuite.
 
 'make check' here is just like 'make check' in the source tree, except that
@@ -158,9 +172,14 @@ it always tests the installed DTrace.
 %if %{with python}
 %global python_build_args WITH_PYTHON=y PYTHON=%{__python3}
 %else
-%global python_build_args %{nil}
+%global python_build_args WITH_PYTHON=n
 %endif
-make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{python_build_args}
+%if %{with pcp} && %{with python}
+%global pcp_build_args WITH_PCP=y
+%else
+%global pcp_build_args WITH_PCP=n
+%endif
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2} %{python_build_args} %{pcp_build_args}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
@@ -176,11 +195,20 @@ mkdir -p $RPM_BUILD_ROOT/usr/sbin
 %if %{with python}
 %global python_install_args install-python PYTHON=%{__python3}
 %else
-%global python_install_args %{nil}
+%global python_install_args WITH_PYTHON=n
+%endif
+%if %{with pcp} && %{with python}
+%global pcp_install_args WITH_PCP=y PMDA_OBJDIR="$RPM_BUILD_ROOT%{pcp_targetdir}"
+%else
+%global pcp_install_args WITH_PCP=n
 %endif
 make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
      HDRPREFIX="$RPM_BUILD_ROOT/usr/include" \
-     install install-test %{python_install_args}
+     %{pcp_install_args} install install-test %{python_install_args}
+
+%if %{without pcp} || %{without python}
+rm -rf "$RPM_BUILD_ROOT%{pcp_targetdir}"
+%endif
 
 %if "%{?dist}" == ".el7"
 sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
@@ -222,6 +250,13 @@ fi
 %preun
 %systemd_preun dtprobed.service
 
+%if %{with pcp} && %{with python}
+%preun -n pcp-pmda-dtrace
+if [ "$1" -eq 0 ] && [ -f "%{pcp_targetdir}/Remove" ]; then
+    (cd "%{pcp_targetdir}" && ./Remove >/dev/null 2>&1) || :
+fi
+%endif
+
 %postun
 /sbin/ldconfig
 %udev_rules_update
@@ -265,6 +300,20 @@ systemctl start dtprobed || :
 %{python3_sitearch}/dtrace*.so
 %doc bindings/python/README.md
 %endif
+%if %{with pcp} && %{with python}
+%files -n pcp-pmda-dtrace
+%defattr(-,root,root,-)
+%dir %{pcp_targetdir}
+%{pcp_targetdir}/Install
+%{pcp_targetdir}/Remove
+%{pcp_targetdir}/pmdadtrace.python
+%{pcp_targetdir}/README.md
+%config(noreplace) %{pcp_targetdir}/dtrace.conf
+%{_mandir}/man1/pmdadtrace.1.gz
+%dir %{pcp_targetdir}/autostart
+%dir %{pcp_targetdir}/examples
+%{pcp_targetdir}/examples/*
+%endif
 %files testsuite
 %defattr(-,root,root,-)
 %{_libdir}/dtrace/testsuite
-- 
2.43.5

