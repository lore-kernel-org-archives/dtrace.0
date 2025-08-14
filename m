Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D118786A
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143917; cv=fail; b=tc2jE7/FAtsGMVgpHzxXZuZl4SVRRCcpgZb1Jnrg9E4Nb5KvQZ2KvEO59RQAhG8z3IdXshZX5z4yvo5Mv5KJ2i+ck0Kp28zrSiHTsrGhcq5W5v9SgzfhJKJC35aq9TT0tNMEE/FfIIaMd+p7bbLADOz0Bn+Xz4kBPI7G86OWPHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143917; c=relaxed/simple;
	bh=aZeeZ5k1Mgx08fMtYcrp+uoTNH5IW2HeTTHes/gXRAE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Si6e0mWmhWDUyXUM+Nq7Fjc1ni0eE3B03xepsP+l9PxYKcSuu5I00WhbnxtD5SBjYysdOc/AVhWBYQB1bbRULzdXslmtOqZn6F1jyPyzELS5y00YoIDnw+hGuoCQA2bnx5Vjkm8JLeYoDd4m6fKhBvLnSi2IXB42f7toX1D2G0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RITDa3mg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iEggPPGe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RITDa3mg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iEggPPGe"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLu327032006
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=yMvDZOPj0t9eeo8u3bCZFO2wZB1wgoZ25qmMr/A+k5I=; b=
	RITDa3mgXgCVmdfFbniur5Q+vWCRhayJm/O417KEAcBfFqbX9L4HThGARhyfDQtn
	VXbSUSkX8rSxFNk5sMYP0R8gYWFko/qAiS1z3xoxOO+CP/DLtGO7+z6eJHkrF5O1
	d7WIyXzYaXg56aQXGhGcHox9rgGr4BZWjr/MN1Hu/+aklDGEdMGiVtkpypB9pzQi
	taLgd1J7uUACZkSnTlxGv+6dSzvWh6/VzY/xCNJpceikSicmwctY91DCeKVgC1T+
	Iq8f+ogP9UnuXK9GXmG7jJ78pCULQ0ZGreDbVn8q8iLKvJHy8Pj+++q+sSuTOSKM
	4mgofRlRG93yVjy8F+1cHw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guch9bbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57E29xE1030131
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsc71pu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 03:58:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le7kqH/NVfIHMqlb5/pM3AM5HGG+Jw5d7mA+gr6MXjhFPqOXjtIu8gFPS/Xm/pqUsiB/p+wqixvw2ao8B0sWw8BuJCwv+66nByswXklJWWsrjqMLinS5KtAUm1ZYJQg30pYviTGUpbBVN+o6P2AnMsQ5+pApcNlrXOfLwn/k9Ekvm8Bwv6rrFASj7NLiU0I+FrdKJULfR/We+/8aeCHEhxPUB+5woQQE8/wT+Ebcle1qwY+tWpFfwXf7+JA5uH/AlA/aDRh+dGVtvRVh/XQHwJs6+VfEBTyINRtjYqymeuZqZQGIaBYX8yuW9O283lyUCxJ4dOM8ltGjpRK3hmOwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMvDZOPj0t9eeo8u3bCZFO2wZB1wgoZ25qmMr/A+k5I=;
 b=GR9Db/brZyz8/EamZuHiwrFWMa3DQCBJqG5ezWVZjaQQgoR2CZWuiua2ZClULbO38U0NHHQldOtoWQAjaEm4UcEE7UlzpKWOlPu/Yq7LDclcsChQWop/ws5Pg5G0kpf2ZavVd1agHLOi13JL4L+GfMe8oX0dUbRFm6fDb8lByvxbIlAuxls3rpItYVHSjEIjZooFITsy/QpTrIg3GHf3+Gd4gmjAfc7TAKhStAZRKFIo+IbgfBGKqZaxp4KyNa/XmkE2zAxBHzEHUgiM8jzVP+OBCeUGttqCFntw41rTvIFix7bA6Yof1XyGdkNbtShbpSmQoYrpbxrcFL9PMe3NUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMvDZOPj0t9eeo8u3bCZFO2wZB1wgoZ25qmMr/A+k5I=;
 b=iEggPPGedPSshzM7gQpL29rBBXGtpTSPx1Zi5bLiYfxQb7usdhvgSKJNMvOZPSiLc3DAmMe9v9K01bmv8mnh7oSkSFIscMx9E/X7KSvldJK+88hZ43djsI8zU39Y+Sul/8Q7+nfv2W7ImH0kETMsQIreXhCA5RV8xKKAH1v2N1Q=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH8PR10MB6573.namprd10.prod.outlook.com (2603:10b6:510:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 03:58:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 03:58:05 +0000
Date: Wed, 13 Aug 2025 23:58:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] uprobe: do not call populate_args() for pid probes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH8PR10MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8f503e-86cb-4992-2671-08dddae6c5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I76viNH6o3GeGzw6fwHJ1Pi3bw8EdGhlVN0h2qzNQCC/xjgm4qwGBDfsoKl8?=
 =?us-ascii?Q?oE0LXkmz5ljPs9wQSouVqjjRq8pVJ/OKErRcUvOM4biqMVIGT0pe3p3KiV3U?=
 =?us-ascii?Q?GjizKCv6hh/GTw+fam/pyiXBN+RHXTozRBJPaxYGITWEgsReW8jfX+81L1Mj?=
 =?us-ascii?Q?tIl+uG8zowHTyjOnX3VC43XeHebel2u4UInJ2ojJgWy0nJl8d9AidF9ZmrwG?=
 =?us-ascii?Q?7V5seSpNd/l5pGr8Y9NfnfCQMF0XlH1W6FK3Yg9r1+Otw+k3POtCMJC8a/MF?=
 =?us-ascii?Q?khOw/ZkzrO9IbtbgO2HnOCSq6D8j60RQE9mv1INmejNhE0PUXvGL/q+y9DW2?=
 =?us-ascii?Q?cSwtt1x3XzDAlWg1Xatdpi5b7Mcm4dQigbLqYv+1EB0g3zUOvZ1MnH9jjdXD?=
 =?us-ascii?Q?fZz37W/pcD3nNNW+pAON6FmPYzIrEeqkyg2dlmFuaziygW1fMf90iFDXGDDV?=
 =?us-ascii?Q?l2iWLNy5Ll2mjLeGeCwZ8A5WYRWJrqCha3mPyQ6sqlQdOF24x4IOAfFplqaR?=
 =?us-ascii?Q?yWoUzPKeqqhDdLy6stofuWWMbjhpB58UddazUVFfNcPvr8jdiT9P09Piztl2?=
 =?us-ascii?Q?OrshjV+ucFNJ9OXvHFMwcF9PIPOMqZ1eAsCbvPRWPrvbliBHG6sad90CGakl?=
 =?us-ascii?Q?kJctNLbsL0I/nL5yIGOys9PYMK/uwtks8QXOdAlHFB2cjRMuAM6VFiFX6/mH?=
 =?us-ascii?Q?F2iOyZGtpCovfDlRrG3PxpQBX/WfRpjjDBBskknfoJVZW38no507TKyuACDK?=
 =?us-ascii?Q?u44044xu1PsRI5Lozc1r2SoMdRUhlZ7BQzbfxoEcQTwHEPQCKNkQhU8/vCRW?=
 =?us-ascii?Q?hH8m0KRTHSF7oUyYNC0ywv9NqQceyVxCOjsAbFmdTUOjrlGlKIQ5dPTNl6XN?=
 =?us-ascii?Q?TTV4A5AaDBPOSVcdEIswr7fn/UZNTrOBdAPBUJzrBR1uOUhCXNNxJLXsAgQ4?=
 =?us-ascii?Q?xvawasLzNQ7naSGCb2+kiMqUeln/sqRjPb8sVjPMQj2Q1RWQrEYwOVIRxQsS?=
 =?us-ascii?Q?xBgRx8j2rDbBlYVwnZRHhk0Br5iy+d9vAVV24QqUA0PlcKTdD91u51B1K91m?=
 =?us-ascii?Q?Az4KIt+8RALzkf+DQUIBEBWyq6n4Ga48XkvaGLJyTzJ7UjhBD1SXM8rtFw1E?=
 =?us-ascii?Q?Uzvn96AzloNuA/gobyLEYEZLvJxd+QQsl+p6iKKz6lBrKdRvGnsTi1KGMdRj?=
 =?us-ascii?Q?adBWHTCHcz9vXc4qKhoY0PYCbbBL5cOB5xkwe7VGsBiwHWZzISBwexGp1HDh?=
 =?us-ascii?Q?7W3g5YsUtKLBFyhg308cCOW3PqHUBwzEz5GNedGP3tGcouFiKZzfftkwdqLr?=
 =?us-ascii?Q?sl9R0Ut/2bK0bbCqRGn5tgK+JKCtV2vtjMM1g0A2GalhVRCVebniuDi07FRQ?=
 =?us-ascii?Q?lSmWgrQFbiATlHbWY0YfbG4e4VSDP6mfPG0oOMCUj/pIW0axkwJop21y5Zm2?=
 =?us-ascii?Q?OHOxbRUoTr0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ij4fJlIIPr/5zMpcyqVcNiTF1x3cZIts1edpkNmFnLe5YjhgLmKs/wCwne6D?=
 =?us-ascii?Q?cgMA6S2SzuGmn0FzyrMLe7KYVcl2uDOA3mMhGZJ7m3x3n+8vXcwvOpNEUHX0?=
 =?us-ascii?Q?b4uZhrzsWwoCcs9RpCzjwqYTxgUzzljrY4rhZjhd5nQd5DBVUC+fMoJUiif1?=
 =?us-ascii?Q?SjX6GowC5ThFDTViCT/WZgT7reUAzLE0xlK4zBcXKcOnSuVzwuZLPubKv72A?=
 =?us-ascii?Q?X3Oxg6/IDfcP0nxL6UxxJxyz0idiga6Z+MIXHN2DwSsn5wxrknuLWx/AI78q?=
 =?us-ascii?Q?Jr1Ylf0jo4haL6ZFDkpa0rxNNSNf2l4s+CmZu3giVNlg5RkpI15qGq1buCEn?=
 =?us-ascii?Q?3hTzKYLjcAUz2YXqxS3BdDDRA3M/7L3PKHjzMWY/Ga8hZJoaEX5xU9A3OZ8w?=
 =?us-ascii?Q?5b3Q/anH6tlKTFf1mlsI5GEtbsmxJD5sxk2YDR8KMFljfMTs9GgH55ROfsgv?=
 =?us-ascii?Q?tiYbpYv9GvSwtkjgNQIxWLFNaHvjObcjg4rwrSbKeNN7Qz30d9NODrBNbTcf?=
 =?us-ascii?Q?KHCEnA+fNy3cjVZToJfgXBf4BaKWMAuq4ADzPtAVdJSrBvFdO0YXRwNWvNv3?=
 =?us-ascii?Q?3iC/2FTWKu1gZWwLhhmKIeKzR3B9yivuvNafMgzH99dwk5JGJBN1ZjfhV4FH?=
 =?us-ascii?Q?nZmQ4APbhY2B94ShpZSeI7zT16gBt8SN9k/8nWJ+iQUlx2cHvbA58FXjmkBb?=
 =?us-ascii?Q?92eE3rIStdwdl1JREAk6VYm9p+76zQ5d3waIGJzDFqbecLZv3CqpejrGmrfQ?=
 =?us-ascii?Q?mR7YhHp0ElgwuUWHNbZQpy6utvG0FQq5jJcetjCxtFYUC1o3eaqIgSRWSBlR?=
 =?us-ascii?Q?7zKsMhQSAENksYfowD4HznDmO3O7WWpHZ+3ZqEM+jqcrnpE0X7lD8V++NCMh?=
 =?us-ascii?Q?jFiVeXY6Mqjrcds7Ab2XRxPJ7PHMteOShqzRSfz4Hg9bCy8jpRmrmU0njpHM?=
 =?us-ascii?Q?McZDSKQ9Sl3D3r58KAFME88rzzsmBzA58ox1fZUgU53jTErWg9ok5PHy9Ibe?=
 =?us-ascii?Q?yZIW60DsR1dkjD4/K6u6AB8N7UbtniLqnm3kQuP4YqjECirrsB54Kc+4BHb0?=
 =?us-ascii?Q?weJRUBWgvwwqT8c9dvrxtSMnsrooa9wamjGEZheMiwnYbmfuZ3r1dP0cnvXZ?=
 =?us-ascii?Q?YGzceMZaFICUf42xFelwu17bxhqKnEYvkp88+ryHrAgOJ6+xH68f7ykxnorQ?=
 =?us-ascii?Q?xfgH1FeECy7/Wf/mwjaWBlJAI8QhEeRJJjZj40Cy+PyB2tXBGcGTQyznkt3U?=
 =?us-ascii?Q?/xsBCEvMHMQ9JCJl+rAYAy/a9fCVo4aCM923DLZom0NLWuviOKezymGywPrM?=
 =?us-ascii?Q?D751NDYlAzNT5ttldheodpzpvl0LdswU6iKMjej5ggvllO46Lt3fa+d945/2?=
 =?us-ascii?Q?Kvh4q0Pcm1gdad3ICNcRoGkwFGaISU5v+Uk0UB9HL99kURJpH1UYr0g/bL6m?=
 =?us-ascii?Q?aMMQZD/DxSQ5p+M7GQnpANFEoN3/i7hM1+I63kYQrpElJTj8q3xxC4bgc5jp?=
 =?us-ascii?Q?wxO9Av6T+PHE2jmi7gPUUXer6gAAV/saDs/TFqI0Dzo8ciclzg4angJ1laKJ?=
 =?us-ascii?Q?AFpl5dhRkw+1ajVlDhf6AwrLChhPfcWRbHAYn4ndYlPZ5elXbE32QCk3Ovqv?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xm57PRsjsKMQA1jmdI1Ul5jiCwvn9t8bg2MHmJQ1eHR6X1RKoMlOpWgyxA0pBALykjeMKN9CpRbwh6WhMq8h5TaDqQObtv1G9ACKLBWDBvaTNsVymjDyHsYUMiSgF609x0YY/zQIN57PG3eD3+3xYwKr8kv5YcX+yqEmzEeM3WxOEyNYXZ1ygB+ncAzHb1PJu10PiUcxEnRx0tYKayefv0yS2FSNdnqMaSk7YL2AiXrKOh909RB8x6P7M17cQJmy7UMilp619m6hHrgFD+qouyu+ZlKzron6QTOKByx4b+htcvbjE61cI71d6VddiChTZwClQFBb+FNZ9oFapA5Ursg+NoD+D5BYsw3LAPwl0kQ1DCbuxZyeFSf9LnNtbhkqztFngE3Ljtt/xRm3lmNPg9rgPgj2XfpVHqDTZmx/VoIAzBRCYPXyvyAAOtTjjl3qNm4mooygK5Oki0GsK+8e3ting1DnFWy+Mlsr5i5MxfEIz4RN55FZE6UHc5nG/qcwU94OQ/TOlCHl2rK24Rd48fMcnehC/dskZazlQeRy/2gQJczhm0WPOZ+WPLfDoIVNbd/AXrUiJuXiVevPFOmaBI+5euez89qHNdzGzRhCEWk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8f503e-86cb-4992-2671-08dddae6c5b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 03:58:05.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQgjTU8T5f7/5rpYXqMNtQy/0P+dbgAxwnoXwqh4yW+DaNODYQFIw4vzLXxSnc35CwTAKgrZJtApEWE0T31eO4QuSnHsXLbiPjmPzXCkkfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6573
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140028
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689d5ee9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=X9NcyUbua9AmIzz3ZqIA:9
X-Proofpoint-ORIG-GUID: XAtODQyFsPFT7h3Omptd91y1wiSUWQCp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDAyOCBTYWx0ZWRfX3BrCoSqU8Rj2
 GH2SvS00UUpbiYFu74waHL02XzM6CVsKfhOFkZjra99OYm/VZ6Tziym9kirm7hhOIEVDydS71dG
 mVqnM/i5EirzJBJ5CwK9fFxUOO+ZQziIsg461TE6NVO+9Q4iefKbRK788GFCLNBfaEJgyCb9JaE
 Qns1O3YJ5ETDOhiPQTA8w//eUSCMwXyS5DI+JpJoG8tfgjupp7rESmnyxXTTc1zeLDrtY9cz3Ml
 H+clw5YSTna2j5dxOumNx2RD1m5RKxN5j4Bqce65ebK5LVbV4pDkZXA7+g0EpykpKYywp9hvD1/
 STNm51SjTVO8oBoc8qm5tMCrVssitAHwUc0OCKh2qVz6Z66qY6QegXliwOGUMYUN3HpXVoY46V0
 QC1vwWdZKx+L7Zsg4MkeHliHATu00I+W2qibCCZHoLPg+E+8MZEfoDQREfDT+BYMYmUXNOd8
X-Proofpoint-GUID: XAtODQyFsPFT7h3Omptd91y1wiSUWQCp

Only USDT (regular and is-enabled) probes need populate_args().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index c63d58383..605ae8397 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -994,8 +994,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		 */
 	}
 
-	if (populate_args(dtp, psp, upp) < 0)
-		goto fail;
+	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
+		if (populate_args(dtp, psp, upp) < 0)
+			goto fail;
+	}
 
 	return uprp;
 
-- 
2.45.2

