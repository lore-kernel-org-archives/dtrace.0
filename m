Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669132C8E
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298224; cv=fail; b=adOSgVTF9eGNCTkL+GcNlGRiwF46gM+FvMYFbUSF9+DuB8Ywk7jvBJVBJpAEKcLk6u7so2q2Yno0wGmG+V2TXFeNgKgzXyhoa9y1gsWXEnTHYPQzws7pnB02tf81KPJp+Mf8HF1GO2nUxzZBCJbCG80YvWMJQ8Ay3DKOjZOAbM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298224; c=relaxed/simple;
	bh=2VNi7NLv2sqXENzMBoWoy7fD2/2dEOUouJ+ElzSbb50=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=UXCm3zQYf2L3n1URZE2uRyga2umHfUD+NsA5Yx8F/DeSuNDSpOFzqbE4UEUDXHKGfqTvWIduuw86Wzx09AXFg1GmqQ9fMNdUfgZIwLXLZ2MpSqS3d+cz1vcxiId/iv+q5jh5KWlg6xcmgV/Yh7ToHNgKbByZgMVhZkJhcdgxA94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ODIQpqdd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z4HY7Uhp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ODIQpqdd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z4HY7Uhp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AAMX1aU001389
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=My3q2mNKq6kgGQtZeylWG61usUWriEKCtArCKFstd8Y=; b=
	ODIQpqdd3b/xttPc0QsGgOh+m1xTOTlp6iDhv4wG1YdHIFB2c4SOQSuWIQMWNiSX
	DbAPVZ8BlPmq7QFjgnUntGvVo7xSi/X7bJ8+K/66k8sreWbojJKE6DzeJceYq1LS
	cESgX9pvlGMC5SSx5m7U/f9g4xIUurpNsBsLANXec446SS7jUJtbNoTqKokQp6Bl
	LmKR8fR09LH9y3hVIe2jfhsrlH/FVcWe+Jhuepi7W9rM2sCmdi/QUKi72MQYdfx9
	zkpTVU6cG5iCuo7ZCe31HpQ79b40VXvYZ4TmkLBAAw8liG/aK9PVdqisOP0XQxVr
	5vObf3hUGMFA7BSslY5awA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hn9n7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB2e5dd024208
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66ams3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1EZ5h52SzbnrL5ruzgcvb7NmBSGUOc2Z9HnM9GqlmVYEjkstZ9OQs0UQYFD5Nsbuaj7n7U63ca1cfAZIpnnNHja6NwSXyAL3sU5V2Qilf2zD3rLX7GpfDr8xT8WQQ6skfarHVNAP47/QjGx/8ijl1XnBvckhRqOLazIgUE0E0pMOrtVR+70cAV4/0kkVII+LSjmJHhVFo6ZgA6CyEtLNRPWUF21lPOoqH8SbRJomKrgGznlH67Ojh7bH7JELtqDJi+l+K+oDhgxCvq2IsoE+D2sejmmsZgiK1z3GHLunIR4oHpAqu+96E0Euqa2QwT1BrSe6iaJjoFlkqDFYDVYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My3q2mNKq6kgGQtZeylWG61usUWriEKCtArCKFstd8Y=;
 b=bmjmmAi0xAV8Bc4R5QKHJl2Tgbpbq4xL0V4272AO1yhQkFZPLgPxVggBvOFN5kUxzfZj0Vdol4p/Ge/fDK8YZC0V/qDJAuft87OYdKf1QJoRgzNDkANBA4Qo1XZEm3rf/aMsj4PCGKAdmHVGLhDYMGFb39HwAXcLsBLXwSoQU70xSFIxgbPm2ZDJhGaQsg4SNl+OSiLtdv7Bm4uZaPrdcRSkhDTJRjhLov+KAP1Xvtw9drGnhN4kO90UG0Cb2m3ahfs4efq+jPTJxZqJ9AkdPme6UaEw5TlG7n25R2k9V41xGlXiutjZ7DNp/Kwo48UfSj+bdlfChPkzB6Xh9/0AXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My3q2mNKq6kgGQtZeylWG61usUWriEKCtArCKFstd8Y=;
 b=Z4HY7Uhp1oTqx9Mj9+3hU1YtlUBPlC4vphznym/hNuaDrCzEhtcfYNhP46CsYubuxI2o4wiLiaRC/L+U/0uPrnzCWKwtEB8pQy6csrh/Gn1ZX0yDQcHUbT4Vw2efezrT6hRc5jro5vfg3Q9Pk47lhn4XFphv+B/26MrIVTUMTJs=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB6881.namprd10.prod.outlook.com (2603:10b6:610:14d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 04:10:11 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 04:10:11 +0000
Date: Sun, 10 Nov 2024 23:10:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] spec: add dtrace.pc to filelist
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Message-ID:
 <CO1PR10MB47692B203911603E18C72BDAC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: 3023e8da-db38-474e-931c-08dd0206bca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BL4M9qXSDaK1+ObxVQA2+RzA1ta6I4GGAZmS0TRlzH42aVmQadodaDlSPzgC?=
 =?us-ascii?Q?+K7KwbXZcp4plcBGE1dNTMwd26t8xCHqIcMELIUKbjDD38a58MQCpyG9L6mH?=
 =?us-ascii?Q?A5M66LFqBvJbbHFgtIDE3uiEueESskH4GkyPWL3+Z84nt/xFsSj1DnpshNJF?=
 =?us-ascii?Q?J5mvpBEOL14CroUDyqKYukCdPeWppKfRSM3hROrMAzhKl3Pf5rtFTXq5MzMA?=
 =?us-ascii?Q?U+DliPq7ZgGqQ3Bt23rGVBz5k+/Y5qmkhp3DnLNmzj2b34GHWZdwiTblwsUy?=
 =?us-ascii?Q?os5bfDBRk7tFd/iPTXF+BHF0B7Mw+ioQaQfMjXnMx/EoGOV2WasxiDuD5Qf2?=
 =?us-ascii?Q?EYJSqVBAGCanr0QgwjpVD4V7RyYr3Z2U3A6vIQjsASKx7AGvq2XHoa3zHaxX?=
 =?us-ascii?Q?82kQes4XhKtRqwTENVHTpCvhJsUrnc8nO8LyGNVWlPmeTORX+6J49sE1Md0M?=
 =?us-ascii?Q?ll6AD1x37pfEEg0i1Pt8bHm/+M6/Vtdx1tVzfKfKGS4XTAtTh/Sh0Iak5zmd?=
 =?us-ascii?Q?JKQH43fiABZITVcA4n/nQ2BYyzPsctT4g1eGOz6L5hLkc8MPOSoz4sRSI30r?=
 =?us-ascii?Q?3zEUiDtZEueRCuLWJw801b0M5RJj4o0Kx+VvVyTvJ/ijkKEBcoR9mNzBTz5p?=
 =?us-ascii?Q?i2l6cwecOGk+jxMm3wQMR/GqktkKBzTJ0pkYEGmfWmrHvAxU9s1XUQgRfHJb?=
 =?us-ascii?Q?V5O8r6kiw+NukBR36Rz6PjucfkejE2zRiwqLkARKWgR5zms3DNHX0A3vu9Ef?=
 =?us-ascii?Q?Z7e+X0ptMifj2v0WN3z7pgbC1/UtrG+ZCgxoJdvqzOlnVrInu9qAb5JhLYh2?=
 =?us-ascii?Q?GmWWkHUGIw+QQIf6hj+3J5gQFs6HaH1UgC5u18YHFH6RoaMyJ1BZ+z/pRsaT?=
 =?us-ascii?Q?j5eAPCNkxT2ghr5jre2/H4Ce2A85pT1ybPBzJCWTHay6PhL4k2HtEiLhLyXd?=
 =?us-ascii?Q?jjEwbcRl6dIX9AS+Wg05A6uJxTtDwemg3Fj2xYkZ27KofxW/Bcx6HMyJHPZx?=
 =?us-ascii?Q?3bTqjaPx3Vgj/4nUuaSu5L7slpSb+6DwBJ2F64HFIVGnnWeukZT8cnmz5mF9?=
 =?us-ascii?Q?RZ8qYkYFinFkh8wuK8zA5wBllwZIXHUrphZcHcshx9tm5hYIzjKI+NZj4rbV?=
 =?us-ascii?Q?66g120mRajDgvQHR94cBb+izwCDr8J3MtuOY5UTsPfM5ioqNMn14JhZv4osm?=
 =?us-ascii?Q?aebgtGk2m4tICDc1L5CXq4qM+4Ot08hs2zuafp6wMyOgBHS1BW0OLf7Awn9i?=
 =?us-ascii?Q?/Ooksv4Id1dTPeBYewN2Re6uR4MAHuReeXvTRMdIs54hkjF9xEMRgZrI73vM?=
 =?us-ascii?Q?+gfz4sY5qLG0PJNiI1qCErI4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KaOHnG1Nz+DjCL0Yh622+anlvQYgZrOP5h4h11Ur9Bp1mQ+6Cle8O63qduPy?=
 =?us-ascii?Q?H859m1qznTS3DP7p0tKKUywXr3KDk92zufS9XOQAUsNveh293dbIrTSMhsux?=
 =?us-ascii?Q?LlBif8VSZdiQtFX17PKNGnY02lzNDCbFABcW8Gv9ly8EpO6YduBsH0co0v1O?=
 =?us-ascii?Q?4Tn14wDacLPZsaCnvXH8RbS9WP0AIaHUKcsSlaxpam8g8vbbrc2CzEC1Mz3c?=
 =?us-ascii?Q?2s5FPf4igkfD+SOWCPszBK2cvHIBwNJfRNwGmlENJy56T0dWtPu2PAcx6/2y?=
 =?us-ascii?Q?m92pVfK7eX9Fxecpw5lc4czEzWxRj3OBARdZcjC4Ps+D9+YY1miQM5Qc136Y?=
 =?us-ascii?Q?Xv8bqnXKzye28QjwTzOMJIBRaqVnZMECvgDV74iMiDWu3qF8fzRNqmlFcMRp?=
 =?us-ascii?Q?UMu6UMqOAUyaC8/ht1JViw95DVYQ12A63x2ifsqqejfHSsv+A15l+7h025Ny?=
 =?us-ascii?Q?8znrzhqLjFXg9cObM7JQYxyFLtOwGF00Zme9UT1rLaxigm76Xm4uuMWJ2gzg?=
 =?us-ascii?Q?k3KV0lS2umvR3ZV4OZl0C3XPuD3h2cPlRjm8VxZpPRHTldbGpEW4X4mrPiAR?=
 =?us-ascii?Q?HT5Y6i1RAS+3IM/QLxe1XWZYiZ+83SFZ7BkV60IYBfRdbFeQcRjW57a1H3NQ?=
 =?us-ascii?Q?3wUiThVK8dxRJBs/2CJXX8n9bA7isUB5mOqVHys+lmGzdkj5aVKWjRelcdIJ?=
 =?us-ascii?Q?gCpwhsIVFLQ0ANIpyc5UtbNDpnpBIpxQavW69Eu9WmmEwXnN6tFHFL8jMEEg?=
 =?us-ascii?Q?q3u60FDJra7nDqetmkLApEJZCPiJgaDKC/NClQ1Iwa6tjqyn4y+/0UCALtXp?=
 =?us-ascii?Q?O4biONgr8hUFQ97VxaRT141PnFAi2npDONq34WgUQvAhsE/arnSI5CGbZP47?=
 =?us-ascii?Q?GeUdETTSzxYvBYXc0W690YktUr7DxTwdtnyNbWhXxKmeZZO3Jy+/1S1xMskJ?=
 =?us-ascii?Q?Z8d35oMSCF81E5SqVC8NUTuMxkaUfZ0M79KK5GgSt8zXHEYHYt7IKBEh5dzF?=
 =?us-ascii?Q?RqDpxjXPCGnUvl04la2OkSLeD9EIsG2GDTzkXfvaWWvhFV29cCNRRuyxfXMM?=
 =?us-ascii?Q?DiJDGVUDW2k1HzTAZvlIhKZ6srmgTeU90wizEM0n6BoUdjIz6fzPXeJ9r9xl?=
 =?us-ascii?Q?sN7m+/OggJhPVGtaah9Oy9DgzFDDmaPmEe/c2YCdjfn20MWBjjZTdGxRneTV?=
 =?us-ascii?Q?C6ofuxd+JcWVrx7cykUIv5/nfftfmEk9njqRtyhm5NbvaK6Kmwo/Qd2PHwzE?=
 =?us-ascii?Q?r7HnCxWyEup0sAyNy0uIieWCo17BLSN0+u4Dlh37AEp0Cf2yF+jrXmDH9h4T?=
 =?us-ascii?Q?pQJQFsebFpTrYRjOOjCaGOvA6ZTU+RfOktXUFthx9AumgqChdoURKrRK/tHt?=
 =?us-ascii?Q?32Zvcn5030EozTR77IfZawxl7dp01YvEooXLfRFVh5DyzpgWYqTsWFko5+fm?=
 =?us-ascii?Q?uRpgOnTJQGRFpdgqOlkkG6suXF8etHrH5N4DhXa5YhJW0WikcTOfLbUZGenf?=
 =?us-ascii?Q?KmT7+VTbFWxtHmp0xhGJ5Hvls+DEJ3IFZ1Ma9QV9EbfxhquthAEZN2u5xY1h?=
 =?us-ascii?Q?mRASFVqQz8WHNrWyxEsr0H47zVmYsWU2+L19FM9T2QVIvyJgnLYmOM02rT+l?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R3+aECgcb21wCNYnSim7bpCbMzI6NaAzZokVonundM6S09EEYnraalr2WAcb8EL40wIbOJHnAOO3S10fMt6d00aVmB2uNWw2a+uUwBOPmXUGVPeeumgKAh9qfLcAqYUWOLRRaFtnvsNLfKwDynXTxgG1BjVpaxe2tL9c2/SXZiiiRoEBIEoFbz7ICR8i9PatGjheTY+5wXHAFLTjv8jmUvMppmPD3BwxfMAMSHrgNWl24tbYUMSa7pjT0JN8I0DDm94yD5OIuOCGp8n20Zn3myXbm//iJiFP8HHVMbaxqtBxujC7eao0toNzA978MMKaoB0cT9Ew1C5gd4+SIzQLhdttnu4R3s55h9P4SkxISF1Vb5EZfznwymI6BQvusgwYJsQKo9353JnmjkywEdRyDpaVATOB+mo5gsWuE3+vwxMG5hS7vKLYX/O6jvr81hadQ7vVYmPyECOvJX+qWKYJr3LHxIgpXkCeJnTswX/SRuIYFrrDBfx8MX/St4r6grti759KG3+B1HcIFO/ElGQrdEjDBLf3LhfFJ1d4DsJqL/SJlF0I1Cas7JpIqtYyrntToMUO9DkwkVYv6tKiWDHWWkB+GttmPmbiwZrPTPm0Dc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3023e8da-db38-474e-931c-08dd0206bca7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 04:10:11.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/AqedeJv1xJKw0W3XbCVtZ5fwKaJ30tUNhROQcpL9qeBraJB7yQ16OfVtDUmDO0LU78diwxKm5gr4IUNvd9RyO7s/xDYo+91/bYQ8781U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_03,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110033
X-Proofpoint-GUID: Vxh2C01evr5giNC86CqR91rU_i2jIF_R
X-Proofpoint-ORIG-GUID: Vxh2C01evr5giNC86CqR91rU_i2jIF_R

Commit 52a18d35 "build: add a pkg-config file for dtrace consumers: use it"
added a dtrace.pc file but failed to add it to the dtrace.spec as well.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dtrace.spec b/dtrace.spec
index 1887fcad..c895426b 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -246,6 +246,7 @@ systemctl start dtprobed || :
 %{_libdir}/libdtrace.so.*
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
+%{_datadir}/pkgconfig/dtrace.pc
 %{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
-- 
2.42.0

