Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD34DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909224; cv=fail; b=KbJy9rmLDTT2wo4xRdzlv6xKg9o740s5GHYxOwUTC5UvKEjtSkFuzA2n4CkcskMB4EAf426Dk8hS3GlydKFMeeK/yEpA1LCfi9PzthTQSawgOkZIAa/QzzOGLmgjzqCy72Iw7ukbmgQegvjAF5iJDAGfCGwvcxHM+jz8k8/cdQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909224; c=relaxed/simple;
	bh=Gq02LiihsPxE4x1WFdQxAbS9tcG/FHOowFKwKcCgUuk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zbjdk0XA7qOsyspu4jIvZlXZb4Ia6Pgrc7gD/2z2BaB+1KLzWjCvloslpkOeAZLlFnAeUnge2jZR+Rxl1NU6/pX6prndCConYNzE2ejpBqskqg7+8D7oBQNlJeV52srN1ZsEONXEbl7b0OV6DyVSvdkYxoMML1Nqh3qJg/ugkp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PIJaFN1W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Exyy4LEm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PIJaFN1W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Exyy4LEm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1hO7Y014986
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=5lkvVzgVX103p/
	MEzUiGC52vSxNby/9q7/XdVC9djls=; b=PIJaFN1WGZySsTP2jT3yZ64ySTXNfx
	RHvw1JpdxCOB7G4a6kNf5SJucIGiqb5YvKsXfw+FifNKbY6xDatJyuADWLUroAlu
	mYQbnfU9t4FpCd0T15+j7pAdwh16dXkyzWb9leoaL5Ha6sHcDY84BbOFQ/4MPAFw
	Ia/hx86y24jkRXqVUB7pvUMZiUhgyFPTF277Lybu51Y8tgr+s8/X4uyEgkCuHcoD
	4dgY6ZTiwVwRVbw9QvrZ9dPvQUKdDTP7NWbAtCCOED0tv88JwcOZANwYRpc3owds
	l7D+wCa43sRGb06YBYLxX1CDgoypf8OUQsYqxyHtvq49IU4A4HlhyHow==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk77j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5OIF9032135
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w85t9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5n+TWlZ0ZMrYrvIRNyr0yONdbP2H8rY0cljTLmeWUlf/FOiHv0LxohX0ajkMNmgXstrRMOSGoA28Di/5K783rP2Ijs3+fg/opobmHrjqKi+yzfZ3HxFfOE3EoypXPSJF1U+FD1ghPa6X9BHi9CTAOO14p3HWrZ3JePFNQa81AwdaIvmWrW1MMOgWr5O9etuwTuFm51t2HUAVam1q2Traf+72mOLp16nbkCcO+j61ZpcyqCebDjKVl9PksEOq9RVX93RupJxItElj4Hc3knDbqdoi9d4rvJI3xLdjyR6+rDKOZTRztNK2GvTaoWdzr1rX6LqP5CM/H/kLNN74ZGBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lkvVzgVX103p/MEzUiGC52vSxNby/9q7/XdVC9djls=;
 b=tci05lJanamR4sNm+tj1neIuWPq8SvpEYLWvhWuRehuOcZgcKbn6cqoqGE6VQs0e1uM8sMGpLj3NRXtjI3dIKsWRLf6Cl9ugaASuIbyIs7Bnvw8IR8i4MGIj1+rQ/ZRFzv5GzhULfWMyHFtfI0ni+vKLm2FgNlHGUzOYK6HQhBIyCEMPSCRvEoh8KEHZwHocU9NYbErwSji71NOOl89+6HgQ3+/qaNYnBCRpVNF1V+BTaGay2fNhbkNpx8aH7aDmNHLnlfGfhRscGGbnG9dk6FojpoC5ZWxuSk3BYvogNNPDM7f/PBbjvXPzxN/u6XOdjL+YBiBao8L51rS3glk3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lkvVzgVX103p/MEzUiGC52vSxNby/9q7/XdVC9djls=;
 b=Exyy4LEmA7pzPSK1N4hgcmxUcpbc01g7T9EjotChn8vFfReceXtNUQWJRGz3C6s+4jpSPbVyeqr7FqIXjp0jrQ6hjTxr6g/iw580dZhObpkO4OUSlyGQvQeTS0L0VxGSRmXIHeaJ5YVYssPJzu+UkPwbHQytnQvHKd2N5cJVnHM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 18/19] test: Add a lazy USDT test
Date: Thu, 29 Aug 2024 01:25:57 -0400
Message-Id: <20240829052558.3525-18-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 54501613-dbd4-46b3-b65e-08dcc7eb3331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jOriQxLurK8qEzjIB7mz4kk8jnFhXqvVt0xCgy05HCok/6mpu03+aS6j+ikj?=
 =?us-ascii?Q?KAH617ECavXC5NzpzMZMy13Ax9I7v+EYc3PGcGzmY9twi+DP0AloydqrpwUI?=
 =?us-ascii?Q?ZcEoQ1PqZZcBRdV/blGdQdXnZjMEcGD4vileeH2yfkVVqVDEFOm2nTeZFUFK?=
 =?us-ascii?Q?nW4Ry7jwfEXdaKQI3Z1OZVfIzxpS6jsSaWt/Hf5vle9HhUhQjgFmkRWtqYKu?=
 =?us-ascii?Q?QPbsZCOkQOlzcCCG1LNH6tM7yHAjs2CVwaH9RwGDOf1d+VrtY6+jRyGrwTQi?=
 =?us-ascii?Q?h60nqfKccSuiHC+vib6RHbJLCItSwlWxVd5JPzco9J6mXAE6GXdRACVaPOnt?=
 =?us-ascii?Q?QzSHG7a+KJaSwxnxlDO8mnHEHUhtPUfqJnumxG/LNPtNViTzSz36ml6VuzT7?=
 =?us-ascii?Q?eUCBUVtxEw075iVu3X9dfBsuRUkxCe1bU7WyJruih7pBMrsu/JFF3TfLrkER?=
 =?us-ascii?Q?FiNHAsqr3FoNHuHTdk528O6CKPZkTAOAqnYMfnieNTxGVB5NC+pCZQSKLEh4?=
 =?us-ascii?Q?bxYx3u30wNTerGZuZwVUWAs2NYYwcTIMsAOa/2zZROjdCEKqyDnvFjuM33jr?=
 =?us-ascii?Q?557lqDQOmDhMDXK5awTW22Tg1Lj1nzLsIyLskEmh4wdOOfJ++Dx6XkCMdYRa?=
 =?us-ascii?Q?JcIb+2f8pr8uslMWW7FfDH/9c0yVu7pqv0mq4e2UYX5ZPeMsWcELtNjQhRhX?=
 =?us-ascii?Q?BCbMdEA5tdzHHEBtn+pum+QZpvioJSX7klNu6K6YUb8hwSjj2kUvhlSObD0W?=
 =?us-ascii?Q?xssBp9fzy2KMD/mAvAFwMStcoTz4v6WwchWa045Jw7NOpWvX+Ic0FoRHV3K5?=
 =?us-ascii?Q?b+7mQ2yJcXdHLN/76rxkks/2YSf8AIRo/SKSzzlIDpyXj4TzH2XRoY/l8K5+?=
 =?us-ascii?Q?4MccVYxvU0xwSmswx3LwhGc5gCs2rc9GfT+6cx29mfBgl2DpN/kGy1x9R+bC?=
 =?us-ascii?Q?h0VB5MYYKeosEjHcuYYacGALbSsx1/V8UPEdVaMpjAwSsEn2F+g19V6nw1Vz?=
 =?us-ascii?Q?01wLxRcsB4KPWjiURYPsOEPqkFJgugtNXgaKN5RhHBcJCpyzOnZgrK9BL1sg?=
 =?us-ascii?Q?ObE7BSC/Nf7qCOBaJSQANDlK+14zu0gj1DigxdpYTBrxjZkLBr+jij0qCJu1?=
 =?us-ascii?Q?OkrZOeHvqvCDGkvDGvU3+iRQZYV7oxbm8Pi01uSsKRFifsxNJAhNLmOWr8rk?=
 =?us-ascii?Q?swb/Hioa2Ne/8IO/s3Urp3ouHVMzCAjmAYYLYzfF+GimBI8ffhU0jWc1E2PN?=
 =?us-ascii?Q?H7yV83VaqSC45NTO+n4MG+AIxlLk5NYn6roxSDTiXe4d9WjILoKk68E/buJk?=
 =?us-ascii?Q?/Cw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pAhkyErCUpIOL6Q/lvZHIi0HqwDikEwhzhUnH3YeZiwFff9ug7rneEJY+758?=
 =?us-ascii?Q?xIr6xZrC8/mqsXqpVzGuUdMMsR/cZjekCeMztdvjniUSSMxDtdVByCHnLpz5?=
 =?us-ascii?Q?RCOMypn27534L6ZarTjRvPgfB0eCL3ZLDmkWTcnRVPXpj+ivW5E/qJ7lJYMy?=
 =?us-ascii?Q?9JrygU2z6KmtolvBDj2klzb8znGw89OSEsSjvQNctj66lb4y30F4jvjctrsP?=
 =?us-ascii?Q?8xnfaGe+eLh0Uo4hB2fOhfkyG/WTItYT8qCHVdkkp8KalEY9C2fpbOyhcw0t?=
 =?us-ascii?Q?o7YYfkIP9nZnSq7BZP4grkN3xbuXpekF3kThGf+M44xEkORpPByJC4kdPgcs?=
 =?us-ascii?Q?/gaXzy+OIXU3UGWL5j9CyrCTt2iPNY1pjlM4PzsAnwANub+3VAnSSyvmYJCw?=
 =?us-ascii?Q?FiDxtncW4OdctBUCbAH4rG0SbdWK6qGX/Wz1dATpimWP5KfT98gclBgWmZig?=
 =?us-ascii?Q?U9m0TbadwsGDEI7WPV/bmBVtvCkdmasej5O8Jy3vuUA0yWBW0Th/C5Wezt5e?=
 =?us-ascii?Q?qDypNvkGdUb31PZ0kqF8uYqbCKxoSUQXoImuJcRlHoQ5ti5sJE6hyFvb3iEm?=
 =?us-ascii?Q?KcN1h72RhdGm8qCzO4cRy+yupmAHQgm9trzRoBmSce9ew/zNdVevFhwpEJSa?=
 =?us-ascii?Q?XK86sUTSfy3qcJf8DfrShIBYThB62wbpzt9TuZEr9f8DMEkKvfkkLFNd0yEU?=
 =?us-ascii?Q?SxF9EfJDbC3LWE+t1DSo8s1+b8flbgPuytwXEz1o/qgNmK/zybqWtgDoee0n?=
 =?us-ascii?Q?9KPoAl9bqzRWlDVyEoSV5iuK9Sw28dZi1A+JrVprsIMX49+d7FDxEE0o/9aU?=
 =?us-ascii?Q?sxYTV38u2rA1Uer1SY3tRhSBwptUxf1PCro95Enj67jNsByy4vmV4P0LfVAL?=
 =?us-ascii?Q?+GhCNZaKNvtlqT0EWKnvvq+ppp+5aLJCyDlwOMdDgQi/EU+PC+qyCnQ1JTK4?=
 =?us-ascii?Q?mLhKfp2D3YJp6v4fwnVo0wy01bkuJLaw14KpE5OZayJHihlXQwOAc/kJLE+k?=
 =?us-ascii?Q?0lPfY7s2WSYbht8xNvGIpSA5Bj7bdu0x5+4Xi8q5aaB21gcVcyR5iIAP/Ztb?=
 =?us-ascii?Q?v/UyPfLZh5yXN1524UBfba788b4pVoUfZmKcNlxsvG8uOfLTcpVwJmE7WjYy?=
 =?us-ascii?Q?ZIhR1WhgwTku8quUM7HBhsgXrQ7TKRTWhmOJDCCvZjo+wJy1Ua0FYDdXBoK0?=
 =?us-ascii?Q?mZEvA21og3rYoLbGur8v1zLT/Uj7RViffp7T/0cd/snPlz3UpYdrTHqImyJ9?=
 =?us-ascii?Q?NxzQreDhzamzumiMON3s/Vy1TNlo0SEkGi+lEXIntf9N/p4+Ly+Dy2rHDeOz?=
 =?us-ascii?Q?Dn2xT7EUHL+M/7rGptdTvVQSpqbjultD6tTOQkXAEJ+jAadqShJaAm1bKY/f?=
 =?us-ascii?Q?hS0dfrUeQ5FK76SDlL2etQiyzBZESt8T/UywO/nD2E1BAanPjQIoEAoSABxT?=
 =?us-ascii?Q?64QQ4ylBEIt1btQpjIXnuTSUAUQGStwsOycsrwz3cC88Pi80FL5FW1vcw7AM?=
 =?us-ascii?Q?PbyK2gMfKZhP4WTIhCsG4EPDBIy8nsavTlDFGEq/JpgsNCZMiYf4d9djaTbV?=
 =?us-ascii?Q?Nc8XlAL5L6jDBuW1B81I0xUCYuHeNVBFgCzTkqwJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S6bpLou865abzpKWiqfDgWgIVi7FGmfc7gVuq5qeQGJQPD2vwsSxJaUUJXV4J1AQW0fQlacLita19pJlZCxKnqG+lNhrmaejstZ/8R2GPZjIpzBnI+Sfnm1e0ZgreFSY07/JAsHQb7+Z4unA1G3OMjEIPOKpLJD/Sm1FyKOn8ARcV1hXkuKssp7P3gOw1qdJKqa3sQnRcM6OalR5FrbYnRqPGs6E20bGUAjWzAjHQca1yvpUnI75yBu2BbKYSF8pj6x4AERm23jC8w8c3mdc9Kzp/i74tXqf7QbUz/jLhitG7SD3k8RJe94+MGkfyq1xjp+PQPnODpxP1TsLhsQ4Z4GvkaVrNNLzEoJmg9lDgt0MtWwPmtXlL9/285Aqg4QTBcXvwHrdq8kmRU1GOIsNOXcdulLb7i8QLm0hi+SToi0kLcQNoF7M9PqF5pOZmAlm8cLfKUwhE3aGZs5Z5oI53z8085axYS5fAfvpUzzn4HB3WpITDOBNeggpyqV4486fqXAq42o+MHKMB2A7yvtDwQ/5pfE6jebI7Lj+aW4q62Mf271VZhIKDZpGamXL/eLHqDFNlOm5MhDJPJYjM0xhh2XNdaPNe7Z+vPE4mfSJVhs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54501613-dbd4-46b3-b65e-08dcc7eb3331
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:57.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQjET077NHs2gT8+0UmqCDm+e2IGpflmmKz/VI7yVbCPbWolKh0ucCu1tt7+Ro4aJMo0BobBXjY2mxrt55sdfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: pvOwj9_tk8GI3lBiEr1xWkSU3rkes2pv
X-Proofpoint-ORIG-GUID: pvOwj9_tk8GI3lBiEr1xWkSU3rkes2pv

From: Eugene Loh <eugene.loh@oracle.com>

When new USDT processes start up, we do not immediately know
about their probes.  Our detecting these processes is "lazy."
First, dtprobed has to see these processes and then dtrace has
to find them.  Hence, many of our tests XFAIL.

Introduce a test that accounts for such laziness.  That is,
the target program spins in "phase 1" waiting for USR1.  Our
D script watches for a USDT probe in phase 1 and raises the
anticipated USR1.

Then we expect every USDT probe during phase 2 to fire.

Currently, another limitation is that at least one USDT process
has to be running when the dtrace session starts.  So, start
one process first, then the dtrace session, then many more processes.

We start "many" processes so that we can filter on pids.  Specifically,
we expect the phase 2 USDT probe to match the last digit of the pid.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.lazy.r  |   1 +
 test/unittest/usdt/tst.lazy.sh | 245 +++++++++++++++++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 test/unittest/usdt/tst.lazy.r
 create mode 100755 test/unittest/usdt/tst.lazy.sh

diff --git a/test/unittest/usdt/tst.lazy.r b/test/unittest/usdt/tst.lazy.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/usdt/tst.lazy.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.lazy.sh b/test/unittest/usdt/tst.lazy.sh
new file mode 100755
index 00000000..348a70f6
--- /dev/null
+++ b/test/unittest/usdt/tst.lazy.sh
@@ -0,0 +1,245 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT will see new processes, even if detection
+# is lazy.
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/lazy.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create test source files.
+
+cat > prov.d <<EOF
+provider testprov {
+	probe foo();
+	probe bar(int, int, int);
+};
+EOF
+
+cat > main.c <<EOF
+#include <stdio.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <signal.h>
+#include "prov.h"
+
+static int phase = 1;
+
+static void
+interrupt(int sig)
+{
+	phase = 2;
+}
+
+int
+main(int argc, char **argv)
+{
+	struct sigaction act;
+	int i;
+	int nphase1 = 0, nphase1foo = 0, nphase1bar = 0;
+	int nphase2 = 0, nphase2foo = 0, nphase2bar = 0;
+
+	/* set the handler to listen for SIGUSR1 */
+	act.sa_handler = interrupt;
+	act.sa_flags = 0;
+	if (sigaction(SIGUSR1, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+
+	/* in phase 1, loop on probe "foo" to wait on USR1 */
+	while (phase == 1) {
+		nphase1++;
+		if (TESTPROV_FOO_ENABLED()) {
+			nphase1foo++;
+			phase = 2;
+		}
+		if (TESTPROV_BAR_ENABLED()) {
+			nphase1bar++;
+			phase = 2;
+		}
+		TESTPROV_FOO();
+	}
+
+	/* in phase 2, just loop over probe "bar" a fixed number of times */
+	for (int i = 0; i < 10; i++) {
+		nphase2++;
+		usleep(2000);
+		if (TESTPROV_FOO_ENABLED())
+			nphase2foo++;
+		usleep(2000);
+		if (TESTPROV_BAR_ENABLED())
+			nphase2bar++;
+		usleep(2000);
+		TESTPROV_BAR(i, i + 2, i * 2);
+	}
+
+	printf("%d: %d %d %d %d %d %d\n", getpid(),
+	    nphase1, nphase1foo, nphase1bar, nphase2, nphase2foo, nphase2bar);
+
+	return 0;
+}
+EOF
+
+# Build the test program.
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Check that the is-enabled probes are false when the USDT probes are not enabled.
+# That is, nphase1foo == nphase1bar == nphase2foo == nphase2bar == 0.
+# Also, nphase2 == 10.
+# Note that nphase1 will be undefined.
+
+./main > main.out &
+pid=$!
+sleep 1
+kill -USR1 $pid
+wait
+
+echo "$pid: undefined 0 0 10 0 0" > main.out.expected
+if ! awk '{ $2 = "undefined"; print }' main.out | diff -q - main.out.expected; then
+	echo program output looks wrong for the no-DTrace case
+	echo === got ===
+	cat main.out
+	echo === expected ===
+	cat main.out.expected
+	exit 1
+fi
+
+# Run dtrace.
+
+num=10
+
+#     Start one process.
+./main > main.out0 &
+pids[0]=$!
+i=1
+
+#     Figure out the pid's trailing digit.
+lastdigit=$((${pids[0]} % 10))
+
+#     Start dtrace.
+$dtrace $dt_flags -wq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}
+testprov*'$lastdigit':::bar
+{
+	@[pid, 0] = sum(arg0);
+	@[pid, 1] = sum(arg1);
+	@[pid, 2] = sum(arg2);
+}' &
+dtpid=$!
+sleep 2
+
+#     Start remaining processes.
+while [ $i -lt $num ]; do
+	./main > main.out$i &
+	pids[$i]=$!
+	i=$(($i + 1))
+done
+
+# Wait for processes to complete.
+
+i=0
+while [ $i -lt $num ]; do
+	wait ${pids[$i]}
+	i=$(($i + 1))
+done
+
+# Kill the dtrace process.
+
+kill $dtpid
+wait
+
+# Check the program output (main.out$i files).
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		nphase2bar=10
+	else
+		nphase2bar=0
+	fi
+	echo "${pids[$i]}: undefined 0 0 10 10 $nphase2bar" > main.out$i.expected
+	awk '
+	    $3 == "1" { $3 =   0 }   # in phase 1, round 1 down to 0
+	    $4 == "1" { $4 =   0 }   # in phase 1, round 1 down to 0
+	    { $2 = "undefined"; print }' main.out$i > main.out$i.post
+	if ! diff -q main.out$i.post main.out$i.expected; then
+		echo program output looks wrong for DTrace case $i
+		echo === was ===
+		cat main.out$i
+		echo === got ===
+		cat main.out$i.post
+		echo === expected ===
+		cat main.out$i.expected
+		exit 1
+	fi
+	i=$(($i + 1))
+done
+
+# Check the dtrace output.
+
+#     regularize the dtrace output.
+awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+
+#     determine what to expect
+
+i=0
+while [ $i -lt $num ]; do
+	if [ $((${pids[$i]} % 10)) -eq $lastdigit ]; then
+		echo ${pids[$i]} 0 45 >> dtrace.out.expected
+		echo ${pids[$i]} 1 65 >> dtrace.out.expected
+		echo ${pids[$i]} 2 90 >> dtrace.out.expected
+	fi
+
+	i=$(($i + 1))
+done
+
+#     diff
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong for DTrace case $i
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

