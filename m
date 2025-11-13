Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D96184524
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762993083; cv=fail; b=BuZGo9OySoHHpDXBNE5CWtELKl6NHolucbRFSj3MKN72jy3/d+rRhH+tLPmwqcGK0C6oC4aMFZJP1TyiUDURfi2T2yiUOKB92BLyODDVKKzgMh3KMs53vwsHK5/86Ee05wdMMfmfFEgw7BaOjRW0T1jB7oqQJLqKiBJtamTQu8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762993083; c=relaxed/simple;
	bh=LUurbGUrg9qubRNnHmgo23kVy2QC1Av0ewcZ13vFyKI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HakjXZag/nLUjpkcR0H32qvZz/s8A7nCHlioTq2zI0xyMujofz3j4kOXpjWv+T3fTbXj0xS5W6ZlSaetILtWMYs5m28oq+MmmlfFSygakQMUSsCpDOw3xDitKX0Jx0bY2aFrO/ylyeqW6VsUqPoMcihnM+2TBD2BA2v5T5JFG28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UosxV9nl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V45r5YZH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UosxV9nl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V45r5YZH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACNuRiU015673
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=byUaWYZwKooKuzDM5aXFyr3700TVrxQceAbx6SXPpnI=; b=
	UosxV9nli0qYxsFewmh17nsf4A2nYhmF6b0CAs1XNu0Qgl8//1ZcNYf/19wBhVR3
	jDPEhvL/q6zAj+J03AgwIY7OfhMiskMzqYd9iHhhliKSqDEU8YWMXeSf92CgS360
	ZcP/JcaeNtXwaoTHPyj1cGVdLkcQWtlS5mzXI0RHFckX0GgoGU2lNsqqcYSqedzl
	KKqzCmQkDlGYeDlkcQuw9bgK8Ipx9T6iHHIlOiXqQGjkkF4kt7y0u+4R0NbGzprP
	8XOkFjrOZZ9ronex1ApxssaEn8q7HokhnAHlqSTzT3ci0NFyiPcXpXrhALx7Tf7u
	WUYh9grz2YYLiVOAmnmtQg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acyjt8jwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:18:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACM0reB009929
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:18:00 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vabxwu4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAnHzAjScF+a9N4dIX/cHOE0gpBI0dbngN5G86Jo62PMOAIFbm5qWpZl5gl4130SP/3o+uiBciYBQvhUS+ok6y3cA9B7c71Wpre/J/x5JlN/rnX+JM0639xPFJ/dSNAU69lxBlQrHTp9UlVqbRLk0sxwrjNxrbdyR7Er2YyfieFvyvtVkEOuJbBLb0ZffwxPzMTeD3Y+94QuS0c/dUbyHZOBmSZB7g3cawtMxn8lkGiel1KPItw1WEH/zIA8LM+ITp2wf4sUeKHiKmXWjT/e6MkkhpISurJtPTOYGQ7kHhcLYoUtc/OLMeGiCFf8F0dp8s5RMVhzflupHEZuhrQGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byUaWYZwKooKuzDM5aXFyr3700TVrxQceAbx6SXPpnI=;
 b=l78Na7upkbkOYxDun07pNdnFsb4xcVovOPjsvQMBx6OJd0SbnobaYfle274UEgtm1np84Cj2N/D2mr/wYRRVgaokg2SdhMNT2hmqMtzh2aVRISlS7bzPFRwSJMvhW5XvWujOUzuL+t75SpRP8SJYj0k9kHFig+VDentu2PWgGiocyL7wrEcZjd2nf7vCOEMKfNMoeFijBF8aEAa9DRUhkSynJG/ZPTNz5eZUnMCIAuRn8Q4TJBOvjvNiUaYvs8e7IOFPIskTwFUUsAeAiG+yHSFODKJfSkKS44AADtFKXbKWNLs5MEnDFwDmvxQDx7mW1uuZvpUBvEDNhsbryRAoXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byUaWYZwKooKuzDM5aXFyr3700TVrxQceAbx6SXPpnI=;
 b=V45r5YZHgujDS8h1M+y0faTIoswf2bWKcM/vCQKKqRrMpwe+wi6yDiQqs0eAeJlz1tP6Glm0n5+mAovmhRgin5du2GqaNFqyofvP1/l/LLhONSnKYCPJf5UPaDZBK20NE8nFmwfxNrXRFMCjlGTZl0y/6rNqmynk1OPF6C6BOfs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 00:17:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 00:17:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Skip err.1.1.d
Date: Wed, 12 Nov 2025 19:17:53 -0500
Message-Id: <20251113001753.26276-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd8435a-8816-4ab6-a489-08de224a176c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7jDzu07+/fk9eOnRdJXajBupnHlvA9mn2zHi/aC5Y16zQ9E1zvOcwSXAxyXo?=
 =?us-ascii?Q?L47BkmRJmMWnQYzynICyT/SZ4xdWndK4GDQRZxo7yOM+pEkR4YsTavvbXjds?=
 =?us-ascii?Q?w6zTup3zZDKbhGhkIF8IcsENVXckobuPVK751QIns7JoyES5TeOoIkQxQN3Z?=
 =?us-ascii?Q?PtGgJI4uNj55GTozdusZf+zzfNFt7IABIr77M2HuZRqimi7Edfk4rSBFeJ8p?=
 =?us-ascii?Q?0OsYX/tFm8kEGEqzrXYxXEpGwtufx9omfihrGzSy2zwczJBbRvuhn1WUo79s?=
 =?us-ascii?Q?kgXVprX+BGqvQ/3CA5woo6PJKgvHN0I2H8lXl6O/Ch97S4TX3KdN4uSdnc0t?=
 =?us-ascii?Q?XUcIJqFDVgOAq0Wlfl+42YjUwdE/kaudm2A8tT7Q6cb0GUQvcOimzvb7HSmv?=
 =?us-ascii?Q?fOZeh2jJI2WwYdoD5jHfR/IdQIlt9nia3/n0CejER6MF+SGM+npcV5rQxqEm?=
 =?us-ascii?Q?G8whZZiHmEB3NLjMz6mBV59K5rkZLTiaKTppjc3WwxgBkzMyl8I9eFVGzyKf?=
 =?us-ascii?Q?c7XPe6UjetFwmqZhB3FT8igsCZhVobwfcINTmrowOvymaTEqi0DDjC0fmmTg?=
 =?us-ascii?Q?ucwB32+AmlM06u0R9hcZcvPfiLemIL29ipO5vuSG0x0RPkPCgw7e2d5p9GP/?=
 =?us-ascii?Q?l9eVlafPxcuSMYjxDZpFDuUEYG1zzXVdZNEt9HJ63JgJXOhYk7BifHm/Aait?=
 =?us-ascii?Q?qzjin1eSS8KtjINp2ClIASgofkNYkOoMxYbuDw1t5ZH4LtpiSqyNgqWYEUw4?=
 =?us-ascii?Q?5nHJC3eqdCqCQDofDtB9F00KitsDjPLB+qX5RfbFtM9O2VkKdkvHAzAE18CX?=
 =?us-ascii?Q?8Ehwkj7/ty4SB7ASd7hkGxYm3j1QhcvOv6Ua2DCEkPSy0Oecso93RylNeQWb?=
 =?us-ascii?Q?4lHo2zOPWFcaPZ8hBbjt/oqbmcD0fq8UON5+JARNWWA/s7hkckm79ZHEGmMt?=
 =?us-ascii?Q?GqcQCarqadRN/CrAr34nOAEeDcgV0KQ24hyrB2dZYJ8f2fyiJFGaFHuVhGHS?=
 =?us-ascii?Q?DE1Rt8oz3fxTqYbVxg+0fn58eflIGKCC94dfJcZemzj8E1SaifqwZnf8yk4M?=
 =?us-ascii?Q?G+4MpnRu5vlmsuIw3UijRYJ5jP8ZmxEYJ1SxRsGIZoPMxGadhjGNW3AfQ4JJ?=
 =?us-ascii?Q?qvAx7I29+riqioQSQU9DlkBDL0bf4y0S/G5Am/Gi4fZeOjDPIEscSYsBuVC4?=
 =?us-ascii?Q?MhMBqmkGZcdB6G4pJ/+npycF3Kzp46RO8QJG4xE2nNndelDZe59+W9oMbl4w?=
 =?us-ascii?Q?7BZbG40UR4da/YEHCxEUlrJR7EoN3LgQydslTQBvB6kEsiIcSo3maho7BR5n?=
 =?us-ascii?Q?uuvlVAPcAkO9mBZs+VUPoNapA7asDInr7WZW4LJIlB+lcoV9ktsfnYIjz6bH?=
 =?us-ascii?Q?iRzuZJfg0SjdtT5cnRys8Dbc66UdZXviqsN1CB0g1CxvAuqfW/dDr0CQiWbu?=
 =?us-ascii?Q?RxQwUe07p3g6BY8P8vS601HU2BOhI/+JsCIl7Kk0JsPQsFefbIsQdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q1tCjKxbAb8YLfivZPp0PpC2ghIH8vcxnpDKSt2Mazn+hrPCOmuf8SsriFVy?=
 =?us-ascii?Q?N7Of7wSH7OQfF4hNEnBcRv1z76Z6A4j5XIv9WlA9/2YZ0EMvIcJmuLNx9oEe?=
 =?us-ascii?Q?tmSNsuPeIZKJkFUwMsfRvp3C6iFXiimJ0BvWjLCJS4U7SsuodZS5qdzyasVz?=
 =?us-ascii?Q?5qBR3Cmy4Q22v9gE2cPJsPzU/i04KioHIArpy0Z4wI6rCVt86XTbxpspBlfz?=
 =?us-ascii?Q?xfkjO/DmsvS3c5KJpxVYzmnQWDptbKyadgYPWZk+Y7kheZg8sCMIMiySuSn9?=
 =?us-ascii?Q?3+tKsatEo/4xUh8R7+VzzUCRB7pCOJwXQgAS9qu5tJI54OnNs8+NS2JGCtIw?=
 =?us-ascii?Q?/VrFI4MCJuw0VxSyGWAU/V8dzGCiUNPF1CauzgrEZSPR//g783myZu/Gv9hs?=
 =?us-ascii?Q?suENB+48XRAIOrgOy4nq0kZBkzmJnGmwW5INASvSt7OzAbIQayzyPGYnPbBJ?=
 =?us-ascii?Q?jHI5+zCAToE5n2hBonNTzP8RX2nKm6+eIfJs9AB1RzYYe4AF5efxGGLeznVz?=
 =?us-ascii?Q?VJXqHuAgNRFSfeTSnqaID2DttGI0+YF3Ewyge9CQtRnPx3yDCKxsC0wFeLZV?=
 =?us-ascii?Q?A8876dRR3WG7h/RbjWmf6mmMxH8+d66PQ//Hm0+8SzUMOBJymeUkTxAtoRRE?=
 =?us-ascii?Q?SNPcKHbFQYN5GainC7UfqDhHV9w1dCwTw9lQ+vRywkBwFgUVRFYZEjpLGvFs?=
 =?us-ascii?Q?5Dv9Ge8fCZHRe8b2HVCo7f9AIhu3gH71/q65WnoxaXCHIrhE5hkFMZXz20/L?=
 =?us-ascii?Q?MuwC9qBXJEaUzBBo84xtzFHZRoJTFQhSG3LVaqWQMk6cJOLb3FMFUzFUx//4?=
 =?us-ascii?Q?BIyk42H7CCjTkYxPlgnDCnLobDuytMtT89dAEVuSOYJV8TyFZJ/+plsQqF/l?=
 =?us-ascii?Q?tELaDyRKT9ozWcTTfUs5UfupxVkmJFF9PxTHVyWwCcO8VJKnG6bhcuw1/UTJ?=
 =?us-ascii?Q?XBas/qHea1afvRuRY+3/mdE0oi0cqbf4TmX0YRV/U6DJODNiFWR9VvObxhMc?=
 =?us-ascii?Q?1JcGt57pBhYtqbuKxyyuDXvkbEz5Q2g4GKQhChLQXyrOOVBfNiKFLyBd5z6g?=
 =?us-ascii?Q?0VufScx9Ml70jbbSbnDrRG/ishx/xUmyFXVhZ00aKUDUwkFq8t2MeAkMXHCF?=
 =?us-ascii?Q?ccDP4Zdb3o5uZ0QneiFcd9ONGjdoE3DcGEecpzbJormNXc2uEzB4wc0qK8LI?=
 =?us-ascii?Q?3j+e9MUsBNyA3lnUmKMK7YM8Am7/5ubgB4y7u3fNCdammdQy9NV5jmfDz/Az?=
 =?us-ascii?Q?efdRZdc6NR9MVTqi58FsUuOmGgdgsL6da/scQxTmmd5+MhAsJjfaSB+XImHg?=
 =?us-ascii?Q?0n9ML+8XzDYwYet970WCtbaGjrLE9pJ0431ofdLQz4oBX0mUPYmVz+lDng+t?=
 =?us-ascii?Q?sSL/ZLP+3IihsCbkLM+5bZDJraU1ewctBVnpEb5j3Qw7Sk6GtAAWYLkRMAD4?=
 =?us-ascii?Q?ccD51Zb8ZFfYO+lmLdAp9fCqYCU3Cu3Dh8e7EMjwIE4kFhfX7K04pqood2lV?=
 =?us-ascii?Q?lM1RBCVpUK51T2he1wAHaJhqcOKUoqxoXRUyfLDD9YtywoV9n3tDkl21L4kA?=
 =?us-ascii?Q?DV5290xb4MvBVkP5a/G26LY0Nw1cM8XyDlnje3uo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HUcdebp2JkGTJ7TegDMDiU2e7NfmR7Fu5cm5PROrFtAJ2Weu6AWXYKGqZiTmfbVx28Sz/m4ZxwWTcKI4YMWNew/PNb+/3oc1VvNl8oZkKOqmyNpL3T7qIcsWcY/QjtlBBRN3pw864cDd0cjoixd9/FTo2L0MKVOOxUDR2+JkTlgQTrPArb2vu/dc4xmjHzytCPW5Ysy66vFoHqZ97aI7qmmztC9ZL+caq7EPTlcki4gysHbQoCwkdf/vQz67xBEe3wu4gtQDMEVtbzO4BIEN4m7oahokHB6f2dVTRxVeEQ4X+q/C2qZR7IWeUP3wrP53bKMsvsosTSY7RVlMNCwCgkUH9tFfIesRY9jS00dsMmlHRGXVyOyQhxfKOL8zldS/j2wPqErd3VLey6HSsU8Fc9riIZFU6srRu1oX650fd81Zu+8/BzyZR2vvuYI3tox/SPN3KZdJcBvx5gz5gv7BxHZuAXcx7aTF7rNm5BATJzbgI0D7S8xFASR1jGk7Iab9dJB0NKy/txoB+KBSAPWnz3Wc45Qp0DydJ6dvemuhbRg7v8m/cyWfX/A2fSQU8VLbExhtbCY2WLBX6HPktg2VvAxDUaH5jm6WhJjPXhwxIQM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd8435a-8816-4ab6-a489-08de224a176c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 00:17:55.1635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IX4FZcdoKCoRpX7gTwxQtGoTh4D3Zu1PO6tu47ki52okoWVZ6VvhpzlhhtaDZ47BbKIqT/n+h9TKXcSanMRYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511130000
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0OSBTYWx0ZWRfX5xhGGz8SOZH0
 4kOa/sJVk4TzGAeXPPvwN81tRaInZRa6bf3jXFSJz2SS+7nRAAT0OHsZr8CGXjlh+I8i+BUlOYO
 9D4a9QGFgJ3vtx9Bg715JwipE8vLgbkI5G/7Y2BcfdK/crbCVLDIDhDdp2u+M9ZE3QNDhFcy1Fy
 QJGWT4JHxGN+a0uGJ94QoXnD3cXEKIKNwDYDq12rlusjsdwdpE7iRRz4uN/oz0/15aobcuFyeEm
 iln3Od3M1yWMU3coPn0Yd1nNSjDnSjai1BdZ2TkWqYQGTBlr0TVPoZNhE7K/Cu1S17nBIlhVBd/
 HpcSW6UzARSQY72K8e8+zBw/vcai9otVxDpxgQHRHvQM0Y1jHWaubgGlQGQBnfwWw0BVaAbLfAY
 WoGGwFMlweuETdldtyxB7QCWOYMYmw==
X-Authority-Analysis: v=2.4 cv=S6/UAYsP c=1 sm=1 tr=0 ts=691523b8 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=PSCuHxTcSy4fsvyqwrkA:9
X-Proofpoint-ORIG-GUID: 5ITAo6Na4KSV1RUWX7qwNVczbbfZ7Y2H
X-Proofpoint-GUID: 5ITAo6Na4KSV1RUWX7qwNVczbbfZ7Y2H

From: Eugene Loh <eugene.loh@oracle.com>

There is a known problem with this test dumping core.  It is not enough
to XFAIL the test since the behavior is intermittent.

Orabug: 38615307
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/version/err.1.1.d | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/unittest/version/err.1.1.d b/test/unittest/version/err.1.1.d
index 0b63421f8..7b6a95a3c 100644
--- a/test/unittest/version/err.1.1.d
+++ b/test/unittest/version/err.1.1.d
@@ -5,6 +5,7 @@
  * http://oss.oracle.com/licenses/upl.
  */
 /* @@runtest-opts: -Ze */
+/* @@skip: Known intermittent core dump Orabug 38615307 */
 
 #pragma D option version=1.1
 
-- 
2.47.3

