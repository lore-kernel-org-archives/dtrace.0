Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431452EDD78
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907862; cv=none; b=MzvxmPDS1VylhaKUJyTTMpApjqE+4nhxDMWaC9K3fBoTt/EDytnhB6GrHXLF5B8NnmSs/UIpb106/l1uFJ9dIMEdd8uFegTDtIfgupdxXc8BjWXqCtUfug4CnG3K+4eqENvUw73Ks+WDmiYIljP9Fkrf4LRpk+c+wEm7vZIi5Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907862; c=relaxed/simple;
	bh=po/3bKHHyC6/BGyp1XeEAXNyi/wQQZHfE4FSinDQnHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJiTRneFKLIuY2VrR2mMLrc95u35ApCN2gqbqREn0uiIXN4THsA29QgKXbzpfx1FDuxNI5Ndsg9uyjzkdcCHQVZua2QzU7LOgjtaUo6Iwq7Bpn/Fo1J11UY97Gwd3evzk6zDQjTDqyh8Hjye7hBchUS+BW9d32T5hdSlqXX4y1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NN47kCnc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NN47kCnc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64REhFlq3190506
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Y5nzs
	yiD3f6U5P/XlNUeT6S25aaWNS7lHG9EqoG4VBU=; b=NN47kCnc0ehTvnlKXgA4T
	QSdhl2JvTp+ZSJu/vXxGXEG2sNOqvpvuzL20W6t8OnOQ3SfdKH6eja+I7SJRlw2x
	ansPNe+wUVSFGAeLFiPIyrqZ910fe3dAFP1KbV53KldctF6xItmoYrtM8CBkMONZ
	99RnRPlcwiAfGTS6VIA+K4UQTiXwGbSZ6bB46/G0fy0M1FTSIYeNc3dA8GkWqfzT
	scVEJLaLfyFTufiiGB/3Y2NZqlowRb+KS9T5fK2Y1+S+s7I4/vkmnh+kHgLcz30W
	EwNQ9YovApWjY8tNm5qV0JhnVU3CvyfzfzHo0ZCRRu3Y8M6bKSPiX+2jBCxUZudM
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eb47xp2be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:51:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 64RIodP2031461
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4edjse4tag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:58 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64RIomgj033024
	for <dtrace@lists.linux.dev>; Wed, 27 May 2026 18:50:57 GMT
Received: from bpf.uk.oracle.com (dhcp-10-154-48-144.vpn.oracle.com [10.154.48.144])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4edjse4sc8-6;
	Wed, 27 May 2026 18:50:57 +0000 (GMT)
From: Alan Maguire <alan.maguire@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com, Alan Maguire <alan.maguire@oracle.com>
Subject: [PATCH v2 5/7] dtrace.spec: add python bindings packaging
Date: Wed, 27 May 2026 19:50:01 +0100
Message-ID: <20260527185004.2267741-6-alan.maguire@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=MMNQXsZl c=1 sm=1 tr=0 ts=6a173d14 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=xca6tUrTAD3QlTKMASUA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13706
X-Proofpoint-ORIG-GUID: hQfz8BlsHKY3weQFkq7b-DuXajYv-qVh
X-Proofpoint-GUID: hQfz8BlsHKY3weQFkq7b-DuXajYv-qVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE4OSBTYWx0ZWRfXzsLdFTBZdysL
 HyDz+jZZ5ovGZ3D0WqP3L/iAJU6RPAPJIbPIqaJNRAb73s8yfgo0brfwFFoqP7h1adP8qa4i9Bf
 JlbnV4XhBK758lE441qD7R+JEC0PRNohYzxs3cc18FS/wkC0jcSvFVzC67XS4iUCn+Wpm5x5Ch/
 KmgHrP8hrCkkCMEbcB7U1M5GTIBDirUGU4UHV3QsXIanodk84PsxIP6i1IYpgIJyujUcQRbCiE8
 XpvM2J3fzvA9cAPKhqspZ0s8bwTarZwJlqzbn8tqPaR8ez8yzhvNfM02rtKelcC+pRDaA4Ny+92
 FH7tKEjep3H7tnDkmRrHuSKFv+h00wXmfG9bqSmm5ZcNYddEbhbIGsBrgKdMsTejPbOal5Me0UP
 Qjf2sMLpxyMT7TvKL4Tn5vAzuJHDK/pubPZpItJW9fiNHvJSavOrybK3fT5X5vq2wgJV1ZzFAwL
 HxACWxoPOm3Awxkv4aXQdmrbSYjeZjM4oQTunTzE=

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

