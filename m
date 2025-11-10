Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123F2DECAA
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762809486; cv=fail; b=eFLa4tJJP0S5N+3Nmd4C4CgjCfOAbH9Nxmnh436iAjOSmo+vyytutQXeGpMJpyzg3L/VHb/1MMtXpe+upjLDZU9eZSut5xhoY9s2BNdsNbnNfQIjZIOkS871IYvhBRFIo4tdK2+ZEaHN5MiZlzzsNxFXRvcfOVVfmkFsVfz1nzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762809486; c=relaxed/simple;
	bh=/Wp+Y87/hDmGMsbaO3thxCY/q8Hv/rh04msRTdjKuXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Go1i/3bkUbI3MUAyAZmoTnJU0Afik+BppRXH4mDbMRlk/94LzgwzBFfw8qJ6FqC2Ah8UipXDV2R1/mshaFYFKnoHToN25Cra0kE61eC0QcZUUwjsbf/fqH7BHaJkJR/Huq81uqS/Ao+qE41wrFPYCoLA5+R/J6RGzGSnyIULcNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NrnybfBC; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yN8W3n7C reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NrnybfBC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yN8W3n7C"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAL8ee6009249
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=4Jm0HvV05Y6H3bjl4SooTTcYOTZTtOaSPCRpt5ClscA=; b=
	NrnybfBCDqoI3vrC2gzExo4r7+vIawdipLVYOJB7EhaqBL2wgBT8yOsdj0Tbis3H
	pmLdzeHobYq/GtH0bmNm6UDjGl+6MYGJj7UUjnwRI3apNla1JNVvJSBFeuFRx1XX
	2gVbRBNGH7TBQ1fUbwCysQxzn6YSi4PEjd9+IW00Zulknq1UXMyTyx2ONp3/C01D
	ZOPlpmvG0DbN7ZMNwyz6BAgdt8qmL8KYrpFWx5dAYVD32ek9SdVdAyF5rI3W3D/6
	jaGwryZ/pCXypSH4nqnukYC1jU1n+vTEFPutBbbmeyM4Y7qrWUBw9jNOE4R0e/AF
	8BgObQbQAhnu1F4vfDEZXQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abqpug0sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:18:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAKAsMw007388
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:18:02 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va976rk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 21:18:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4Pf4ml5Nc8NNJqEjhgutatx/kGZ/cvhDLDff51k+C12H7JwwofmmU+awAICSPA95FmGctK4nQ8TFB8yowSRffB//0lDRopeHr2PHP8WVcOD54jZ516JeUm0hfDKunaFfE0geBMyeXAgDY3pwE6QcxOkM44q4TirdE9tPzYdJhJfYT3rrH/YhAo8tpSARSszaBG6QR7tVK4Z5KbFrwQNFJSXlcKOgVwS7/9k9BYIHwYLC7UtMwjaqLG1P4i7gxHzENYk3sZeKJvL0qoSjUNhSMf/LWDopAw1g4r8tCL+nVl08nUXXjEsTo9YyMfQtO22wAqGEIBmtvVhP2uoApHbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+CiTaTntCm/QSk8IZY3JgwkEqpiryfksPnK18UYkwQ=;
 b=iDQgyoadEZ77F54nhfAUYRJoq21L6VR00txZI11wbRsiR8wO2Gn56ZE/s1ui59I/4WRTDcFuYdXE+fP72imqIVY8BGcaH5+K2VwbRxv0YN/KuSQ9JAoUFR9Is2pm/8Pfd5oOeRaXyuwJJGamJv0gH0ElHCzDKJMQ+x14LQokdIwEU6JSoXM1bA5g7cjlj7HP/PrXKyF49bgAGJuy2F8oMtWBr7E+OJxmpQT04IjgtOSMOSF1P7epQfX4R2niRJIgotwfgBWJzrCcXk4gO/AnWZhX7QGOu3VmZCJZ8XOfJA4+M+paohJFXhxAcXd2g0vlcL440pWM15CKWM+36nEXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+CiTaTntCm/QSk8IZY3JgwkEqpiryfksPnK18UYkwQ=;
 b=yN8W3n7Cspo/IOSAkQI+KvimLgZH6eQS12QBkTwNYkZJd28Q/kJKudQHk12JXwYJU4JiIr+i7MnwtRBDkPfhT3GkjUJp9b4TGhDsDSp1EDbuwsN8PW1WxSwyYdS7FKPLCcD8S+YZjhp69vKnWA9vTLUvX6YS+aPVPjTFUjEPRqE=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by IA3PR10MB8613.namprd10.prod.outlook.com (2603:10b6:208:577::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 21:17:59 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 21:17:58 +0000
Date: Mon, 10 Nov 2025 16:17:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/4] bpf: fix file descriptor leak
Message-ID: <aRJWg7pNBqBytP43@oracle.com>
References: <BY5PR10MB398729B40B695D3F3B541D3DC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <cee8efa1-0b4c-77bc-ebfa-dcb0684aa6e9@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cee8efa1-0b4c-77bc-ebfa-dcb0684aa6e9@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|IA3PR10MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 53de8dfa-644d-4e83-243d-08de209e9f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aiSxOBHFg2kRToS9UGJPRDKLwrz0lpK/LfZ1N/UPxoRdtLYyuSVRJYLqdE?=
 =?iso-8859-1?Q?ZqgB0FDzN1Ftrz6jqBbBS9gvrbiq6z8Wyo8KUFRIpopd5uRyDyJ4ecCjjA?=
 =?iso-8859-1?Q?KBoU95Ij5MDf7zJmDxyofNURm52wRiQpYf6wAYtFH5jcDeHYU/ytbxOM+G?=
 =?iso-8859-1?Q?J7eL/i2dnaPAmPnvgsNl2qKVbnbSBxBJV7aCmb0oYQlqPNwEXgC4dhiHw2?=
 =?iso-8859-1?Q?RIafgLRSG1UI0t5Q2UuxVSU2yuZMPkTdjKZet5/flsaSAwSISYBgAd53Nd?=
 =?iso-8859-1?Q?PFBzuaC6VsEdD+HV+anEVOrArSzlcEgxRKSKxqvF2r6omLJKVA776LBuu2?=
 =?iso-8859-1?Q?uNdmcZkgaO6vV2Iqj+BAPlejkFKf4oLtutBrBmDJclW09sa3QFCC3iOcEi?=
 =?iso-8859-1?Q?bKKyQ+4IBO79bszegXFPnWtZGC0x+3j8k2CVPqJFI7S5ZRGDVqorkD+aed?=
 =?iso-8859-1?Q?mbdn+YmUg0TyqZUhXqY67JqK1OWKEMz1bt/gTIaNUBhEM/4Ri9FlyoJGDn?=
 =?iso-8859-1?Q?AG+JgPlTEzusqKAjkSKdNGX/fh9DL2Kygbe4NMztXBv4fGIpujjf76XD+D?=
 =?iso-8859-1?Q?ms+/SaZqoXJMl5beKQc1Sm5vNc3H5rQ2up58i+68GowF/RvHOQNwPE2l+8?=
 =?iso-8859-1?Q?o+tbYbVJcAL4uVcIM3PAE2Z2lQOaUYni376wXWTeuBwLhKF4ylAaKsj7Rh?=
 =?iso-8859-1?Q?mB4RcgFM+jIVy3IwlKZuvXo6V9DDR8Ay9PpyeCv+QO4SR/SoWLx4pWDjws?=
 =?iso-8859-1?Q?keaivC3TJ86XBqABBG4VXx9gt2fbyc/YZmkaeL6puY356spk8E9cBudivL?=
 =?iso-8859-1?Q?Ze28mncTFkfjbDgH+drRTnWq41fUmMDVe2alrhSdxUx95Qq1HTZmSNgDr4?=
 =?iso-8859-1?Q?Lc3434jcMXAJJap8KY15UO6VtDn2zXOezAL14uwM8Lx0e5Osm147bKB6xN?=
 =?iso-8859-1?Q?8jjqWFpq5Gste7PBT/CoJ4d2Ecgsu8umYEdjTNxmdk4HWdCxWO7x7UUVH8?=
 =?iso-8859-1?Q?ZGOpa1WWiJskChCArucbPfJc7ocRYtKjAQjJokoHmHWGmu5qUGh0Ye9I1o?=
 =?iso-8859-1?Q?mVMBoJ291oH3eSRTJzVpLZXF5TQ/r0oPln+z3FPykWW6f7a1rsi2fPmLEx?=
 =?iso-8859-1?Q?LiX0FLoN73BXdgpWG3UFHXbgRRBzTBezuvUm7j9XsvGgOqdPYeCCOLCMiB?=
 =?iso-8859-1?Q?Vkt2kw33XXSrl/TFHslEGNctYYLBURi5mcwZ2l3MwKIAldHiGcC6WjyMBn?=
 =?iso-8859-1?Q?vgBzeLzCyyqWf3HEhdODjUVQnnzsPh/9wugOTVWS3h+axHBWDHMVp7meMu?=
 =?iso-8859-1?Q?2dKuMPBvvwabFxADZptHOUD7MUIZOzcsvcG2HWxE87ok3yenLjvCzXvojE?=
 =?iso-8859-1?Q?f2UP+xf2Bh0h8ZXwJvHZE8O7WLOBVUWpQRAqpQmfFkp4OR9wIhZUvccqVU?=
 =?iso-8859-1?Q?DzLkE10d4ooUB5qoBDa3YLPFpK0BNOWLG4e6fVnPjJ+z+iDKG4U/LH0fIs?=
 =?iso-8859-1?Q?lnEkD+yNbjEc6Z8GmPatIg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?H54G3k0KVFtqCoFHMQwbQCWE/K8A/YeS1vNUJRnQVelfA+J8k/Smo+lvtI?=
 =?iso-8859-1?Q?WIla3uq0gQPpSx6XuGiCT7Ui54WJv+sGhXsC5YLm509IltgzT6/h9u+TS/?=
 =?iso-8859-1?Q?OZ8qhIjjU9TKWDjrDMhTPsuvxDc1RxKWPOukctMTKMXY3SabvTKlIFDb5w?=
 =?iso-8859-1?Q?WmI+fHjcsPLL5VzFOTdSHvVmM9auHvqV2vzRV823NAtug+IUzOAMCBamDO?=
 =?iso-8859-1?Q?LNtjgf2WO4jhqYESLh8GoLYEOtZPRdAjycvE0Jl77wRMmbY8avHWgZkl7M?=
 =?iso-8859-1?Q?34CEkY/wv7/kwJX+AI2wDHC3yDMRbZrWl7CJZCTFunCOP5rpF6rOkJSbEo?=
 =?iso-8859-1?Q?GdIy+tL7yIDOi6bFEc8LOQFVH14PqRwzPEDLeaiCFXZkj0o02LmkBAxwXa?=
 =?iso-8859-1?Q?Q/0b3dVxyauM2ScTSUzUYpu1FJyYglUyyYDgmkxfHra3JSxXn9FoGIgup9?=
 =?iso-8859-1?Q?Xl4OD6sDj30UdP67ZvsBiOiB4bN45CWxRK9+S1nyuLGuWuzDOkNQOlNmmF?=
 =?iso-8859-1?Q?s0LZcAT2igxoP5DpNT9ELL+xJNQdnRgA15TyBWb+6/3B1FjST94MLs9ccd?=
 =?iso-8859-1?Q?HlUvrbW418TKHdnVE3nyKagJrbiH8XI5RA5TVI58LScamLu2wXEj/xh+OC?=
 =?iso-8859-1?Q?+AItbUeQ6NZAhHir8m280Vv9Pov4dYRND8vniw/KoOPpO8p2/xnqE+TkjH?=
 =?iso-8859-1?Q?mDgj3OJBbvwd/68ZX0Ccs2QBE7ryqthME+PuXjaxKi25qcO4ZLBU0oxxwI?=
 =?iso-8859-1?Q?c5J56r1jvmC/kuB84l98DHHN14bChrnaYszhnfgNyxq+0FRIUxYmPgJfjX?=
 =?iso-8859-1?Q?42uElW4ll0bOhXN7lJlFBcmiG+5P58IlItA7yv6kORRX10lrefVCxlVTtd?=
 =?iso-8859-1?Q?BfTFDPcSn6M0mI5LS3QDDRt/kwakl0dQrjKhZJgycA5FQOPhsc4/dwSRfo?=
 =?iso-8859-1?Q?xtl3hJbsZ7Ej+k9Iu2VN79P8rB+rkKpdaBPDirHXdV9bLk8QU40S2iYA1S?=
 =?iso-8859-1?Q?23+1FY5KnHJR9iuqCchqUUj+FKmXJhqREUbdg9fVcrfc+AlAEebdw1R9iC?=
 =?iso-8859-1?Q?kUBz573qOkEdziqXUrtxaA/iwA6sNzt6/EmeHjiyO02oAfMwASRS9sK1PY?=
 =?iso-8859-1?Q?Rb18s8NfPQPvgGy746lRQMUbYba0hy/8LdR+C4XJz6hqLQRoNv9ldQClw1?=
 =?iso-8859-1?Q?nwWtzvM+tiTGfLW9VrDkEpMuneb7Nz05NQkU+LNyQQS3OKmBUPuUK3EF6X?=
 =?iso-8859-1?Q?vGMEE8FyL0F3WLadDmxKD1tgyq5NS3rjU51fFcaAsVWxd0o7Kpj7dksAMi?=
 =?iso-8859-1?Q?ddrZYS7Kwb1qnSUOHVl8znqQeyP8dvs+vLqOEDSjftNxzLXtrM8XuGgShz?=
 =?iso-8859-1?Q?J1RYOIsQSo3TVPHt9KAOJ79Su+eOdSGXo7eDbocCFkk6w9aF/lFxbwbDgb?=
 =?iso-8859-1?Q?Gw/O4PNAafJw3eqrrIZs8RdWIBE4kgF8J3tlegh/geYPwA1inSk2Vdh9QG?=
 =?iso-8859-1?Q?HAqYNRh12+CWxk8aXgC24dRc7i1MOW3Ceia5SZBa8HTTiU1nAEIqEZb8bf?=
 =?iso-8859-1?Q?guWyC5EB2LRAxFs4hhvcZ5odHdLUZXVd8EXcb4TO+76bRxZtmxwmq9uVhG?=
 =?iso-8859-1?Q?sdlaFa97NbPvGP/GMgoEc9ZeFgrfI0TwYzjWYgnDLp2uz1hByHpo2KTA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jxKO9DGKLjKJn0T8pGWztcOcsK5hlLQWiHEkbeIooXbhP5hdIjtUxWkKkBELwZb55JVdqaLAo+spKYtC5xsUuH7FFbjXrJ6VFlD2Caj0Bs5Y/OvpBzlaq6mKEKsqIE8JuGZIzVcTDJuFHh6JDsX1luzfL6yaZ71Jt2oqKakmoQre5V8kQpqqu6q/HkAzX1+Gt2B3Fzokx0lfgBsJGnaS3WASFpmMeU7JPbdR1WKtUiMQ1euVerHo+4gMMl2JvpInpF+8j5LHf7DGdpT6a7yxst0TYwoCYZy6RphiGjT0Nv7rb04sb+6NvbX1OCkehh4tUWH9DGMGi3WA1SNIA3lfnU6zHmF0n3gsFuk5s3GRBpwkmRSn7OlsfswzSDkihyTtzJWz3npa0dBmDstW904llwjDcJHThk6O4M3wJmMgjkD2eSNv0+UzSvxwoSIQ45dVpBYnQrDvn9U1XWusqswhgBMY4Tdh7KFY/6eBdSSsScE5TnrJo/EWyiEW1wP9r1zBke4KXPEdLknPCW2vFq0QMJdeqeZ2JxVwTwxvmpOemJwvH0/Z9DOJ++F3MQ9GSv8KTS84LTpwPZSFLK3AoeQBGc3d4vik66/qL0PIZR9nBxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53de8dfa-644d-4e83-243d-08de209e9f89
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 21:17:58.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifzwBgJy0twnEkO3mXAWvfm6Kao8+2OyhgbNIECl1ObWZxCPJojsjzdYEXXx3p2c6PW7euhZgzNZinmA0inNEEkq5AaWt0Lfr6Pa/S98hpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE3OSBTYWx0ZWRfX76uG87YFPU+d
 C+0dDaWR+KMj9V0tdrkw/xho+QcekWbqg+TifNH9peXa3ISWKKXfMqj3pTFuhAvK7Cne6heaI5c
 CpWz+NsLwuLvx9MGydU4d1Km4MwRfLhejgMvLdjDnoU05tzIU4yuJfpixE39OxU1xB0zIBPVQxd
 8ReayaESmezN8WVx+lwsILlBVjhM85XFC558Cjskbl0FBIwW6rUP7Ki+SHutdbCBhiDgRGXFZH9
 ddUfF5rQNGDppksIgDOd4WHs4qfGCtO2GejCacDMEeb+IU3GjPeZwwunKrbNHsmEVSgdLalktHU
 WuNKA1pYar2E6wbV167p4Qlvafp2PhaeJYDLJPOt69bzdh54ZMbX1c6R7YlwwQRkWY+cD20NJpt
 I5NrJrY37OHfTLgZbDkxAa8gDsr/cw==
X-Authority-Analysis: v=2.4 cv=H5rWAuYi c=1 sm=1 tr=0 ts=6912568b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Q8mZsHSEzyXIfzPlZ0cA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: Gydpr55Z6tl5-BoToOuMKNhod6BTBSaB
X-Proofpoint-GUID: Gydpr55Z6tl5-BoToOuMKNhod6BTBSaB

On Mon, Nov 10, 2025 at 02:55:52PM -0500, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> But I'm curious about the "if (attach)" check.  It looks a little funny that
> we first set fd= and then we check "if (attach)" to see if we are going to
> use the fd value we just set.  I suppose it does not matter since we expect
> attach to be there, but normally one would first check if a value is needed
> before going to the trouble of determining the value.  In a way, this small,
> pre-existing issue is outside the scope of this patch, except that the patch
> makes more obvious the one, isolated place where this temporary value is
> used.
> 
> Up to you whether to clean that up.

There is a real reason for that.  As you can see, fentry-based FBT probes
have their own BPF program load function (the reason a hook was added for
that in providers).  That one performs the attach as part of the program
load, so it does not have an attach hook.

> On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> > When a BPF program has been attached to a perf event, it is safe to
> > close its file descriptor.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_bpf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 0223764a..28eb890e 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -1385,8 +1385,8 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >   		if (prp->prov->impl->attach)
> >   			rc = prp->prov->impl->attach(dtp, prp, fd);
> > +		close(fd);
> >   		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
> > -			close(fd);
> >   			dt_attach_error(dtp, rc,
> >   					prp->desc->prv, prp->desc->mod,
> >   					prp->desc->fun, prp->desc->prb);
