Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389091;
	b=aEyrjPZboCJMdym1KV+q6xcvJNPqzS09os08ZXJO2e05qoPehME8Y83Byen1Qtwe0div
	 sOrQnJKKFiBXyAXuzwSWogZL8dlBIqvIRA9kv0x9d9CllRZ1M1XVTUYSoVbNGMOw35YZX
	 kBXmm73LZWcLrD/T1GeIwboERMEX6S7SvixCl88hrH2dkMdvmswDbrUfroirMwj/tbMIR
	 sInkPNmvBqv56FKGkdPxj9Il6AL3VqEqs3SLuwLueVgFpuTzta5ICWqrwn1VKbUVaA/ga
	 lW9IAnrOnauI7JXS0tPNuaqw8cgKt0OhHPRX6AjALVbY8S1aIEzRMJSFyew6SemDgyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389091;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID;
	bh=mdK82kT7o/YrWx0/+EBobOBimQ5MX/xf2ZfMvF+RHqA=;
	b=xaoEL8irskNerGSjYe8oh+iGxgCyOM+5HkZC7LMB1nbtN6wRzOY3GCAvtkl+Vny6TEkD
	 D0hJ/nO3AXAq5u7d2tvct3cRgxHiy1lUCT2ClCDgdnynJBWmXI9k8SonHK+aHI3N3zpjZ
	 P0W60f/FcsN73HczPG2GqBfdp6j+C7ZABTUIMeCl0uJOyFO53gyoWVr+Cb6SBFscBF1SZ
	 PvxufS8GL7YRyL4yyYO6pFaDaFbXXEowRl/NYmkwivvBnmA/zhobWP9vVhiQvNHlbW/WF
	 RkXIh6kGx92xf7zgITNesSXGWzaYzbttaIBmiB0KHeo5ICsl18p2hnf7Ve7aTlfF5ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=AVY7P3Jj;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bZ9MKSmv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B0606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=AVY7P3Jj;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bZ9MKSmv
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXUQE1845998
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=mdK82kT7o/YrWx0/+EBobOBimQ5MX/xf2ZfMvF+RHqA=; b=
	AVY7P3Jjvbmp7j7gIUoBwobk4SctD6vG25e5ExCU67R0VQb60VWZsqne1oxujJHe
	okxTINV/2sCS9UnN0/1FDHi/O4e12w12bG+NvpSmid+vgHgE6u6E/sfXW8L9eIeH
	yfZ0CF9CVfrpgZqjcQp7YzYYu9pBX89rD9vO0CJi3gS3CBj2jlc5gX0wj8w1EJc0
	88DiRbTY4v7KC1dtsliFZCp5c3MTTZdbPXI17SpfoGICSIxdWyy2nARYXbXzphPK
	9dzGCdxrf3eGBoSaQX0m7r0w3T9stEw+xAbvDKIKdAGIhVTLJWiXjLn0H03x2Acd
	qcv1y7D26iMOvt4B3TYlgA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5pse86-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHw0X1475063
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:09 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn01jb6uv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b91Rgpu1FjlgAKB9ts++HLHABa/NLJJOl0/WvdsHQbz7c0brDZ8HEPQAr0BKvdO5M4e3fQuWqaoWHppwU6VnJ6kU2BUrVK3YEnO4yOa/yEBMPnOZKHYEnty7yr7bWiXrzHYto7MW0tpOuKQTfB6t9ko6a1zprp8EGYgZez+KLqC3eGs/P3QIqJ7GhfSCJICYx4gAnTxzarHsAiOEAANT+gXaQplooLjSuBC/duDNn43a1o02zV1kf4saUgxWjCncAj3LygVKBsTwHzFx8EUDqo2vAp2dT3+sh2iqq5eRoGpZiifL+l0a7VyjBO/WzE18usgKtM1UUdBIi/E7mUyQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdK82kT7o/YrWx0/+EBobOBimQ5MX/xf2ZfMvF+RHqA=;
 b=iuneQUlL+ewlY1qG/dRVbNP9KrUmU85zKL8nd59Cp8dKnHE1HsphXF4f7hIf2YleIFLKktpFja78CmaX4ErN8JqGR6I1rOJ1BZg5xwPHWjcjBoA4+55c/zMH+Evr86gZHP/m2WEdAKhN1xH+OzFqfN7hKggfz5gMIbqTVFRCpiQW63yYP6iYJV2sg7qbzJkqUZxXGobx8QJ6h8+/3oaZ1trrELqIx0ENx/aN57QWefHT/gDmHwVL5Q9Ii4dPiOt1uLXKNmlAen5o/Aslczz+xa6+ply1U7xsQ+WS0+IokYa642p+VqLqHEoKxs7eUZKolhAAk8gfdrE3g1JL8lWwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdK82kT7o/YrWx0/+EBobOBimQ5MX/xf2ZfMvF+RHqA=;
 b=bZ9MKSmvNSZd2dEmL9Gjm9fzRecdqTIjA4eLno+h2ztxbuqafkPBwj4AwalampaNb7BAF4ZTK5XZNLqncgwVxYybgNTa40c+T6vtam4WcRrhTjYNJNjRBe+9bOswMDL6qJ/e5wveDKSbSzfRQ/7+4TFmKx5R23Ck5YPXBTMY6gI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB6708.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:04 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:04 +0000
Date: Fri, 30 Oct 2026 19:36:29 +0000
Message-ID: <10c34e1100164e736b99534a57e74cfa@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/20] libdtrace: retain module metadata across incremental
 discovery
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::18) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB6708:EE_
X-MS-PublicTrafficType: Email
client-request-id: 8dc12f7f-6773-4182-b947-78c4a811cbd5
request-id: bb0ad9bf-9504-470a-290f-08df36bd5099
X-MS-Office365-Filtering-Correlation-Id: bb0ad9bf-9504-470a-290f-08df36bd5099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6133799003|10067099003|18002099003|3023799007|13003099007|56012099006|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	G6tPalttwlHFuB509YANKGYcdT9Mh2WIOrUKxqLAlvh60aZdGZCk6dYynkG3SWEUgXt5cF4kbj+GTvu5cfJ/Aa6bW6fy+lIj4iRJ/xUOQLnQMS572MP3ypU0NiFSJrAYYazDPSE3NRHHKpwr88En0hlYVAzcmGPCZHBUBM6Jf5kgIeJbwNCa9IoOtx/nhBq3BxP26I2TRI9/+TucdJE+sgZ3nJWelrXAXlbjM7SbNa33SQtuuvno9lvQsxNbSzrgb0aK0d7BvUPLjaIhV2eZ3HXJnsTlLpjQKeo/YWumHlXetI4hIXVvkUy4oMRoRqIpnZnzhwrwEDCSvZr6r+H0863GIGou2Tsv4xMu+aElDor0fAgB433ReY6a9qlL8P5pOU6mLzViyct/ProAV1aZB+StSYrE6HsXQ4IWcVz5QfNGzZRbiRqSbvPEtGu3MeM07xmMIfRyNjLYhStvb2VbCLMLQGz0lEAahFoC0rOWnAfQa4u9QkT6hQQHuT+pUP8hwpFJHcQjaAs1Bl/dbb3+ewJRiOBps5cBsRssNUap4Qw6nN+N/kxWxqAoriFaERHpqntevdr6RD4p6W2/DKig0XImpZflwe1FYb3/2ydKZIxgyXXS0S+8SlX3tPlgaDzNGichOXpq1CpCEU3p9XyQ2XZSjmI/UR8hBCv7d7dpsPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(18002099003)(3023799007)(13003099007)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G+wxlrlwfLKzFqupI8wu3u38/bVWwpKIqWHLjvU3KLlVtEYG+2cRgmDgfyDJ?=
 =?us-ascii?Q?SBwYIGKTJ8rCkagRXVMS2NFFR9yxgtjonTtEtSnIbPq6P2BucF0BJBfe/1r6?=
 =?us-ascii?Q?LjJNYJByKwWynS5P3T2418EFbF5hsAyVqhdAwDzpOEeCGb+c3IXJsejtkvoa?=
 =?us-ascii?Q?YAp/ptvqg726ExOHtqS5erHdORkMjEOZOR0G6rJ8x8UIWcUp30VFfOMsSgkZ?=
 =?us-ascii?Q?zpYG8Oivpvw4JSuHgN23fZ285hARIxCXURALnbYPrpw3UDrsnRuH04w9Fa1R?=
 =?us-ascii?Q?Fp0HyWoNopbEt1pSszO5wij1hetBdVKbPADzDw6Q6Z5HDXZHzCgI7cEuiFvc?=
 =?us-ascii?Q?IpZbiu7tNtumPHESeM/Mqqd31ujIqIk7d+9yEqiEuRMLJBn2vxN0vBPFhRMX?=
 =?us-ascii?Q?N70RADCR+7pLQk8MQtFaDlAX8x/I4o6o+xAD/PnD8JRzwYVh+NKBLLv3GOO2?=
 =?us-ascii?Q?PXOuyUumYXhYumz0jOkpO+efOosOIWz+nfg5KbxtLhDDD+YDx73dceEusU1I?=
 =?us-ascii?Q?t1F2B4LK8TtrhN1Mde/CddhOoP+YfLZnyCy+kIclut/P8xa1CsidGIdEOY5l?=
 =?us-ascii?Q?9J0ByQ598ut/X2D84andQcrodxzCGUSfKexzghgpUgcDvigyyzxpEdNtpSBp?=
 =?us-ascii?Q?9q/2VRp5ON6O6KU1owQIxlWAK0MNfowYHTGlQDrXBhUlL+IFZ4wOEF78MYMs?=
 =?us-ascii?Q?+BfPgeqPRF0kpf++oB6dYFpq8E+/vZXow2wWRQ/fc53a/FQ5Ie4g39alXHcw?=
 =?us-ascii?Q?DELP9oIt8tMAdpQeYVj34Oy/HFNIEGtOCaW48V0yEidofd5yvDRKq5CBGKSW?=
 =?us-ascii?Q?Z+XEWeHaOrsapR6NGe1p0yAjdK6a8yvsquhCow0GNq33+uYR5SFHtv+guVAI?=
 =?us-ascii?Q?CzsdBA0HvBF8MiZOqXqcT9fqlqKfTUojL/7XKR9xzeMceOdGyE/+OOCB2W1n?=
 =?us-ascii?Q?GG+SgOmq9gyD+zWgBORPr7ks9+iLYEesUPtDkZFRaSHryg8dPbzKG3jrTeSx?=
 =?us-ascii?Q?1I5SkgzrViOo5G20JjV0hWXY0JE0eQf6kh7q78p6QWxQRdjTJA52iSXXnrMa?=
 =?us-ascii?Q?JyLslC1REEe93/Ret2m3as2KKfcr9TiKuyJLCtnGpMvpFb62IU84rjAOv1f9?=
 =?us-ascii?Q?763+Q8k+Iq68m07Adgy/JKgtk1PdFg9seH0BSicWZNAPW+cGkEtj8Vc8POm1?=
 =?us-ascii?Q?ob0d7nyNtJYnbNCLhyWIqNFzmwA/pPtIKBV/j9fyhuOSq3cU4UzCxrIQMNLH?=
 =?us-ascii?Q?2oXOgyYWq+Sgi3TXsSNWVMfbevR5eYtOCmiTMxo8lxQ9SCJTxEUVUcpeszyO?=
 =?us-ascii?Q?NEHFBQMssuMNtw2UKiF8Q2/3RBzIY8/eHukq7bqKlgSifM4DRrA+FRZ0EW+M?=
 =?us-ascii?Q?2zWnch8DOpQ/uDPP7eDyq+mcJhzSS86U2DnqGPosr0ZB0e/wsCJFMygMBQwV?=
 =?us-ascii?Q?57VycMjzoshPKUbxmJerPcceIE634WlPlHG/EW9voGvS7QgNmYDVklU74o4F?=
 =?us-ascii?Q?bwscQX2TQ0XEEltl5pQ3tWXJP7xqNgsczr+yGgkVnJ7nJ+ZijHnc+HQeCRDk?=
 =?us-ascii?Q?XG1ISIJ9zAU13I8LonznUgFbGhFkXJsjaSJX5PNXk/Ca8u2bEkH9lKmrfqlF?=
 =?us-ascii?Q?FVhqVWbSz3ZdkB3rLCpImrMfsiSFDXZUxeNZf9YZ19cPI/M0lExh9qKAK8+u?=
 =?us-ascii?Q?wFFIeudD2BCDVmSsi9I29+ktOhdBCopJO62CjXMLgpv5g2EIROkG1Sg7815V?=
 =?us-ascii?Q?5Cx0pC3g1tNY8cJzt4gE4fzhRr7YbEU=3D?=
X-Exchange-RoutingPolicyChecked:
	HG4GCNSU8x1i07/sGLIYaAesZ5MZeW7h984pK+v5P4LuWGM2IEZ/7uKT+ScZiXQV7K94injmwNhq+7j8KtZcPVWYEBDybXmqJXXqQlvbE2MFvSG1Lg8VvXcmT5TRU9NdPL3Y6CnHiEOITg8O2O24hTxNini6XAKvcRzyQLqRtw1bUxe6WSco91eGqcD+7ADlyFVt0kpndn3U2OAKlUVn3imBuf88YVyhCG1i4HXBso1alhTyKoi/QznspJS0lKodPLkWOTcF1QRLYLIUAMg32NV6Rczzz7YANM2wgjNp+tlA3G9tIV6OXgfZxoKYRp1QdtGF5bGz3bUS1t/dgLC3Ug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j8baiuebJbjK47sCPbYMANVYPWTtxqOHA9RcAdnbr2tWmkfeBrELOWxZOhr1ZAn6pWpSH9o7C7mM0QhsqdUJdWWUHdkTpyFwhQrZjYA8L/0yNrNfb0bXuuOz4PAyggR7Ga06D2SICU+TtJJhaA14YzTEXlG8kAAOJJnpc8FmO7t9yjvBHMuposyfaxbp6/IAba4D1oCxebfD+V6If5/WObEfqdb4/i6oqsphLa29RbPGcxefg1xIaGyRoridYrWlC4l1DscIr9ObpLNlo7h960m/vnhGzl1phmqHjS5PUTCJuEaPtk0c7OUzsv5jUSo4igb7rT/VPPoC4mXpcRIxeQSwW1rCrVjl27ufKgHumoWckyOrDGe36cQ5O8ywxjmNQHCjl+sWHwr1lBKvtD9DDF00dtHSwMqbhvNPNuyqyaTOsx//FIe2gA9UXyjP3BS3C7Hxwb5mTXK9Q2bS7jLZtIYGnNHcRL66lY/OVc3O8WZ/50E3wS33jqND6fOE+E0fDBBrnsfgMJx3m0YJPOTp55/dB1ZUSNSoOprfG6/9KnPScCqqUJG1drfafa7l1Rgjamq1K/3RTQIZvkokYkFEA0+vzKx75sHT57HWjGDSTXs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0ad9bf-9504-470a-290f-08df36bd5099
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:04.0324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0UyMgrpP5ve70IVPJjyBkT7s4uHC2TOCJFAeBMCHQWVERTx31zaHAMluajvCLuuf1rLDFfDvsXFb0LA+7Ap+d+4pYCp4bvXMQeFxQ4FHKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX9F3hgn/k+zVR
 kSd0vtl9YrW8c9LDPvXSxf/q99TivT/ZDDz0eav0rm4f9ScJbpVMmwdk1hJ7HpGEKIVOEx1sOx0
 kYgOTpNY1dscW396KPe1bFsvtOcLH2W6F5VnLPN3ebUZ9tJDMOKyCKjcVlnNWOx1XYeMMKnZ6kt
 Y5Fu5d+mqwERDmRDD+Stg+ZFB5Fn5MR6XycO/efzc4Df9sjztwiSIiGOP2boQoNmGOvBsarI6Dv
 KOIPw/DcC9tFx+M6o8tbQiDXv7loFOIRF5wRoo5vdkxS5P8HDE85IW2GDFxD/Vna8hx6q/idptX
 WxHbVA9Lfn3yoOLWqfHkGd6m4RW4f3aH55bsHuhiSRWPAoyvOo2E2Xp/ZTWambiMnfJLbiyYCz6
 QrxIm71K3CG1rgnQt0iRW055lHJXVL07O9OFYhIPOtBpW4fgnMrFZEXCcuxU3rToN7OI6qosdsV
 9as+fFZE/oBU46Ss9/w==
X-Authority-Analysis: v=2.4 cv=SI/Xx+vH c=1 sm=1 tr=0 ts=6ae4f221 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=IzFezftEF5SPd7qsZL0A:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: WRWbny6vMSs2_VZf6zUQiKKy3yufTKBB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX/nsUPpWdhJcw
 xf65EnR3eyqwMxamMEOAFb16D2HHNIloBHL38pFMFJ91kMEs/+lASZddmyACcwzaJrMKTuEWbqE
 ixJe8zNmk0owxPTlO/nhGqnlLU3tCFgHV9ufRjskxqSIcw6lgnWF
X-Proofpoint-ORIG-GUID: WRWbny6vMSs2_VZf6zUQiKKy3yufTKBB

Stop unloading cached modules in dtrace_update(), including vmlinux. Keep
discovered symbol tables, ranges, types, and BTF IDs for the handle lifetime
while collecting newly loaded modules. Module disappearance or reloading no
longer replaces cached metadata.

Separate failed ELF-load cleanup from module destruction, retaining the
existing handle ownership of shared CTF and BTF. Document the new lifetime
contract and cover incremental discovery with both kernel symbol formats.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 INCOMPATIBILITIES                          |  10 ++
 libdtrace/dt_btf.c                         |   2 +-
 libdtrace/dt_impl.h                        |   1 +
 libdtrace/dt_module.c                      |  90 +++++-----
 libdtrace/dt_open.c                        |   1 -
 libdtrace/dtrace.h                         |   8 +-
 test/internals/btf/tst.module-discovery.sh |  11 ++
 test/triggers/Build                        |  11 +-
 test/triggers/module-discovery.c           | 195 +++++++++++++++++++++
 9 files changed, 282 insertions(+), 47 deletions(-)
 create mode 100755 test/internals/btf/tst.module-discovery.sh
 create mode 100644 test/triggers/module-discovery.c

diff --git a/INCOMPATIBILITIES b/INCOMPATIBILITIES
index bf55019e..933c5c86 100644
--- a/INCOMPATIBILITIES
+++ b/INCOMPATIBILITIES
@@ -183,3 +183,13 @@ proc:::signal-discard
 	expiration should be discarded, no signal-discard probe is fired.
 	The reason for this behaviour is that SDT probes do not work in
 	IRQ context.
+
+
+Kernel module metadata lifetime
+--------------------------------
+dtrace_update() discovers new kernel modules and retains previously discovered
+symbols, address ranges, and types, including those for vmlinux.  Returned
+metadata remains valid across updates until dtrace_close().  Dynamic kernel
+module unloading and reloading are not supported: a module name continues to
+refer to its first discovered instance, even if it disappears or reappears at
+a different address.  Open a new handle to obtain a fresh view of the kernel.
diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 55b58bf5..54011e4d 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -1002,7 +1002,7 @@ dt_btf_get_module_ids(dtrace_hdl_t *dtp)
 			return dt_set_errno(dtp, errno);
 
 		dmp = dt_module_lookup_by_name(dtp, name);
-		if (dmp == NULL)
+		if (dmp == NULL || dmp->dm_btf_id != 0)
 			continue;
 
 		dmp->dm_btf_id = id;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 243fd2a7..0290e0b4 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -202,6 +202,7 @@ typedef struct dt_kern_path {
 #define DT_DM_KERNEL		0x2	/* module is associated with a kernel object */
 #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
+#define DT_DM_KERN_SYMS		0x40	/* kernel symbols discovered and finalized */
 
 /*
  * Why do we need (only) 4 slots?  The maximum amount of string arguments to
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 5d5859a3..c98297e7 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -34,7 +34,10 @@
 #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
 
 static void
-dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
+dt_module_destroy(dtrace_hdl_t *dtp, dt_module_t *dmp);
+
+static void
+dt_module_clear_elf(dt_module_t *dmp);
 
 static void
 dt_module_shuffle_to_start(dtrace_hdl_t *dtp, const char *name);
@@ -242,7 +245,7 @@ dt_module_del_mod(dt_module_t *head, dt_module_t *dmp)
 	head = dt_module_del(head, dmp);
 	dt_list_delete(&dmp->dm_dtp->dt_modlist, dmp);
 
-	dt_module_unload(dmp->dm_dtp, dmp);
+	dt_module_destroy(dmp->dm_dtp, dmp);
 	free(dmp);
 
 	return head;
@@ -799,7 +802,7 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 		 */
 
 		if (dt_module_load_sect(dtp, dmp, &dmp->dm_ctdata) == -1) {
-			dt_module_unload(dtp, dmp);
+			dt_module_clear_elf(dmp);
 			return -1; /* dt_errno is set for us */
 		}
 
@@ -848,7 +851,7 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	 */
 	if (dt_module_load_sect(dtp, dmp, &dmp->dm_symtab) == -1 ||
 	    dt_module_load_sect(dtp, dmp, &dmp->dm_strtab) == -1) {
-		dt_module_unload(dtp, dmp);
+		dt_module_clear_elf(dmp);
 		return -1; /* dt_errno is set for us */
 	}
 
@@ -895,7 +898,7 @@ dt_module_load(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	dmp->dm_flags |= DT_DM_LOADED;
 	return 0;
 oom:
-	dt_module_unload(dtp, dmp);
+	dt_module_clear_elf(dmp);
 	return dt_set_errno(dtp, EDT_NOMEM);
 }
 
@@ -975,18 +978,12 @@ dt_module_getctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	return dmp->dm_ctfp;
 }
 
-/*ARGSUSED*/
+/*
+ * Discard a partial ELF load without invalidating persistent kernel metadata.
+ */
 static void
-dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp)
+dt_module_clear_elf(dt_module_t *dmp)
 {
-	if (dmp->dm_btf != dtp->dt_shared_btf)
-		dt_btf_destroy(dtp, dmp->dm_btf);
-	dmp->dm_btf = NULL;
-
-	if (dmp->dm_ctfp != dtp->dt_shared_ctf)
-		ctf_close(dmp->dm_ctfp);
-	dmp->dm_ctfp = NULL;
-
 	free(dmp->dm_ctdata_data);
 	dmp->dm_ctdata_data = NULL;
 
@@ -1003,31 +1000,33 @@ dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	free(dmp->dm_asmap);
 	dmp->dm_asmap = NULL;
 
-	dt_symtab_destroy(dtp, dmp->dm_kernsyms);
-	dmp->dm_kernsyms = NULL;
-
 	dmp->dm_symfree = 0;
 	dmp->dm_nsymbuckets = 0;
 	dmp->dm_nsymelems = 0;
 	dmp->dm_asrsv = 0;
 	dmp->dm_aslen = 0;
 
-	free(dmp->dm_text_addrs);
-	free(dmp->dm_data_addrs);
-	dmp->dm_text_addrs = NULL;
-	dmp->dm_data_addrs = NULL;
-	dmp->dm_text_addrs_size = 0;
-	dmp->dm_data_addrs_size = 0;
-
-	dt_idhash_destroy(dmp->dm_extern);
-	dmp->dm_extern = NULL;
-
 	elf_end(dmp->dm_elf);
 	dmp->dm_elf = NULL;
 
 	dmp->dm_flags &= ~DT_DM_LOADED;
 }
 
+/* Release module metadata only when its owning module is destroyed. */
+static void
+dt_module_destroy(dtrace_hdl_t *dtp, dt_module_t *dmp)
+{
+	if (dmp->dm_btf != dtp->dt_shared_btf)
+		dt_btf_destroy(dtp, dmp->dm_btf);
+	if (dmp->dm_ctfp != dtp->dt_shared_ctf)
+		ctf_close(dmp->dm_ctfp);
+	dt_module_clear_elf(dmp);
+	dt_symtab_destroy(dtp, dmp->dm_kernsyms);
+	free(dmp->dm_text_addrs);
+	free(dmp->dm_data_addrs);
+	dt_idhash_destroy(dmp->dm_extern);
+}
+
 /*
  * Insert a new external symbol reference into the specified module.  The new
  * symbol will be marked as undefined and is assigned a symbol index beyond
@@ -1768,8 +1767,7 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
  * ranges as needed, and add the symbol in this line to the module's kernel
  * symbol table.
  *
- * If we return non-NULL, we might have a changing file, probably due
- * to module unloading during read.  Perhaps this case should trigger a retry.
+ * Modules discovered by an earlier update retain their symbols and ranges.
  */
 static int
 dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
@@ -1877,12 +1875,21 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 			dmp = dt_module_create(dtp, modname);
 			if (dmp == NULL)
 				return EDT_NOMEM;
+		}
 
+		if (!(dmp->dm_flags & DT_DM_KERNEL)) {
 			err = dt_kern_module_init(dtp, dmp);
 			if (err != 0)
 				return err;
 		}
 
+		/* Never replace metadata for a previously discovered module. */
+		if (dmp->dm_flags & DT_DM_KERN_SYMS)
+			continue;
+
+		/* A module previously known only through on-disk types is now live. */
+		dmp->dm_flags &= ~DT_DM_KERN_UNLOADED;
+
 		err = dt_modsym_addsym(dtp, dmp, &sym, state);
 		if (err != 0)
 			return err;
@@ -1895,8 +1902,9 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 #undef KERNEL_FLAG_INIT_SCRATCH
 
 /*
- * Unload all the loaded modules and then refresh the module cache with the
- * latest list of loaded modules and their address ranges.
+ * Discover new kernel modules without invalidating existing symbols, address
+ * ranges, or types.  Module unloading and reloading are not supported: the first
+ * discovered instance of a module is retained until the handle is closed.
  */
 int
 dtrace_update(dtrace_hdl_t *dtp)
@@ -1905,10 +1913,6 @@ dtrace_update(dtrace_hdl_t *dtp)
 	FILE		*fd;
 	dt_kasstate_t	*state = NULL;
 
-	for (dmp = dt_list_next(&dtp->dt_modlist);
-	    dmp != NULL; dmp = dt_list_next(dmp))
-		dt_module_unload(dtp, dmp);
-
 	/*
 	 * Note all the symbols currently loaded into the kernel's address
 	 * space and construct modules with appropriate address ranges from
@@ -1945,13 +1949,21 @@ dtrace_update(dtrace_hdl_t *dtp)
 	 */
 	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
 	    dmp = dt_list_next(dmp)) {
+		if (!(dmp->dm_flags & DT_DM_KERNEL) ||
+		    (dmp->dm_flags & (DT_DM_KERN_SYMS | DT_DM_KERN_UNLOADED)))
+			continue;
+
 		if (dmp->dm_kernsyms != NULL) {
 			dt_symtab_sort(dmp->dm_kernsyms,
 				       state->kind == DT_MODSYM_KALLSYMS);
 			dt_symtab_pack(dmp->dm_kernsyms);
 		}
+		dmp->dm_flags |= DT_DM_KERN_SYMS;
 	}
 
+	/* Discover BTF IDs for new modules, retaining IDs already cached. */
+	dt_btf_get_module_ids(dtp);
+
 	/*
 	 * Look up all the macro identifiers and set di_id to the latest value.
 	 * This code collaborates with dt_lex.l on the use of di_id.  We will
@@ -2082,10 +2094,8 @@ dtrace_lookup_by_name(dtrace_hdl_t *dtp, const char *object, const char *name,
 
 	/*
 	 * Search loaded kernel symbols first, iff searching all kernel symbols
-	 * is requested.  This is only an optimization: there are (obscure)
-	 * cases in which loaded kernel symbols might not end up in this hash
-	 * (e.g. if a kernel symbol is duplicated in multiple modules, then one
-	 * of them is unloaded).
+	 * is requested.  Fall back to per-module lookup for symbols loaded
+	 * from ELF objects rather than the running kernel.
 	 */
 	if ((object == DTRACE_OBJ_EVERY || object == DTRACE_OBJ_KMODS) &&
 	    dtp->dt_kernsyms) {
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 1baf3844..9dd15483 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1227,7 +1227,6 @@ dtrace_init(dtrace_hdl_t *dtp)
 	 * Initialize the BPF library handling.
 	 */
 	dt_bpf_init(dtp);
-	dt_btf_get_module_ids(dtp);
 	dt_dlib_init(dtp);
 
 	/*
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 82965fbd..2b4bf583 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -480,9 +480,9 @@ extern pid_t dtrace_proc_getpid(dtrace_hdl_t *dtp,
  * information cached for each of the program objects in use by DTrace.  The
  * resulting struct contains pointers to address range arrays and arbitrary-
  * length strings, including object, symbol, and type names, that are persistent
- * until the next call to dtrace_update().  Once dtrace_update() is called, any
- * cached values must be flushed and not used subsequently by the client
- * program.
+ * until dtrace_close().  dtrace_update() discovers additional kernel modules
+ * without invalidating existing metadata.  Kernel module unloading and reloading
+ * are not supported: metadata for the first discovered instance is retained.
  */
 
 #define	DTRACE_OBJ_EXEC	 ((const char *)0L)	/* primary executable file */
diff --git a/test/internals/btf/tst.module-discovery.sh b/test/internals/btf/tst.module-discovery.sh
new file mode 100755
index 00000000..4edff5df
--- /dev/null
+++ b/test/internals/btf/tst.module-discovery.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: Module discovery adds new symbols and retains metadata across
+#            repeated updates, module disappearance, and module reloading.
+#
+
+test/triggers/module-discovery
diff --git a/test/triggers/Build b/test/triggers/Build
index f8a08d6c..20763860 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -24,7 +24,8 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
-    libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim
+    libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
+    module-discovery
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -244,3 +245,11 @@ ustack-tst-bigstack-spin_CFLAGS := -O0 -fno-inline -fno-omit-frame-pointer
 ustack-tst-spin_CFLAGS := -O0
 ustack-tst-mtspin_CFLAGS := -O0
 ustack-tst-mtspin_LIBS := -lpthread
+
+module-discovery_CFLAGS := -Ilibproc -Ilibdtrace -Ilibcommon -Wno-pedantic
+module-discovery_LDFLAGS := -Wl,--wrap=fopen64 \
+    -Wl,--wrap=dt_bpf_btf_get_next_id -Wl,--wrap=dt_bpf_btf_get_fd_by_id \
+    -Wl,--wrap=dt_bpf_btf_get_info_by_fd
+module-discovery_DEPS := build-libdtrace.a build-libproc.a libcommon.a libport.a
+module-discovery_LIBS := $(objdir)/build-libdtrace.a $(objdir)/build-libproc.a \
+    $(objdir)/build-libcommon.a $(objdir)/build-libport.a $(libdtrace_LIBS)
diff --git a/test/triggers/module-discovery.c b/test/triggers/module-discovery.c
new file mode 100644
index 00000000..d11b761b
--- /dev/null
+++ b/test/triggers/module-discovery.c
@@ -0,0 +1,195 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <dt_bpf.h>
+#include <dt_module.h>
+#include <dt_symtab.h>
+
+#define CHECK(expr) do { \
+	if (!(expr)) { \
+		fprintf(stderr, "Check failed at line %d: %s\n", __LINE__, #expr); \
+		return 1; \
+	} \
+} while (0)
+
+static const char *symbols;
+static int kallsyms;
+static uint32_t btf_generation, btf_id;
+
+extern FILE *__real_fopen64(const char *, const char *);
+
+/* Supply changing kernel symbol snapshots without loading real modules. */
+FILE *
+__wrap_fopen64(const char *path, const char *mode)
+{
+	if (symbols != NULL) {
+		if (strcmp(path, "/proc/kallmodsyms") == 0) {
+			if (!kallsyms)
+				return fmemopen((void *)symbols, strlen(symbols), "r");
+			errno = ENOENT;
+			return NULL;
+		}
+		if (strcmp(path, "/proc/kallsyms") == 0)
+			return fmemopen((void *)symbols, strlen(symbols), "r");
+	}
+	return __real_fopen64(path, mode);
+}
+
+extern int __real_dt_bpf_btf_get_fd_by_id(uint32_t);
+extern int __real_dt_bpf_btf_get_info_by_fd(int, btf_info_t *, uint32_t *);
+
+int
+__wrap_dt_bpf_btf_get_next_id(uint32_t curr, uint32_t *next)
+{
+	/*
+	 * Do not cache real kernel IDs during dtrace_open(): they can collide
+	 * with the synthetic IDs used by subsequent discovery snapshots.
+	 */
+	if (symbols == NULL || curr == btf_generation + 3) {
+		errno = ENOENT;
+		return -1;
+	}
+	*next = curr == 0 ? btf_generation + 1 : curr + 1;
+	return 0;
+}
+
+int
+__wrap_dt_bpf_btf_get_fd_by_id(uint32_t id)
+{
+	if (symbols == NULL)
+		return __real_dt_bpf_btf_get_fd_by_id(id);
+	btf_id = id;
+	return open("/dev/null", O_RDONLY);
+}
+
+int
+__wrap_dt_bpf_btf_get_info_by_fd(int fd, btf_info_t *info, uint32_t *size)
+{
+	static const char *names[] = {
+		"discovery_first", "discovery_second", "discovery_offline"
+	};
+
+	if (symbols == NULL)
+		return __real_dt_bpf_btf_get_info_by_fd(fd, info, size);
+	snprintf((char *)(uintptr_t)info->name, info->name_len, "%s",
+		 names[btf_id - btf_generation - 1]);
+	return 0;
+}
+
+static int
+check_discovery(int fallback)
+{
+	dtrace_hdl_t *dtp;
+	dt_module_t *kernel, *first, *second, *offline;
+	dt_symtab_t *kernel_syms, *first_syms;
+	dt_symbol_t *sym, *entry;
+	int count, found_first, found_second;
+	dtrace_addr_range_t *ranges, *kernel_ranges;
+	ctf_file_t *types;
+	GElf_Sym elf;
+	int err, i;
+
+	CHECK((dtp = dtrace_open(DTRACE_VERSION, DTRACE_O_LP64, &err)) != NULL);
+	kernel = dtp->dt_exec;
+	CHECK(kernel != NULL);
+	kernel_syms = kernel->dm_kernsyms;
+	kernel_ranges = kernel->dm_text_addrs;
+	kallsyms = fallback;
+	btf_generation = 100;
+
+	/* A module can be known through its types before it is discovered live. */
+	CHECK((offline = dt_module_create(dtp, "discovery_offline")) != NULL);
+	CHECK((types = ctf_create(&err)) != NULL);
+	offline->dm_ctfp = types;
+	offline->dm_flags |= DT_DM_KERNEL | DT_DM_KERN_UNLOADED;
+
+	symbols = fallback ?
+	    "100 T _end\n"
+	    "1000 T discovery_symbol [discovery_first]\n"
+	    "1010 T discovery_tail [discovery_first]\n" :
+	    "100 1 T _end\n"
+	    "1000 10 T discovery_symbol [discovery_first]\n"
+	    "1010 10 T discovery_tail [discovery_first]\n";
+	CHECK(dtrace_update(dtp) == 0);
+	CHECK((first = dt_module_lookup_by_name(dtp, "discovery_first")) != NULL);
+	CHECK(first->dm_flags & DT_DM_KERNEL);
+	CHECK(first->dm_btf_id == 101);
+	CHECK((sym = dt_module_symbol_by_name(dtp, first, "discovery_symbol")) != NULL);
+	first_syms = first->dm_kernsyms;
+	ranges = first->dm_text_addrs;
+	CHECK(first->dm_text_addrs_size == 1);
+	CHECK(ranges->dar_va == 0x1000);
+	CHECK(ranges->dar_size == (fallback ? 0x11 : 0x20));
+	CHECK(dt_symbol_by_addr(first_syms, 0x1000) == sym);
+
+	/* Keep the old module while discovering another, including a duplicate name. */
+	btf_generation = 200;
+	symbols = fallback ?
+	    "100 T _end\n"
+	    "1000 T discovery_symbol [discovery_first]\n"
+	    "1010 T discovery_tail [discovery_first]\n"
+	    "2000 T discovery_symbol [discovery_second]\n"
+	    "3000 T discovery_live [discovery_offline]\n" :
+	    "100 1 T _end\n"
+	    "1000 10 T discovery_symbol [discovery_first]\n"
+	    "1010 10 T discovery_tail [discovery_first]\n"
+	    "2000 10 T discovery_symbol [discovery_second]\n"
+	    "3000 10 T discovery_live [discovery_offline]\n";
+	CHECK(dtrace_update(dtp) == 0);
+	CHECK((second = dt_module_lookup_by_name(dtp, "discovery_second")) != NULL);
+	CHECK(first->dm_btf_id == 101 && second->dm_btf_id == 202);
+	CHECK(dt_module_symbol_by_name(dtp, second, "discovery_symbol") != NULL);
+	CHECK(dt_module_symbol_by_name(dtp, offline, "discovery_live") != NULL);
+	CHECK(!(offline->dm_flags & DT_DM_KERN_UNLOADED));
+	CHECK(offline->dm_ctfp == types);
+	count = found_first = found_second = 0;
+	for (entry = dt_symbol_by_name(dtp, "discovery_symbol"); entry != NULL;
+	     entry = dt_symbol_by_name_next(entry)) {
+		count++;
+		found_first += entry == sym;
+		found_second += dt_symbol_module(entry) == second;
+	}
+	CHECK(count == 2 && found_first == 1 && found_second == 1);
+
+	/* Disappearance and reappearance at a new address do not replace metadata. */
+	for (i = 0; i < 4; i++) {
+		symbols = i % 2 == 0 ? "" : fallback ?
+		    "100 T _end\n9000 T discovery_symbol [discovery_first]\n" :
+		    "100 1 T _end\n9000 80 T discovery_symbol [discovery_first]\n";
+		CHECK(dtrace_update(dtp) == 0);
+		CHECK(dtp->dt_exec == kernel);
+		CHECK(kernel->dm_kernsyms == kernel_syms);
+		CHECK(kernel->dm_text_addrs == kernel_ranges);
+		CHECK(first->dm_kernsyms == first_syms);
+		CHECK(first->dm_btf_id == 101 && second->dm_btf_id == 202);
+		CHECK(first->dm_text_addrs == ranges);
+		CHECK(first->dm_text_addrs_size == 1);
+		CHECK(ranges->dar_va == 0x1000);
+		CHECK(ranges->dar_size == (fallback ? 0x11 : 0x20));
+		CHECK(dt_module_symbol_by_name(dtp, first, "discovery_symbol") == sym);
+		dt_symbol_to_elfsym(dtp, sym, &elf);
+		CHECK(elf.st_value == 0x1000);
+		CHECK(dt_symbol_by_addr(first_syms, 0x9000) == NULL);
+		CHECK(dt_module_symbol_by_name(dtp, second, "discovery_symbol") != NULL);
+		CHECK(offline->dm_ctfp == types);
+	}
+
+	symbols = NULL;
+	dtrace_close(dtp);
+	return 0;
+}
+
+int
+main(void)
+{
+	CHECK(check_discovery(0) == 0);
+	CHECK(check_discovery(1) == 0);
+	return 0;
+}
-- 
2.52.0

