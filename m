Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87542315F
	for <dtrace@lists.linux.dev>; Tue,  3 Mar 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549562; cv=fail; b=JT1kZrbq+R4SXOJn0A0S0RBHOSoO2vTsUzsOMZPVsobhb0KmgGbjjSucguNrx9B63zMy53jGPrBVoZwSwu57hQ5YzLBK7SCrj9L3sbooJRtaLD5ertydM9Eo7lic7/+1DLw5HqsWUujlMYy3Q+tdmWSdbuRziKUNhunbir4sYy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549562; c=relaxed/simple;
	bh=yBegzHS4+tZsq+bImuxrgo5gUvjmi+rwHIUkLb3qFyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jbxz+/AGRFXHXWgdXBCSDOWNCE28LYHZI7Fw8rm5pNyuTAvlBLrYEdl+wcE+gRxEdA0DbwjWdsFkBqASHdgFnR4aFVnm39KAtSX7chNBa9FM2slmSUH2LlKz/yrmI19SCjBzd+L93khkUJMw9/fBX/2TNbQmoFheCMTfnVeIZj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dw6lpqmB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yj21Msb1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dw6lpqmB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yj21Msb1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623EXWa2058015
	for <dtrace@lists.linux.dev>; Tue, 3 Mar 2026 14:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UvRjvtGZ4tArv0skPv
	DcAU1xpHk6mPLebYDpdcAXjOU=; b=Dw6lpqmBmbkbLcj35YD+ANXONYYz6TN1nk
	zGDkR4dYNAmejqStTK89GLQ3qN75TUlcjfbhLhLbWQfayeTQt5qLYhXuzQgwLZ6e
	HgTQaYXqvGyvPOwmVFcO0vYktQM4NBCDJWIC8D45v6IOEy2vAhALWVHIitsVaSWa
	RE+TkxcOQERzLslKH095KM5pr35AFImbjNWZ1SPC5OLYFrn4Vq7mV8TFBOQ1LRE2
	1TRsK5ZBvYK1rWIFfSl0gxHT+N3R+95yE1pm3tfOGIfXTj3BAirIoMw7IIC4PSho
	gyz+PTdbifuHZvpTaCav6Z4d7U9wR6avAbRuSWzs3s1AAeFes8ug==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cp1gv01fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Mar 2026 14:52:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 623DAFp4029671
	for <dtrace@lists.linux.dev>; Tue, 3 Mar 2026 14:52:39 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptadpp9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Mar 2026 14:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GItD6Z8HVg8VetJ/+brmnF5+Am4NCA0P0yZQAdzgyMjTWUAzGaz7atU3sTxnwrQ9avwRc91VDPmyd44WVcMXHl7rvcF57v0GQ069mHvSRSYkq/7IdAHeRip5k+9SlZHuq15WLWURt0rQsHxsMcOASko9xzqwONSO0dVk9gGE8LDgnEhxEOL9IX+4a1UdjfuDDuQ5K+klyYbKiBErpgYNlqkyOFqdUl6wujKHgS+KtJWhRmEle4IYtAp2x95WLMNjsKbn55ia0oOyoJ6TYMTr2ho1RVIereDNHnH7or0UQRO3cfBqE/1QhaXXkYzELAk43ArNxzbu8zo0n1pf1IEJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvRjvtGZ4tArv0skPvDcAU1xpHk6mPLebYDpdcAXjOU=;
 b=HSvDKGs4ArTxLh/O2e3r06QTTercFJCx8Gamj2E0r0z0akvR0L0pJ5vHriXWiOq/CwuANx23WY4Za6R7J5SAVT/flFgm1wXKUWaRlnACvA6M3AWA/bZt0jensoKA31Ea/xdDSucMqp2h6yAaWp2KP5Qdg2ksivsdXpyYJvHnaxDrclpNdx+kVQ6tTswjh7WjNVrDvjz+vD6B7eyA6dnqI2LlYvblSHZHOlbkHan6VLxTyVFbUQoHJA0TiWA9F3odPhPUVRVxMmJT6h501JOQfjzKxGcAnqWF+92Sh7WUIcm6bkZyfV53rRqwZWPVeADDOh6XhSR8Xo2trMnfmqZgOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvRjvtGZ4tArv0skPvDcAU1xpHk6mPLebYDpdcAXjOU=;
 b=yj21Msb1eC0v7yQXa+GcwITEx85FRaKG5ZAN6vViIc/gNOdJ+MoqIvorFqq93NJTGcRj8w3usqIdUBZcUUdyZioK5lWn6ElaCAJb3ZdHbdWw+tEoPeptGxRIpMkDcvN35RrP/V1BuAxA+VIBmxOfYUyHmG7scy0c+es2Sp085n4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS0PR10MB7431.namprd10.prod.outlook.com (2603:10b6:8:15a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:52:32 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:52:32 +0000
Date: Tue, 3 Mar 2026 09:52:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Check for symbol
 ext4_dir_operations in module ext4
Message-ID: <aab1rszInoJZdpcw@oracle.com>
References: <20260302215112.4416-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302215112.4416-1-eugene.loh@oracle.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS0PR10MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 861091b0-4736-4d22-ea5f-08de79347fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	cLHG7IlqbbQ3t0O6G78qhTuOvnP3A1pIpb5/4qEoHvQKcoV08K93do1FJaFhMFBAf3a2V9VZF1LzD9Aq38phddzbM2t9+RS2tGkMPwzHedDNqDuF9+m2kz8MBFQyragRRXlPq7hR1wNN9Vf6AysWL5Si1ZN94CMHjug/XIaxqXAmNt83xBuE4KtDw5X5TrRuoC7PjrbwjRkhuSS5tRKLyUms2PUE4K+BCwB/WE4uDl+yUgFL98KXy9wGQjaivrhcdU33O+VI44/R9wjknz9WGdtqq285RV1LtqYvD69aUEOFA33ZEVuCpEV2S/veV1UXbwFNWIH16tp+XhQlEmu5+4ajD0RS/FDkPbCYGBbJqiETHbzucDok0qLQHh680P3bvSaERQxkXOWUdKbbszcQwUJLpketfS/0So3V72/2BGAOKK7S6wwTT8IVjByHxPmpaxI/5pr1OulezJNqo+YNgJa/FGz1BRL55wXAIP261f7pexo6WiVz9UA41cwMMG+cNWA5yVX+9PZJBP7+2uLtqi7C4V00/DdrIBVJsNi6nc7HP08lkQ5AnYa16TM10lSyDrqNpN+KhQ3bGYPRXUNK4Oterm0ncKeRpMHMnYirPfpmwgu1kghjpoqkFvq9QTaoIUVekWhbS4YD/4uWniySB/GuFAfqL3qDx0wD7Ei2K406PX32uVIADPZsqnMHB2bpBzQHJR8POxl6390VEIRFZG99vxCxdYnHKSiCnYi3xS6uEHB25Pr4K3Wy1QjSrp0Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQo+r+qlmuubT5oSGoqNbZ83K3FQ8pku0wz0WDoF1eDuGBS0swhucTFihzOB?=
 =?us-ascii?Q?PWAdjaU/ZgDsREoc2VJRa4W76zxUjg79JkWu/ImB9u264vOCSJESDEirXIjQ?=
 =?us-ascii?Q?8xkjVJYY2kyX0lL9+/nKArFldT+aRsekJE7jIeOgjy3u5NN+SssjGM1SrKby?=
 =?us-ascii?Q?2lnUjCguOvyy8bhJD+OaxsxEuP6RkQ9mlfHlGmYDW8yPPb9A//+1v7FP0W4F?=
 =?us-ascii?Q?i2UtX5WI+fjEwqFTXzcgwx0plsxwao1DlgrQKyCRH44+ybfaT11bbGyLjUvY?=
 =?us-ascii?Q?LcBnriDl7Wbisz5ZHybF/t0qF/nmbzBgScdDJRJLsN+pekJ/F6z++lBGWFFA?=
 =?us-ascii?Q?71ti9JivKZybeggcr6832FtESSc0vy2QOOoMW9m+Wtrv/Qy1WvGKpmsQ7/1A?=
 =?us-ascii?Q?DMG/SriO/gGsqoT816dp11bYlw+J/AM6/qVZ27mg3KQavtgdlDACTckViwci?=
 =?us-ascii?Q?T6J83VSmss5wLq+9SuQaFKWiJysfZltMAm09ox+Fgum+OdUDBxbyFALIuA5s?=
 =?us-ascii?Q?qBxYTQpFtnnoAAcAMuGRaQRFKpZO7XVwjC1XlDjIqkGK1ROw8kUzoCabo32o?=
 =?us-ascii?Q?uLanCClrWN7AZhV7JHASahqyiht6crm8GRPYptdddaZq9ely8exopl0RQJju?=
 =?us-ascii?Q?534D61iTTRIk8MJrcb2XnDB/Tn18QhVpbZCvzygQvuS70WcYf1b6/89AipZ9?=
 =?us-ascii?Q?BOJL8j+2q28j28fFgFZhJ09pABfv04l2kMBQ46UM9n1xrLwFPJWRWzUrDaAw?=
 =?us-ascii?Q?PzRl9s3jcNo7lZ72SsaTHw5zQB5Gf1TX78R9SrE1maBF/TeeNgmTmbmbvqDI?=
 =?us-ascii?Q?KDnF85z3/pCvsgElYbWfJn9hOgQ9xdJeS62ijDhJFdProJ3Ya9pVRoIBMFXu?=
 =?us-ascii?Q?/0PulxB3fzeodGoTUTHzQr8rsl1hGB+2giBCb9uYExFfD+ljTA3LiwDGDZ02?=
 =?us-ascii?Q?BieX9j5D4fq1xW/xvQd5boasI6+O7SAj8eA/Sr1uuEBEU1mb4jlks7uRbeG8?=
 =?us-ascii?Q?DR4+mi9VwvA5ZwAa8OqfRx4+q/F1Xg+xavNT6+fkvp8VALb7pi8yp1wn5ruI?=
 =?us-ascii?Q?4Ekvil1pcjFpOJ4OiqofU1teJr5y9JX5nLoUv3pvn7JlsrbiVcXuakBwJIRa?=
 =?us-ascii?Q?ZGWb6zZ5ieHlksX4/NW8PoL+OCjm+5uM4Ld66+MclyJE1UILfTInb/Amphdv?=
 =?us-ascii?Q?bwZWB57yPz3wv5KgC53bVWsmHHo/GonOUge4H9jWnMELgZPgtdKJgryCPnJh?=
 =?us-ascii?Q?6T6KAa+KLZTkKJNGJ7lZlLvK82JqpmxVKdIAnB1LBbvRaxyasmMW3QANHA/q?=
 =?us-ascii?Q?jNUXFtmHUqjvrOYV7SrdJc5hVuHNF1XlzYIJyN9fki40253Y3TnuPdgsIeL0?=
 =?us-ascii?Q?Oguq79zHpFoxdJBx6rxYAobXWXzqPdXLoV+X+SpseFbZnQI1dYMmHnL8AU+1?=
 =?us-ascii?Q?PUiRk6wwQ7lxticoniV0zpuJzpQ0AAoV0K3EFqL0bJgaVG+etOlefuWnJFDa?=
 =?us-ascii?Q?Sf2o0NBOlNOi6oOwy42aXr68A9P52qLEmzS8ARFWXytnziNrYUjLYR8AAiLS?=
 =?us-ascii?Q?8iPa3myLrqX78EBphE7XrZUlQ7IpHv30U42oY0MZHTXGzsDRuzkpsjqSAwlE?=
 =?us-ascii?Q?kKbjwF/HKX/BcHq3Gqlt6Rpp6aKr6QpTmUffE+lkE2xiAUg8NOBJ+Its4xZY?=
 =?us-ascii?Q?S36UjIee6ElpsFufUR+700FTB63LHlEmk37Hg0Awj+bX/FIpX37HLA1kR/L4?=
 =?us-ascii?Q?Omcwi1GKIQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b1qJU76MECiUC98XzWktU3P59F7ATg9evenVWarrzNL0hoQwU5uZG7cu5z/D2BPk6Xq8D1BB9WDALfAiVD5qUK+9IjWLsw2XiDA22Ds3u0dakMbRc6YjxTLPGcBQpChPfGcccfyDC6nTSLhQqLpbb6rOj18I8+TTj1rH1oC3q1bSPAr3PMRbkbatjISvQ32JBzGAHg1IcYJe89hfUfmEpJOV6mqKF8Q5Ux8x4NaKD9YydKnxJMWepGB7HQBL/B+HGjyZXlL5OiMFrLPSdj2uG1jI8VeN1hcNwKiKt+cb72N+sP0DLtoUAPddkZ0YCJh40qlb66FBqFVJLaNb6j8x5Tcf1M47ZAoICqCrg5J5nTlMBsGmdN8YQ7BsV2sdMTfGQ3HXQjxtPiNZT76lM+HaSLu+GTDqkcTIOd+u5VXJ3gpaMrb7gk/1aZPOsRIyCJoclYKcfOs514/nj7yluK5Zsg68uLALbo7uTrdjRBM68syedmSIeFQWzKZK1uu/T+JdhUy905Xyf53dH4fysF25Txlak2GZ9YZyUB88ugzvAC/MwTSYXDY58UIUCwPtaVhSK+7rNQ2bo+5u3JgF2ImTyOyX6F29yJhdYOn8N5BhyHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861091b0-4736-4d22-ea5f-08de79347fdb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:52:32.5398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cflgPYRRN0bTI+ZTGnKAIYpHltCyhcsuOdE/neCP1JDvjvbwjFOYPe6ttmFWQ56i08jQvxKB7ADsMcQcMKPFN2Zl6iMeqFynU8QDtTsOsbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7431
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603030118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDExOCBTYWx0ZWRfX1qAmSDuwfeVe
 uUm+I6uYxr2iK2rRCBV7SESa6oTkPwqnTZdBQTRiC8VMeo7HhQKXMyb1nF0Ytvdfm8CE67EMldl
 BQJuQCA/RPCPbhGEazJmvGuP12Kw8N83ka8dLu3BDkWk2OvX8sJBY74dBM0RcAMzEPe0djozVfP
 EWVUjCvkKIcDtOOHIk2TucO10momg2DlKg+NLJer5VlBs8gtC7IJo1xQPowTGA+M8qmIkUarTkV
 bkYrNlJYL2ufjcElg1PETxtO7sr93i+16veqstY2PgU7lG8nj9AxVdPW2rEoF34u/TS/e1ToA2o
 hxObpWuqwPKvGFatACSWvQSODKFgHaMK+q8S4HD7F+Eb63grkTCSQ6jCEF/y0tY4hW9IbTtlcJG
 UwDXa+moHVnaFo8tvCKhfkCNTNHk/c35YclRPvx7FA8NveQALknT6XzDDmBlx778opxonbw0ixt
 HPNfGfvzn1gGuCGhtzA==
X-Authority-Analysis: v=2.4 cv=J+OnLQnS c=1 sm=1 tr=0 ts=69a6f5b8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=6mTWHuwD_vXiDxj2cUwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: WqHFOZAm-RvGF6W5mFDLFl3JyABUH-SR
X-Proofpoint-ORIG-GUID: WqHFOZAm-RvGF6W5mFDLFl3JyABUH-SR

On Mon, Mar 02, 2026 at 04:51:12PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The tst.misc.d test assumes certain kernel symbols can be found.  The
> test specifies ext4`ext4_dir_operations, but there are apparently
> kallmodsyms bugs that misassign the symbol to the wrong module.
> Thus, the test fails to find the symbol.  Meanwhile, we are less
> concerned about such older kernel bugs, since we are moving from
> kallmodsyms to modules.builtin.ranges.
> 
> Modify the .x file to check for ext4_dir_operations in the ext4 module
> for those cases that rely on kallmodsyms.
> 
> Orabug: 37783183
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/scalars/tst.misc.x | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/scalars/tst.misc.x b/test/unittest/scalars/tst.misc.x
> index 1a1d9d271..ffef2fd33 100755
> --- a/test/unittest/scalars/tst.misc.x
> +++ b/test/unittest/scalars/tst.misc.x
> @@ -1,11 +1,20 @@
>  #!/bin/sh
>  
> -if ! grep -qw isofs_dir_operations /proc/kallsyms; then
> -    exit 1
> +if [ -e /proc/kallmodsyms ]; then
> +	if ! grep -q 'isofs_dir_operations.*isofs' /proc/kallmodsyms; then
> +		exit 1
> +	fi
> +
> +	if ! grep -q 'ext4_dir_operations.*ext4' /proc/kallmodsyms; then
> +		exit 1
> +	fi
> +	exit 0
>  fi
>  
> +if ! grep -qw isofs_dir_operations /proc/kallsyms; then
> +	exit 1
> +fi
>  if ! grep -qw ext4_dir_operations /proc/kallsyms; then
> -    exit 1
> +	exit 1
>  fi
> -
>  exit 0
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
