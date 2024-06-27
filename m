Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379401C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466801; cv=fail; b=S8RCWfKOtArnn0OUAdn/vKjtUmPVS2TuqLDGgRYKi4hDoo/d6mt9csrYVDTxDg4G+iC7nYFewrcxeeJD6n93MsSbPzi9iVkF5RY396RqrkAbzST8T+VQYxNG5P9nZU5R29xOJVx56J2DrJe5xItje2cwg+kcACPndjTGRHgvu1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466801; c=relaxed/simple;
	bh=D9Ydjgg1sX91ZXMSCW0NqszfE8eaaEfmb76leKdofFw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uaScn4UrzXKRBtUNz0zKKxzlD7Vpz746BIOMUO9LdLk0PZQWdtfS+dJET1UWW8SCECmGDW02RxBlutuulJB+MHcnVvUgrJUXZg0LXDmV2YrKWHAIqBtIcu97FpL+bybJUo2hZL4DmlOG/WnpY6eIFWAAsKQdSfzQpOnSzVCWtxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kaF/dBRE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LXrJRZ7U; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kaF/dBRE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LXrJRZ7U"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMfTu022450
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=M06hzSLAd/2Oor
	MdAS90ZjZl+EMCY8h6YuIEdfWOvbE=; b=kaF/dBREQWJ2zd7bz4SY1jsgSgZnv4
	/eYuvuMcLkWblW/qMTaffKmowx8f8DpTQHKoNIad0f0M+6Jvx2kuzsf7lx2i7XaG
	EzziEN2lm9Qpe7AWN7F1r+LvriU1hPyMj+MhFh3dhUOUnYbsOzzYn1dhOlRVDpAd
	KrEFsukvK1LuCSoHfLXa6RiBXk8uuJpLQrLyH8et4orr9vnXmpMNbjGu7a+oIkPQ
	VlF5Wvut2ilwbgqM0s5Hy4FtILp0A2f3QISCpQbfcJK2OB5n4nDfHeQ6XOrkIpFx
	Sjz66jsOZtO7Z35Bb9DgopvQ764DKH9Sm0hlxKjQJwSWSazR4iCqx6ng==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70d12y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R51T9m023336
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gf0ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYX58J8deLf4fU0Wva8ZGAW9vmQ0iCSWqnP0WtQ/oZUWk6wLyQK2mqrMCclK8JRiE9KjILwLRDT+kZTnvfI2MNV9pWn5Bmz3TKaY+FO1LaF+hEevQY4yDZA6f9AOun8xB7UcCuD5izrAMFMdDPHnKrxCv/xWIIDdUkYHdYhrDQxYbNNGXeix7QaquPNxEdzIloA++YaUO0/ox63Kz9Ik4GGliegVSCIFMVPR9Qr2h0jgGvzOz8cmufBMAXxoV/OpHJXjoS5XxErCkg0IMy8Zos9PGVTZL30v/rvYGQ6zjDwB/EIv9prVcAufUxcb1CLAAjZzLvfV+TufqRGuYRojiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M06hzSLAd/2OorMdAS90ZjZl+EMCY8h6YuIEdfWOvbE=;
 b=Ex9GQjwLdnr7uUJCDpU76yi5awVm4aZ80rSA1gHSUAUGHxXxhY0Vd6vefSiD1bCPwWlLDNv+CkukzMB6esdn9/pt74gVtR27lOP2owuLFOK8SA6mkpllGOxAuSnCc6r/dynGVNqSAQCJtJ/FuqfdH8TozwNxFI0WwPQEpJo7e2mYzQ4r7XAFjku8F3f5quoEw2Xdh9w2/Q6wSAkTxLElEurXU77vRKN6Dd+YCmc+WW8KltJ6gluo0sXtK7rbCbuBQ6xjpqwkqsMlKNOtIaliIVPx9D7JzMEIofiT4sE11uKuwmCDhTd5prxevoLjpsc0Zf1L6ddB84H3ADSKDKSczg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M06hzSLAd/2OorMdAS90ZjZl+EMCY8h6YuIEdfWOvbE=;
 b=LXrJRZ7UNIvgsXJhBcM6trOdQTXl3YZlXJmbkHpkoWB1NPONqlO0526jKYDMhMYdmjUEPZL+T28AENjrjy7xW6f53ZGhJTt84J6LDnisyIZzKiohsOZnGHPKbbcEFJtE76SYq54f1AeyQuGnhcRrb11dGJJWl61R9G8s4g3gxao=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 35/38] Use uprobes map to call clauses conditionally
Date: Thu, 27 Jun 2024 01:39:01 -0400
Message-Id: <20240627053904.21996-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: a58a0b09-336d-43db-a6c8-08dc966b8ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TrIJnxjRj000TzxYj04r8+sslXz8SSeZz0Ca5v8Ak6ElOh9cN+bO53VVgiTZ?=
 =?us-ascii?Q?JU77YbLkgDDw8OolofHOLD4wgOfDtlpaWFki8ipVbmKz92iM1YVUbc3zd6QA?=
 =?us-ascii?Q?gAPh8aGeeBuqJ4+glw/ldNgxsoI5jjxCSFjY0Ra2/3YzAhhqykcboBmTpdO8?=
 =?us-ascii?Q?RKnQjvCq0xebCYGxoNGqE1GdQ66GMRwrrWODvoGrHuwNV6OaWtm09abYkncp?=
 =?us-ascii?Q?WzfQEGAq8wqVvR9V7IMKMZRBBY1zc05HfxplzOmtCTETJkNWoPfl0b6S2O6g?=
 =?us-ascii?Q?SaOMT9OgWB0vAv5yT7rT+mvI0Z3+vatkMl1HJfl5E3J+LBGXSNtGw1EsoVQa?=
 =?us-ascii?Q?OeyV8NNqslwFZfdsA2PdWLif8iSqql2mU8FOshkgBoqAaSgVEVt8rOmFhNIb?=
 =?us-ascii?Q?rIDsiWl4YdXxSJCxpReTPJZiOPP6W4HPOyuWX1JH4lABjEP/ewv1IEOBJLtx?=
 =?us-ascii?Q?ZDIXOivaR65l5+90jgLFxppjRqxVoBXRrcvVdF+uZa2jTLGho1euPDonF+nA?=
 =?us-ascii?Q?b3fgcVAQPEkUvAF+vWXj/xG0huSQMGUzcNeMdmKSW2IeoumYRw78hEjSYOGj?=
 =?us-ascii?Q?H+hAL4zXvZPpCjk1N8GKNsfmRa3qy3NV131ZC/XDo7cOisWZOuZeRuZB5+O5?=
 =?us-ascii?Q?n6qlDjqp9txXotrHW3N8VgcQCHy9vfGWSz0O8EMbF0kJ1tvymgR37oygvH7m?=
 =?us-ascii?Q?BZJYv4diUpifd3idad0hMtJe38OsVOKaVAzrT4gydmenrDSOV1ker9i4u/RZ?=
 =?us-ascii?Q?eF+YZHnJaJMqiJkoyLhIBQKclIKbrakOEQts9OjXcQhRQO4i4nwbcATkt7zI?=
 =?us-ascii?Q?AAUB7sMEtexRxehvYZ3GEJWtke226PpltWlOooVKEcCmrnxGyYhylf5ig/y9?=
 =?us-ascii?Q?D0R/c3Al5fax/eAFGrdyEpSZsnDFviXDAXSsHR/1+Ui4nEnHOncqN1zUs8RG?=
 =?us-ascii?Q?EOYUMU59uIyJGrTrs4fWYtxXz+IeAfOCgu3xG+7h99/ZpjbZGtYOuXDE9yfR?=
 =?us-ascii?Q?5Oe5utpPncUn/292EAUvulySShcixO9PCkPFepuvSSWbf8z8MI9Jb+sDhd1s?=
 =?us-ascii?Q?XTPMMgbuOg/COihJoaA9K1S9U+5spskhzfWzFItW0VFuVOYYb38x1jLb1/Et?=
 =?us-ascii?Q?spAwVdOaaBG/NPyKqq9h4IWBGh74rE7cWPu3qdrEE5roSElskreVPAMZ7Edf?=
 =?us-ascii?Q?5GQQ4I1fuA1ofAeKYpVS4pI1HSmZAVfS3ebH3ifjp48aNuPOHFC8iuhCxIX0?=
 =?us-ascii?Q?Mh3setEqE86+YHtN61BN5FqZlU+WrR0P+welbmdsXYr47t3lI+dTDWse+bl8?=
 =?us-ascii?Q?yvKuiCGt8iNXT+b7AscFYz9nZ8ai33FEIl5WSTvlG6F6wA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0uMyhY+LMtYiuve+mvDW4kbVy0RBEbvB/GZf4x2iElyK0uRUNNAAsz3ikofB?=
 =?us-ascii?Q?Zn+7h3znHreNJ560uSyW71n4NveNC+AS9hDsS6Rj5VPNgTRlHiiu7iSc4t0k?=
 =?us-ascii?Q?tOYbi7WXY9IEayulAfKVFXclxajXFulVxaa0sTcCDgLLNO6ltZw1t0rKYfgg?=
 =?us-ascii?Q?Z7N8as+gfTh7RAnWaEHEVGna6+zWQ7kGArnnVdyX/VMwaXk9wWtzUUlw3H2R?=
 =?us-ascii?Q?Wk3JoNLPWBuA89l6mmMBli4lIfobOrBEWb28HPNmRD5Hpy+oQfOfLsaW5Xkm?=
 =?us-ascii?Q?58LsSSRihzwKZmlsvYE2TmonvgsKyJJGE57xSthCWUKFKkXX4ejrESqqCutP?=
 =?us-ascii?Q?++DlF4BtULZq9ix8xCeAj9iT1ws1/SYzTPp+vMRexyYVyigORhUt9Zy8WpZp?=
 =?us-ascii?Q?am6bzA+zMJ94vhI9xAb9ARSPBvj0YtO4TEAuRiEgdRdK7BALH6bMZX76/dDu?=
 =?us-ascii?Q?8XCuKs8WEn1IjnT6Wc1MirlPS8Md3RoFxnLqD6f7ogkymDWRl8KfaFHHAQ/b?=
 =?us-ascii?Q?n4B3svI2q7q1Obg93MrYjaQWJlG6sxAYOk8y6fgoYErIzS44GJnT3SnB/v+N?=
 =?us-ascii?Q?3ySQtmHgNyDyA0MgW9MCpoo+gW8zE84LkuGdmMQLAMRnSM6Rh92+KKrMHQO9?=
 =?us-ascii?Q?fwfeZVOwni1aebITbIAfy/5L+BXxq4HndMacaMzq3Qi7w5u0mziWafBbFApu?=
 =?us-ascii?Q?DOnsNjVbIXOMcJt0fPplfGpiFC/Uq+oN6mnbagAc5MT+KjJUW2GVDCjqgFGc?=
 =?us-ascii?Q?89XpDc0vzZw45+ai1bINzles3GVFPVgIAwdA2rOgBN3ApvPEJkeSufESvzZQ?=
 =?us-ascii?Q?U7Un1QsJuU+ZbfIeT1/PImsoPR/KXVl6NeZgsu1C3e90ZjVTVo3+ItkAFdh0?=
 =?us-ascii?Q?H946aCqsjfHlbhMq7jLqs7P7WoPsCHvrsRv0wWNrWrZ14Bau1C92ONo1NOhU?=
 =?us-ascii?Q?AuBuRW9ETLukKnqIMi8fAdHIpIcs5touL5+WVATalc7iDFicXGeeMOGpN1wr?=
 =?us-ascii?Q?Fvt8TDQl22y4k/vFE0bUZ02r0ow/rwVQGDiAnf8+75lZ7fFhjhYFeruTynWt?=
 =?us-ascii?Q?Ff6N4EPg2JizjIjbnkZj/4x31gXmem0B1Jl4V9cTOaRdGgqOj+TWzq5dfVmn?=
 =?us-ascii?Q?/rFgD2MRx+xUB7ruUDVO/0nLvvEVRPs14UweCH05d8P0qhcws8xWaDM6PNRc?=
 =?us-ascii?Q?iI2HeN/8hJgZgE4N7JYiLVJc1iCdFIhQNeAdoFtx/IxB3J0syy8TJYoowzj6?=
 =?us-ascii?Q?VaSzMt+HWKz9hZHaySEGOw1JXIJM1NAcbLa0JIKVBsdTXTQpuPPAJ7oMT5Xc?=
 =?us-ascii?Q?s60Fz6MQi1NHUjroHA2RaZsZFeIeuwm7hqP4FQYCA4Or5bugDnW9ZdzurG5o?=
 =?us-ascii?Q?/NuNMycTophx9Vec+2B5MQ7Fhsgzd2KdWPldhfxNJtmjgK0/2fQA6Jj2ywr3?=
 =?us-ascii?Q?sm8LxvlnZZVB54Xu7kOszlRyp4uU4CszQPfYE5qqLBa0W4MrPgoIviMwVtPd?=
 =?us-ascii?Q?bNFdektDoxhAVN2D3F8V70lmsuxjJRTx/v/7BudEyS9ChRocDQSxanCDCP7F?=
 =?us-ascii?Q?YVv1hO4nuXMLHCbD+Eeqbf8thB8hXwKFWL+G9uDl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7lX+fvM/4lOZx8oCsGDYJA0+gZHBspTi9Qh+VrjRxlqbXdsTQWtujNbjdg1ehZrg44vSU2DgNpD32bX/BJfC9rH+4rX+97vLXGV5z5WbLG7ndxOGfyuH+oxxW2FlXvjqey6QhiATdF1HGSvZE2Xigg2ktfg3ojG2FTmB5fmVOwHtzAAeiix7wGGEctToctseO9t+HdfK1BviHgZWwXl1HTB5VolI0+eFDbOaMeGrvJxC5auDN1DPD25uT5QRMQM/tPoalKe9fwZhSGbZkLybSl2qQnXAmZtJzicczPnIs8VTv20mfbd/gFezfJ4KWZhO9roh8MczIgwG0wmEjAuG3WG9igL3oRQHmubkDnV7zJLKIFxtpCFS3v8h6x9r5+rr2IyNHGytgE6S4NLQzVmT+IGbKtjCVwsNuT6eOx3/wMyc2biPNkpRkFcaxfQqkCHvGFjbWBFnHwVrpVzDnew4rUxpmHvEaJcp17HrSpG2CHHs2SSZAJyAKNEhYQ5x1oFoeuMXujNeAUNP+2v/avOpY6dQofPVdEG8bk34TLl4bHHm+oB5X4ZT08KRDj4Mvy4dbMq74s9CG0pob5rn1c9crIW6jJRPNegr6ib5ZRD2jZQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58a0b09-336d-43db-a6c8-08dc966b8ad9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:41.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ameai3Q7EL73fMAOV33H4y1pMjZoH/M8xyZ0Y6JAec1haRFTpNQEw8shSMZ3pSEnzK7E/3h8/k2O5bNmrCTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-ORIG-GUID: wI2hFoaG2C7JDe21coAzEooUBqeD1nTX
X-Proofpoint-GUID: wI2hFoaG2C7JDe21coAzEooUBqeD1nTX

From: Eugene Loh <eugene.loh@oracle.com>

Check that the is-enabled trampoline is sufficiently tested.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 147 +++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 79 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e99f02c3..43c77fe4 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -517,8 +517,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*uprobes = dt_dlib_get_map(pcb->pcb_hdl, "uprobes");
+	dt_probe_clause_t       *pcp;
+
+	assert(uprobes != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -527,7 +530,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 	if (upp->flags & PP_IS_RETURN)
 		dt_cg_tramp_copy_rval_from_regs(pcb);
@@ -542,47 +544,59 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause:
-	 *
-	 *	if (pid == PID1) {
-	 *		dctx->mst->prid = PRID1;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == PID2) {
-	 *		dctx->mst->prid = PRID2;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == ...) {
-	 *		< ... >
-	 *	}
-	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 * Look up in the BPF uprobes map.  Space for the look-up key will be used
+	 * on the BPF stack at %r9-sizeof(uprobe_map_key_t).  The key comprises the
+	 * pid (in %r0) and the underlying-probe prid.
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		uint_t			lbl_next = dt_irlist_label(dlp);
-		pid_t			pid;
-		dt_ident_t		*idp;
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(uprobe_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)) /* or -sizeof(uprobe_map_key_t) + sizeof(pid_t) */, uprp->desc->id));
+	dt_cg_xsetx(dlp, uprobes, DT_LBL_NONE, BPF_REG_1, uprobes->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(uprobe_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
 
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(uprobe_map_val_t, mask)));
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (pcp = dt_list_next(&uprp->clauses); pcp; pcp = dt_list_next(pcp)) {
+		dt_ident_t	*idp = pcp->clause;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
 
 		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and emit a sequence of clauses for it when it does.
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
-		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
-		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emit(dlp,  BPF_JUMP(lbl_exit));
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
 	}
 
 	dt_cg_tramp_return(pcb);
@@ -630,10 +644,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*uprobes = dt_dlib_get_map(pcb->pcb_hdl, "uprobes");
+
+	assert(uprobes != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -642,8 +655,7 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
-	dt_cg_tramp_copy_regs(pcb);
+	dt_cg_tramp_copy_regs(pcb); // FIXME, wait, why are we doing this?
 
 	/*
 	 * Copy in the first function argument, a pointer value to which
@@ -660,46 +672,23 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
-	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
-	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 * Look up in the BPF uprobes map.  Space for the look-up key will be used
+	 * on the BPF stack at %r9-sizeof(uprobe_map_key_t).  The key comprises the
+	 * pid (in %r0) and the underlying-probe prid.
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
-
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(uprobe_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)) /* or -sizeof(uprobe_map_key_t) + sizeof(pid_t) */, uprp->desc->id));
+	dt_cg_xsetx(dlp, uprobes, DT_LBL_NONE, BPF_REG_1, uprobes->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(uprobe_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
-
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);  // FIXME: This is the only copyout_val() call site... should we just inline it here?
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.18.4

