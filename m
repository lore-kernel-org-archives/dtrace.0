Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2135AC32
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403133; cv=fail; b=lkS1x5UtlSexV3PGeu8l0iCngLzBb9/JD2dnBQ56YILIC8gs8V1Z/IcJzhzR1gaAGw22kvWgXzbjz9t1xFzrAe2Hy7nZD0Yp9nCEx6skjdpRvULS7tM9qsQaHXY/uPd7Jb3TO7dLY7JRsbUJ7jhkNcwcqGvaPJ0kOi+g5+C2Ly0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403133; c=relaxed/simple;
	bh=ipgiWNiIcudFjLe6EW1bzjtaTb9nDFS0yV4qb/9oho0=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=uu5TQuu4cwiuq3+4qwG4H0Us64vOaGkJhO+7nenfroFOd9Wa8yxNbDSZDOmXbgPN3IfNQnEZgdB6M6Fpr2JNB9EpIz7CePGuE2dOir5KwnVvRa6+QdQA/0t9lrM57Z0Efr7oRVelmEyr+vWiW+dJ+nWK1rUOElMca4vwuk07Yr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pNc7ly0t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=praPbepC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pNc7ly0t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="praPbepC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SIOvHr3055256
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=pJuoq0sgnZY1SZrhhD8lxDZzg2t9srdpEdKxDblhpcE=; b=
	pNc7ly0tgckSR9dompMlYu9KnzVNMVbEQceFRyCK9QIy5FOdP4zOWRXAJomDxF7X
	oLcBzxpZ2Uc5Gpql5qqmVay7XpykI8UVCXOfw+IQ8gC6WFDA2fSdaKlJ70D8Ni0e
	WFXkjf5m28ZK+RTTHNz8Ur/+enU2XKKdk2elRdQPeZAfQaiutsNrubiIg4DV0id6
	SyJCWQZBbxvR8UDLkutk/LGyfCTkhM28w4KDb7da9yxkexlaw1NB0j+HQTu8QpTL
	YxsmzLqy71i/wKcwXRHTFqFd+JWMALV3zAAyi3bFWHpkMDK27K3QwWdVhRBws1i/
	rFkqH+BYmY3lGxz/oXk0eQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drmd60gvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63SJ1OuW034166
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:30 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2cg06q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tb0jfq/ElKY/IgcN4yHGfXc4DJlIy0YA+9jUfMPX98afelGJLs2RgS3+MLlvxU87s2TlgDnL7u65MTi2UBEvT4M1EGP1FKK2yp3+8MOsfLWS29OqP9YkKHfpN8+SjFK+2u2NL3Js8JkssQLCTjeWhFG58IWt1AWkqhRNzpVQJpkBHoLYcqaouhQG9ypog+xxNdLoY/4P9JIGTB60eawwTGsjAOQkFxeoxKFXwSPEveHbuLP4cGcHFBmoLZM7X+/+amycb2B+F/0tTP0l8Um/KGIjyCPyRZdWNxCXqDCDwYPpWTkcx+NP9NYPTAUipmfZ5401mlQSo1HUZj/dt1tMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJuoq0sgnZY1SZrhhD8lxDZzg2t9srdpEdKxDblhpcE=;
 b=gyNBIwIvtS69lZ2v1naApj0BGc1SyDiVopKj3TN3DW0rIXYa4kd7Fou40Bz4L4rEW9Lev57A499QdszJeFfrRH8ghjD8u8mTtiuYAyrJsFio5seBBLX8/Jr5sle2kpR/9BscDGghroje9NO6Swk/aHRlPUpa7RVMJzzAGfGtDHCGKUdrh/IbvjZvhka0ouViVyknz+wPVWXMOYsEn8QSzcbKO/BHtcjWcbdcwPtOlIH5UC4Nk53Db8meFJrZxjhY+MslKjYM5pJktJAltnB7V2Pp3cBF21wstucHqmD857D7U9icMpkIsGJvt4hGCPvniWYBGLDOnIagGNxGU8RmuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJuoq0sgnZY1SZrhhD8lxDZzg2t9srdpEdKxDblhpcE=;
 b=praPbepC8zDWieP0gBP+VO3eQn0Ei/QP+NizSZE24utKblfvxe7OL2a9qJlwhM6babwbaE1Ur01wQ2Wa9n3hrvzrLq9sSrMuC3OClQSZ6Mj3cFIYZLdMEIthRG3rk3Y5dByKteMNIytlNbAjYrBfFWM+q7B3ph9HwtvWdcxV/Ro=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:05:26 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9846.028; Tue, 28 Apr 2026
 19:05:26 +0000
Date: Tue, 28 Apr 2026 19:05:27 +0000
Message-ID: <3dc679a2ee099ae4e555e093422b17b6@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] fbt: retrieve function return value using helper
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::22) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|CH0PR10MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c600dee-8654-42ce-4a7c-08dea5591b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	E5e94kBDm2eSKWa7VZVlyhoQxOgZRAq+y6YhfwXPdaZ/EbDUANeJgmqMm5rSCe9LKUcqCIt2yoo7uL/ZUtulWCtrauElRVYQtGzD1oRKYulcHQdOSbMtp1L3k0jjA0wQ1z0gFd6pbLWJrGvtI8xgDT1+Px9di/y8gGgBYgGYZoh2mpnVDiM37Na+Mf+nlGY1QfQC8dQq3n9KBg+vbf2spUsYj1bu0vCLeHUceIZKBCh9Ttl9UlVsGyU2rycIKLsuaKCcoYZwfKOQ9ChMPNRH9dIO396UZj3BkGo105/0JG+Mp4locnxC3lnJogNGHDADI14slTTyc63//9c+KpFJEHdx4TbB/7dVd6WU7rqZY7hBbtCd7GbSgezw/LTUVWcXjkNEmBVDUM+baTDaX6Flc4b2N6RLazEdTHbJ95l5BggVC8KnGslIZE8SsDv7nNpb828HmKNE8SLopDBK0820YnMylMK8UYy2FhZDAiBqVY15Jb43F3TKj0FtdAMBXxUXJ1azw5qsO1m7ARUGkNZFAzk0hNSWJRb2Sh5YrzzP4dWuHGVLX4Ee35vjOFZnQdFiQ7sVZgoWwrG8UtfC6poWGXVNIkX6MRUbxNq2c8f6IIbb+9i0Vu5P3suxI1pl73ddtEFB7JKqf9Q5ggdwHl3P//3twknXIOwLLlfMkygUTVby6zKaHq+wcmlpQgM23p71W+fDyuc7VvL+fq1kH/Tz/4KcJSaT1KP6lX+w2wMfiWcrn5PJT7EGy+gshIoJrYr8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EqMZYIKXz75AIVXTo31oy3AzSd3D4M+dvuIJVdxF4TYJxKK7ziFRZGQq90Zu?=
 =?us-ascii?Q?QPaJaa0Ig67MbyIsVVX7MVBh2fvb9f5/7C6nVdh8W3NwtsC8QfW5AwJiSy73?=
 =?us-ascii?Q?aSkvQnNy30FFUjROYy0HbnJyjG7eKtDPJ6HBMBQy6qyxEps6xkYsW0Xr/sDq?=
 =?us-ascii?Q?6PSJHxYpQeo8LiEfcl9WtCDzKolPmPqeUOk5gjftkqJCp0UCH654P2f1k2kN?=
 =?us-ascii?Q?JasWS5Q4vhv0WEOuTRl14iqV2wX3yMas0OmSvIhUplmHf+qXZG99DWEZPpdF?=
 =?us-ascii?Q?uDs90TpaWBrfVePultyUe4CJE2OwRnycOz6nVPW1bfEmlEVAWPF9wyUZM1af?=
 =?us-ascii?Q?Ml4jH5ukd9eIXWcV7/oCDMpWYf4nihIK7BNaeqw0Sr5NAL2no2Srx8c1SevP?=
 =?us-ascii?Q?l8um9LKBk+LpCBPe9T0IMJ2GuV5+grUvNO7Acps9wPbN/J5fU4/oM8qdTbRk?=
 =?us-ascii?Q?gT954dLsBIYAL9Q0I03e0ziWS8+y6eksNrRojXmbgYooi9GMoMwYpRbgUT/i?=
 =?us-ascii?Q?0EdPkSjBguIFVVgvSkF0Xxq9wYX30j1cazYCwVRN9g2U1jtTn2glyFI1UBho?=
 =?us-ascii?Q?aM9ChrFO7hqUOnE5iSeTWsnNJCYXL4OzBv2uTmltN34WvB3Ikrj8Doi5xKfN?=
 =?us-ascii?Q?UmzOI6wTXkj9DM8Yj/uNGCwn6bptlgS/+FyQwhjSgUj7M4D5TgxIYrNN/X5M?=
 =?us-ascii?Q?lNfBs8DgoAepdCKj++dpeWwS6Ae688d2EA67Z+KiM8sT3dolMVTQrmbL4BeU?=
 =?us-ascii?Q?5hvHv5noFnlredqI0b0E8NMiJEYNDkws8wF9J+ooGBdz+/F6u7m4Xog+SMeV?=
 =?us-ascii?Q?5GyJKTphrbBnSFlWkjN0RHvix492aY0DSkrUAZyer836n1qawpzEsO9EMFJ/?=
 =?us-ascii?Q?XOUyNIqG9YGdr/R6kLgHPdgaifBXX+KZdpRdM+nDENRarKZ0CUlKsasG/X4w?=
 =?us-ascii?Q?jN5Gb4bdGaLB86rZYkRh8FD2pXY89FAWVX2koRrShNuTLsiO1/IWD3lw012D?=
 =?us-ascii?Q?dGf3/nonPkC7IZpzC6CAIRCiwuGwIJWjHEmRbHpw4H8lMyMmloFLpKPL12bN?=
 =?us-ascii?Q?XysRya8MLLzqifBbCcAJg1I+yBzbsLUTCROCQ1RPx5D4GGHGPa6CNAkn0Zsj?=
 =?us-ascii?Q?/S58lgWRD6NbqLqY0KzliDyGfEijeMJT0SPeLLF09kEeSR557UFYvdV4ds3Y?=
 =?us-ascii?Q?cf4ICc2CrJE1BF+7C2+HyZX1rM+qsLwGsN5e5XWrvt2H0yWOON9wy8QJCMbQ?=
 =?us-ascii?Q?82TSvq01rUy8iE//wby7c7RbYPqLpW9J0lu9uB0Bu/Rr/m3bwXTmrdPAeg1A?=
 =?us-ascii?Q?j3ep0v4q6Nn30/wVPCd6jcn4LcTTxpGcUvScwwdHT/kismpqlLXElOedXnLK?=
 =?us-ascii?Q?fQRyhJ3kYcSMpPpDGCvgk301Mt1aj3C5wZYQsDIhrsff1RhlFcmrwdPHmhIJ?=
 =?us-ascii?Q?H/4oOQDllO2BSXj5JGNEJ8F3vvc4AIPzixSEv9vdgrcQz618sRORhVHI5SJi?=
 =?us-ascii?Q?9coMQjcchbgUFK0sKgSYGOo4wzAV7TVhGB3IGsktc6MefXMIBaLCte4Pw6BO?=
 =?us-ascii?Q?jcCOIsaIaBV5wnw/zI2Q6l4aq5y74SrnORlevKgTjXfiaxS8QuLk6c1r6hn5?=
 =?us-ascii?Q?zXTfe3a5YqLZeii9qxnfekK+xBuEedIkvlTs3dZv/l6Kaa+7qnU/005Z64Qf?=
 =?us-ascii?Q?gIRcn8m3yQl6S1nU5vRxEkQqd6KUsAsGlyArgSytjSjj2IVLCKsCpJ6P6w9n?=
 =?us-ascii?Q?kf/XglLZt5LVRiNU9H6GM258ZByA6ng=3D?=
X-Exchange-RoutingPolicyChecked:
	R8MYOGNG4/sRKTTx4mkTxdUS4FjpblXGCQgPWaFaAUqfWiM9uT3iTAy70z9cuBOcVzzBTxMsQuC1Mddmq+ec0RsnHsytMNHTUyYN10Gmn25Xo13EmLRt404T/SS0lRGq6q8TCZQdg0cdG9wyf2aAf+EbP6ZCb4iRXnRzVhh2SNEjwtXaF7yx5KvScHeGWS1rJvM7zvNrQYTd6FNQwWCc81A6LQ3evoFcXfPeaGnNyUlDpqPNJs/tDNu3PYtpttVzozCP5tn5MJYpp44HmknbLujad6D7HW5w6UqwHcHwExogzLVEgXl4OvHqLtMB+fyL4sCiDBSvTh7ADBxTedDR3g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2DLgoF78mh7p4oTT3KjErqf9VM9bXbA5rbfGblPi/ZGk0055eTgfozHOCVBx3+SxHMOyCQetxdKgxrov3d9bAm/j0KL3KXGm5Y55GboJcTIPlaAPuL9oAPvR+rf/ae25fjSgI/u+lJA1lz4mZBoXXZi6aGUdiecXBkgBt2AQe0tMiCwLWwLnKDtf1PSsEcXSP5SDnOAPa0CuGi9BnJrWPh56pRsmozI86RlKcsP2567LmlqY327nM1QtCDMiWp/Sxjw70MA0BcFf3Tw96NZ3KylDmETjWGxbd/mr7jdvxeic2octCBMAVchxSa7JBAfoJRTUlyNJ+sDmfE3ulbNKzQZkfkzU5Vey6NQYCS01Xu5svqCoopxp82Z1FK+QD7j6Kt5i8Zpw10N90JAz6oN3JAtjF4+fKgAWXjm17h+0dREDVh0K4Cc8ZOB1hKRtuvdGwbjzgPTXkJXeKdo/l6niqG23EanOHu5nfsys0Uc6y3Q+XWVpzVXc+mw4PbuafZ3V2f6ieDDEvyXQE5OrS6CSaFCZMxeItWR5yrI1Al/2AD+qMyMl5Q3b8wGDd8iKguNaCq67/9d1AJ7orkCk8L06umYrx/4kGpfnWGIazlQNNrc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c600dee-8654-42ce-4a7c-08dea5591b8b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:05:26.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0ihzF4k7IflDO8m3hmhSMpf7YWkj8ugNC/kKyAD0sfPPw2MDXLaObInZI7BNTU8dIf6AahZJLbNmIK0z5pXsZe+B7Ivap4v6h84pHGl1Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604280185
X-Authority-Analysis: v=2.4 cv=V/VNF+ni c=1 sm=1 tr=0 ts=69f104fa b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=f8eE1dfHqfwo-MEGZTQA:9 cc=ntf
 awl=host:12310
X-Proofpoint-GUID: avH3lk32fHobIMxRRXZtWHSE3NGJ0Z-e
X-Proofpoint-ORIG-GUID: avH3lk32fHobIMxRRXZtWHSE3NGJ0Z-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NSBTYWx0ZWRfX1VRIqgXgLs6c
 rG7gvaI4zDAitPaP3vHGvUPTTvlWL9pYbxlGruYmsjCvfgfuMfVNQkzagZqZyXW1CnSQVSWStfX
 JxVY2VEU/EaNGUom+fupUJxj6i4+AApRZ1PEz7yoHMRJqSIdh02zLv8xVSUwIzi727Omd46h8e2
 s+KGzb57syXnisQMO/zDgZtao8bqSGi5BFXW66Bff4SCTsUjZaxLKrvERyVMxDGnitzT408eyEP
 Iqpm7k8IRc3s9KLRhgyL+7ljx6DTlWDzdXyLXs9CpU7KIXPGoMu3XAz669drV5Fk2TW9T8zhD5g
 fHJlHU0Z4mjTM9q1zieYegPe3B8vVHM27KsVjh96Q6hSunvUfLWZ1Emf7LLpirAuX+RHBOerGf7
 wwrs+jmLTjUnbJNIBRDlqWiadoKXe5niupNeOI3S9Ti/I2vJRqUfAbA0V/xh+Jkt9H45PLalxsV
 cS+ea8ShkcC+Sh/462EQPUBUSeEnU5T/jo68Ffmo=

We were causing BPF verifier errors when trying to access the return value
of some functions due to incorrect calculation of the offset to read from.
Rather than implementing the more complex logic needed to calculate the
proper offset of the return value, we can just use the bpf_get_func_ret()
BPF helper.  This does not impose a performance decrease because that
helper gets inlined by the BPF verifier.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c                |  9 +++++----
 test/unittest/codegen/tst.fbt-return.d | 24 ++++++++++++++++++++++++
 test/unittest/codegen/tst.fbt-return.r |  5 +++++
 3 files changed, 34 insertions(+), 4 deletions(-)
 create mode 100644 test/unittest/codegen/tst.fbt-return.d
 create mode 100644 test/unittest/codegen/tst.fbt-return.r

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index d6f57c67f..3ae035819 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -336,10 +336,11 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
 		if (dmp && prp->argc == 2) {
-			int32_t	btf_id = dt_tp_probe_get_id(prp);
-			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
-
-			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
+			emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
+			emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 		}
 	}
diff --git a/test/unittest/codegen/tst.fbt-return.d b/test/unittest/codegen/tst.fbt-return.d
new file mode 100644
index 000000000..123641bb8
--- /dev/null
+++ b/test/unittest/codegen/tst.fbt-return.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Ensure BPF code generated for an FBT return probe passes the BPF
+ *	      verifiier.
+ *
+ * SECTION: FBT Provider/Probe arguments
+ */
+
+dtrace:::BEGIN,
+fbt:vmlinux:adxl_get_component_names:return
+{
+	exit(0);
+}
+
+dtrace:::ERROR 
+{
+	exit(1);
+}
diff --git a/test/unittest/codegen/tst.fbt-return.r b/test/unittest/codegen/tst.fbt-return.r
new file mode 100644
index 000000000..1283918b1
--- /dev/null
+++ b/test/unittest/codegen/tst.fbt-return.r
@@ -0,0 +1,5 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+-- @@stderr --
+dtrace: script 'test/unittest/codegen/tst.fbt-return.d' matched 3 probes
-- 
2.53.0

