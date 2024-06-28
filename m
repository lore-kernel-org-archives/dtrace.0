Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6604FBEA
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540227; cv=fail; b=UVscarkwmRob215kVd92/22DvVxxrjpS8+dJyGLtoqEsVmxc0qFp8X/Beck2/2MXAFgqqtpNMfmOk08Wlv5vri1YjFuEXCPo0bLt/vV1blPQadyu7RtzzhJBJj9tdscZ2sb3bNyPD20MCFatI6CaQUdHJOAoa7fxcA5YdmwYMJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540227; c=relaxed/simple;
	bh=1R9Kbxpunc97NEp4chsgrdPIlM/DJEvIBhhwxKLlYy4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dqwY8GrIGQpL8vRukmpdbEE74q0+dWA0tyNRS3N8c+jWP5Tj4XpbXAFsTV1iyLukqDHXspACF7WTrQ3V8Uct1ii37xWesX9CtdkbK/otBjhziO3k7mqJoy5WmRZaDultkGZ9OBicjVA7lqSBhBo+ng9PWSaVsUuYg9lelmXN/sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hb8Lvj9A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nJJf9tG8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hb8Lvj9A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nJJf9tG8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBVU4015572
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=bjsAxO1y47Fm7p
	1WESNVVdY+AAia0+JSsW6fyFi4o6w=; b=Hb8Lvj9AcKkEj2+CWu0HDpwKh2kyi6
	MLpiEIRVjnCNV0/MUZbN6kxDJBuKuh627R+yS0FO7sFi+VWXT4J4oJ1rb+3Vauc6
	usY854f35gBlV85IyiBebkE/se/AbkuqrGi72O1QNWmkRtF14Qh/8CzqcCzvbvd2
	N3XPv0FOhI27PZJ6mBmX2r2cz9lf1bKO9FnrMxV1pwXGf/gGrc5FUCaugTjGIQmS
	luR4dUKeVPQylkZn7rwk8LQr6VAB+Im1dqyMs41KPDbKf2ZmKPF3BfjJWe2irNHd
	Poe8lxZrZDHDZClKswpQO/R2knXzNIRetEbpmPf8ih8/19e8pkw/PDRg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7sq8k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45RNrDdP023336
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2hqvp0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmNR3gyyZ4Ez2hBVCTb/PLhKdVeMmo+SKg6GKxVHn+ck1XcS9EaBLwWbIVTl7AJEFZzU8iDmOqpFUhQK5e0e/+GxWTEEgPkGh9AHBbYq5pgsrWfda63e5kQ4F+YeKoFJXgqj6KfTVfBmXNbHsIywLY4kp2/f9YlZ+f5vPrrb58wHzptRyxWdDzTUbJtzNycOs5pOmMWq6zwY9cgMaam+9ljkPFyNkvYnBKvfakS/X+xtXh4YgEd7uFwKpnOR0RaM6nAAA91irxNWdk9/KpdFnvihIasHGdZee8Bt6Abhmf+yYCT+OJQ4Or62J4h+4/OCLmAvdz832AUQfmNMspCOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjsAxO1y47Fm7p1WESNVVdY+AAia0+JSsW6fyFi4o6w=;
 b=eIGdvCBb5GdTzAA8s7SuM8OkqMdy2KtbjXgToFige/te+XILExqIpugX6whuNJLcb6mAf5NfiHZyVUZ+/3MytXr8BhEGFP6z57+ZOeL1IHxod2ffHJ5l0gC5kMpMw+bn92vVU/67HrcIrddAaNjLs3OPSiV6SdfePCIkJ4TqOYjtxUdtG4SleOoMBJtTEUwXYKBcL7dEeFmIPJ67g1rzHzfDGP2r5/F9b+sMvBRds7ltMPOUHUlWs3gTUcrnxTm9L0IrFmJ/OISYgFo6+PqfFur8gUL+Ir+OOI5dEyOkoeqenuAueyzRLUOq1urMapZQX0tG0SVvcoAyLcXpujvjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjsAxO1y47Fm7p1WESNVVdY+AAia0+JSsW6fyFi4o6w=;
 b=nJJf9tG8ASor5CKanpk2slPyGUXoSOluwYoX/Z424DOe3qFMbDdITEHjnm2J2YKQ1S+QB1MIBgSpQvLPWdp9/fDAVqqj0zj9ZlKyiv+JU5NknaelkEeYv3mri1ckJxv49RGFgwBCRuE0sCGnSaPAQupgL7XfjAxBIz0QbEAYZqE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 02:03:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 02:03:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 29/38] Set the ERROR PRID in BPF code
Date: Thu, 27 Jun 2024 22:03:12 -0400
Message-Id: <20240628020316.32544-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240628020316.32544-1-eugene.loh@oracle.com>
References: <20240628020316.32544-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2d42c4-e4dd-4625-e124-08dc97167d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XgVOHDGzTH1/f3dgVrlqlMqrBvCBYBDuvI4mrZ2+7rEP+lR2eUNTIlZRj14p?=
 =?us-ascii?Q?44FdKFI5QzzpY4wZizStl3O5t0dYI/ybltkFxOby9Pq42l5BuYUCcswp9DmQ?=
 =?us-ascii?Q?qE3sZmCP0GhjBda607P/z6BjOyPKRw5ja0JTPLnPFEQqHxzu9Efo3dbOwSwN?=
 =?us-ascii?Q?NxMUc6A3nI6yVfH1TTN5yoy27YA6B4oDvX135LahgZxXQiT+xAvlV+mk1F5p?=
 =?us-ascii?Q?LGloX76jeYPb8JzIjeIE8WYmusiXQLEn1D8Ofrc90kBdM8ql6XsgkgKuaz6n?=
 =?us-ascii?Q?xramTwwhdQAFbBtx6OSl/iBN3Fn0gRoIauyueWL0hQ0wJ2bEBY7T+Q/DtSe8?=
 =?us-ascii?Q?fOtt/BaYWc49ts35IDCBBPUVajDCjaiLk7ffUVy4/u4JEW/FCuo+nhVokhAx?=
 =?us-ascii?Q?OTiuJ73xzNfmEHSPUIIq3Ay9RZmSKHx4LrhMU3yPh8Xqj2GLBvVOHEBZ+ryi?=
 =?us-ascii?Q?Ogkew5640rpR8gUdhxq/gi8+m7edVxtNSpPw0VhR3YazkN1Dfe4zUOmwSL8q?=
 =?us-ascii?Q?ymf4Vqdy618wjadcf5piNB/XXd/khG/I1Wxc8WqX8U5mY1lwhT6TK/rJglpQ?=
 =?us-ascii?Q?AYKMpgMVy14I7I+r8FZFDTPoxZ4j2jYjnGrD76EcUf/20PzPCFINy6Rt33OX?=
 =?us-ascii?Q?KUeWg+btkGbDCNrVKXYQLM/hodS+/gKApsOaXB4aY0EX2ZGtHYrNunrP+SOU?=
 =?us-ascii?Q?4vnUi0poWU9BJ0V27c5fq0o00JPGh9QCvalfnnJFf/iVEXmJ0JhOVHBpt2L2?=
 =?us-ascii?Q?Cs3zsSE8P9lRFrBqeNrNGEcTP17IWUdpdveAgCWPb/Id03sL002Zk5CPx/sy?=
 =?us-ascii?Q?o/8ZLL4hy7qkqUUvS6J7sqO37NSkwWwcL/6GdGJPxFh2kiDJ3I/qQyZqgUED?=
 =?us-ascii?Q?V/ww64l4G+4cPmn2qy0AuYhzt4f2miaZuUQ/6W8jf7rfAyk3drgLE8wAirTf?=
 =?us-ascii?Q?DfvExoM9qdIvTZxOdBS7LfHIQU3RIAFONgsforAciCVqElRmOYcE8v9NhBOg?=
 =?us-ascii?Q?rouJLXDIQFGx/IKNL53qbUytgZYy4JnB9uwLLWOPn8P8T0+L5T1CqqYNYNUg?=
 =?us-ascii?Q?qG+HY6Rsud2Y/59w/myLVJ73TtoqRGh5tgxKjCuO2xUTrLpMMnC/Nza0500y?=
 =?us-ascii?Q?HLa84FMA+FcLOAk7PEDkfv8z6QQCllsZr1+IX1/q0jZICOqPYi1w3f6MgIRO?=
 =?us-ascii?Q?9JfUMdvWLOZfdnLMNJAfzdwtTmB0zcMzIUgvTSzUTIUtJG7KWygcbB4o0uak?=
 =?us-ascii?Q?H5QhFxodfe7j2FqjHdsgCjqjj6AvQGCL/GgKMSI6PVAl+Z1gkxkICZl6uYrK?=
 =?us-ascii?Q?Zl5ibU1bhFZYosQ3Y8Q19XbeNemqpBH+vz61rTM2lv5+nWjXUxM8UnBH+pgC?=
 =?us-ascii?Q?Uk+klhM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9DP2uEMVEIbXj4innyq1KCQdSSQVoCchpjB8uTeXF3tDGxnKXodbz4KDGTUK?=
 =?us-ascii?Q?ycJsVEvN2vGbXfg35yzcqJcdA3NQfl0fyYJwfCTwBU7wv8I7MhpCZN0a59Fp?=
 =?us-ascii?Q?v0cNdmHCG1XJfuiAD+BVWskNZ3gilTbP/yfwiMYgjXI77yOjX6pb94oA3gUo?=
 =?us-ascii?Q?MFIQPNSRkGA69No0fpskoOTSebIE1dl5/kFNSlIVVianvKHaqBE8+ro+uTuW?=
 =?us-ascii?Q?4DLNfR/knurZa0fAHkVsb+ZKGe+0VM82ckqMGOrVNMw9+uil5/rtk6wm/faO?=
 =?us-ascii?Q?8YLjQEd5BhSuGyQpUCaQOg/JbzUCR3n938cT8tncmiWW5RIDDHIOtp5Laj/X?=
 =?us-ascii?Q?VFshdLrsqtwFLbm8VjxOkIlg3aybXHRVKHze6J7TxLe4bZ5y7TcRI1BoDuzl?=
 =?us-ascii?Q?188yqqkeyiRL+Yh2iFCDCxpY8aYNdizKW7miLNI0rsouKG4bQSaRbPhcfb0Q?=
 =?us-ascii?Q?XdzFBMM46KxhzNHIRhrE4cz8HNl5o2V3uSHo621nWVHZfs3JO6JL16nt9BvF?=
 =?us-ascii?Q?ZtdmhXVjRKT6PNwD+8oy3kI/dgc6lIR3ZmuH0M3/tFuwqgJi0lx2SSZDfXOP?=
 =?us-ascii?Q?hr827gjwSaskn6plCj+xDD7NIBcVlXWOdPxD/qbwYCzzRxqyQsZGiUIDxD1d?=
 =?us-ascii?Q?DQmVzbJ4U1rsL+p/mBkeaUMufXrUdlQIGbyT38t4AEtniXKE+HjvWgXfNijR?=
 =?us-ascii?Q?6/IA2TfXM+ReDAD7d2FIrw2bHOrkodqR2Vx3/Dsgm/13TXi/8GD1I0HLl0hp?=
 =?us-ascii?Q?W3CZuf1k0AEc27tHTiHNqKZ10nYs7V1MC5S0wvYEsnshM2nk3PNgqbdLyaie?=
 =?us-ascii?Q?CL2m/DGfRAgDausW/r07kM3xndcx44RqLMsvgrDNGPk9WigW042R1lNfwwB6?=
 =?us-ascii?Q?KEkWyZ7fPjZ6lLfm7RPJLv661tCTPCvgjoXD8gAlL7SmVVfKFo4carTAA37h?=
 =?us-ascii?Q?NW+L2J04haoLL3FEwzP4JlfxAbY9AQHkdaKKORaH+wQ9zRtmZLIRWDdiaXBg?=
 =?us-ascii?Q?1/707lpCH+T+JNtjbtCQkT/K/SkXC/CG1nAGRWZvgagGpFfyMMJAyGsXpbk+?=
 =?us-ascii?Q?9IQeswbPh1xCSaxcgH9aotA8hu9Z7z4h8UzIV6Zx2lXMSHkhtc0ZxuDcoSxm?=
 =?us-ascii?Q?YsVJ4M6oiTvkOxTghsegyB4xt95FFMYqk/kA1AKqd+qeGkX/T4lKdmFoHuuh?=
 =?us-ascii?Q?AEpPWWxl6P1WE9L534B1/6dXMynfk069lMih/lQJjDvDBnS1WLqwuOOeJ+Zj?=
 =?us-ascii?Q?Fu2cUJIWAwec9YphH7K9U/Q5FjVRIgIpCLDBVy9YrCdIweUROQq9tODZMEnI?=
 =?us-ascii?Q?ZtQUEjRPmyyoPyDJ3CGy1HQMU9MCR38BGF3dvp31cC73UjxTGZUibhSXcrbt?=
 =?us-ascii?Q?bWlexaJg1pHFG60TEAEW8QHmF9Nn2l7fYRJSieDc61dvMUKXORTTPruNq/3E?=
 =?us-ascii?Q?yWqHDUUSIzL9upaPcX0EBPP8pWgfN+MSUKi5Kn7scN+NUPEk3iLOwdtGhW8b?=
 =?us-ascii?Q?PKY1ymYwpdxQsF+SCTg9IltVztPysdHEUNFA1aAMWY0JltVppVoPEdO05tkS?=
 =?us-ascii?Q?5EZpROVTxBMTLw3VFzlVdJnFLTAxRu4Awl1ErJt8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	AOfPff/07E1quNK+Tg2T5ICK4l0rBgUaJzkfW9LLYVBMTc8sqN7EKvYYqeVL1LWUW+EMFump4kh4Fm4IS5EaTfQOFVvSfHFbwWs1iFUOCUSmsxTAX9k6m/kmqBGOK8ZSi75KEmSU09VB9QAeykiCyfWremdYUlckpqgk3xyO4ymRlHafglqSp4eei/Xz1cs51ZNbbaFwEmaHh1SIsILNJKboEai/EYfaneJmsOzheh6oJUTaH0kF0F5j0wOlSKi70GInX06lLzlR/seNqwaXuuuO4vDgDdT2Q6nvMb1iMOK/kwSSJApbYbHXjqGT4vad3Dz6TkhJEXqy1U6j0kNdoRFzjgONdEl09PnoTCO5mrDX0YsuvgNmwB/JAt6jYKM07tZLq3+7kM2qoRpsWRsx4dIYJTK9WH6yYDeGjKj9sH3t/v0BNEiRGPq3yLWtAqxX+lF/Ll+OFuXJo/LKiB5zyyTT1/21jtfZVfUSh0a8zVhT+9ZiBEEoyqFXpbG8eYVj4uJBRfCTcsmcKo2275suJRoIw0UVIe2JOAXw3F+airRXcyw9TKCzGUL91mEMJDt9UvQAbq9q3EKMyJ1RMtVZ2PB8SX5wEl5rcZycnRwRewU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2d42c4-e4dd-4625-e124-08dc97167d69
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 02:03:23.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kHvxCtk/uFc6Lx/c3OQsFkYdyA+nxCLNbx31WkwGEaqgsWt3T0nZCz/eaxDqOwcaFg49tHiiH+DgNm2u6TfoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280014
X-Proofpoint-GUID: tqPeGzKdOKTcmJ0aVuxkQGl8yk4SCtB5
X-Proofpoint-ORIG-GUID: tqPeGzKdOKTcmJ0aVuxkQGl8yk4SCtB5

From: Eugene Loh <eugene.loh@oracle.com>

The patch can be simplified if we are willing to assume the
ERROR PRID is always 3, which is probably safe.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/probe_error.c                         |  5 ++++
 libdtrace/dt_bpf.h                        |  1 +
 libdtrace/dt_cc.c                         |  3 +++
 libdtrace/dt_dlibs.c                      |  1 +
 test/unittest/builtinvar/tst.id_ERROR.d   | 32 +++++++++++++++++++++++
 test/unittest/builtinvar/tst.id_ERROR.r   |  3 +++
 test/unittest/builtinvar/tst.id_ERROR.r.p |  4 +++
 7 files changed, 49 insertions(+)
 create mode 100644 test/unittest/builtinvar/tst.id_ERROR.d
 create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
 create mode 100755 test/unittest/builtinvar/tst.id_ERROR.r.p

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..a6616c2f 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -7,6 +7,8 @@
 #include <bpf/bpf_helpers.h>
 #include <dt_dctx.h>
 
+extern uint64_t ERROR_PRID;
+
 #ifndef noinline
 # define noinline	__attribute__((noinline))
 #endif
@@ -26,6 +28,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	int		oldprid = mst->prid;
 
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
@@ -34,7 +37,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
 
+	mst->prid = ((uint64_t)&ERROR_PRID);
 	dt_error(dctx);
+	mst->prid = oldprid;
 
 	mst->fault = fault;
 }
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5b2df264..58cf29cc 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -56,6 +56,7 @@ extern "C" {
 #define DT_CONST_ZERO_OFF		22
 #define DT_CONST_STACK_OFF		23
 #define DT_CONST_STACK_SKIP		24
+#define DT_CONST_ERROR_PRID		25
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d1ee3843..3d9a9c79 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1076,6 +1076,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = sizeof(uint64_t)
 				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
 				continue;
+			case DT_CONST_ERROR_PRID:
+				nrp->dofr_data = dtp->dt_error->desc->id;
+				continue;
 			case DT_CONST_BOOTTM:
 				if (boottime == 0 && get_boottime())
 					return -1;
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index bc883e11..1fb561ad 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -80,6 +80,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
 	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
 	DT_BPF_SYMBOL_ID(STKSIZ, DT_IDENT_SCALAR, DT_CONST_STKSIZ),
+	DT_BPF_SYMBOL_ID(ERROR_PRID, DT_IDENT_SCALAR, DT_CONST_ERROR_PRID),
 	DT_BPF_SYMBOL_ID(BOOTTM, DT_IDENT_SCALAR, DT_CONST_BOOTTM),
 	DT_BPF_SYMBOL_ID(NSPEC, DT_IDENT_SCALAR, DT_CONST_NSPEC),
 	DT_BPF_SYMBOL_ID(NCPUS, DT_IDENT_SCALAR, DT_CONST_NCPUS),
diff --git a/test/unittest/builtinvar/tst.id_ERROR.d b/test/unittest/builtinvar/tst.id_ERROR.d
new file mode 100644
index 00000000..59021c60
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ * The id in the ERROR probe is 3.
+ *
+ * SECTION: Variables/Built-in Variables
+ */
+
+#pragma D option quiet
+
+tick-1s
+{
+	/* trigger the ERROR probe */
+	trace(*((int*)0));
+}
+
+tick-2s
+{
+	exit(1);
+}
+
+ERROR
+{
+	printf("id of the ERROR probe = %d\n", id);
+	exit(0);
+}
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
new file mode 100644
index 00000000..95974abe
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.r
@@ -0,0 +1,3 @@
+id of the ERROR probe = 3
+
+-- @@stderr --
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r.p b/test/unittest/builtinvar/tst.id_ERROR.r.p
new file mode 100755
index 00000000..884b43f4
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# Drop the line with run-dependent PRID for profile probe.
+!/error on enabled probe ID/ { print }
-- 
2.43.5

