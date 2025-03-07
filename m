Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087451AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383318; cv=fail; b=VZeTHhBJiZD6T4VMVjCs+lAl1CQGvxgpfj8F9wg870zhyv2hGGEzTW5wkvk99DC/1Gzxk1JRxWaWel1WRXyWXUajraIOY4VMUCAwg2oUvKmBVxM6uOAHuLZS8v/42HMrgdab5bPyU1LK5abWvjvN0mFTwefcJEVcs3ITQrc9blI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383318; c=relaxed/simple;
	bh=+mfmvvUnxc1z7TKBo+M0YBQ6bb35vUruILZKR+ic6RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nAvt4Xn3ALib+cGTV4v0RTI89EsasSR4Joc0QMuN7DOiF+qOh3obfwztab14WixiM30PNpLLzeRDHe/NyFFIUfjINzU6T+s6NMqOqn2fFEXtVyO2c2a4y64yk/hIkvCyHXsQ5v182jl0WPM0bceNTofy7gUg4BaScNsDk8kR6ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R/QsTHmm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PSCNVVs8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R/QsTHmm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PSCNVVs8"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIKCH005638
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wOgYEfhnAWC8LpqFPCCPoZ2R8MrURI2+OBzoPyszpuQ=; b=
	R/QsTHmmV7j7kFa+HZAO2VaR77H9goxNUMKr+WogtVEejqz4/yYcE5KPrcIdLy7y
	Ja3UV1Jj5Qy7a/cyZxA0yIUOsQim3Q+pbTmcBw7L39TyjzcLILh3ILJdSfs358Vh
	wnqp0Lc8H2glbEXllMSiY6QuL8fGEJyDP3qqZUNaUqy4nuclZJbXsOnY0Ol3nAGQ
	qi5e46r9RIqbqeFvfpQn8ADIjtSRfEJxyQWYCFes/8M+7xdjHUdBZCl4OVhUDMqT
	iX3wl7PU/wpBkQsepkhm+RNRQHUmi1e+SS+VXwFxmIbkW+TmELipx06pWCd8FAxN
	aa0shIJe4J/qxmYYlywMAA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u9qn9c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527Kg5OQ015691
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpf4h0v-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sc1RSBkXZd1WcMcnErCwbyD/XzoBTJ3hlXkU1M6IdDNzsuYA9P7D7skms+uktie5toYsaHDKbXGC2htysnVxXrhXpKdBPRBaxpwznk+s/oeQgBd0fy58DYoiMvuC3I11U/Zlkqx7WjlKKVWRali0+6F+VErE7FdJPmPMXl7vhjzXC4iuZMPtpj7j/XLLbOTW0AJ3VmQ7EmpHVkNt9933UA7GN72zMx8TD7iGUXVL2PmQE4kmQtXakvUABq7WjBXW7xOr+4ZRFGhNASFmNc0ye4SbEU72aIcJzwFIZtcHVbSIHi49DTCsZrbrt2Xm+JTRMJV8m5y+w0uz5E0eh3OCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOgYEfhnAWC8LpqFPCCPoZ2R8MrURI2+OBzoPyszpuQ=;
 b=suqnB9562xVW2I3nj4bKgVD1rY4kCf1hDcj/oO0+qld1capJthsoQQULXzJnWFJBVKDt0DDCypk44xJXdXlXQuPSky9PpDZfzM/Gao3Hsv2QE8qiHFa5MBkFTG2GLzYub9t8Zi7hxdQdFEzu+xJclv5l8GEcZLitwSaru5gMd+3w/UF38duu9UwDPbIr2sy78nQyIULpmkf5EFFncxJx3Vo4Q9SJoR8R4wzoCWLNqdOSMGn+9DB4y3GhCkt9i8bDKYD/rUVctUPoMlQ++rNZ8ATgj4oqGpahyVE/AstqNvRkpxfINYsXjUP+PYvP61xqZUviXjKlM4dNbIp2cFxzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOgYEfhnAWC8LpqFPCCPoZ2R8MrURI2+OBzoPyszpuQ=;
 b=PSCNVVs8tgmYRyTXA+t3KH40uUOjb/gZYgqM7DehMMHVs+7fhdsRiXDWZ2BxGu2cPjglZf95Aza/oQMOn/5MsIoQqRuu+n2ATEpa11z4xPv5rIJbVPe96LMtMfyKDrJDkcYPlVEkIpC+/cXfY8yil4r5di7ay7trcsgpbmGifdw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:35:09 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:35:09 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 7/8] rawfbt: performance improvements
Date: Fri,  7 Mar 2025 16:34:40 -0500
Message-ID: <20250307213441.9495-6-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0223.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: baac9cd1-fa70-4b2f-af2d-08dd5dbfef92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fZ94w86dq1ja2WKkDPxyHGq/ipUubjDKPG185lxMyOL60OujDDy7Woh4qXy8?=
 =?us-ascii?Q?IS4vfwoQYoptvrxTK0hlRzrM/gpCH3l91dUX9IikP7olMVpMHw7bRL3bSpH6?=
 =?us-ascii?Q?Vizk01oMo1fsYs3VDnSSHvvTrSX830h7lpd9p0A215h+gOiRGbegyZI3rNH8?=
 =?us-ascii?Q?dPzYPpgiwQw6WoWKW78s3SuMQAOJNcPfk++6Y4CDDZERkGvFnXZyPmFokPcl?=
 =?us-ascii?Q?3zJbz+yREfpZTDiqGgU9UJxJq4BCn7ObnhHOovvOQ656iVoV6QO01xIQANFy?=
 =?us-ascii?Q?EGOAxZwAmNlsmMiPWacdcroTK80z7GwZJEymdQ3fgmWzsbU1q0VvVYGoz2rd?=
 =?us-ascii?Q?D0VkvK/yK6M59Xehk/vAseqk18a/pSBscQW1wisWwjrab5hrOZWkfPpLMYp1?=
 =?us-ascii?Q?b1e0wylV0DSSu3PAo9R8lNAp1guM+m0nMYseAmAlN44nZkDIdXWjghZv9oP+?=
 =?us-ascii?Q?C4BvNMiTrSCQlLCjmL5o6fg+5/1P4d2RJ2LEMoPOeH9c7Kd0q4xDQ7zXnrIY?=
 =?us-ascii?Q?e24RmCXwZTQXIA5p2omuY1Qd5BG7arsMrCTsFzd9kRA+YuSD7cLw8l6+4sxR?=
 =?us-ascii?Q?tN852bD2md7msZha3OiJlYzKevkdKoEnd9e6RkpaTqec/1kZSPU3GRdfR5oK?=
 =?us-ascii?Q?uBjTkXHd3Z6CaN9ljL5Qk+pvvRwV8CxhmOplCm4BiyNUFytSU2/Hgm7NdnCX?=
 =?us-ascii?Q?QUsIX/SBTIp2jgsYl4/jlX1D5B22IX9VnWmB5WoWGq/Dzicd0dGx3CcBpGq/?=
 =?us-ascii?Q?qIofUOBhRCAgsjx5AlgkjFak21RXhTdMZjk1UCu7aHr+u448Alg/+IE47scE?=
 =?us-ascii?Q?ZiSxaMtn6RviR1CwwbPb+CZs5gUaGjnKqQEQybl/26GrBtO2yZynG4E8QQ0K?=
 =?us-ascii?Q?5I7vNIf2E/zyWbUKU14Gl4XMxSlXsZKlRP2rwZGt4T8CNp+7H0cOu4LR1x+V?=
 =?us-ascii?Q?rfsj4BuOZY/vcDeVPjYKuYWadCybeIKsMZCXhziZ6MFK/aSAU0FzpYyZvgod?=
 =?us-ascii?Q?qQGD4vqFK8AJzctIhZqeDl+yR/lZUvpZzJynQuV/9X6oXzAWbgAXWlEa6g9p?=
 =?us-ascii?Q?+q+Oz9G3Ve4V67p96qNDj8ApSud35/J9wnYsO0WhRS8vq51jrRbeYAdvQe6/?=
 =?us-ascii?Q?6sUheIuy2ab6w593/VnpfBh/DRMHfOTx/fuWGouAUZrgQQ3VGEsqSCcREv8y?=
 =?us-ascii?Q?OrYgd+3uoXfTtf86X8qBxViZ4/J0+IcUOxV6lpxmkube/nOjXiuqaHwnXjmP?=
 =?us-ascii?Q?dyY+NV0cHoGAaWavUrPKxeURRjyzeXbM9eBckjAY+z/yq7zA6udEBODUWhoO?=
 =?us-ascii?Q?iKiHneuH05EAZ3mro/EKD55RQ7lb0sjtHIXkqc2Sv+3Fy+Y/+7PHUtd1JUDQ?=
 =?us-ascii?Q?wpnIVnip/SGKrnHhObuINrWHAAyV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cSSw6TozIk9PjTViViY3UdTsCidOB1jodq6dWU+eczkHffFShmFPmvZYjPIh?=
 =?us-ascii?Q?24Pmn4IGAYV006n/SuW2C0Yqevgp1rNIo0Dh1xsKAVhPSNmdlqWKfczqczgN?=
 =?us-ascii?Q?6MA6phVD+DjPR7ZCS3UkSLXyVfhv1itaWWADae30u4wxBnTF8mKDQdDpc0Z9?=
 =?us-ascii?Q?pE6WzebLEvjfwmiJ1YsWTimU1vd/adloYomDRcYMmDVGS5HXBoL7yAUVQmxp?=
 =?us-ascii?Q?Tb+bJTSltKPEXvlth7flwyR804+rnaaPmxEDnzkiP1vAzlo7YTglOLNheIpB?=
 =?us-ascii?Q?Ky2zJr7BBDALi8FfXoulJnHdzeyBsXRbF+2fpBUW7dtPWZ4MhoFmPstMuXNr?=
 =?us-ascii?Q?dPqS3NYGSf9EbnNr75M2xgALbRE6qwHUs68mwRgu08iaI4H/nhP8TOXbxpEa?=
 =?us-ascii?Q?TZcrmGpqoUrTqo+/cm6VUbWR+Ji9+FkdvX6+wWicUtX8ZdjFbY2zCD1jQbEO?=
 =?us-ascii?Q?rIhUmCbcfLiWEiIkn0ZQSR5MAeWOYbjPLQ6KHo6ftwRv3RkuAv8XSzGR/Mps?=
 =?us-ascii?Q?CCASL5pCaadaFyxDTbOj6jlqGOGqUOzs6kGCJVqSMsvrj5tXYzT98g096cWH?=
 =?us-ascii?Q?mMz7YZjX2AmiWEhfrL29NuzJmMXERm/jF9Alhho5AadKC6eAxLc6B2+3nOAW?=
 =?us-ascii?Q?r/xzEuqKGoSFSXLbTSmK4e1i9Xay0XN1moD3p4pzT2UHjAR1hAyxISPjeHnC?=
 =?us-ascii?Q?OGs5uYIOkyskaa9/WBxQfuMijsOtoIsRIvmTRUwlRSbWHIynqwp5BLLvMEC0?=
 =?us-ascii?Q?bmUSFH6qa2N+f74BpmqLfYOPzP5vUuVYcBNEdNQJh8/rW1HZAtsNKRuYPuxm?=
 =?us-ascii?Q?pW4xIfbXqPIJCbDfiVXTzrw82FB2CsoAZpzUDG8bqz/LjIPQJVBBIErH4oUt?=
 =?us-ascii?Q?xSDYKBjHD+nSiPOZVUK98h/2NivMqX//rYcCZKklKCbtVc58r3q2fSmFzV4L?=
 =?us-ascii?Q?319R7gjVTLLnvHz5MTS7GplxU27T7vb13Mo670pk+1BfzAwOCmIr6Ypr8CAp?=
 =?us-ascii?Q?gJBJ3HURlYnhu8F7tv0eBPgXviQQ1rPU2qVI+c1X3L0YjeXaPUBmjqkrtStI?=
 =?us-ascii?Q?MSgU12etVZ8PPzNbBdr7aZpugwem2tzFHpqqpdXNiznlu7KhJUlqVAiwlSub?=
 =?us-ascii?Q?ufy4VVrpiE3PLsVxr411yIA5sbVl3iE5Eqy5kDxtQk1u5EhmOXu3MVmXmBvv?=
 =?us-ascii?Q?7VsVDCfS6Fze+Yyis1Mbjr131y96T3DXSW3NKNot3lriUhANZjnD1/TsI3JM?=
 =?us-ascii?Q?SVDLvqshuaua+lIG1DWNkP35n4dkFXY+BPR2q/T/9QSNcHEgKCrdjTvFuOi0?=
 =?us-ascii?Q?od+r+eCk8gRu+AAEKV/Bs3VTiBsmXi3AitgCnlTjCPuQ1UqmL/gV6bADCKCQ?=
 =?us-ascii?Q?j94hqkzCGSsbCbiP/EpSTUWLdgK940EmKwOwVsgk1xHxfFb67Xt/dqkeYnz3?=
 =?us-ascii?Q?SMXg+L+lDbNONHMlXpUPdfN/hHN7uwzi0q0cx/r0WDMtmvz9xcKsNamAEFbc?=
 =?us-ascii?Q?b6I1+jEuhWpixPEkVIsgNQ1tRE4GxP4Okg703mv7B6m+cngbHYhgozJzdBCe?=
 =?us-ascii?Q?cBTvL9Xvu0sDyKNtsFOcPX0RQmWIIeCRKj/T9fCvQsI25TMPbJRIEIweg0Ef?=
 =?us-ascii?Q?dLDTG56yRsmonY9/Zw0djy4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EDr7DjVgvl2FvRyfUxfu0d8P5OqszfpqCOBLTEt4JWTDMYNtB7qOTvrvGiS99+PNThLk5XKt9rjQVbO4bFIMp/COUIuNkHSK3VHz5Prom99+dmlcv6B6U4BZ6vfGhhkKDGz74MNPbIZrp0G1a2mqgR4HBgpvoQ9SYQkXtbJSz7A8MjqAYtpsk+dqVsXg44qr2IX2yvcvze4h3etouuxlrUSGdowED2edUdvkovMRDV1otied3SCr5uHgp8FEfcmBex874qrKdjtgxsHRTE5CBcVGKN9qrvSKOAMjBaLligYkDB8GY57UtsZGNbXM8ALK0Hlt2wCHWvmlFjYaY7PlANjMdhD5T0blfmRS6RWycLgl/fKPidhQI8Mi4XWg5cTeQOLzHHe8/58PaYXx7QhLzBAY7618PBFGE5k7ya+BqcLWmCjhBkabnjkjpFiIK5RCXBA4og5mYqzeq8r4ZCZjncTF8boiRMajlzerutQYXBhBqfn2eM0QpDJCexpw9M7K5aeOnZ9YoECN7mOwaHK7d3kgCaGsrMl8FWGTy+mQjumE3UTbiG1WE2iTYBxPpc7iCnRIFziCOCMEHahM0f8in/7QI9KsQro1N1mEKZkUEWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baac9cd1-fa70-4b2f-af2d-08dd5dbfef92
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:35:09.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/mVhCib+clGzvCWK7FJtgJqTvrX50SwYYKioduYm1vVaM/73HZVUC614i0ga9NPZxL7jAcEZKSFjVD6YmiO1YNNfaNbAJhPk5z+5De/P0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-ORIG-GUID: aD30Ntlv5cVrVSRdScqbyOhW0_HK0AN-
X-Proofpoint-GUID: aD30Ntlv5cVrVSRdScqbyOhW0_HK0AN-

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_rawfbt.c | 223 +++++++++++++++++++++++++------------
 1 file changed, 151 insertions(+), 72 deletions(-)

diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
index 62f2f4f0..52152655 100644
--- a/libdtrace/dt_prov_rawfbt.c
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -44,10 +44,8 @@
 #include "dt_pt_regs.h"
 
 static const char		prvname[] = "rawfbt";
-static const char		modname[] = "vmlinux";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -61,98 +59,178 @@ static const dtrace_pattr_t	pattr = {
 };
 
 /*
- * Scan the PROBE_LIST file and add entry and return probes for every function
- * that is listed.
+ * Create the rawfbt provider.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	FILE			*f;
-	char			*buf = NULL;
-	size_t			len = 0;
-	size_t			n = 0;
-	dtrace_syminfo_t	sip;
-	dtrace_probedesc_t	pd;
 
 	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
-	if (f == NULL)
+	return 0;
+}
+
+/* Create a probe (if it does not exist yet). */
+static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
+
+	if (prv == NULL)
 		return 0;
+	if (dt_probe_lookup(dtp, pdp) != NULL)
+		return 0;
+#ifdef DEBUG_FBT
+	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb)) {
+		fprintf(stderr, "%s(..., PROVIDE %s:%s:%s:%s) - ...\n", __func__, pdp->prv, pdp->mod, pdp->fun, pdp->prb);
+		return 1;
+	}
+#else
+	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
+		return 1;
+#endif
 
-	while (getline(&buf, &len, f) >= 0) {
-		char		*p;
-		const char	*mod = modname;
-		dt_probe_t	*prp;
+	return 0;
+}
 
-		/*
-		 * Here buf is either "funcname\n" or "funcname [modname]\n".
-		 * The last line may not have a linefeed.
-		 */
-		p = strchr(buf, '\n');
-		if (p) {
-			*p = '\0';
-			if (p > buf && *(--p) == ']')
-				*p = '\0';
+/*
+ * Try to provide probes for the given probe description.  The caller ensures
+ * that the provider name in probe desxcription (if any) is a match for this
+ * provider.  When this is called, we already know that this provider matches
+ * the provider component of the probe specification.
+ */
+#define FBT_ENTRY	1
+#define FBT_RETURN	2
+
+static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	int			n = 0;
+	int			prb = 0;
+	dt_module_t		*dmp = NULL;
+	dt_symbol_t		*sym = NULL;
+	dt_htab_next_t		*it = NULL;
+	dtrace_probedesc_t	pd;
+
+	dt_modsym_mark_traceable(dtp);
+
+	/*
+	 * Nothing to do if a probe name is specified and cannot match 'entry'
+	 * or 'return'.
+	 */
+	if (dt_gmatch("entry", pdp->prb))
+		prb |= FBT_ENTRY;
+	if (dt_gmatch("return", pdp->prb))
+		prb |= FBT_RETURN;
+	if (prb == 0)
+		return 0;
+
+	/*
+	 * If we have an explicit module name, check it.  If not found, we can
+	 * ignore this request.
+	 */
+	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
+		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
+		if (dmp == NULL)
+			return 0;
+	}
+
+	/*
+	 * If we have an explicit function name, we start with a basic symbol
+	 * name lookup.
+	 */
+	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
+		/* If we have a module, use it. */
+		if (dmp != NULL) {
+			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
+			if (sym == NULL)
+				return 0;
+			if (!dt_symbol_traceable(sym))
+				return 0;
+
+			pd.id = DTRACE_IDNONE;
+			pd.prv = pdp->prv;
+			pd.mod = dmp->dm_name;
+			pd.fun = pdp->fun;
+
+			if (prb & FBT_ENTRY) {
+				pd.prb = "entry";
+				n += provide_probe(dtp, &pd);
+			}
+			if (prb & FBT_RETURN) {
+				pd.prb = "return";
+				n += provide_probe(dtp, &pd);
+			}
+
+			return n;
 		}
 
-		/*
-		 * Now buf is either "funcname" or "funcname [modname".  If
-		 * there is no module name provided, we will use the default.
-		 */
-		p = strchr(buf, ' ');
-		if (p) {
-			*p++ = '\0';
-			if (*p == '[')
-				p++;
+		sym = dt_symbol_by_name(dtp, pdp->fun);
+		while (sym != NULL) {
+			const char	*mod = dt_symbol_module(sym)->dm_name;
+
+			if (dt_symbol_traceable(sym) &&
+			    dt_gmatch(mod, pdp->mod)) {
+				pd.id = DTRACE_IDNONE;
+				pd.prv = pdp->prv;
+				pd.mod = mod;
+				pd.fun = pdp->fun;
+
+				if (prb & FBT_ENTRY) {
+					pd.prb = "entry";
+					n += provide_probe(dtp, &pd);
+				}
+				if (prb & FBT_RETURN) {
+					pd.prb = "return";
+					n += provide_probe(dtp, &pd);
+				}
+
+			}
+			sym = dt_symbol_by_name_next(sym);
 		}
 
-#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
-		/* Weed out __ftrace_invalid_address___* entries. */
-		if (strstarts(buf, "__ftrace_invalid_address__") ||
-		    strstarts(buf, "__probestub_") ||
-		    strstarts(buf, "__traceiter_"))
+		return n;
+	}
+
+	/*
+	 * No explicit function name.  We need to go through all possible
+	 * symbol names and see if they match.
+	 */
+	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
+		dt_module_t	*smp;
+		const char	*fun;
+
+		/* Ensure the symbol can be traced. */
+		if (!dt_symbol_traceable(sym))
 			continue;
-#undef strstarts
 
-		/*
-		 * If we did not see a module name, perform a symbol lookup to
-		 * try to determine the module name.
-		 */
-		if (!p) {
-			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
-						  NULL, &sip) == 0)
-				mod = sip.object;
-		} else
-			mod = p;
+		/* Match the function name. */
+		fun = dt_symbol_name(sym);
+		if (!dt_gmatch(fun, pdp->fun))
+			continue;
 
-		/*
-		 * Due to the lack of module names in
-		 * TRACEFS/available_filter_functions, there are some duplicate
-		 * function names.  The kernel does not let us trace functions
-		 * that have duplicates, so we need to remove the existing one.
-		 */
-		pd.id = DTRACE_IDNONE;
-		pd.prv = prvname;
-		pd.mod = mod;
-		pd.fun = buf;
-		pd.prb = "entry";
-		prp = dt_probe_lookup(dtp, &pd);
-		if (prp != NULL) {
-			dt_probe_destroy(prp);
+		/* Validate the module name. */
+		smp = dt_symbol_module(sym);
+		if (dmp) {
+			if (smp != dmp)
+				continue;
+		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
 			continue;
-		}
 
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
-			n++;
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
-			n++;
-	}
+		pd.id = DTRACE_IDNONE;
+		pd.prv = pdp->prv;
+		pd.mod = smp->dm_name;
+		pd.fun = fun;
 
-	free(buf);
-	fclose(f);
+		if (prb & FBT_ENTRY) {
+			pd.prb = "entry";
+			n += provide_probe(dtp, &pd);
+		}
+		if (prb & FBT_RETURN) {
+			pd.prb = "return";
+			n += provide_probe(dtp, &pd);
+		}
+	}
 
 	return n;
 }
@@ -306,6 +384,7 @@ dt_provimpl_t	dt_rawfbt = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_KPROBE,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-- 
2.45.2

