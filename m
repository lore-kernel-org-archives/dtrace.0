Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE3E30CD84
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756433295; cv=fail; b=iVlgo3wAJvX66o2Xn4BgVYTN7HtD1Q3vfxQvEHABg0CJgDcsR6JRPPt5sVdAgUUaGFZUwoFTcZlqozZHmPBQFqnmSQ50FAy3+yyGZ9lhDrbGPWQl8UjKbRfD0j3mtwLNwE15XFhB3QOK81NTbhg8J/hRDVMTJtU/MKxcVP2nIVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756433295; c=relaxed/simple;
	bh=S7/F5KiDZs67rsgkCCx8ZdNCMkxneD5UeoBdRK9dPdY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h+50bq6do/c7+m06DaVBQ/p2y4Uj7CtqBiZ5TnTARV36wdFdMZpwVie2n20joToijG/6K0SDzwKEKMSyS/IFAKf/aSoogC73l+oBdQVZuLyj7F/1FfL80PIpuOL7mTmuYmDM53ti1fqdMuSbWtgU+GzRfrRFohlsizFiui22h9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rsKwXgAh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VxvuKC1C; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rsKwXgAh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VxvuKC1C"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T1fugO011656
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 02:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4WorIXXDgC68g3vbzmaaJjrpWevytWJSQwKW2fvuvOA=; b=
	rsKwXgAh5d1i/HEjTTE9tIv7MrG3LpMUtIWn+6JBFVO6H0B3TeT5oUMYPTcShaed
	aLGylVLXsE85UyIaBJq9DbNBoXzADuDu58nSW2C1OFb0gfy/Kv36jzlGDRDv4jXV
	HLsXZaDAtFX+F5OVXMQaLx4DSyc4Cia8QQMjTUHnVoPMCn5xJaiYo429qFvWr6Pf
	BujfI6d52Dw2EQekYPdvVSZdgFMaGJBKBZ3kj+sb3QAt9sirMp+vb4SY44FcrUGA
	E05eJfLO6+ddA2A9BUFW33HR0Ughc1WMLaag38xgyMLwAhifBKIap2cFCXF444+p
	6BA4x0X3ZD2ErMI+D9tklw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48r8twgcep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 02:08:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SMjQb7012368
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 02:08:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43ck2yn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 02:08:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN2fpG5WISGujmM4ZC2G0OMRwRFb4j72XmxoZ5h4BYgt9tEAX4pE/Vx0W5KUa9Dl4qX0Cig2xIo5OWdtYewl3AoimQPk2u6Fasysui5WwYNnZYf4uJXyIktYkWpEfKYcvxAhcT2G5sEaMsUPawh7nTW7VL1RIHSdu5QU3pJnZry5CN44ReerAZvNdPiVjpd3JY1fUPpJwR3Y1e9q7kRDqgDjSrUB77P3FMrG8DKUQEgQX83PLfXb5mB+ADEkpSoNzB/YL/wsoW4bSAnr0dHhABwRHycJPbPm3oN4EEd6eeVxEcdWCpjfNem53f/qENkR1mhSo+wDnUV/P/rViTZX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WorIXXDgC68g3vbzmaaJjrpWevytWJSQwKW2fvuvOA=;
 b=vQp/k1eHtXFctLWHi8hXm74+n6bgJOoCMDBGkQWbbctV9+sQhqIBgLYZCdnmjLLexs8t3mLTS7rGaa4wifdn5M8W7abptG/h9i7UlTVXaG71t09ifK+NJnDK4U0Pe/o+SdzRjd+Odzkyp7fh4xrEHbwqbm4YvcpdhcfH3nkWOSV2PdmijkPEnRvNtBVIL2dhewIKSVcZmghd8NbHUx1uiryD9WgICzJ2uTgWpGpFeHreU3mDoumdQEdJYwlpy9X9T8qX+qaCOmNC6hM9r9lymWrU/t4d4RB3F0MdEyUohnnfws5yipFaoVXueEDFPglkoAT7TSBhq8JoeV2tO9/fAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WorIXXDgC68g3vbzmaaJjrpWevytWJSQwKW2fvuvOA=;
 b=VxvuKC1CbvYE5DmlMkJwSeNsiVN/0bOLOVmjYYBJctR2wX0bEd7zcj5AiPeDq1RSyE/U1SdAVX3c7iTMBd1/Ype4q+4Hgaq3JQzaaxeWBC2sgJc83hE5x2eCcqjGlDlIl82FYxI3GBB0oXHqH68slJA6ppgzOjTz8+LvI8vPekc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7210.namprd10.prod.outlook.com (2603:10b6:610:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 02:08:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 02:08:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] examples: include a first set of scripts and a README file
Date: Thu, 28 Aug 2025 22:07:58 -0400
Message-Id: <20250829020758.2691-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: ebde044d-97e2-49b7-a4bd-08dde6a0e188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BO19GMSwIlqohnK9LEFPzrXmJv+sG21APfx9bqziRO18tvFcifpwAdapHwM1?=
 =?us-ascii?Q?3/BhIqvPSDWkRmb7mPLF9SgQ6BT4tT6MN0KwWtqmv2vNFMOcW4kyX3nHtPsr?=
 =?us-ascii?Q?aZbJ4DGFo4cT28dbFtenInsfBODpaXCwcjnu7fbPozamyLyp2eaoRZJCHzFr?=
 =?us-ascii?Q?lfvueqCbc+EWNo6WEsFro3J9tJ6sduVi58wPTFfpYO6YTqXbmwpzmS0FvJ5Z?=
 =?us-ascii?Q?2LPeIbiXBbT1hCwEF+KZHtjfSPQ8vpohT8PUbRU9bTpq9HSoDyJ/oYKc+PF8?=
 =?us-ascii?Q?pJbNbQJdZvC2Osrf/4r+Ob+LRMhJdH3M5BrYUmn0PV6sIJxEipl1hQmWMxOD?=
 =?us-ascii?Q?zZoCKkraji+OD7HYNrqJnWmirgWUf1oAfIe/4a1C1pKivBbnVn4qDcekfoxY?=
 =?us-ascii?Q?dFWWLv8h665OKDOSRCfv7J6dB66BA9v+oW+eFU9dj8qOM5zJN0JAk3DtQ+xE?=
 =?us-ascii?Q?ag6zJu2/MVag5l9RW4NdQ6yj+pq3yNbFhE8OObGY7AtNG86nc32P5MbXgTw5?=
 =?us-ascii?Q?cMhHZYuorvbwE66AdGvTBc6OzXpwmiMAzrNjcCm/TY6H2R7cIFDQn+9Z1AXi?=
 =?us-ascii?Q?VdhaJDwyZCvfR4ZKshADOb6YRQIl/uAZDoIOv11Hw74/cWWTunY8L3yz0p9D?=
 =?us-ascii?Q?12zz9oATyovItMK1pcwij1lVTwrxtez7c3SypcCi4adTwwOTXJ9YVAOz2jNV?=
 =?us-ascii?Q?cAAfPRdZjEgwZKwxjVPDKcNdMDLIoUqmp/bKVefTMo9ZLzMkgvxL7ONb/RRG?=
 =?us-ascii?Q?9vfJZ331Qmy3jBaZMNZAJKv5Kp0f/Rs2/ISXoE4Gd+1vSBYdOTvi2h1duWA1?=
 =?us-ascii?Q?4tXDU11+HmSYSXZ+CTgriMqjs3NQLzDMTe1xOZpEgkpTi0FoUIql2uhUUb3t?=
 =?us-ascii?Q?dpqN97Erh2HFkh26E5v7WKwpKPgYxUMpkvuKqKhGiqKPILyzTjV4TpLU4XKD?=
 =?us-ascii?Q?wfseeICkDsAG7/THWiYvY6NI8gxu1QD5pYTrkoD68E67wjQTYfBeDYofcmwa?=
 =?us-ascii?Q?/MOuOY6Ts6zQegITrM7LA8qR3xySvTVbxTndz/ZdtrCiLNiCBkb3LzFcrd2s?=
 =?us-ascii?Q?5YDMpoU+EOH/smhwYm6esBTaepxwmM6k+qFeHjhgvw9anmsyo5W3LlpVXJBr?=
 =?us-ascii?Q?Nwvwlzu3MmITJOSG5mSxLydYP6m8UF4zocdRZfb/ovSOBeWxHdhFwjFlv5eN?=
 =?us-ascii?Q?uLMUr1lanZBsrkLQR1MTfhLyOp8+UjI7ywmesN6/zWGY8Z4onjk/fr0OQddb?=
 =?us-ascii?Q?VCcN1hCVVLenmRGktSmRpj/7XDsMNBR8m6eYtlpE0JN4ARfMnKRwPuwsRFSf?=
 =?us-ascii?Q?Hynsyzs/P0QWaOcTbj0Ld4MXgdi4y930aaUJi28ZBsinPwacIoezrje80o6G?=
 =?us-ascii?Q?tYAh6K++OOSrowNWEOMItbMKBDex3vqN6VQFuT03PWV/XoR271jBVVZQXVH6?=
 =?us-ascii?Q?m7La2sRdKas=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DiGE4lMkvMHrODU9K57veHBo04eJqQXWJepogFaIaE+PB3N7T3lyKabQfaYi?=
 =?us-ascii?Q?QVet5OQx/8MqChXnaydtf0GtzEXFSeof+Up3LBe4WlNwi738l0QilySp9Dn4?=
 =?us-ascii?Q?rjS1yPbn3t7yCzywTfSnk7idOsQmHtAC8pOpmOhMNqNANMTdehfeoaSj/vx0?=
 =?us-ascii?Q?zN0gaJI0IaqkZPtR3sUF8oo6HcX6tc8qMrcucxbrVg3MDSNo8bEZUmkM8/uE?=
 =?us-ascii?Q?y5KtEhrtPiun9mz2aArK11K4rp3dKIKG9nc0N7u1MgGhI5zgI+gmmZ+jtCDU?=
 =?us-ascii?Q?5U4uoQ/742Adka8IwVMaPIuKqTBCjlhmqSL0BL2YPE+dwuINKJgrGWwNPYGZ?=
 =?us-ascii?Q?H0FSwLwo7mRlgM4TrurLBRzt8lPde4mcopXIZPGrXUQSnqXPhdta/wb/uHUX?=
 =?us-ascii?Q?FlliP7DpzsEs6OcxpjfQNPUWPlp+ZneQsFa26KiNV+iYlX/H/2KmNumI3QPz?=
 =?us-ascii?Q?ZwIHTgcHqaI/aZ1mZa93AokSrKFELnh1shcorNehf3qR1GFcr7wjHVECGAFt?=
 =?us-ascii?Q?EV5s2ms1qKUfexi//y8jSOy7Aq8CxhVmvURUq00IqPqNe0xYaWqb82vHhkYk?=
 =?us-ascii?Q?sHNQ3Xu5477QNs1+aj0tnRfA5BHLThqfAPipu4GCmWwq0y979Z02hkgFa1zZ?=
 =?us-ascii?Q?6FPVt7m7IVFDkTuQH5nepu6VxeBmFd2douIZ0gSwuIZ5mqkAdQbfhLVviEOX?=
 =?us-ascii?Q?f42rZGbOEzoEOcaKRjRDAb07zr7XKJ3RCu/Zp0anVMO8mpNHf996LvsmD6IH?=
 =?us-ascii?Q?jXn+JHk8Nmj8NfKtml8A8oTnbRQ8ofzvNM8lqFNyOmIdldnbKnInEkFg2nJm?=
 =?us-ascii?Q?FAuyWkB+oDbklGf4pAY/ABx3tVoho4qMF44hkJ7kHVWPXXzTN5JvNKSKsqB4?=
 =?us-ascii?Q?UNlzRJaU0SWPxTZjLPaQG839otQpuL/2+6YWz3yr3POj9z6amAdgwrqgDQsT?=
 =?us-ascii?Q?zBBSYbzCKdXBP0mKFHI1zFGpkLZmynaRwKrPo1Ov/mOFYDwsACMy6wsob+B1?=
 =?us-ascii?Q?YCPNtoifhRVccUeizWD7+JZfCZFvk7tx68rQZFOze/HW+//KfpVVR2mSexea?=
 =?us-ascii?Q?r579+va7mK/BHSFHXDEcY2IoXtSuG3ylwCIMWPv0vtDocyLHohRFR3JluXY+?=
 =?us-ascii?Q?ZDRSmeuRypOEXNag3+Dh+v4Ba1sDYVHHZU8aeRxgqBtcV5EbXRt0Q4UDqIrW?=
 =?us-ascii?Q?EWstHOGVmiu4qCI6SE6gHY/+LxEdtIOIqnJeohHS6zmoCPzt0EO9guqNqWfK?=
 =?us-ascii?Q?g6djNrluSluWfhqKxqWxN2kEKq/PnsrL1zAurrQIzsuBpSsvqyNDiouYaLDT?=
 =?us-ascii?Q?c7CQy4PC3tTMWOiBMr2YBVlQk53Ith4cx5JKuylUFVkGQDq4azUoAJw+snsh?=
 =?us-ascii?Q?OIEmJfvMl5ZQ3/x/eU90XgY8qOAakoKAoJ1OoMVvdxgK4/MZgB9joaMYDzAm?=
 =?us-ascii?Q?7G57S99sKfqWCrZFLnZ+1pLKAhKXQBP+t7fZIWWbC2TL6cETzYnsyXEnbBZq?=
 =?us-ascii?Q?p3gs3XKDEwJ+8Hv3n8up4CwKXZrfNIdTdquNMtj6JhLP5lziJsYVeco5nelY?=
 =?us-ascii?Q?teQLN1enP6zImfIBMGFplPDk26in65rlu8v3uQPx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kPl/J6B/GeAwce5NdwubMqoP38bhPPindUVM8Ante1F/O6/cNm039k8yEZmqkm06A+u+b4IjMG7p7ltESqXci0v+Nii3vuoS1iT1jOEgvaOwC44JN437mREqpEpKH35RoWhO3PhqSvjE/+DkHUpFIvpTovpcYDO1kSmqzS6MIXEBLO4kirHmhKAb3utE6oolIQLeWxZiYzWSyUS88DFOAIt9rmfA4PQBTnn9L+RM5HPSlXXsEi7W4VmeR5Djdc8//PKWWhcPQUOhrXTuvf60WeuwH8hnRGZkArMdR3K5a1Y66XpVolbXcIgfO9bWyD9fWpMZKA+Gimy6cNmNyq1h+5o84SXKKMFGWUxhp+xGmhJkVGB6QIp/WwaWFudughXpOTRhbMN66iy7vC/CpOb5XYNXhSVgZA+UJjSyVj+Y33uHDR+fzlr/cQ66jGQy2V2lMsNqlnV4cFJbFMhk+y4rupp06CWrc3aSbsCzJheyux+DwcpBKJkcGLajonkKIVeRWYRylCcHxQ8GSQnLAXnHa/vHRFDZBqdOT1rnUlzEKmfaAL0xl+NWYeshhW7lOm4JDXhjhqP4Rq7/Y1zIz3zOjTkqEgfiZlFIM9Sdph8fE+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebde044d-97e2-49b7-a4bd-08dde6a0e188
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 02:08:01.1531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmoJ0tWUCUUceQUnsJ/4M4O5Oscs6IZWHk35Uwui09ajUnNHpjTbmJiHsdRKZnKrHWjgNfUnnSlzF0TLkaTCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7210
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508290016
X-Proofpoint-ORIG-GUID: XlchYT0Uyb70fPzCgKfuJ0xBZIdrnwdu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI0MDE4NCBTYWx0ZWRfX6iM0/Ptt82N0
 YECfLuwdFEdbcRnC13pRO3qYO6p+Sbi2UrbP1Z2cKOTQHbL8nxCTi4/lHgHyWzj1WvD3Pw/p3+z
 Izqf7e7Rbd0HGS8nPLmjC7VviKD6YRru+9NGj9SCUt1TTjySsdxa9atDZOtqqbEg0SSaAf0BPNg
 rf5zdxi6kjl4/6aaaTGq0zMXrfolDWoGGtx+S+RzeYZhT520eSlRLfabe1tsDE9DC+fWi3Lxdw3
 fqv/qB6LZg5LhgWL6UKLqnFKbamFR/SM5m1ztjBL41dwJCokAB4JejQA+GlvKIr5wpvoy7btydg
 bqFlkUlZPAPPsDBmLAkCUjsUIOBr36ZEOSFE+oUmKNFMhuUdnsR6R1pgWrDysrU/rcK2T94vP7/
 j3Jfh9h8+blueymImzVKHhwfVyDrkw==
X-Proofpoint-GUID: XlchYT0Uyb70fPzCgKfuJ0xBZIdrnwdu
X-Authority-Analysis: v=2.4 cv=IciHWXqa c=1 sm=1 tr=0 ts=68b10b8a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=S8VyNBHPMDSX4ipr:21 a=xqWC_Br6kY4A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6JqA57Gs2tIeDaDxxHUA:9
 a=Rt-vP23syXvofVCv:21 cc=ntf awl=host:12069

From: Ruud van der Pas <ruud.vanderpas@oracle.com>

Add 7 example scripts and a README file.

2025-08-28  Ruud van der Pas  <ruud.vanderpas@oracle.com>

	* examples/fcalls.d: List and count function calls.
	* examples/io-cast-net.d: Show how to use wildcards.
	* examples/io-stats.d: Display I/O characteristics.
	* examples/sched-simple.d: Count on/off the CPU.
	* examples/sched-stats.d: Extensive scheduler statistics.
	* examples/thread-ids.d: Mapping of thread IDs.
	* examples/var-scope.d: Demonstrate scoping rules.
	* examples/README.md: Brief description of all examples.

Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
---
 examples/README.md      |  88 +++++++++++++
 examples/fcalls.d       |  90 +++++++++++++
 examples/io-cast-net.d  |  78 +++++++++++
 examples/io-stats.d     | 280 ++++++++++++++++++++++++++++++++++++++++
 examples/sched-simple.d |  82 ++++++++++++
 examples/sched-stats.d  | 191 +++++++++++++++++++++++++++
 examples/thread-ids.d   | 168 ++++++++++++++++++++++++
 examples/var-scope.d    | 121 +++++++++++++++++
 8 files changed, 1098 insertions(+)
 create mode 100644 examples/README.md
 create mode 100755 examples/fcalls.d
 create mode 100755 examples/io-cast-net.d
 create mode 100755 examples/io-stats.d
 create mode 100755 examples/sched-simple.d
 create mode 100755 examples/sched-stats.d
 create mode 100755 examples/thread-ids.d
 create mode 100755 examples/var-scope.d

diff --git a/examples/README.md b/examples/README.md
new file mode 100644
index 00000000..de4ba090
--- /dev/null
+++ b/examples/README.md
@@ -0,0 +1,88 @@
+## Synopsis
+
+This is the README file for the examples directory that is included in the
+DTrace distribution directory.  These examples are meant to be learned
+from.  They can also be a starting point to explore changes and enhancements
+you'd like to make to these scripts.
+
+## Target audience
+
+The scripts target a wide range of users.  There are examples that are
+ideally suited for the beginners, but there also scripts that are
+probably easier to understand once you have some more practical experiences.
+To make it easier to select a script suitable for your level of experience,
+we have added a level indicator, but please do not let that withold you from
+looking at other examples.
+
+| Level | Description |
+| :---: | :----       |
+| B     | Beginner - Only some basic knowledge of DTrace is assumed. |
+| M	| Medium  - Some experience with DTrace will be helpful.     |
+| A     | Advanced - Practical experiences writing scripts is recommended. |
+
+## Installation
+
+There is no need for any additional installation instructions.  Use the
+examples as provided, or make changes as you see fit.  You can do so
+in-place, or get a copy in your working directory.
+
+## Usage
+
+Each script has a usage line that you can find under SYNOPSIS in the
+top part of the script.  There are also extensive additional comments.
+
+In the comments, we often refer to a target application, or command.
+With the latter we mean a Linux command.
+Most scripts can be used for either, and also work on a running process.
+Please check the comments though, because some scripts assume there is
+a program called main, for example.
+
+The command given in the SYNOPSIS section may need to be modified
+according to what needs to be traced:
+
+| Option        | Description |
+| :---          | :----       |
+| `-c <command>`| Trace the command (or application).  Tracing ends when the      |
+|               | command/application terminates.                                 |
+| `-p <pid>`	| Trace the process with id \<pid>.  Stop the tracing with ctrl-C. |
+
+An example of a script that can be used for both is `sched-simple.d`:
+
+```
+$ sudo ./sched-simple.d -c ls
+$ sudo ./sched-simple.d -p <pid-of-target>
+ctrl-C
+```
+
+## The examples
+
+These are the scripts included, plus a brief description.
+
+| Script          | Description                | Level |
+| --------------- | -------------------------- | :---: |
+| fcalls.d        | List the functions executed by the target application.  |B|
+|                 | In addition to this, the number of calls to each function |
+|                 | is printed.  This information is given on a per-thread    |
+|                 | basis, as well as aggregated over all threads.            |
+| io-cast-net.d   | For the target application, show a list of all the libc |B|
+|                 | functions that include one of the selected keywords       |
+|                 | (open,close,read,write) in their name.
+| io-stats.d      | Show statistics for the fopen(), fread(), fwrite(),     |A|
+|                 | pwrite() and read() functions.  There are several probes  |
+|                 | and you are encouraged to experiment with this script.    |
+| sched-simple.d  | Use the sched provider to count how often the target    |B|
+|                 | application, or command, was scheduled on and off the     |
+|                 | CPU.  The information is given for all individual threads,|
+|                 | as well as across all the threads.                        |
+| sched-stats.d   | Display various scheduler statistics for the target     |A|
+|                 | application, or command.  For each thread, a histogram of |
+|                 | the time on the CPU is shown.  Plus global statistics,    |
+|                 | like the total time on the CPU, and the minimum and       |
+|                 | maximum.  Those threads with an on-CPU time below a user  |
+|                 | controllable limit are listed.  Also the CPU IDs and the  |
+|                 | number of times a thread was on/off CPU are given.        |
+| thread-ids.d    | For a Pthreads application, show the mapping between the|M|
+|                 | thread IDs as created by the Pthreads system and the      |
+|                 | thread ID as returned in the DTrace tid variable.         |
+| var-scope.d     | Demonstrate some of the scoping rules for global and    |B|
+|                 | clause-local variables.                                   |
diff --git a/examples/fcalls.d b/examples/fcalls.d
new file mode 100755
index 00000000..f4973a89
--- /dev/null
+++ b/examples/fcalls.d
@@ -0,0 +1,90 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    fcalls.d - list the functions executed by an application
+ *
+ *  SYNOPSIS
+ *    sudo ./fcalls.d -c "<name-of-app> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script lists the functions executed by the target
+ *    application.  In addition to this, the number of calls to
+ *    each function is printed.  This information is given on a
+ *    per-thread basis, as well as aggregated over all threads.
+ *
+ *  NOTES
+ *    - Since a.out is used in the probe definitions, library calls
+ *    are excluded.  If a library like libc should be included,
+ *    duplicate the probe definitions and in the copied lines,
+ *    replace a.out by libc.so.
+ *    For example:
+ *      pid$target:a.out::entry,
+ *      pid$target:libc.so::entry
+ *        { <statements> }
+ *
+ *    - It is assumed that a function called main is executed.
+ *    If this is not the case, this is not a critical error.
+ *    The first probe is used to capture the name of the executable,
+ *    but this is not essential.  The probe and printf() statement
+ *    can safely be removed, or replaced by a suitable alternative.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and have
+ *  printa() print the aggregation data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Store the name of the target application.  The probe is restricted
+ *  to main only, because the exec name needs to be captured only once.
+ */
+pid$target:a.out:main:entry
+{
+  executable_name = execname;
+}
+
+/*
+ *  Use 4 aggregations to store the total number of function calls, the
+ *  counts per function and per thread, both seperately and differentiated
+ *  by thread and function.
+ */
+pid$target:a.out::entry
+{
+  @total_call_counts                          = count();
+  @call_counts_per_function[probefunc]        = count();
+  @call_counts_per_thr[tid]                   = count();
+  @counts_per_thr_and_function[tid,probefunc] = count();
+}
+
+/*
+ *  Print the results.  Use format strings to create a table lay-out.
+ */
+END {
+  printf("===========================================\n");
+  printf("      Function Call Count Statistics\n");
+  printf("===========================================\n");
+  printf("Name of the executable: %s\n" ,executable_name);
+  printa("Total function calls  : %@d\n",@total_call_counts);
+
+  printf("\n===========================================\n");
+  printf("      Aggregated Function Call Counts\n");
+  printf("===========================================\n");
+  printf("%-25s %12s\n\n","Function name","Count");
+  printa("%-25s %@12d\n",@call_counts_per_function);
+
+  printf("\n===========================================\n");
+  printf("      Function Call Counts Per Thread\n");
+  printf("===========================================\n");
+  printf("%-7s %12s\n\n", "TID","Count");
+  printa("%-7d %@12d\n",@call_counts_per_thr);
+
+  printf("\n===========================================\n");
+  printf("      Thread Level Function Call Counts\n");
+  printf("===========================================\n");
+  printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
+  printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
+}
diff --git a/examples/io-cast-net.d b/examples/io-cast-net.d
new file mode 100755
index 00000000..9a933b78
--- /dev/null
+++ b/examples/io-cast-net.d
@@ -0,0 +1,78 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    io-cast-net.d - get an overview of read and write calls
+ *
+ *  SYNOPSIS
+ *    sudo ./io-cast-net.d -c "<name-of-app> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script lists all the functions in libc that include
+ *    one of the following keywords in their name:
+ *      read, write, open, close
+ *    This is a fairly wide net that is cast to find out which
+ *    libc functions are used to open, or close a file, and which
+ *    functions from libc are used to read from, or write to a
+ *    file.
+ *    The number of calls to each of these functions is counted,
+ *    plus the total of all such calls.
+ *
+ *  NOTES
+ *    - This is an example how you can find out more about a certain
+ *    area of interest.  Wildcards and empty fields in the probe
+ *    definition are ideally suited for this, but be aware not to
+ *    overask and create a huge number of probes.
+ *
+ *    - This script could be the first step to analyze the I/O
+ *    behaviour of an application, or command.
+ *
+ *    First, this script, io-cast-net.d, may be used on an application
+ *    to identify all functions with read, write, open, and close
+ *    in the name.  This list may then be examined to manually select
+ *    the particular functions to trace in this application.
+ *    An example of this approach is in script io-stats.d.
+ *
+ *    - Wildcards are used and as a result, more functions may be listed
+ *    than you might be interested in, but in this way you will see all
+ *    of them and can make a selection which one(s) to focus on.
+ *
+ *    - There are no print statements in this example, because we would
+ *    like to show the default output from DTrace.  In particular, the
+ *    feature that, when the tracing has finished, all aggregations are
+ *    printed by default.  Since this example only uses aggregations,
+ *    it means that all results are printed upon completion.
+ */
+
+/*
+ *  These are the probes used to query the system and see those function
+ *  calls.  The first aggregation has a key that consists of 2 fields:
+ *  the name of the function and the module name.  Thanks to this key,
+ *  the results are differentiated by the function name and the name
+ *  of the module.
+ *
+ *  The latter is always going to be libc.so, e.g. libc.so.6.  We
+ *  have included it in the key for the aggregation to show how
+ *  to make a script more flexible.  In case the module name is
+ *  left out in the probe definition, or changed, the script will
+ *  still work and print the module name(s) of the probe(s) that
+ *  fired.
+ *
+ *  The second aggregation has no key.  That means that the count is
+ *  incremented each time one of the probes fires.  That will give us
+ *  the total count across all the probes that fired.
+ *
+ *  The output shows a table with 3 columns: the name of the function,
+ *  the module (which should be libc), and the call count.  The results
+ *  are sorted by the count.  This table is followed by a single number.
+ *  It is the total of number of calls that have been traced.
+ */
+
+pid$target:libc.so:*read*:entry,
+pid$target:libc.so:*write*:entry,
+pid$target:libc.so:*open*:entry,
+pid$target:libc.so:*close*:entry
+{
+  @target_calls[probefunc,probemod] = count();
+  @total_count                      = count();
+}
diff --git a/examples/io-stats.d b/examples/io-stats.d
new file mode 100755
index 00000000..30e1e64a
--- /dev/null
+++ b/examples/io-stats.d
@@ -0,0 +1,280 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    io-stats.d - show several I/O related statistics
+ *
+ *  SYNOPSIS
+ *    sudo ./io-stats.d -c "<name-of-app> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script shows several I/O statistics for the target
+ *    application, or command.  Among others, the filename, the
+ *    file descriptor, or stream it is connected to, the number
+ *    of bytes read, written, or both, are printed.
+ *
+ *  NOTES
+ *    - All the probes but the END probe in this script are based
+ *      upon the pid provider.
+ *
+ *    - This script is quite elaborate and has several probes.
+ *    More specifically, in alphabetical order, these are the
+ *    functions from the libc library that are traced:
+ *     close()
+ *     fclose()
+ *     fopen()
+ *     fread()
+ *     fwrite()
+ *     open()
+ *     pwrite()
+ *     read()
+ *    In the probes, we rely on the information from the man pages
+ *    for these functions to identify arguments of interest and
+ *    the return values.
+ *
+ *    - Not all of the probes may be relevant to your case.  While
+ *    no harm is done if a probe does not fire, the associated
+ *    aggregation(s) will be empty, but still printed.  This is because
+ *    we use printa() to print the aggregation(s).  If printa() is not
+ *    used for an aggregation, nothing is printed if it is empty.  You
+ *    can of course always remove such irrelevant probes and related
+ *    printa() and printf()  statements.
+ *
+ *    - A related script is io-cast-net.d.  You may want to run this
+ *    first to cast a fairly wide net and explore which open, close,
+ *    read and write functions are called when executing the target.
+ *
+ *    - All print statements are in the END probe.  On purpose
+ *    several different format strings are used.  This is done to
+ *    demonstrate the flexibility in presenting the results.
+ *
+ *    Note that we do not need to include these print statements,
+ *    because aggregations that are not explictly printed, are
+ *    automatically printed when the script terminates.  The reason
+ *    we print them ourselves is to have control over the lay-out.
+ *    Another thing we do is to print more than one aggregation
+ *    with a single printa() statement.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and have
+ *  printa() print the aggregation data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Capture the name of the file that needs to be opened, in the call
+ *  to any function that starts with fopen.  The first argument to
+ *  this function contains the name of the file to be opened.
+ *  As arg0 is of type integer, it is converted to a string, copied
+ *  from user space and stored in the thread-local variable fname_fopen.
+ */
+pid$target:libc.so:fopen*:entry
+{
+  self->fname_fopen = copyinstr(arg0);
+}
+
+/*
+ *  This probe is nearly identical to the one above, but note that
+ *  for this probe, the name of the thread-local variable is slightly
+ *  different and called fname_open.
+ */
+pid$target:libc.so:open:entry
+{
+  self->fname_open = copyinstr(arg0);
+}
+
+/*
+ *  This is the return probe for any of the fopen calls.  The predicate
+ *  checks that fname_fopen has been set and if so, in the clause the
+ *  count is updated and the new value is stored in an aggregation
+ *  with 3 fields: the name of the function, the name of the
+ *  file and the return value of the function, which is stored
+ *  in arg1.
+ *  Note that we can indeed access this file name.  Although set in the
+ *  corresponding entry probe, a thread-local variable is accessible in
+ *  the data space of the corresponding thread and so can be read, or
+ *  written, here.
+ *  The third field in the aggregation is arg1.  This is the return value
+ *  of the function and is the pointer to the stream.
+ *  Since variable fname_fopen is no longer needed, the storage is freed.
+ */
+pid$target:libc.so:fopen*:return
+/ self->fname_fopen != 0/
+{
+  @file_pointer[probefunc,self->fname_fopen,arg1] = count();
+  self->fname_fopen = 0;
+}
+
+/*
+ *  This probe is nearly identical to the previous probe.  Other than
+ *  the name of the thread-local variable, the difference is in the
+ *  name of the aggregation.  This is because the return value, the
+ *  file descriptor, is of type integer.  This means that we need
+ *  a different format string when printing this field.
+ */
+pid$target:libc.so:open:return
+/ self->fname_open != 0/
+{
+  @file_descriptor[probefunc,self->fname_open,arg1] = count();
+  self->fname_open = 0;
+}
+
+/*
+ *  This probe stores the name of the function, which is fclose(),
+ *  and the argument, the pointer to the stream.
+ */
+pid$target:libc.so:fclose:entry
+{
+  @fclose_stream[probefunc,arg0] = count();
+}
+
+/*
+ *  This probe is very similar to the one above.  Again, the difference
+ *  is in the name of the aggregation, and the argument which is the
+ *  file descriptor.  It is of type integer.  We need to know this when
+ *  printing the key.
+ */
+pid$target:libc.so:close:entry
+{
+  @close_fd[probefunc,arg0] = count();
+}
+
+/*
+ *  One of the functions traced, is pwrite().  The first argument, arg0,
+ *  is the file descriptor.  The third argument is arg2.  This contains
+ *  the number of bytes requested to be written.
+ *  The aggregation function sum() is used to sum up all those byte counts.
+ *  As a result, the aggregation contains the total number of bytes
+ *  requested to be written to the file connected to the file descriptor.
+ */
+pid$target:libc.so:pwrite:entry
+{
+  @pwrite_bytes[probefunc,arg0] = sum(arg2);
+}
+
+/*
+ *  The pwrite() function returns the number of bytes actually written.
+ *  This value is added to the existing contents of the aggregation.  The
+ *  name of the function, pwrite, is the only field in the key, so this
+ *  aggregation contains the total number of bytes written by pwrite().
+ */
+pid$target:libc.so:pwrite:return
+{
+  @pwrite_total_bytes[probefunc] = sum(arg1);
+}
+
+/*
+ *  This probe accumulates the number of bytes the read() function requests
+ *  to be read.  The aggregation is differentiated by the file descriptor.
+ *  This means that we get the totals on a per file descriptor basis.
+ *  We also store the file descriptor in a thread-local variable called fd.
+ *  A thread-lcoal variable is used because we would like to reference it in
+ *  the return probe for this function.
+ */
+pid$target:libc.so:read:entry
+{
+  self->fd = arg0;
+  @bytes_requested[probefunc,self->fd] = sum(arg2);
+}
+
+/*
+ *  The read() function returns the actual number of bytes read.  These
+ *  values are accumulated in aggregation bytes_actually_read that includes
+ *  the file descriptor in the key.
+ *  We also accumulate the total number of bytes actually read across all
+ *  the file descriptors and store this in aggregation total_bytes_read.
+ *  Note that this aggregation has no key.
+ *  Since thread-local variable fd is no longer needed, the storage is
+ *  freed.
+ */
+pid$target:libc.so:read:return
+{
+  @bytes_actually_read[probefunc,self->fd] = sum(arg1);
+  @total_bytes_read                        = sum(arg1);
+  self->fd = 0;
+}
+
+/*
+ *  This is a shared clause for the probes for the fread() and fwrite()
+ *  functions.  We can share the clause, because the arguments and return
+ *  value are the same for both functions.
+ */
+pid$target:libc.so:fread:entry,
+pid$target:libc.so:fwrite:entry
+{
+/*
+ *  This probe traces the entry to functions fread() and fwrite().
+ *  A clause-local variable called comment is used to store a dynamically
+ *  generated string.  This string is then concatenated with the name of the
+ *  function, resulting in a string, stored in clause-local variable rw,
+ *  that depends on the function name in the probe.
+ */
+  this->comment = (probefunc == "fread") ?
+                   "read by " : "written by ";
+  this->rw = strjoin(this->comment,probefunc);
+
+/*
+ *  The aggregation has a key that consists of the pointer to the stream and
+ *  the generated string.  This aggregation accumulates the product of the
+ *  size in bytes and the number of elements, which is the total number of
+ *  bytes read, or written.
+ */
+  @total_byte_count_frw[arg3,this->rw] = sum(arg1*arg2);
+}
+
+/*
+ *  This probe accumulates the return value of the fread() function, which
+ *  is the number of elements read.  This number is accumulated across all
+ *  pointers to streams.
+ */
+pid$target:libc.so:fread:return
+{
+  @fread_total_elements[probefunc] = sum(arg1);
+}
+
+/*
+ *  The output section where all the results are printed.  In one case,
+ *  we use 2 aggregations in the call to printa().  This is supported if
+ *  the key is the same.
+ *
+ *  Note that we do not need to include these print statements, because
+ *  aggregations that are not explictly printed, are automatically printed
+ *  when the script terminates.  The reason we print them ourselves is
+ *  to have control over the lay-out.
+ *  Another thing we do is to print more than one aggregation with a
+ *  single printa() statement.
+ */
+END
+{
+  printf("%8s %20s   %-15s %6s\n",
+               "Function","Filename","File pointer","Count");
+  printa("%8s %20s   0x%-13p %@6d\n",@file_pointer);
+
+  printf("\n%8s %20s   %-15s %6s\n",
+               "Function","Filename","File descriptor","Count");
+  printa("%8s %20s   %-15d %@6d\n",@file_descriptor);
+
+  printf("\n%8s   %-16s %7s\n","Function","Stream/FD","Count");
+  printa("%8s   0x%-14p %@7d\n",@fclose_stream);
+  printa("%8s   %-16d %@7d\n",@close_fd);
+
+  printf("\n");
+  printf("%8s %5s %14s\n","Function","FD","Bytes written");
+  printa("%8s %5d %@14d\n",@pwrite_bytes);
+  printa("Total bytes written by %s: %@ld\n",@pwrite_total_bytes);
+
+  printa("\nOn stream %p - Total bytes %s = %@ld\n",
+                                  @total_byte_count_frw);
+
+  printa("Total elements read by %s = %@ld\n",
+                                  @fread_total_elements);
+
+  printf("\n%33s\n","Bytes read");
+  printf("%8s %6s %10s %10s\n","Function","FD","Requested","Actual");
+  printa("%8s %6d %@10d %@10d\n",@bytes_requested,
+                                 @bytes_actually_read);
+  printa("\nTotal number of bytes read: %@d\n",@total_bytes_read);
+}
diff --git a/examples/sched-simple.d b/examples/sched-simple.d
new file mode 100755
index 00000000..d653276c
--- /dev/null
+++ b/examples/sched-simple.d
@@ -0,0 +1,82 @@
+#!/usr/sbin/dtrace -s
+/*
+ *  NAME
+ *    sched-simple.d - count how often the target was on/off the CPU
+ *
+ *  SYNOPSIS
+ *    sudo ./sched-simple.d -c <target>
+ *
+ *  DESCRIPTION
+ *    This script uses the sched provider to count how often the
+ *    target proces was scheduled on and off the CPU.  The target
+ *    can be an application, or any command.
+ *    The information is given for all individual threads used by
+ *    the target, as well as across all the threads.
+ *
+ *  NOTES
+ *    There are 2 aggregations.  The one with 2 fields in the
+ *    key, thr_count_states, uses the thread ID as the first field.
+ *    By configuring printa() through pragmas to print the data
+ *    sorted by the first field, the results for this aggregation
+ *    are shown on a per thread basis.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and have
+ *  printa() print the aggregation data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  These are 2 probes from the sched provider that share a clause.
+ *  Without a predicate, these probes will fire as soon as any
+ *  process goes on/off the CPU.  That will work fine, but in this
+ *  case we use a predicate to restrict the probing to the target
+ *  application, or command.
+ *
+ */
+sched:::on-cpu,
+sched:::off-cpu
+/ pid == $target /
+{
+/*
+ *  We know that the probe name is either on-cpu or off-cpu.  This
+ *  is used to assign a different string to clause-local variable
+ *  called state.  This variable is used in the key for the aggregations
+ *  below.
+ */
+  this->state = (probename == "on-cpu") ?
+                  "scheduled on" : "taken off";
+
+/*
+ *  The 2 aggregations below are used to count how often the probes fired.
+ *  The difference is in the key.  The first aggregation, count_states,
+ *  does not use the thread ID in the key.  It counts across all
+ *  threads.  In contrast with this, the second aggregation,
+ *  thr_count_states, differentiates the counts by the thread ID.
+ */
+  @count_states[this->state]         = count();
+  @thr_count_states[tid,this->state] = count();
+}
+
+/*
+ *  Print the results.  We use printf() to print a header.  For both
+ *  aggregations, a formatted printa() statement is used.  The
+ *  printf() statement in between the 2 printa() statements is used
+ *  to separate the 2 blocks with results.
+ *
+ *  Note that we do not need to include these print statements,
+ *  because aggregations that are not explictly printed, are
+ *  automatically printed when the script terminates.  The reason
+ *  we print them ourselves is to have control over the lay-out.
+ */
+END
+{
+  printf("%8s %-20s %6s\n","TID","State","Count");
+  printf("====================================\n");
+  printa("%8d %-12s the CPU %@6d\n",@thr_count_states);
+  printf("\n");
+  printa("Total count %12s: %@d\n",@count_states);
+}
diff --git a/examples/sched-stats.d b/examples/sched-stats.d
new file mode 100755
index 00000000..c932b010
--- /dev/null
+++ b/examples/sched-stats.d
@@ -0,0 +1,191 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    sched-stats.d - display various scheduler statistics
+ *
+ *  SYNOPSIS
+ *    sudo ./sched-stats.d -c "<name-of-app> [app options]" <threshold>
+ *
+ *  DESCRIPTION
+ *    This script shows several thread-scheduling statistics that
+ *    were collected while the target application, or command, was
+ *    running.
+ *
+ *    For good performance, a thread should run on the same CPU,
+ *    or at least in the same NUMA node for as long as possible.
+ *    In case it is taken off the CPU, it should be scheduled
+ *    back on the same CPU, or at least in the same NUMA node.
+ *
+ *    The information printed, shows the scheduling statistics
+ *    for any (multithreaded) application:
+ *
+ *    - For each thread, a histogram of the on-cpu times is shown.
+ *
+ *    - This is followed by a table with the overall timing statistics.
+ *    For each thread, the total on-cpu time is given, plus the
+ *    minimum and maximum on-cpu time.
+ *
+ *    - The script takes one parameter.  This is a threshold value.
+ *    It is a lower limit (in microseconds) on the on-cpu time.
+ *    For each thread it is reported how often the on-cpu time was
+ *    at, or below, this value.  This table might point at threads
+ *    that are falling behind on a (heavily loaded) system.
+ *
+ *    - The last 2 tables give information on the thread affinity.
+ *    The first table of these 2 is sorted by thread ID and shows the
+ *    CPU(s) used by each thread, as well how often the thread was
+ *    scheduled on the CPU, and taken off again.
+ *    The second table of these 2 shows the same information, but now
+*     from a CPU centric view.
+ *
+ *  NOTES
+ *    This script works with any target application or command.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and have
+ *  printa() print the aggregation data sorted by the first field.
+ */
+
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Place the argument from the command line in a global variable
+ *  for better readability.
+ */
+BEGIN
+{
+  time_threshold = $1;
+}
+
+/*
+ *  An on-cpu probe with a predicate to ensure that the probe only
+ *  fires when the target is scheduled on the CPU.
+ */
+sched:::on-cpu
+/ pid == $target /
+{
+/*
+ *  Set the start value of the timer.  Since each thread needs
+ *  to have its own timer, we use a thread-local variable.
+ */
+  self->ts_start = timestamp;
+
+/*
+ *  There are 2 aggregations.  Both increment their counter each
+ *  time that this probe fires.  The thread ID (in tid) and CPU ID
+ *  (in curcpu->cpu_id) are used to define the key.
+ *
+ *  The difference between the 2 aggregations is that the fields in
+ *  the key have been swapped.  Given that printa() has been configured
+ *  to sort the data by the first column, the first aggregation shows a
+ *  thread centric view, while the second one has a CPU ID centric view.
+ */
+  @thr_cpu_id_on_cpu[tid,curcpu->cpu_id] = count();
+  @cpu_id_thr_on_cpu[curcpu->cpu_id,tid] = count();
+}
+
+/*
+ *  This is the first of 2 probes using off-cpu.  Again a predicate is
+ *  used to restrict the data to the target command.
+ */
+sched:::off-cpu
+/ pid == $target /
+{
+/*
+ *  The process/thread is about to go off CPU.  Now is the time to
+ *  record how long the thread has been running on the CPU.
+ *  The value is converted from nanoseconds to microseconds (us) and
+ *  stored in a clause-local variable.
+ */
+  this->time_on_cpu = (timestamp - self->ts_start)/1000;
+
+/*
+ *  This variable is used to update 4 aggregations: the histogram of
+ *  the on-CPU times, the total on CPU time, plus the minimum and
+ *  maximum time on the CPU.
+ */
+  @timings[tid]    = quantize(this->time_on_cpu);
+  @total_time[tid] = sum(this->time_on_cpu);
+  @min_time[tid]   = min(this->time_on_cpu);
+  @max_time[tid]   = max(this->time_on_cpu);
+
+/*
+ *  These 2 aggregations are very similar to those used in the
+ *  on-cpu probe.
+ */
+  @thr_cpu_id_off_cpu[tid,curcpu->cpu_id] = count();
+  @cpu_id_thr_off_cpu[curcpu->cpu_id,tid] = count();
+
+/*
+ *  Free the storage for the thread-local variable since it is no
+ *  longer needed.
+ */
+  self->ts_start = 0;
+}
+
+/*
+ *  This is the second off-cpu probe.  It has a different and somewhat
+ *  more complicated predicate.
+ *  The clause is only executed for the target command and if the time
+ *  on the CPU is below the user controllable threshold value.
+ *  We basically record and count the event, but of course any other
+ *  action can be taken here.
+ *  An aggregation is used to store the data.  The thread ID (tid)
+ *  is used as a key and we increment the counter.  This produces
+ *  a count for each thread.
+ */
+sched:::off-cpu
+/ pid == $target && this->time_on_cpu <= time_threshold /
+{
+  @thr_below[tid] = count();
+}
+
+/*
+ *  This is where all results are printed.  It is all quite
+ *  straightforward, but note that in three cases, multiple
+ *  aggregations are printed with a single printa().  As long as the
+ *  keys are the same, this is supported and makes it possible to
+ *  print multiple columns with values.
+ *
+ *  Note that we do not need to include these print statements,
+ *  because aggregations that are not explictly printed, are
+ *  automatically printed when the script terminates.  The reason
+ *  we print them ourselves is to have control over the lay-out.
+ *  Another thing we do is to print more than one aggregation
+ *  with a single printa() statement.
+ */
+END
+{
+  printf("Thread times on the CPU (us)\n");
+  printa(@timings);
+
+  printf("\n=====================================\n");
+  printf("%10s %26s\n","TID", "Times on the CPU (us)");
+  printf("%21s %6s %8s\n","Total","Min","Max");
+  printf("=====================================\n");
+  printa("%10d %@10d %@6d %@8d\n",@total_time,@min_time,@max_time);
+
+  printf("\n=====================================\n");
+  printf("Thread ON CPU time threshold: %d us\n",time_threshold);
+  printf("=====================================\n");
+  printf("%8s %26s\n","TID","Count below threshold");
+  printa("%8d %@14d\n",@thr_below);
+
+  printf("\n=====================================\n");
+  printf("%10s  %8s %11s\n","TID","CPU ID","Count");
+  printf("%37s\n","On CPU  Off CPU");
+  printf("=====================================\n");
+  printa("%10d  %8d %@7d %@8d\n",@thr_cpu_id_on_cpu,
+                                 @thr_cpu_id_off_cpu);
+
+  printf("\n=====================================\n");
+  printf("%8s  %10s %11s\n","CPU ID","TID","Count");
+  printf("%37s\n","On CPU  Off CPU");
+  printf("=====================================\n");
+  printa("%8d  %10d %@7d %@8d\n",@cpu_id_thr_on_cpu,
+                                 @cpu_id_thr_off_cpu);
+}
diff --git a/examples/thread-ids.d b/examples/thread-ids.d
new file mode 100755
index 00000000..eafde492
--- /dev/null
+++ b/examples/thread-ids.d
@@ -0,0 +1,168 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    thread-ids.d - show the mapping between Pthread IDs and tid values
+ *
+ *  SYNOPSIS
+ *    sudo ./thread-ids.d -c "<name-of-app> [app options]"
+ *
+ *  DESCRIPTION
+ *    This script assumes that the target uses the Pthreads library
+ *    to create one or more threads.  It shows the mapping of the
+ *    Pthread thread IDs and the thread ID, as returned in the tid
+ *    built-in variable.
+ *
+ *  NOTES
+ *    - In addition to showing how to uncover this mapping, this
+ *    script also shows a technique how to retrieve a value from
+ *    a pointer argument in a function call.
+ *
+ *    In this case, this is the thread ID that pthread_create()
+ *    returns in its first argument.
+ *
+ *    This is from the man page for pthread_create():
+ *
+ *    int pthread_create(pthread_t *restrict thread,
+ *                        const pthread_attr_t *restrict attr,
+ *                        void *(*start_routine)(void *),
+ *                        void *restrict arg);
+ *
+ *    We need to capture the contents of *thread.
+ *
+ *    In this case, we cannot use the built-in tid variable
+ *    within pthread_create(), because typically, this function
+ *    is executed by one thread, the main thread.  This means
+ *    that the value in tid is the thread ID of this main thread,
+ *    but we need to have the value of the thread that is created
+ *    as a result of calling pthread_create().  As shown below,
+ *    this can be done by tracing clone3(), which is called by
+ *    pthread_create().
+
+ *    - It is assumed that a function called main is executed.
+ *    If this is not the case, this is not a critical error.
+ *    The first probe is used to capture the tid value for the main
+ *    program.  This thread is however not created by function
+ *    pthread_create() and therefore this part of the script is
+ *    not essential.
+ *    This is why this probe and corresponding printf() statement
+ *    in the END probe can safely be removed, or replaced by a
+ *    suitable alternative.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command and have
+ *  printa() print the aggregation data sorted by the first field.
+ */
+#pragma D option quiet
+#pragma D option aggsortkey=1
+#pragma D option aggsortkeypos=0
+
+/*
+ *  Declare a thread-local variable.  This is to ensure that the
+ *  compiler sees it before it is referenced.
+ */
+self int clone_tid;
+
+/*
+ *  Store the thread ID of the main thread.
+ */
+pid$target:a.out:main:entry
+{
+  tid_main = tid;
+}
+
+/*
+ *  Variable pthr_id_p captures the first argument of the call to
+ *  pthread_create().  This is a pointer, but we can't dereference
+ *  it here, because the contents this pointer points to, are only
+ *  available upon return.
+ *  This is solved by storing the pointer here.  In the return probe
+ *  for this function, we can then dereference the pointer.
+ */
+pid$target:libc.so:pthread_create:entry
+{
+  self->pthr_id_p = (int64_t *) arg0;
+}
+
+/*
+ *  We actually know that clone3() is called.  By using the wildcard
+ *  here, the script continues to work in case this number changes in
+ *  the future.
+ */
+pid$target:libc.so:clone*:return
+/ self->pthr_id_p !=NULL /
+{
+/*
+ *  We know that one of the clone functions is called from within
+ *  pthread_create() and it returns the thread ID that DTrace stores
+ *  in the tid variable.
+ *  This is why the return value, which is stored in arg1, is copied
+ *  into a thread-local variable called clone_tid.  This variable is
+ *  then referenced in the return probe for pthread_create().
+ */
+  self->clone_tid = arg1;
+}
+
+/*
+ *  This is where things come together.
+ *
+ *  We already have the value for the thread ID as used by DTrace.
+ *  It is stored in thread-local variable clone_tid.
+ *
+ *  Now we can capture the Pthreads thread ID.
+ *
+ *  There is one more thing to this though.  Below we use an
+ *  aggregation to store the results (and ignore the count when
+ *  printing the results), but this is not strictly necessary.
+ *
+ *  The approach chosen here allows us to control the sorting of
+ *  the results.  In this case the sort field has been set to the
+ *  Pthreads thread ID, but this can easily be changed.
+ *
+ *  If there is no need to print the data sorted, a simple printf()
+ *  will do.  All that needs to be done then is to print the two
+ *  variables this->pthr_id and self->clone_tid.
+ *
+ */
+pid$target:libc.so:pthread_create:return
+{
+/*
+ *  We are about to return from pthread_create() and can dereference
+ *  the pointer.
+ *  Before we do so, the data needs to be copied from user space into
+ *  the kernel.  Since this is a 64 bit address, 8 bytes are copied.
+ *  The value is what pthread_create() returns in its *thread first
+ *  argument, which is the Pthreads thread ID.
+ *  This gives us both thread IDs and they are used in the key for the
+ *  aggregation called thread_mapping.
+ */
+  this->pthr_id = *(int64_t *) copyin(*self->pthr_id_p,8);
+  @thread_mapping[this->pthr_id,self->clone_tid] = count();
+
+/*
+ *  Free the storage for the thread-local variables.
+ */
+  self->pthr_id_p      = 0;
+  self->clone_tid      = 0;
+}
+
+/*
+ *  The aggregation is printed in the END probe.  We use printf()
+ *  statements to print the thread ID of the main program and the
+ *  table header.
+ *  Note that there is no format field for the value for the
+ *  aggregation.  As explained above, the value is not relevant
+ *  in this case.
+ *
+ *  Note that we do not need to include these print statements,
+ *  because aggregations that are not explictly printed, are
+ *  automatically printed when the script terminates.  The reason
+ *  we print them ourselves is to have control over the lay-out.
+ */
+END
+{
+  printf("Thread ID of main program: %d\n\n",tid_main);
+  printf("%16s <=> %-9s\n\n","Pthreads ID","Thread ID");
+  printa("%16d <=> %-9d\n",@thread_mapping);
+}
diff --git a/examples/var-scope.d b/examples/var-scope.d
new file mode 100755
index 00000000..8a99bcc3
--- /dev/null
+++ b/examples/var-scope.d
@@ -0,0 +1,121 @@
+#!/usr/sbin/dtrace -s
+
+/*
+ *  NAME
+ *    var-scope.d - initialize, update and print variables
+ *
+ *  SYNOPSIS
+ *    sudo ./var-scope.d -c <target>
+ *
+ *  DESCRIPTION
+ *    This script demonstrates some of the scoping rules.  It
+ *    shows the behaviour of global and clause-local variables.
+ *    The target can be an application, or any command.
+ *
+ *  NOTES
+ *    - Other than the BEGIN and END probe used here, there are
+ *    2 more probes for the fopen() function, but you can use any
+ *    probe you like, or no additional probes at all.  You are
+ *    encouraged to experiment with this example and make changes.
+ *
+ *    - In case this example is used with the date command, you will
+ *    see something like this:
+ *
+ *    $ sudo ./var-scope.d -c date
+ *    In BEGIN
+ *        A = 10 B = 20
+ *        this->C = 60
+ *    In fopen - return
+ *        A = 11 B = 21
+ *    <output from the date command>
+ *    In END
+ *        A = 11 B = 21
+ *    $
+
+ *    - Thread-local variables are not demonstrated here, but many
+ *    of the other examples, like io-stats.d, make extensive use
+ *    of them.  Please check one of those scripts if you would like
+ *    to learn more how to use thread-local variables.
+ *
+ *    - Below, the workings of each probe is explained.  Since the
+ *    results depend on the command that is traced, we base the
+ *    explanations on the output from the example above.
+ */
+
+/*
+ *  Suppress the default output from the dtrace command.
+ */
+#pragma D option quiet
+
+/*
+ *  This demonstrates how to declare a variable outside of a clause.
+ *  Variable B is declared to be of type int64_t.  This is a global
+ *  variable.  It is initialized to zero by default.
+ */
+int64_t B;
+
+/*
+ *  In this clause for the BEGIN probe, A is initialized to 10 and B
+ *  is given a value of 20.  Both are global variables.  Variable C is
+ *  a clause-local variable initialized to 30.
+ */
+BEGIN
+{
+  A = 10;
+  B = 20;
+  this->C = 30;
+}
+
+/*
+ *  In this clause for the BEGIN probe, clause-local variable C is updated
+ *  to a value of 60.  This demonstrates that clause-local variables are
+ *  local to the set of clauses executed for a particular probe firing.
+ *  This set is executed in the order they appear in the program.
+ *
+ *  Here, there are 2 clauses for the BEGIN probe.  The printed values
+ *  in the example above confirm this update for C, as well as the initial
+ *  values for A and B.
+ */
+BEGIN
+{
+  this->C += 30;
+  printf("In %s\n",probename);
+  printf("\tA = %d B = %d\n",A,B);
+  printf("\tthis->C = %d\n",this->C);
+}
+
+/*
+ *  The clause in this probe updates A.  Since this is a global variable,
+ *  this change is visible to all probes that fire after this probe has fired.
+ */
+pid$target::fopen:entry
+{
+  A += 1;
+}
+
+/*
+ *  The clause in this probe updates B and prints both A and B.  The
+ *  probefunc (fopen) and probename (return) are printed first, followed by
+ *  the values for A and B.
+ *  We are in the return probe here, so we know that the entry probe has
+ *  fired too.  This means that A has been updated as well.
+ *  This is exactly what we see in the output above: A is 11 and B is 21,
+ *  as it has just been updated.
+ *  Note that C is not visible here, because it is local to the BEGIN probe.
+ */
+pid$target::fopen:return
+{
+  B += 1;
+  printf("In %s - %s\n",probefunc,probename);
+  printf("\tA = %d B = %d\n",A,B);
+}
+
+/*
+ *  Both A and B are global variables and are visible in the END probe.  The
+ *  final values are printed here.
+ */
+END
+{
+  printf("In %s\n",probename);
+  printf("\tA = %d B = %d\n",A,B);
+}
-- 
2.47.3

