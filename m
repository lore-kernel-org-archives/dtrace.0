Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F5224FA
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771391262; cv=fail; b=HYzZH9IurTd1mxnxRSqqFUfgwxSM02eh/eLI7q5PfmUxhAMXjcdEK0mOUu2y0F0pjgJp8ALYzcZgy2IdMZmHFvr1yl/8EBILnZMAYZdcbexHwhV+MgdomW3ukK92lYq1XSyKzcSd57BFlVXPEEWUe57fkAK6YTq0Ih2w9FyClBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771391262; c=relaxed/simple;
	bh=wuPDUEg6u4ia1bIEsQTzQOrrhYB1E7OxKMJ3GfoQ3yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n6kiiOzxU6Qky9xFkJC/pPNswj4R1wfsm/kA7ouGgbFIUC5pU4WZJbLYw9pVxdjh7iBnDbiSbDIEm121DiCk+GCHTSKBxXG2HJve/7OgmWJPtSGCq1gOqJ7amK/VvOMJ9b0HjsaknymtqO6bHv9gu4P2VAoWvx0ofXq5XwOLfsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jZO/mocC; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iyj+I17u reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jZO/mocC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iyj+I17u"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNMX61535457
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jHFTaFLD1cKoAArOFMDsgJwqfJMNbypNHxR3HpnzjtU=; b=
	jZO/mocCjxjBB/GgJlg1IH2MZFie0b+jobGHKvgN/MB4Hz/DiTSqLRdeo7lrOatm
	TNgLB2h1XzXWwYhTVyYeAf1L6cAygMofgcqDxeJkpnU1dhchvBcK7u8B6ZcoTX7n
	rDwu57qVQHbhQ32c3ma+4COXKCRCujUhECIi4D/S65HV4UGpA+I5yyhXJHmqRCYV
	3P1OveY4XVDdR0zfJc3uSpy6I2B7P3cite/u7SzU/Po48jwTdvqqy1p8rJuPgjsa
	oOxkCbiK08tW0D/8L7OOIsm3opnLxydtAKvWSDC9NuhhAIVk/kAM/e7z7UXTfZ2T
	7qOdUjZeFvwoUuSgCq5mqg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj3t4wck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I27PxW033249
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:38 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb20mtkn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjaweOJ6bSzYV9IjcQUu4eMTha202AxfdOD77oj71mkYydiRn4bkdyCmfU2arbOmhqOKtQaM9O1B2L/tD7kO4D9cB/yFxz50Nr5kKThsTEJQEcKOwQp6PHBV/jBVMRoolCTjfLFawhbc/z00NfDnldvQaCssWvidogjH+pWEAbLSt0DHNawZdLHhC0367oNCgsxvpRFOCA+LI3S1gVTITEdBkvf1qglYeFp8Pc896xWc7wO79TSCGhSdrhyQs7XjGuBPRhBQGXmp4EpAmkw3ovZNsHdmAEaPuwwMXORlqIx8q2hwKw7TW1W8jEXkH31bFerqPXZpkl4vTkJrE3Aylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12MDnD7xt6sfZL6/iPDqpclVMLP5dQdDiALgpUyMbQA=;
 b=JmF4zKnvfvfR1WYATaijgPdh+t+vCokwqipQ2kEvnMSMZb7sAHcABlgRvs9f44fW5LIVlrgmaMaB0QCaek0gVboFnHhF3cV6cUpEOmWq7SxOMk2/SrlPv1sxXcKnmyTtx/g9Y4Pfxzz4B87Zv/Q5A2UIHTL2vzVSPYR4PQFnnU4bp40tBGLPR6uj6hDP9fOxUVkELRFuW2SxsPUn/SZo51glCg44bexAv+JyM4NOKADToCqy/d6S6azgCfatagL33qLvnlEPIazHrNO9oC3XLGtO3Y5sERJpUPeiSroWhZ6oqkvRzfDcnvMJQ0ilxCg5ewrikq+zEkdbdymQnrwsaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12MDnD7xt6sfZL6/iPDqpclVMLP5dQdDiALgpUyMbQA=;
 b=iyj+I17upmPC+c7gXpcGgbY8ShKz9IxeAcddak3XMu2KywyXG24wTW5nFJNKJVf1FCWenykZ2zc4bluDYhyAB/bcFYnB/QPjdvnE5MgU5dUMT3dzNIf5+YXoMn+zxaLBpYJMETCEpviEpcG3546PRa1f+oOq/7t087J1ovNhYc4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:07:34 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 05:07:34 +0000
Date: Wed, 18 Feb 2026 00:07:32 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] configure: add support for
 --disable-option-checking
Message-ID: <aZVJFMHoDVtOxQiz@oracle.com>
References: <DS0PR10MB75222227FA6AB2FF619DFF29C26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <77a78d0d-36c8-5540-6635-4ac8bbd72f60@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77a78d0d-36c8-5540-6635-4ac8bbd72f60@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc65da2-356c-4ac5-be46-08de6eaba094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?lphhXCOZQ2a5EOmlxHP2aN17lchUxM1jZH7SWkUUnqbN0hAc+crOMZMqHo?=
 =?iso-8859-1?Q?Mo+tfn7ansXh+3UeXlBICg9lWE+tNrfImu82Qgc1tLsahkZv6sM5pm20bW?=
 =?iso-8859-1?Q?h/pQGjAJ1PSAoQiT50qhEp2kbDHIrfwVr6/3b6hqP2k7+xpyjwgMcZD0YG?=
 =?iso-8859-1?Q?kNLUhO8wrnckLSygyKMmfQ8oEhM5NMebMZ31Iie1uKa7eZLyyeq8sPvDrt?=
 =?iso-8859-1?Q?GjJxqUz1VImyk+tzqm5Q3d8U9W2XO27Te19nzq5pACkv9V9q0g9augEJei?=
 =?iso-8859-1?Q?mzxjn7POT/huMae3rnO9fUXYG+i4VTLftUEfXt3g+L38bTX94J3yqLYWmV?=
 =?iso-8859-1?Q?NijI/Z4o6cfRINCEY0OWp0RDGjQfvlDuymfwo2QZrPdUbh8WSlhtSPeh7o?=
 =?iso-8859-1?Q?bFuHjDwMvNVve6tshaEpD7o2zS1tX7v3hn2+/CUKw5SogZzqvoPbnCSz3O?=
 =?iso-8859-1?Q?q0G/fr9DffRD1XqsR+fgniYw0PBoQKHqwiunOkJ9d59I2QKlZBsJjkA9wH?=
 =?iso-8859-1?Q?arwzQ1gVzEqrgEKHPaJPQxE5TAsivF4w++uTvriaeMbH0wWUCtqYQ1d8ea?=
 =?iso-8859-1?Q?XHpjOd3OmCi/Tq1waYxe3sv48NVQFmqJXcnunEA6376VziaQ9oIuujLHq5?=
 =?iso-8859-1?Q?jAGeMKOB5/DPXt6GUFSVzLtoWOqHse3GWeiMVvw3QGowxkAFtouZCjb4nt?=
 =?iso-8859-1?Q?vfFg3VbRgUGxCPKChFhamggNv0slLyW5ZjfeU2Sr/xoC3/b9m2vMkBgki2?=
 =?iso-8859-1?Q?w3WWBI3e6zmXYshUsjsuXXy0ptzPFOrEnvx7TnLT5ei4lNJzJEmtOP10iu?=
 =?iso-8859-1?Q?5OIuJH1lBpe7/F2KwuwgqPmxjAJoUrg1hCDySjsU1nZEU13KBFpdC0uXSx?=
 =?iso-8859-1?Q?cZYH2AMHlyCu/ugnegAmZlRY59UVi0XOcVa1bmmXNKoMm9YWax1rjvx/51?=
 =?iso-8859-1?Q?Tw7jOvMNTlPr3KkaX6eSNgmpgOFCTmHWxIra7RBEoUs3qwPkCDVWTjP+Qk?=
 =?iso-8859-1?Q?foj9Gjl85MWDErct9m58k7orsLP4+DkjWy/jA+sTYLTnayjw1qjE/9eUmM?=
 =?iso-8859-1?Q?EAL/4ifSpdN6U7MJ0Ey26sEZLQsn4g1FQfdPNH2hFuqt5XXC05ps1uWjmP?=
 =?iso-8859-1?Q?Aw2mXK8NcyveKZdVURCC4asOyJ0aCv2scVPw6YQmoCj+WnKfIYBQU6T3wK?=
 =?iso-8859-1?Q?5mg5HALjUAn6pX4n4SrOx1rmO/C6q352Ney9Hq6Vok0TfxUi4PlZXJaIJt?=
 =?iso-8859-1?Q?WiPozqg7XAHa04kFvk4E1b4qaXfEKAp+UhyuU4gduL0DuN0U7v3KLoY23S?=
 =?iso-8859-1?Q?7QMyZqxqpAz90edQTfMf2UgPDyd51lnypJaKDEVmwbM07yHDliQgNa62uC?=
 =?iso-8859-1?Q?72cn2AW703dhsxNa8WDxn+reZE5IxuFCBHlW9ZLEt8/4KNzILG/pW8zmVG?=
 =?iso-8859-1?Q?lIQWGahLUosP7KkRTAIf1CHA6dFQ4jBo4f3Fv0REa/oCobZ/yOjzTlBWNv?=
 =?iso-8859-1?Q?svEBko6SboVHLNZftZOlwBf0Gd6D9eWBGCpHuVGdOwwIxrSnnYcbeI6z/N?=
 =?iso-8859-1?Q?7OTZeS2cd9vS56dPxJnZtBmuH63C80Dt/HmLZXXQINIkMfKH4viXqhccgB?=
 =?iso-8859-1?Q?AdbcnfwhobkYQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eBlo7hJ8lUk0+OQcU/bOOKnaVHE0hmPaGwQ/BXszAq4pTdEHYnvgz/5IVU?=
 =?iso-8859-1?Q?Xrnm15SpVofRQe1oel1tFPxl6T7oQ/TaBsHST00kgz28KrvrHYNYaOeWQi?=
 =?iso-8859-1?Q?3X/THInOpJ2um1XDEQV9XNb10q4rpLRzE43qJrD7umwflay8D0N+lfmHwG?=
 =?iso-8859-1?Q?qE6VLC1I5jqrVJdCWmrVNyGTkUKKcqxQaDpzdJepLT+b8OJXf3NrziR+/Y?=
 =?iso-8859-1?Q?aS9bxhdrpdUZfSBnXzmGZQZAoQspqZwrVaJiEiTY3rWweSsLmVu4sJgk23?=
 =?iso-8859-1?Q?fbWECtvkCDretvIiuDbE+1Om9y8x6H80XWvz2upsw7nmKj/6pePuYQlI+b?=
 =?iso-8859-1?Q?Q605PsW3vF9rfbWwHXgRYknH4ySbLf7tJlkTc3e8SsIoSepiGo39kAfo71?=
 =?iso-8859-1?Q?vn1VU5vj06W2w1UTWLer/tTbZ9aJaNjdojyBk8/OP6oLGQBieR/mih38uB?=
 =?iso-8859-1?Q?kgdHE9Law7fFM75IWhLNnPIufNRoSkjB8yI3O/SZb1OuFNTrr/IhRkXejH?=
 =?iso-8859-1?Q?EiiYGoElX5jXOD1e5gIcqjoRQXiU6k8k3sSQVwRnU/S2JgGGX5ajiheP+P?=
 =?iso-8859-1?Q?Y0WwSTEitt+mFzZVX6Wa+2UPWOwiwx8hHuu0woJGMSpwACU5qJbQGFKMXI?=
 =?iso-8859-1?Q?6kzJVrEJbfIGpF4T355pYKO0vPDnyb8tAnd2pNbkxyFrhr3cCAWxNjU1zY?=
 =?iso-8859-1?Q?nPGCWZg69s3/tgGYDKTL412StPa3f/1FgEZ14i0B423EU97qS/gTQWJ14r?=
 =?iso-8859-1?Q?jjzA+RsBivarA5lXUyCHoTUObxaYUYe2WMVTulK8oxQv+G/rKKZ8kaLKNV?=
 =?iso-8859-1?Q?oDS4xIuF5GBD/QVXOvXOF7toKQFmchi5ioatedaalTUmIrbU62NKE3J1Qu?=
 =?iso-8859-1?Q?ldBX296hugdD7VO8UKzs0oVdZUYoraSBgErWArKyomXsGWpL7cc4WFciCc?=
 =?iso-8859-1?Q?o/7BqZ9127b62arQwKQl3zojy8Wo5Ih6jDXJYu4o9BsRdWf36a+phxQjS8?=
 =?iso-8859-1?Q?EtvVxsMfFf6hZM4slhZma0nmQLiJNsgOONZc4M8FSZonlYtJRE6iQnB3II?=
 =?iso-8859-1?Q?6m6KQcmfxfQm7VGbhb2duSLjQFk8rH86kN7sWyO3/EJSoc/puDl+hSb/5D?=
 =?iso-8859-1?Q?9weqGHDhWhCl7nmmNOiSIZxikX9Ez12eLW6qylBu2FizkLwDy5e8ejDKWK?=
 =?iso-8859-1?Q?NLmMZuwOJHSOgzyPSIM9uSeFLzNXabbev5vYIHyaIyKDTJclD6MWGO/Sj4?=
 =?iso-8859-1?Q?mK1jAqPLlwlyo+gWEG2Y8eLdPS/W03x5fSkoBnA9VIFEnonbaSJpjt97UG?=
 =?iso-8859-1?Q?Lk/3t1JlRe3pc8Gqd26dqDL2iEBcvSmKEgXvPWqNc4m5qOTK3B2rCw/aZ5?=
 =?iso-8859-1?Q?GNchdveaiN6Ys0x9zWFa6VMx7gwsiqHMkbMZQ1ZCHj3d81Tfz6lbBrQMIS?=
 =?iso-8859-1?Q?q5f/oOMG2OckWdABuBjfCzvfY/IbVILt7Mb+athDZ7jm1XcjhtST9h9ptK?=
 =?iso-8859-1?Q?FnSwNu+aD3ioSlpXY7hE31/YYOSnSD6pKVdZE/GqU5JVsvCRSbj4fHzwcm?=
 =?iso-8859-1?Q?GKqcFUJ3NW6jygd3Rbbas6zFQrGbJBVl2/ccO+OpKaeH0P//c7i0zX9viT?=
 =?iso-8859-1?Q?pa3R1/0pJI/5KNenHERe0zqA6WjQN6KOEKIz0JZhfn/kXzfFBpUbTMmfOP?=
 =?iso-8859-1?Q?hYd8+sDHYJhVUc30fc+Rwjj3JJZGHuN7Rb1qUmQPSYz7wsmYOzWw2XDS3v?=
 =?iso-8859-1?Q?t/bvvjBQOKu9R8IiuNzWng1cKDvpykihXi2X4xUDUKNZftNH9GPfwnuzbe?=
 =?iso-8859-1?Q?efZL2f3rWQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gn0mxvo7LAMuM78USNZe/PR01v9pow73mLUqPuVm3+UIQovGlI4757SXpwKMdWbmKaKGZ+p46XbSwsMsXNVwG8SUA1ZaXOZQlTHyxnx/sX4wHtSNAUTwEr7JPoYqDMNSCj9t9yrnVjUiZEn8Axx1pZxhw3VLy6lEY4gkLUJCn63CkfygsDleWmS5cfByfX/nFacLz91wnbLiSptHqZAa4WPgVm/afhjOe5QgL+1oOc95tIF8kVUuftQzNdbORmpNip5uY5+TZUYm5b+djKyN4vHgO6o27Q5IEHth+rpxTwkvTqUfL+V/HkriI5ClQGEO1Rs01VLqMhydfuyngNGOWIBoOBV76efP0ss26YanuECp9An60KldX+3wlxvf5AvaEJeHfyrYuCxIchEz8sRSEB2CmDfGh9ApkaCRKzxH2kM+AEYT/v7oR/coAzevNb9zpL0U2BhBsAV9y3sPU4wBZBz6rbX/5hKxVUE43tQ1Fnd2WZsFyFCVXAeHBQsPLyfRAtatjt24ASTO7TZPPQTuPx+f2C2jD81t+L95fptuS+1uw6Wx6X2DHPGMa5eq4X+zjFcd6P6V1NsHp0i0AqBL54a2URdgYZAqigy6N3Xus0M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc65da2-356c-4ac5-be46-08de6eaba094
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:07:34.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoebmVlUsOvMvg1q5I1MWWXTOKjflh54M5XWLbzpHV/7FGd5tZGXqO0Mi8aPpgxAgGLz6pf+D0CCOBq2zGp31j8CYUExPygNVlE0rMDylMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180042
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MiBTYWx0ZWRfX1+XGZj665hQ4
 6i1Wpo4lG+WO5gscyopA7Zq1IGT5MKaMpmp6Zz2yXmjslpEfcBCULrydph5v1s/a89ByUr50XE8
 sToATZMqC4vmNR2PxOQNsiUylbpWcEtKLKT7ZLsXDBW/NxmvjzdUpKazjYkts+YZNW9bvHbcgt3
 MInyaRZs4jrIYhxDaYNMuLSU5h5EGJ4vVQp9VWaLXk//PJUYWSr/dxFtnT6fAMVzXiZFv8Qc6b7
 eTIT1e/FI0c5BpWmnPWbl549c9Z77op4n2tmk9OQbXUuazyWYRyPKe7rEMCfJu7PRvpE0VTHrGo
 4GLOtKqYoT9Pnnd16desr2H5/APDvrOcHrCzo6teGNJrj72919PjZzAlWEB5c93tU75bnba2uHU
 PajhL+0e8+zKkpyCql3RK/oWcmPZtoPMpCk6v9ScdKBHmvaFPDW/wdroVBmYLb2M/P2kSEVV9uD
 vRiX0nxkUwUVaYBl2uA==
X-Proofpoint-ORIG-GUID: -nlzilYowC1HNH2KM70YyjcEwnUN01R3
X-Authority-Analysis: v=2.4 cv=b/S/I9Gx c=1 sm=1 tr=0 ts=6995491b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=-hoRu-M0BH03Prvp_xYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: -nlzilYowC1HNH2KM70YyjcEwnUN01R3

On Tue, Feb 17, 2026 at 04:03:38PM -0500, Eugene Loh wrote:
> Looks fine except again this should probably be documented when "--help" is
> used.

Sure.

> Also, I don't know if you agree on moving those enable-dependency options. 
> If so, I guess this patch won't apply cleanly?

I think it is better not to move them.

> On 2/17/26 12:01, Kris Van Hees via DTrace-devel wrote:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   configure | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/configure b/configure
> > index fadac05e..f10c7f4d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -123,6 +123,11 @@ rm -rf build/.config.new build/.config-vars.mk.new
> >   echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
> >   trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
> > +# Should we report unknown --disable/enable/with/without-* options?
> > +if echo " $@ " | grep ' --disable-option-checking ' &>/dev/null; then
> > +   no_check_opts=t
> > +fi
> > +
> >   for option in "$@"; do
> >       case "$option" in
> >           --help) help; exit 1;;
> > @@ -174,6 +179,11 @@ for option in "$@"; do
> >           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> >           --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
> >           --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
> > +        --disable-*|--enable-*|--with-*|--without-*)
> > +           if [[ -z $no_check_opts ]]; then
> > +              echo "Unknown option $option" >&2
> > +              exit 1
> > +           fi;;
> >           *) echo "Unknown option $option" >&2
> >              exit 1;;
> >       esac
