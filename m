Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389110;
	b=OttZzPXrKZRuDfOibbY8NF59P56B+jFco0OB6TAPFr2iD5+UtVQfgwYEmVlJdEWGookc
	 lqGnpfPSjNBD+tFiiBAr5B5I0lV1QB8m/6uBCXz1A9J0mQfnSFZJoRQCaULva+rYBPOP9
	 2/qRQZgSNVGfQqf5rqUduwgH6LxxkXXH4dvemDiG9llWgdo2Hk7RJDD0y66gUczM2GXqL
	 NfeOcw7UwDr9oIMmENfp1zL8Jxge2l3c0l35NDsSG+yqxdqXZfbySCp1fnCUVqw9Q45Uq
	 0bkYL57XpHSJ4IQ0DXnX4mrZ8FwDEbS3sfLxKlkKwtn4eQ3aCsZIg74B+9YPKJ8fwDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=WBxvfBUSa4UZk1pvWTZ+tOCkXyFPBRr2/cCkYqp6osM=;
	b=eiUvujo+wkT2hsKs00ClZPqEouTQIajGKTqGLBWLc9WQRBrM0Beo4wEywz9fz4Ss684U
	 WECFnMzysN84O5W0S32/mV5r+xQ0OPxSS7CkOJaTiFhRUgsu7EHDUqRpPBetWXLsKZ8b+
	 UST0hlayI+tPdimmwofZi3o6KHbFpeejxF9k1tkTd7DqKx7NCWVf+iUGuVpUFktPO7KqJ
	 JVztqp+2hVSCDn4ZbDcoLxl71hdGYLZIQmQ3TeRZV+Or1CLeNEbc/ZVRcrI5NH9jX1UYz
	 ujMDauTQ187tEKRNgjJw7btNPM95/KhP3l16wmK8+638g3KTRfsVyvLpzP+VNAxPe3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=kFUfxMeG;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D+ORLSv8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D85606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=kFUfxMeG;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=D+ORLSv8
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXU1B437445
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=WBxvfBUSa4UZk1pvWTZ+tOCkXyFPBRr2/cCkYqp6osM=; b=
	kFUfxMeGI1SviHcsgsXmJ8VYApfxZaij+KI1fz+TORtiTyuePPVWWuGT5nrdhKuZ
	xpFCXl6gVQaBGQVU2tDjajDv6A2ZCtY1NVAjT97gOY3LP4bs6PfMIptdE2/NQkAV
	G+EBqbURQR6rJPcsrQtYHTkAL5L1ILzCotyvAIqryrOUBU61Qg78o4TIKb23MbIG
	lSkrbDXTb1uSUgEk7PSeysoTpQRrdqJBNcnB8/0KpWgiI7dmyiJA0lWXC4Pu369j
	eO+WYuEBgl3Uud6Ngg9VJ4jgOgRjAi+VgWe+IkXs01/+VnpeK4TdfrHsZeL3++r9
	IskiY0qPkuNTs8ZOfg4a3g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5p1dr6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvwUR474858
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:29 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013016.outbound.protection.outlook.com [40.107.201.16])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn01jb746-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxgK2cL4qWNP95BTBMrNG2gQQLnfzNyx3rrgFTrUG70B/5DWkwqn7ULo8TnvF6R/95/rNGfBcromE/uSprKSAHR+vwmlTpfCKdxnQPGckHCFPAmsLtrXxlpmYgo33BG4GzJVLJYXlG3xTvNZuTDaai8AcY45j0gl/D0B7t3QycPdOTxbL8ujT0pd/HJ+sE9ytEPbD11SpK2zwcdwY75/96Is4GM6nIxt5QgeBBkKbgFeCoYnTowt4/qxe8yOezbMY2+fUEvUZAUAkwFCso0CVzPS2gpva60bODCSf3LpGdzGDAdvVIajbDcQTckrkF0gYV9UPVGqNYdi/oW+rtLelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBxvfBUSa4UZk1pvWTZ+tOCkXyFPBRr2/cCkYqp6osM=;
 b=KPQspi+jiaWvrur6me9SVIAvOLue/lQ/S+K3tGeooX8PZqWfUl4V6oy3i+iT0ILuY3EpeQkitwn1LS3XJtHV7c+5eZiqHlB+AKCC1vity1o+psyG++mSqqPdcwabTWxxSXLBZqNZW2pcZ8WEXLjwMvg3D4o0mvsqY/C5qm16tRcyI7gulrajffBKRiUjl6Wka58imn1YX0WGol6wIJb7z3DiPJB9tIfLuHuw0vyqtNQSg0ZXGxvDhxlwEPQ9mSkX+kXd7NORswvY33fPU/dANgINVP4pV6b+3xpkVzV/JMsMVbJPyowtkOugEBo/4NWPy3oyu4IT0tu+Kc2Go8qHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBxvfBUSa4UZk1pvWTZ+tOCkXyFPBRr2/cCkYqp6osM=;
 b=D+ORLSv8RoiXEoyxN0DL0aQGRv52GrGRlxbFd9OBPu9sFyY7mEvYKeDvS4QXIw7ydStlO3AiXtQc0zJECWebngl4YJ4+z849FFAnDxwU0fFozhZtLE5ZtwBPSwTKFFOIoq2CB8ZLSUEj7et6CggYOC0bHrMUZ6/3+750Brcimfk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH3PPF8C8C3D129.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:26 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:26 +0000
Date: Fri, 30 Oct 2026 19:36:51 +0000
Message-ID: <10f66def218e32acd6292b104f7f4cb8@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/20] libdtrace: use module address index for aggregation
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH3PPF8C8C3D129:EE_
X-MS-PublicTrafficType: Email
client-request-id: 4ec979e0-d071-4692-b912-95867f7a2192
request-id: e5079a73-07d5-4dbf-e79a-08df36bd5dbe
X-MS-Office365-Filtering-Correlation-Id: e5079a73-07d5-4dbf-e79a-08df36bd5dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|261026140227099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	1QfOpDai6ajVAky6gd4i4hZJ2wdEEHm+Pg4TcZWmJj+aGVdBHTcrtah7w7b+LEHcwO2fcTXxt/c+/qRnS7wuQwQ/yOewoqnTwvHmqGkOBmKtre9E07rvMkm9U3mlA+v+nyIukjNbf8diczmmkUW2OTuFNlwyAwQLFeCstvWmGbqxVe9xQzwMhKFN7y1DRdjkZKGsUSInRkAFwMsF10t0QkCmIuE3VtR9TPSLueCt2Mxvy5CaWfJtfrvATx7UYgg5kryzfG2KQ9kN5hpCH8Vw7TXVBI8stdlm40E41dKp+ZZtd5ioMzVxgGP6QnGBPlP4UraFIFC40TbK1XEv5ou6Ne1EFkOouCSV5K4s/MPqkHlNc9MX2ot0MBNNKmh9FVNC7h6IxY36HM0ue5JdHFRhe0VaQW8FPiXOGL8q2VUjIQYylbiq8UDqUF4UDymP0qFK7BOOj9FnSmUBjpj+ijB1Xto6dUwNt9Z29soZLC9DP+jY4gG+KzpGejl68+0RemL1A4ZaEg1G7PCsVVGkUtYZOpefj1oWmj0LH4rQE4raPLAK27vX3yUZEa3Z+BYPnu88brzJ1XTIIMLoFU2b5sL5PiSwivpixtOPb5e1voQOUvUqD0U7azwA+ED7sQ+vWxsDy6rLnUyUc/Ji8b1epruu90vSecOk4OGt88O9CaqsXcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SI0krHYubxTr7kDtEMXYGz3kPOhEqNGi+JYwU7Y7BV2PcUUfx7dblpLQwlhE?=
 =?us-ascii?Q?TrsgPquZvf/FYZaAA4yMl/4O6u0bvxJloqDvI28WIQBoTFDK7mXYSkq9TDPZ?=
 =?us-ascii?Q?T2oaPNxY8l1zUvP1wVN5sXg16hF9DMOqX7TpJr2AMyuEE0X/6tKWsKAW6+M4?=
 =?us-ascii?Q?atGI5K4fYClTb+VUNLGBofLAIj/d74YuCc2XaWYNzzJ11hMOKVo6k/lMOnAm?=
 =?us-ascii?Q?qwKRnDL54oqzU0ubLcGZirTPi2Vlb4DMbwJQJ3Lt/h8qapWopjujC5ABgKn5?=
 =?us-ascii?Q?81WoK4nX8JjbTwfehQ26eYqkSu2xg5rYU8EPb7bV2nOM8jP4rxfJJKULaNa5?=
 =?us-ascii?Q?XYIWpo4E50xqV0cO0llzz3dRIA99ws1xm2FI1bZNkXBaLHkqHGf8bQuRrjP4?=
 =?us-ascii?Q?c/cCmyaLzdWSoG1JLqFLLGPV7lQRf++YU4u85m87AuxQcH3hoMFnrh0nGCmn?=
 =?us-ascii?Q?DN+DSxTMqwDQEFfTh6fR1VYXYYQYoo2BNlrE3Z1Xb2j6e1H0/Ekgwn307jGN?=
 =?us-ascii?Q?rbQRmO8Xouk/YKkyl4JiVj8xSZnuKBuZFysUROHttE50RCLLATMNzqQJSwP5?=
 =?us-ascii?Q?pr+Y0fCJAM524I+iyEhQmvt3zaZlCAaPObkp4tWD2GUW/okINTBPJvXCi3qw?=
 =?us-ascii?Q?luMNsY+zDZBLHNajXY+8una8cxkhII3eQ4X1bNDtdNpXtAX+a3u1RCjdVyEJ?=
 =?us-ascii?Q?khrma338zKn/U5YgaVDkPYSwaT2eVDUTd5loMcz5ORqdB6MUFBRTtCoehkHt?=
 =?us-ascii?Q?NSXaP7ZUCSRI+wZhJ95fDFs47UqsWpiQjBKqS2z0luBQkyh5r+NF3vUXjFqj?=
 =?us-ascii?Q?QWkYh50YSXmT5oGnNNRN1CBn91IVKi/P+0jUjbGxfkM2kxME68oF7hcE5E6D?=
 =?us-ascii?Q?JZ5EIQb+8aU5v5DYohm3pW/RtO0ia3JKFFJGAyqSjSsFxm94d6SINs7I+vfk?=
 =?us-ascii?Q?L4YBh0HCYEQRgWwdccPFg6+8jiFRCPNikqSjLboiZIumA2hPCz8c20JwptRS?=
 =?us-ascii?Q?LMCo4S+J/sUVNuu50hNA15hIrrKd74+J9eKRY7uNu1Y2Ju2pDW7k2tLLfcTt?=
 =?us-ascii?Q?ylM5uf/iBN1JQrnaoZOnDcem/Vjnu6QVA45oOAd6oRYVSAZd5t3Ij1XMnZ9a?=
 =?us-ascii?Q?dph/Mvdw6vdmFoeFoCE6+S/LdBTzvjLUSPG3MTCH50khJTjPIY8BjKbX6HEI?=
 =?us-ascii?Q?Z8YU+KDB0QLn8WJkYCfGzwnArdBdcM9rPHTYtGAJst4D1dGcQaPwJ230SVAu?=
 =?us-ascii?Q?nMwC7fodMyW88g4euCsg0mY6HPzlnQvCM5myPzu7WGGEJbi4cT6eD05mBwMc?=
 =?us-ascii?Q?2uYF3kv4TpWTJq+lKzSqcB8dQmTobiNv9LBmOYWmPanS4YMhQPEAm6390TN6?=
 =?us-ascii?Q?+KCP7MyprcUDEe958MgjKcAwYbeoHGizFLvV0XA9VKPf5DJP/q4LY6Uz+9OZ?=
 =?us-ascii?Q?71wdImqD4FIv+62pgV/E4PVRK6esg5h1KzrpXTagIJ+rQVhI4hNF2u1kq3X4?=
 =?us-ascii?Q?KWdfk9IqwV7PTGos1bmq5klW8L/IR8yoTv08GoBCOLEdwsbJOUaAp1bxuFnN?=
 =?us-ascii?Q?fE6Zxm1UdiptafkvHNYpiFbt1mv7dBsfxK3yNMqoeB8h9LRAnIfpjxvXf9Pg?=
 =?us-ascii?Q?3yU9aXYIP4APFzuAZ1OjRQyjsp787GcQdNrJQ0YhjjT1vHveow+wVqfFmqFc?=
 =?us-ascii?Q?n5QQjqHZQKzyV96hm3bfkqWjsqcMeQbvjeC1YgWa1VK7Xs1dNNAqZaXVNUR6?=
 =?us-ascii?Q?HgtCVmkGoPagxOxw4tgC6KALroUWej4=3D?=
X-Exchange-RoutingPolicyChecked:
	DtfStWR5auhpgdQIckPJtSccNZfk2IKR3HoWPGhARPGZUptPSY7w/16p5nDhNRR8pxXNentLDcyLp6KH3okCA2K7UdWf6yB2IpE9giNmVSDqvGDvhSiy8r7TZ6hZFswrheBZoXrkdp78TW2miHu2jqqFYS1RQgcsdQEWU9gDdOUIC7WjmkHrAdHLYh5wUYMvDUXv7kxPiUghJQJkyCE9ECEbdzvRdUdN71dzmXVaZI8oTF/2gRLs87eRIqZcFFpVUu0mZN1PmC3kxRhYUN0S5gLWakWeVYPbfhbDURDKcphLZqOwuwdCERGU0X/r9RnuwG/H6zpR9WqaNWJo2djmLg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Az+37Bcd/dxDWRQ52uo0uA1EVtH2H2ETWs468QXYoiy7nmhfhcvgaRAYZpaRjLHGv6XxlyjoGr+V8l+nE+yibkGOvUpoPinw29a/fQ7+By4IlFN4C9CPMfHW9XiOG/BlRQTWENXdVrKcmAp6j6HA9a7Db6lWwXlsmMvOyXip3dsZB13tFhabEXhLcNiDMmLbMWxqeBHbzP5PdB/vc31HpS+9I2ThURzInjqNj/4Wpmuxzz7Dn1cq1KuQNEHO94GT6sTZoVCW/mHNaahGU0hXv0kPtcGHbsMbaBidKHXx2SfavwSQlxgzkyQVUyUcKoj/iSTi6VoD92KBIb2M3rGxyH0j2a7X4Rs5VF0cvK3ceA75ls0irvDb/0Wf2RnOtJJ9wWhf4UHmNx8jCcWqa+3jjqzQIFbQQTlOt1w11YcuqMhorHE/HsV4qwToj9qOv2fksBRmZNNboa20n+PXKJgH6HcdUZIs3XD6EX671wRKv7ZeE6V0R99SWwdwNcxH2OwSniLLlR3L8SjjedDjR67Nv/COZ1gMcck3YEQMxCR0X2s73/YEcXXJhP3SW1JAl+Evs3Liw3FKLJ537KhdyC0Iuxq1oN/jOwFqkjYMfZbSTAI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5079a73-07d5-4dbf-e79a-08df36bd5dbe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:26.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUDJHAV1b7LkkN3VSsJbbcwWtafVTu+PQHZGXe7TB68dqAz/UYb3sJGxaX05Io/s2P8mp+MdZIcCF+YpIcGPX4MVreoRcTznXCItXwjznd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C8C3D129
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+Ji1zp0yuZ9d
 xrYyhq7TMT5wQjTWFPmbYamXME/s2ivTwepyWhygOgHYNWy0EMpp2T5nw01iQjBTaN2WYU206Wv
 m0zVKRW4ykvODrLRvMUl5usdK13WtBXFZJMANXyp2qAcziFttQGDRDe9AuGnm79t3KGo+nEMhWa
 XaoHGc68APDoUdfo3RKFGNBjpZfMvKRYGt46mSS5zEhPl6h/dWMjiKxtD/Ta3Fs6ZbTw1DUbve8
 TxXvhF9dV/v4jnOmKJK0YRVtwpPh9mYvYz4WN1PjzyOqrNXTT4NPSlQR5mzcFxjXHV1igtqhNYh
 Lqh6H276gnSu0KddwJsZJe6nEmGnXPTFrgugV0lvWaay6FJhAKf41SFBIcEwG4qmCLFE5fBTyRo
 HNd5OqVmNDPK4PY/AbHpRk4OU7OMsBWnRc28D3Xlz0Nz/4XC9bTktxOUVRGP8AOdzUJ8vc7B2Ys
 q5QLGdnxR2xIsbl3Ymw==
X-Proofpoint-GUID: 2EMWBS0TrvSDx-vNG_mQrlPGc9hpNZCX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX5IASKUeUinQV
 oGCxgA4lkHzVgl+HIXJHpBZ+VLKI+FxvFVywKpGX+KkHyg0DjH3sEzwHFbn5oi3uneXq5k7/CF6
 AmbhGEbjuJcZzxW+2ZNksIkyS++Iw0Ang4CLP3P/mLceS4WIpnb5
X-Authority-Analysis: v=2.4 cv=fKGsTpae c=1 sm=1 tr=0 ts=6ae4f235 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=6DQWp6KMyov6i79R92EA:9
X-Proofpoint-ORIG-GUID: 2EMWBS0TrvSDx-vNG_mQrlPGc9hpNZCX

Share dt_module_by_addr() with dt_aggregate_mod() to avoid scanning every
module when normalizing aggregation keys. Preserve the representative module
address and reuse the indexed lookup, including overlap precedence and its
allocation-failure fallback.
---
 libdtrace/dt_aggregate.c | 38 ++++++++++----------------------------
 libdtrace/dt_module.c    |  2 +-
 libdtrace/dt_module.h    |  1 +
 3 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 1fc8294d..f04c39b6 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -18,6 +18,7 @@
 #include <port.h>
 #include <dt_aggregate.h>
 #include <dt_bpf.h>
+#include <dt_module.h>
 
 typedef struct dt_ahashent {
 	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
@@ -394,34 +395,15 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 		return;
 	}
 
-	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
-	    dmp = dt_list_next(dmp)) {
-		/*
-		 * Check text and data ranges for match.  If there is a range
-		 * that covers the given address, normalize it.
-		 */
-		if (dmp->dm_text_addrs != NULL &&
-		    bsearch(addr, dmp->dm_text_addrs, dmp->dm_text_addrs_size,
-			    sizeof(struct dtrace_addr_range),
-			    dtrace_addr_range_cmp) != NULL) {
-
-			*addr = dmp->dm_text_addrs[0].dar_va;
-			return;
-		}
-
-		if (dmp->dm_data_addrs != NULL &&
-		    bsearch(addr, dmp->dm_data_addrs, dmp->dm_data_addrs_size,
-			    sizeof(struct dtrace_addr_range),
-			    dtrace_addr_range_cmp) != NULL) {
-
-			if (dmp->dm_text_addrs != NULL)
-				*addr = dmp->dm_text_addrs[0].dar_va;
-			else
-				*addr = dmp->dm_data_addrs[0].dar_va;
+	dmp = dt_module_by_addr(dtp, *addr);
+	if (dmp == NULL)
+		return;
 
-			return;
-		}
-	}
+	/* Normalize text and data addresses to the same module address. */
+	if (dmp->dm_text_addrs != NULL)
+		*addr = dmp->dm_text_addrs[0].dar_va;
+	else
+		*addr = dmp->dm_data_addrs[0].dar_va;
 }
 
 static dtrace_aggid_t
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 9d93b9d8..3b40c1cb 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -2421,7 +2421,7 @@ dt_module_ranges_build(dtrace_hdl_t *dtp)
 	return 0;
 }
 
-static dt_module_t *
+dt_module_t *
 dt_module_by_addr(dtrace_hdl_t *dtp, GElf_Addr addr)
 {
 	dt_module_range_t *index;
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index c94cf7b5..73be7144 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -20,6 +20,7 @@ extern void dt_user_path_destroy(dtrace_hdl_t *);
 
 extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
 extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
+extern dt_module_t *dt_module_by_addr(dtrace_hdl_t *, GElf_Addr);
 extern int dt_module_sym_iter(const dt_module_t *, proc_sym_f *, void *);
 
 extern ctf_file_t *dt_module_shared_ctf(dtrace_hdl_t *);
-- 
2.52.0

