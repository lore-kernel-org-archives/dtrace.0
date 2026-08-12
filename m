Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E740F44A3F2
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540943; cv=none; b=HwIqsFQt9JUPcZGKGVWk7ZuoLZlcJl9beTPPmfukXVhNGoz2dWF5vVaF1UiNl1zD/bGULM/dun4d8zLvESMrIwi4NV1pJTIYWLJ9lONwk3Vda7mywhXKatT3L+13XWyNfzFxgETifAuqXjYmRFbP4CrCp5dq+FYLEU+WKypbrq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540943; c=relaxed/simple;
	bh=734cuEZokbKf7YEE5sJ9gcFZ1Yh/jcnRs5+ks9pFFnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2Tfb9zOEnbuCCXaddP04SM8cCo8jXXAxaFI6O+FEj3Ofc/mWtXN+DhVAn0bSZLIcXHYrzrDfe65Y+hLvnKbVl7kRQN4o7KE/phTRFdhcjBNSiOuSYuReaZRRTSLdCI7T0xKoLgfd225jrd35RHWjLi2Q1LyQUyitm1KXHn43Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A+/YuQ0H; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A+/YuQ0H"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLeTwq3270958
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=qakc1
	Dy8qz1lMbRXm1Ynp6i7AwbwbJEQjmyFjDmf/KA=; b=A+/YuQ0HMGBB/FDs6/STb
	8+ptsQYlv+KjneiOYPOhCS9T2Hq4fMSJJzAyapi5WOt8Xhh0YAF3Ztfs8YY9mTPb
	/jKkfXEgp9Y61mAFVq4jQV0Wq7PU8oUJ7NPa6YRyXyi8rKPeWgcHWLQe1jfTgkZb
	Du/oPg4l5lvGYBz1crgZkW8zT8ILMtAPOQzcmy1anWwrAWOpbEehCdJKihIHLaTk
	hDhTwRf+z7y9DOjHAmXLBHhKH35LedCqiwsBoKxHEGNnLrKkKUUWGbV3Dbp/GOLJ
	JoZ2wGOOw0vKQ4nPzs+wGQOO8XQjKqPOOiPh1AxJ49+w4oJ0OIKxxYcBDZBW9lZX
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fww0sxp7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67CDKdSU002209
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4fwtwsse5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:19 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67CDMEBr010792
	for <dtrace@lists.linux.dev>; Wed, 12 Aug 2026 13:22:19 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-57-125.vpn.oracle.com [10.154.57.125])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4fwtwsse20-6;
	Wed, 12 Aug 2026 13:22:19 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v4 5/9] dtrace.spec: add python bindings packaging
Date: Wed, 12 Aug 2026 14:22:06 +0100
Message-ID: <20260812132212.527871-6-alan.maguire@oracle.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX/fLteETNPS3A
 oNp816S8dHWhgGK8XKb0VdsGmFcNsoO6TcNtiQXV/L1YeZ39ah/6xKiJxYM0o/Ji2yazxR4dJKM
 Ic1Ubuij6Bp48q6zFluiwFk5BkdkzCQRKdvOtx3GpWJ8bjL4a6Yk
X-Proofpoint-ORIG-GUID: idTppzyJX-8Ahcx-EL46ZZg6DiDjcJGL
X-Proofpoint-GUID: idTppzyJX-8Ahcx-EL46ZZg6DiDjcJGL
X-Authority-Analysis: v=2.4 cv=FcAHAp+6 c=1 sm=1 tr=0 ts=6a7c738d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=xca6tUrTAD3QlTKMASUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13509
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwOSBTYWx0ZWRfX8d18q0whT4eK
 EK3JrD1j9TmhaHHXq8G6y47l9DbwU7i9UgLXrUdW37yvpK4T5GE3dRWBXKV752eRAIwCRuFXZZb
 nsNn19QvF63zF8HEvpl2Ja6JhzTYI87IX9SjxwVbr8GqE0WeFEFIuV8y65hIiosVm26ErylAwYq
 lMB7gwJBWAPcWdQD+KzmfqJyqVCMqnByieVebqMCnI0bZNqKlJ3U87uJset4G9WcZpQ3uPfY6zj
 nZqMOXk6BuE5AFzWhjuZ7emNURyH6tZYqU5b71exKlK7Vxum3HfateFEu7+VzTIk8LT19GzQHpd
 X3N8C5/jEnBUaWfxp3N858Yz1d/dRn3j3E66I4y4QPYtzK86UFF4j0JES9Kw+UEcK0RWz5hNMaf
 PUug/jBwtvptYmDtXUbiHv8xnD5YMrToEhyZPRdz7CGLcMQGz7SxuhhL2sNEj/yf1gqyi3LeJW/
 afuGbEcXJ9pnMC4Adp0u7cjI/3aCXVh9rw2aQZcM=

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

