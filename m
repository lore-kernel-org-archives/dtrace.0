Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A67DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909172; cv=fail; b=lHG6Rf73GIDQLQ1jVHx2T//JvPABZV1FZVQC/3B57lBDlYRdQ6+CJd+EKX7KVxjt5wMlMDlTxDDFpQ8ySZQJCsjTzmStgItsgu5Bz/iRmtt8qKsnsfL8q9KNfRdLoJhQmRNt7onTFeXqqfH/XqYVTriYfuG/xspxFHXLqyOo7H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909172; c=relaxed/simple;
	bh=N537RSU1sfRv+a/hVNsFDKnJ6BTawCimhHXuul2I9nA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GwzU16n1laKLKaBk7OcsBjlCkS4KaVoVA/fqm4G4TBBzvo9j0hd2V/fxuZk5pt2cOa+EMOlzGc/B+wxB6T2EglRYrgTASofppui9i4oEbnBW17Oh4cryW5eebBbbvv3dA94rlka/GBRaZ1Rdzdxl/a3D1RQ1PWr7dqj0buJLvEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ByM7nMv3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M9wUT6z2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ByM7nMv3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M9wUT6z2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fVok028729
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=s6IuiZDUvtZfYy+huTJzh5gTjq9UeDXk4afXCuvBWhc=; b=
	ByM7nMv31Nqz8hNgbrtZv10EKG1uiFalGgEdRr95x2k+1uPoGc9IHyZBv1u7GpxU
	ijmpweay8v7CUExomA6l6ATDgUGmfkpHn8bSo7iHMJkTjpuJ7LII18y7QwX2QHSV
	ibrQxUf5XapgTB2VnfBCZvFlKafcBMMdEfL8yXZTFjawi6iIPH4ax1N6aUqhJULR
	Xh4EvE6yPneBboF02FJzY4w2uGYzdVkbQweRxblHBjjtcnNCW2av8GawTeGjsSXA
	xZlPzOxTxvKHFFsaU3T480B3osfWr3hN8VzHOVwEbTZ+9HPd6xsc12jCZxFokcqC
	PjcaGKc8j6Su1u0zXfpQ+Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwv39rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5ADjQ017427
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5unkfu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvD6DylIn5xkD3H+e5oGAA/bzYipjKGMxnPSu5AJll5M7YB9wz4QXmRGrAQp205g0akaO3puxAi+tTAAeJinSrcnxKVOAOdNG7ThKcdwcNIpbhMvHVnSWcAB+BvukQagdAE9ue+csUxxn8AdvNwch9BpB+1+HHaD6ItAC0ae0Ge5ncQOrmgAcdzqMNnfkOwOsmJKVwOerRXa/Mp3UIhi4j88plVLhwbBfYXvTtbxIbG0eNc+G6KPx753KXc6soIL20OWQR71iaC72TDjJg/7cdFfU+88aFVAeLT3iEPpd+92WoN2NmMQMuKJXuM/jB6PHYQO8NgxhZ8LtdcsU2gJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6IuiZDUvtZfYy+huTJzh5gTjq9UeDXk4afXCuvBWhc=;
 b=IVTWUNE7sGjL4HGY78QScwMqDhGlJseh5q8KsSvfUM96NfI3Dh9KyYrzc09tAJuU7DAXrYuCyA6L4hBDkp3d5Vgu38Vnxv0/+odQmZvYt+/G9EQXXfGPjS+kC5tbZmRnd0vaKSVX/nOjFtpyj5mTDwMHBxOBGUry0CKWWFDwgWoP0PbdPVTC/x6QXZb2RVRFX7dCXXSw/Ii9cS+EGY+3kA1R6fm339zOh/2o8JlWcvQCefq8talESprdGbSTHz881ovMTm+uoVjBlygbHOjTmOPwikpf7LiMKx88vAAazDTU9Yf28IBckNjuqmZC2G+3KlO+uo7/GZTGxBBVXPt+mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6IuiZDUvtZfYy+huTJzh5gTjq9UeDXk4afXCuvBWhc=;
 b=M9wUT6z2y0pIAEkTQ4dy2Q9HUoJ7b3HglbRiQhyQ9ImVPXJU33q1hHTeJ8F+l9LqshJwl7H+OhiGRyHkFU3Q1uUlRpbFWuo4Bkqjbmt/U8SxIU/221kPLVZEsCMbRUAjPcyMx6c8ypFuy2SgmZvTj++6FCp3yuN2MReSm0+uDSg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:26:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:03 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/19] Change probes from having lists of clauses to lists of stmts
Date: Thu, 29 Aug 2024 01:25:40 -0400
Message-Id: <20240829052558.3525-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0381.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 61991543-b50f-45e1-877a-08dcc7eb12f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eZoYXPbqIIhk/lDcbnMnYBBRDZoSbaC3uqY6PR+arLrCqJBq1Tm9KyRDd+xg?=
 =?us-ascii?Q?5936Xq4L5y7Zh3BMdnc4ML/Op2VRGFeHmaf2rfg7Bk3lpd1CW3LVexy6sCjO?=
 =?us-ascii?Q?eTTzVXofpTEV98P1csxX0vr4GhgUDb1z2wC6fJT3+NUF+0IlmIqavm4XBAUx?=
 =?us-ascii?Q?aUFX+997PpU0F9CRa55N95TS+2rQDImiu3t+Oh8ni/OEQoGzBUQ35+YIOOep?=
 =?us-ascii?Q?oJH9M6VrCiopa/2wZTiJVYysg3oXYcIoeRMSVglYYFbF/rAuCMCrmZ0JlWCz?=
 =?us-ascii?Q?Vk+r7juzBEkRnucCp1W8+BJVEs/En7iLyewmbUL1jnrZjVb7xU1v+YOB6XPR?=
 =?us-ascii?Q?cJaY7iBReIagFiCBSGxG5fxqIr84X+UrYDlP8ltq2/RisR0njLqKqTFGdlXU?=
 =?us-ascii?Q?uLZ/jbV4gV81Ucu4EEmOKHG7DMTxH+9phvJ8wGPHTyDCWsDU0w61bvUW+st3?=
 =?us-ascii?Q?N9iLxouAoJSak4s4ob6YlTTlAo12whghhhH9TbMbv1tdo2ZKr3ZumZ5e1VCU?=
 =?us-ascii?Q?6IajhgPElM0mzHnrbmB+rIdVXOu+xC+uImp6ncziELPH11pWlZYRYRiYK1nI?=
 =?us-ascii?Q?YRzK+06N0xyDCg9IL2TQFonyG3+LUWAyWhddpL4vIfQGP8GvDFn+dztdWIz8?=
 =?us-ascii?Q?XkNPg7RASlcJRfWAv8lTuQp+Fbo7bb0w6BHRDZAdHmUUVGTWPXjlYRR0qRg2?=
 =?us-ascii?Q?v3TKni+rVUFlpQpw6v2vuSzXrkYODL8WuK2rswCjdlJVjB78eR/7Vc0DmAmQ?=
 =?us-ascii?Q?zMJLpmGuxxXvKlSDUWJso31z7x7eZ2Xp0YItHRlOAJLStzL+3UUY/hI/amLd?=
 =?us-ascii?Q?6IQQs0Hvu6xjciSjCpQw42aFZ+xtXdHRiipUNMASWKWhtUN8unTBI5XhvmX/?=
 =?us-ascii?Q?j5Oq4uPVgCb3JPaQRcwL9mf64x9/w6RFcp/BUi99CTNfMJGY88xbU3OIeeuS?=
 =?us-ascii?Q?LdWcykFAB5FHFNlYLtKxnjY8+iTCr2xsUkizF3Yl5kV6/pydu2kwv3CFRdwP?=
 =?us-ascii?Q?1jQDS3TDT+eQGszlJKjdEDfy8ERaA8Uw6+kqiBhfGPdlV9mbU+W8mZOJbOo/?=
 =?us-ascii?Q?7vq9vnZU6wkzKD0o4NrvLhodbOvwqrYdtA5a5eWQ3BAJWSUXyqQOXqOFu/WL?=
 =?us-ascii?Q?sQ2+a1XFNnMjbkhCWtX2UVtnqDEaRE+kSSxykS0l7Sb4P1hOc7iZK2Cy8egS?=
 =?us-ascii?Q?ovouE51NxjQroPBV207j0z/r65vHqhMR2Rx5y/D0z0MsF8N0NUfLTLcRYKyu?=
 =?us-ascii?Q?ggqHqh76YGTe9vNP13972RRNLRzpu1Y65j/ieGZP+Cefa4P9PbhTM3F/RXEF?=
 =?us-ascii?Q?fRwlRqiBIJ1cmVED37mOpvUxwBIoHo2/3GYRGomeFnVHyA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hsWaogBW/T9LY8OT27g5md5WY1igj43XpxSTbxSAN8RkKwctLHB/1XVfc8pg?=
 =?us-ascii?Q?BZE7xwQEoL2apgVv2oennCk9LRZ4uFVMi1gI0dTiaYVY89QwVILLrM9JfBIF?=
 =?us-ascii?Q?517cBkXEOl8jJygVFTMS3V7tHRv6ZMUZAmZSVQ0hllDH6esGJsMo3K9zmO8h?=
 =?us-ascii?Q?FQ/N3izCjYXHpJrG42nd7O6BnyqaXuRTo2tfTSva/qbUte+WhjwnsP/lkXAM?=
 =?us-ascii?Q?Dp/z0UActzluUiOI7uh4EEK1JSOh4s1jJgqmHc3Rl57eQJKKroIpNamlWp/X?=
 =?us-ascii?Q?7m0AjvsSmdof3liXZcXJThrkBp7/kMpF/1KHRv8/7JL18urBg2blymCoZ223?=
 =?us-ascii?Q?T2mrdiONuYOy/Irr5+3Kyr2hGHg42L28h0S5vEVskGu5nsAi0Ha6RtsOH2wJ?=
 =?us-ascii?Q?QuoCWL4ugak9vb/g0v95V7cddu2KxBGZ2veLVT/XFmP1NaXT4/Dqv2q39vzw?=
 =?us-ascii?Q?6KqHUrrH9S4r2h/awHuZ+Q8aW7DX3NXSu57FtMogTsE8OGFTogsX0ixpp9NX?=
 =?us-ascii?Q?86kCW+Ls6qJueZhIof3B0w/DhlLGiEk1YyUfzueFDx2vuZIf67kJTRpk0y9q?=
 =?us-ascii?Q?wlB1/jn8h9y80yMSF75hd8esX0euuFDTnJ4Fhvl8+VaMpL/79uop0wSAAQ52?=
 =?us-ascii?Q?VeJ6NkBPEHPqnsHdszc5dI3rn4doX41p7xlRDl7yWhe1SO7a08W540Bs23xW?=
 =?us-ascii?Q?a0vgXuFzo9I2Vos+3V0/JChGkWy1bIXsToVN5NhKb6C8jGvLrVuBO9h5ELCz?=
 =?us-ascii?Q?8StAX25B2JMauzorbBFk0/9aRgECRRKc42mES8xVGV6tjmyYgO82XSNW3B9Y?=
 =?us-ascii?Q?SIZ5lPE2h9jHxcvDHxVoqEppyegIhbkWnEA9GmpKo6POdR8VPgyjhmuovrbw?=
 =?us-ascii?Q?om5v0uJTEhGF7bonl5/svSWdSUKd+1MCBa/AlisDeKIJoN2rUgLetO6OItuo?=
 =?us-ascii?Q?spyB79+sQg0vn55N1M6tgKF1uwUDCks/BkIZ8qd21DMYKhMRJ9TM7Isr39Ft?=
 =?us-ascii?Q?qsFFlsEeHNSi+ui6Ib6KqyJ8EpZAgyiMw6QvlWpuF0vJKglo9wxtZM7HeoFb?=
 =?us-ascii?Q?mUfIg5PpXGbu5nCVWuYsFT2t0jzxXcKz3Q2CSzmOsFmaLa3efulWmdK/v2QN?=
 =?us-ascii?Q?ry3V2darZ0fHFhH1GC1OLb9yoad3aPmN1ANTeCcDqHAyDvJKhyt5Y3Cp6eB2?=
 =?us-ascii?Q?y3GTS4g1b/prQqAE1cOCAtmKH2MzWfdqJa/xy5p1ih+MOwnPi2UsrZ+AsE42?=
 =?us-ascii?Q?+AqrhtjooQ9oXbx34zUYJOljJwfSm2NMhGXEFBPdkSBU/wNPGYau9xIUmC09?=
 =?us-ascii?Q?gNQFx5aB52kpCci5hDup0cUChXAXleaKTZ1AGtvyBeXFnrxUQ7PxqzdeRuB2?=
 =?us-ascii?Q?L3XeqSVK3zsbeCgINVBoSfnKejHg9tLhXlFU2vudZMhhvrQzWlmlNJnpiO7U?=
 =?us-ascii?Q?5UDmfB8HvtNeEH1PwrDLo4Mp+S1eTE63xXVoD5He8V1Cn8QrWJoTc8BSf+n8?=
 =?us-ascii?Q?CNTwT56DiCjfahwaE1cILtByQw20XWz5WiGXNteIzKjC6T5pRrsM7csUdOiP?=
 =?us-ascii?Q?9Je18TEIhMEMkSYHkmEhtOhvEQNdpYhuVbR3a2Js?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pgjk6Uw97VrDwzuj+VnL6ml/h4NkBAMVhBJ6LGiqr0IypI/z5IlMt9G/uq5Q3gVnO21t6IizAQj8Vc5Pyom49vOBopH0DnBDB7O9+pyzdapEI4mnqHE/UhLjlnuVzT2aZRqTRO6UBF1jAuMAHGlu3fStiH7n/AZNITNuOzEw6VM9RJ71d1gZ101jQgfcv8jepp61f4WZ+Z6r58701YpL+0HN4o64iWSgMoGNlUvVuWiNK+5xEEzgdyGMBe+aHqqqMrxWgdtaXc/HizWcKMGQgKE19ElUHmPq6G+p4y4roFa2wmrBcFIlhqA8a6D6tdtxVlUnXNJRLlfS/CcJ1duYAqZURm+yHs994Smk+haHv403Dk+vxafK3Ahn3n+iBMmAAECkPrlZtnlo3NogWbWEDRoh5iz0eUbBkMNrkhyaiw29JFhII1mA7VV95fS53uW7azMEr1ElG4NF+0lkFd6AC9Suj8I31gAW06LSWLhI/lfg840TMk32VgjvuwkjkxUbbMjvDE2/58GJo8PYBnFwQyDJtkoSpCvmTL94VRtJnUc/GNxAF4uzhoTt1eABrX+03SN6LQ+Eo9MBs2cdHhZqRQIi6xGEcnaXSLnJjoRjLks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61991543-b50f-45e1-877a-08dcc7eb12f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:03.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ar646tUHbi0akKO5tHmm/RA7FpDCQg7xsC2elXw7nS4I1C/y7Qjavg+igNkoI4pyUfEh1AOEY2ITf+UOmkpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: bPGyPkQ3FJ12cHqcvY8_yefIbfrDSCPc
X-Proofpoint-ORIG-GUID: bPGyPkQ3FJ12cHqcvY8_yefIbfrDSCPc

From: Eugene Loh <eugene.loh@oracle.com>

Each stmt has a clause and a probe description.  Traditionally,
we have added clauses to probes.  Further, we have generated an
enabled probe ID for each probe/clause combination, and the
consumer has use the EPID to determine the PRID as well as the
data descriptor for the clause.

In an up-coming patch, we will move to a new scheme, in which a
widened EPID will have the PRID in its upper 32 bits and a stmt
ID in the lower 32 bits.  The stmt ID will be used to identify
clauses to call as well as the data descriptor for the clause.

In this patch, change from probes having clauses associated
with them to having stmts.

We move the definition of dt_probe_clause_t in dt_probe.c to
be a definition of dt_probe_stmt_t in dt_impl.h so that the
type will become available for providers that will need it.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c      | 17 +++++----
 libdtrace/dt_impl.h    |  5 +++
 libdtrace/dt_probe.c   | 79 +++++++++++++++++++++++-------------------
 libdtrace/dt_probe.h   | 12 +++----
 libdtrace/dt_program.c |  8 ++---
 5 files changed, 66 insertions(+), 55 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 4fab8eed..a7861829 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -844,9 +844,10 @@ typedef struct {
 } dt_clause_arg_t;
 
 static int
-dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
+dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *arg)
 {
 	dt_irlist_t	*dlp = arg->dlp;
+	dt_ident_t	*idp = sdp->dtsd_clause;
 
 	/*
 	 *	if (*dctx.act != act)	// ldw %r0, [%r9 + DCTX_ACT]
@@ -874,14 +875,12 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp, dt_clause_arg_t *arg)
 }
 
 void
-dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
-			 dt_activity_t act)
+dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp, dt_activity_t act)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_clause_arg_t	arg = { dlp, act, pcb->pcb_exitlbl };
 
-	dt_probe_clause_iter(pcb->pcb_hdl, prp,
-			     (dt_clause_f *)dt_cg_call_clause, &arg);
+	dt_probe_stmt_iter(pcb->pcb_hdl, prp, (dt_stmt_f *)dt_cg_call_clause, &arg);
 }
 
 static int
@@ -990,9 +989,10 @@ dt_cg_tramp_epilogue_advance(dt_pcb_t *pcb, dt_activity_t act)
 }
 
 static int
-dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dt_ident_t *idp,
-			      dt_irlist_t *dlp)
+dt_cg_tramp_error_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_irlist_t *dlp)
 {
+	dt_ident_t *idp = sdp->dtsd_clause;
+
 	/*
 	 *	dt_error_#(dctx);	// mov %r1, %r9
 	 *				// call dt_error_#
@@ -1029,8 +1029,7 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
 	TRACE_REGSET("Trampoline: Begin");
 	emit(dlp, BPF_MOV_REG(BPF_REG_9, BPF_REG_1));
 
-	dt_probe_clause_iter(dtp, dtp->dt_error,
-			     (dt_clause_f *)dt_cg_tramp_error_call_clause, dlp);
+	dt_probe_stmt_iter(dtp, dtp->dt_error, (dt_stmt_f *)dt_cg_tramp_error_call_clause, dlp);
 
 	emit(dlp, BPF_MOV_IMM(BPF_REG_0, 0));
 	emit(dlp, BPF_RETURN());
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 44dd1415..98fddc23 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -258,6 +258,11 @@ typedef struct dt_percpu_drops {
 
 typedef uint32_t dt_version_t;		/* encoded version (see below) */
 
+typedef struct dt_probe_stmt {
+	dt_list_t		list;
+	dtrace_stmtdesc_t	*stmt;
+} dt_probe_stmt_t;
+
 struct dtrace_hdl {
 	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
 	void *dt_varg;	/* vector argument, if vectored open */
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index ab90d2ed..bb28bbed 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -24,11 +24,6 @@
 #include <dt_list.h>
 #include <dt_bpf.h>
 
-typedef struct dt_probe_clause {
-	dt_list_t	list;
-	dt_ident_t	*clause;
-} dt_probe_clause_t;
-
 typedef struct dt_probe_dependent {
 	dt_list_t	list;
 	dt_probe_t	*probe;
@@ -467,7 +462,7 @@ dt_probe_enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 void
 dt_probe_destroy(dt_probe_t *prp)
 {
-	dt_probe_clause_t	*pcp, *pcp_next;
+	dt_probe_stmt_t		*psp, *psp_next;
 	dt_probe_instance_t	*pip, *pip_next;
 	dt_probe_dependent_t	*dep, *dep_next;
 	dtrace_hdl_t		*dtp;
@@ -499,9 +494,18 @@ dt_probe_destroy(dt_probe_t *prp)
 	dt_free(dtp, prp->nargv);
 	dt_free(dtp, prp->xargv);
 
-	for (pcp = dt_list_next(&prp->clauses); pcp != NULL; pcp = pcp_next) {
-		pcp_next = dt_list_next(pcp);
-		dt_free(dtp, pcp);
+	for (psp = dt_list_next(&prp->stmts); psp != NULL; psp = psp_next) {
+		psp_next = dt_list_next(psp);
+
+		/*
+		 * FIXME?  Is there nothing inside we also need to free?
+		 *
+		 * If psp->stmt was created with dt_probe_error_stmt(), maybe:
+		 *     dt_ident_t *idp = psp->stmt->dtsd_clause;
+		 *     dt_iddtor_difo(idp);
+		 *     dt_ident_destroy(idp);
+		 */
+		dt_free(dtp, psp);
 	}
 
 	for (dep = dt_list_next(&prp->dependents); dep != NULL; dep = dep_next) {
@@ -1283,24 +1287,24 @@ dtrace_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 }
 
 /*
- * Create an ERROR-probe specific copy of a given clause.
+ * Create an ERROR-probe specific copy of a given stmt.
  *
- * A modified copy of the clause is necessary because the ERROR probe may share
- * some clauses with other probes, and yet it needs to be handled differently.
+ * A modified copy of the stmt is necessary because the ERROR probe may share
+ * some stmts with other probes, and yet it needs to be handled differently.
  *
- * The following modifications are made in the copy of the clause:
- *
- *	- it is named dt_error_N where N is taken from the original clause
- *	  dt_clause_N (which also guarantees uniqueness)
+ * In the copy of the stmt, the clause is named dt_error_N, where N is taken
+ * from the original stmt's dt_clause_N (which also guarantees uniqueness).
  */
-dt_ident_t *
-dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
+static dtrace_stmtdesc_t *
+dt_probe_error_stmt(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp)
 {
 	char		*name;
 	int		len;
+	dt_ident_t	*idp = sdp->dtsd_clause;
 	dtrace_difo_t	*dp = dt_dlib_get_func_difo(dtp, idp);
 	dt_ident_t	*nidp = NULL;
 	dtrace_difo_t	*ndp;
+	dtrace_stmtdesc_t *nsdp = NULL;
 
 	/*
 	 * Copy the DIFO.
@@ -1316,7 +1320,6 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
 	name = dt_alloc(dtp, len);
 	if (name == NULL)
 		goto no_mem;
-
 	snprintf(name, len, "dt_error_%s", idp->di_name + strlen("dt_clause_"));
 
 	/*
@@ -1330,7 +1333,12 @@ dt_probe_error_clause(dtrace_hdl_t *dtp, dt_ident_t *idp)
 
 	dt_ident_set_data(nidp, ndp);
 
-	return nidp;
+	nsdp = dt_alloc(dtp, sizeof(dtrace_stmtdesc_t));
+	if (nsdp == NULL)
+		goto no_mem;
+	nsdp->dtsd_clause = nidp;
+
+	return nsdp;
 
 no_mem:
 	if (ndp != NULL)
@@ -1343,40 +1351,39 @@ no_mem:
 }
 
 int
-dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
+dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp, dtrace_stmtdesc_t *sdp)
 {
-	dt_probe_clause_t	*pcp;
+	dt_probe_stmt_t	*psp;
 
-	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
-	if (pcp == NULL)
+	psp = dt_zalloc(dtp, sizeof(dt_probe_stmt_t));
+	if (psp == NULL)
 		return dt_set_errno(dtp, EDT_NOMEM);
 
 	if (prp == dtp->dt_error) {
-		pcp->clause = dt_probe_error_clause(dtp, idp);
-		if (pcp->clause == NULL) {
-			dt_free(dtp, pcp);
+		psp->stmt = dt_probe_error_stmt(dtp, sdp);
+		if (psp->stmt == NULL) {
+			dt_free(dtp, psp);
 			return 0;
 		}
 	} else
-		pcp->clause = idp;
+		psp->stmt = sdp;
 
-	dt_list_append(&prp->clauses, pcp);
+	dt_list_append(&prp->stmts, psp);
 
 	return 0;
 }
 
 int
-dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-		     dt_clause_f *func, void *arg)
+dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp, dt_stmt_f *func, void *arg)
 {
-	dt_probe_clause_t	*pcp;
-	int			rc;
+	dt_probe_stmt_t	*psp;
+	int		rc;
 
 	assert(func != NULL);
 
-	for (pcp = dt_list_next(&prp->clauses); pcp != NULL;
-	     pcp = dt_list_next(pcp)) {
-		rc = func(dtp, pcp->clause, arg);
+	for (psp = dt_list_next(&prp->stmts); psp != NULL;
+	     psp = dt_list_next(psp)) {
+		rc = func(dtp, psp->stmt, arg);
 
 		if (rc != 0)
 			return rc;
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index b4c1a3e4..2a78cb9c 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -32,7 +32,7 @@ typedef struct dt_probe_instance {
 
 typedef struct dt_probe {
 	dt_list_t list;			/* prev/next in enablings chain */
-	dt_list_t clauses;		/* clauses to attach */
+	dt_list_t stmts;		/* stmts */
 	dt_list_t dependents;		/* dependenct probes to attach */
 	const dtrace_probedesc_t *desc;	/* probe description (id, name) */
 	dt_provider_t *prov;		/* pointer to containing provider */
@@ -86,11 +86,11 @@ typedef int dt_probe_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
 extern int dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 			 dt_probe_f *pfunc, dtrace_probe_f *dfunc, void *arg);
 
-extern int dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp,
-			       dt_ident_t *idp);
-typedef int dt_clause_f(dtrace_hdl_t *dtp, dt_ident_t *idp, void *arg);
-extern int dt_probe_clause_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
-				dt_clause_f *func, void *arg);
+extern int dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp,
+			     dtrace_stmtdesc_t *sdp);
+typedef int dt_stmt_f(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, void *arg);
+extern int dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			      dt_stmt_f *func, void *arg);
 
 extern int dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp,
 				  dt_probe_t *idprp);
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index bdb434e0..afbf7265 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -139,8 +139,8 @@ dtrace_program_info(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
 }
 
 typedef struct pi_state {
-	int		*cnt;
-	dt_ident_t	*idp;
+	int			*cnt;
+	dtrace_stmtdesc_t	*sdp;
 } pi_state_t;
 
 static int
@@ -151,7 +151,7 @@ dt_stmt_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, pi_state_t *st)
 	dt_probe_info(dtp, prp->desc, &p);
 	dt_probe_enable(dtp, prp);
 
-	dt_probe_add_clause(dtp, prp, st->idp);
+	dt_probe_add_stmt(dtp, prp, st->sdp);
 	(*st->cnt)++;
 
 	return 0;
@@ -166,7 +166,7 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
 	int			rc;
 
 	st.cnt = cnt;
-	st.idp = sdp->dtsd_clause;
+	st.sdp = sdp;
 	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
 
 	/*
-- 
2.43.5

