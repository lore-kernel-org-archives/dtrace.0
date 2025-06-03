Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5E2940B
	for <dtrace@lists.linux.dev>; Tue,  3 Jun 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748982948; cv=fail; b=N83+nSokoIQoZtawQp1k8YdpDKVWCuu74FjCNRZlffnQmP7qlMKci4oScAQhyTzwFoORAx23bNc6SHT3wIjQUPEVL1ZVf19GikTGhD0f33DFCPRJUwcz8b5TualqTgcKSENVwxfwGfAkB1UtxoBQ8RfYU1q3n9eOZSgZKDwJFJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748982948; c=relaxed/simple;
	bh=NcRy6UVISqBjXkT3JOCYJC3SxNhThP5FXglYNgMBbF8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nsp8ok251ql3BCkeDfJhlC9U0R8bjhIZ9N2UJtXGW2fEMrp+ZoZyMXT1ycP4AsbPHKkBJQYiJW00LJJ+kw2YgJW9GT7Xf7ktOpQ1WAhIsO6l0Ap53W6d5vEUawlfPFjgfskCmrRVnnjkJx5cqyPlAJj27GRyVfQrULllnfAQSGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oy54UIiL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E/AJ5E1b; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oy54UIiL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E/AJ5E1b"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HY0h3020052
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 20:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=qCj8Ab/yvdGpIIorYxyyP5uQXH8Tf86ivMkp/kyAeB8=; b=
	oy54UIiLnwTxfdqzcSt9a0I2p/Ja2xIPHDPgXIL9m//xLl/YqrjPE2nrCMkf2B/D
	tbL8U5JNqoQ2CVpca1EYN/wvS3L2OR+L4gTWUjWzJkMvgpV0iTRxKIPl7GM7INgI
	hwO/ulg38nLg1IZXVEiRRYSt6bl7craa2WXbj6FFCJN98mzZ7qJth6ew1ZE+bwmf
	l7IFbndeztlLJiUnA5GC7hahoKJOsZrG77VsSmE1eKpl/EJD3jzKdMo5sz2Btw4I
	mkZ+KxjaYha8HpOzggS7dFhyiUv8J5j0mT27yKZ+8Aeic9loCs0yWnss7ThG0/To
	BSvz1uh1w0lS8Ai7Wav9PA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kar7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 20:35:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553KL9ei040621
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 20:35:38 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013006.outbound.protection.outlook.com [40.107.201.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a5p9k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 20:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3X8hRmbRs8QwfrblSgip3ZTtszsKhA1VduVBGzW1Occ+TJni3W18qoiuVDQynkNal9KmcxAApCzhyV+lTJ4LXODSYsh29xXK/BSbYq3yzSv1ZEGINALQCjqEQeTRIrxWkNCizHYLAoiZnOvmAtnxNf+CpTUJ4Rr45SvG1+ph3F1ZxM9U1vN75zMWsJ3koYhlLidxZsSCQ7g6vgBspdOQcnN8zRj8xO+eXVniCuyrMV03e6EfU3AfLnLZOUIaWZ5IKDzNFRl/g6wfDV/VAf39ComahoTdW62SgJXbflPlyuM8Rx7FoNIm49Q1J3A0vMZ7Fhb7R/G/eauE+CFctuYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCj8Ab/yvdGpIIorYxyyP5uQXH8Tf86ivMkp/kyAeB8=;
 b=x7PPWq08H5HZfszclS6BplptfGQzK55FIsTtnwHFF7xD7lEEWFks3cBXCPwqnsAbxP/uWlDeRXhK3MKpah+lrqKwjEq6446q6wjKwJ0Oaaatmu+a95m24ArXk4dp4eXR3BxMPhVzRYPnn95ufUhR0HegHL5+LiPHm8vuOTFGoNo3/Miey3ve73coQ/L52ATAC6e/+GWF5DvdXc1ZUu7NHoS+HfvrTk62PtSG3srd6B4tS0uMGiAAVaB1/jE6SWiIjf4n5t6vVKrRBSIO+zmoBolwxAWArQdTqgV/y5Y1rdKPVME6vgOcVI5vsPGCoETXPRO7eQ8uU5BOJIu5u+kU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCj8Ab/yvdGpIIorYxyyP5uQXH8Tf86ivMkp/kyAeB8=;
 b=E/AJ5E1bnzVAezHu3rKn2TlxFW/aQdX5m/EldW+cXxJoUnGphnvx+D+ttA5GAPkdydpml+ndK6ACEfC7K0+1MSdSr5GVrYguKFs0Q40KAyuwTwi2WOX2Pahkom4wl2N1L43/itHdN9JAAsWim2WhV/BPF9v6095lXeBhe9hL5Q8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6678.namprd10.prod.outlook.com (2603:10b6:303:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 3 Jun
 2025 20:35:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 20:35:34 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Make the USDT "only enabled" test more stringent
Date: Tue,  3 Jun 2025 16:35:32 -0400
Message-Id: <20250603203532.20743-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0247.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: fe07d3d9-015f-4ffd-be12-08dda2de30fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nClJzuXD8fBedKHe65dhBgvk0Uo1U2l11GgFn1ZXluoH9ss4FEizL+mo7Xuf?=
 =?us-ascii?Q?PCalLnCuRPFp876gCHfI3OsH4VGl0YSkucuivusyA+0Bvxe/rho2qx0dOAVz?=
 =?us-ascii?Q?k45yCG9JIs09BjXh+45tL+OjQAaL6Dj4FNepV47wOXnmUvM1IBjN5s31luUu?=
 =?us-ascii?Q?1uawSlXMVPM3kurvfTzQ3pyPPMIdfdCTIBWrxa/5AFwEnk2y7ySgeYXrBotB?=
 =?us-ascii?Q?ta8hvSKtqTPRgIgohyn3e+5ziA9HsdRJe8eGaDqO+6cYlIzDA4Op6xvRw2IL?=
 =?us-ascii?Q?b82Rq4AXjk9DD3uR33K2yQIb0sahfstn8nJ2FcytlH3QMOt0OzuRq6ZQwGCh?=
 =?us-ascii?Q?JtkPP20b22E7TxyS7jEjaqlAKaexXQo2gFHBTPLQ4gOVcuGoO2+hG3AthkYK?=
 =?us-ascii?Q?8KXGM5wKvufXadFzsJik+EcKxZDBpYwNaoX/1e80H9Y5Wt8vi5eUmBvshfJz?=
 =?us-ascii?Q?qKxqIJSTlIK4ClokTuqiEzEbBFPG/pDTiVgdsmqJ76qzPuFSb9XIUMkxQlAG?=
 =?us-ascii?Q?4FHuT1GAJz1KJ0y8x03u/VQnb6cG+XaKOf8cWnY6KdNP+9tadg/8uA6A3OOg?=
 =?us-ascii?Q?cH9Kx1kEo4VHPbvAIPxP+S7vx6Z4w6cVk1Xfz6ombb1Vu4+o1V8HNqjP7xc4?=
 =?us-ascii?Q?b6ud3uF6sinS2YAwiIn12LbOV2Tt2TEd5ePw/HEhj8Pk+0hERq5ySar3mxfO?=
 =?us-ascii?Q?aemJdVHvF/EFGBD3s6lLo3+jK/7JUniLgJ1d8QvOic03MZjZ/pFES92Sf9VN?=
 =?us-ascii?Q?qGDjiVdc0hPcGnhJOEeTcCD5mjxo7jdb5h2Z+memkCl9CRBxaqyrod3RVkzl?=
 =?us-ascii?Q?zWGXDXlW6X7s6/t8BFDicQU5yl/aqy4cr2aQncwSt9nRS2a694Vwb+XAb2fz?=
 =?us-ascii?Q?nr/3sIM/k5W1Jc5atn8Ozhmo9Xl5rGDGw/LUmwveC5XprVjOkb1o25QclZpo?=
 =?us-ascii?Q?T8I4u+TNIE5osEfTcqb4WdsDlB/52VhRRjvhrebqAut+nlj9l2TmG2paDmYh?=
 =?us-ascii?Q?mZAWG8prZHYcCmgYU9dShcamPVi3Fk6D8os134BmXyS/7FIzsKUqDhDzZ2mP?=
 =?us-ascii?Q?BRlKUMiRK2FJny+4h0ewFohZ5YzdoU2EpcRKKgH9PNasYLppbFsZ9bYry7cA?=
 =?us-ascii?Q?loVWw3KC55FhXWTxxK83BIxPTOPwvbrpvPvxF5Hp14HJ9AZz1w/FFwZQv8X2?=
 =?us-ascii?Q?i70ob2nsEkVZsh3SCDbD0y/cSPUZBAQm7MYmM5Mb0AzBJFLEOR6zXGkx+sIJ?=
 =?us-ascii?Q?35/Nl/rVWh+rl7H/rUYMkrhtIkuYBhnMV1yLYlq3lmEVzp+UhNZvir60M1Co?=
 =?us-ascii?Q?Yvxr6w4iWj/QbNS3ZnXQd9yXPH04JR//0f9OOculd3fozapQv6mq1Psr9MrK?=
 =?us-ascii?Q?ToMHkziOD20+2jOEJdHvj8M7pf+XmxfNMhSREcxQXEgbUx+23uQqKGQFI2zf?=
 =?us-ascii?Q?sZriEmvRKOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxYW02UDWyIFOp1SSBT33CD0JY+/3N2yZyzizMReVxCPKEb+iJ/d3te5DNGP?=
 =?us-ascii?Q?cSGVdA/UIgM/uZA33AAisaVPDHAlo7tVDmY0PPqJ3d+p49ZMV4FAzgbqvmpV?=
 =?us-ascii?Q?AyVPidQVvU5IyePk3PAWbHQtAYmpNBc3kVw3lpwsqpDyA19u/KP0e5BAcBQA?=
 =?us-ascii?Q?2blZs9WP6oWQlw/c4s2CoCGymKa0ybBOvGHiuWOAjQIIWG4OMsY7icoNjbzE?=
 =?us-ascii?Q?swyYrvV12En3aJbf/VUa4IaQm3GaUgrzP6kvQtu/SZIOU87YTvSdmN+wctkd?=
 =?us-ascii?Q?FPDpQYfa690iGA5IPvXq+8xTy+PwMiwswAXJrWeqJ9htZGHUFXC1+u4oMgHB?=
 =?us-ascii?Q?I2nqZxDUsBXRDPAdbQ02PeP85HrnfViGUtABL2uoMoJEWrT36Sgh8XC7voAx?=
 =?us-ascii?Q?cX1hb2w/5OGDcv8gPzXTswkcewZ/vSmH0nJ2A5TvL2SyL83B5X0kGe3MXVmc?=
 =?us-ascii?Q?RvF9semmmE34GWz76HdEfbe/Q/r0yCJ0/OZKBOUbcbXun6QZLpNnr7YokgSb?=
 =?us-ascii?Q?RGu7EgZbCSTKb5xndFF8rppd4xs2d0Jyh4CZFs4DYYkeV7e9DhTOKtmwW7R4?=
 =?us-ascii?Q?bUaxnQfYa5++a5LxtOf5YTw36pYOPAipfoCP1b9PFcDmgXQkK8yyRRJqm8em?=
 =?us-ascii?Q?lQToQfFvWtcDk1QlAwOBx2eScjJJUdCpXksYy3Y0LqxKme42E7QkqJ8hhbsg?=
 =?us-ascii?Q?c6+6R8FR3Dkxi4W9Dk2H4Gk+IlMpc1cA6t1wFNaUuXf+jbAdJtolmC2KEG6b?=
 =?us-ascii?Q?aKb/VD+k2TW4wVsridWuQcGMCIIqFYwlEX7gFSVXFQ8tBySiNlrU793axRcn?=
 =?us-ascii?Q?MVmnpMuVn8wqWy9Nt8daEWXQi7RZhbuD4uGb5Xs6wiZwIgw46Dt6+AfZPWDT?=
 =?us-ascii?Q?FsBsgbX0xY6ke2ifsNv+XAvXB76pWjMl6iRwow7oGHVTiHnsi9s7nbHBz0dP?=
 =?us-ascii?Q?6l15Mi4z2hZU7Hriliwz7jJQiJEskH/YvH60GPXCO3TYbXiL0jsGUlOARvK2?=
 =?us-ascii?Q?YWUjBFjNjcYjmEnAtBFEuHLYqAEWQ+0lT0WZZOh0Zhf6ySXlcfn4xyttfmbK?=
 =?us-ascii?Q?3MQ3i5cutDr8OXqmInhLpFGIv9LGowejiwQAl2khwWVVo7fwu9VSjxvlH1yq?=
 =?us-ascii?Q?XotMldwjpCxNygjRbJCSzdh9uU4KD0jUebwMFnAD7qYQeOoLdHghH3Mk+Rz3?=
 =?us-ascii?Q?JuPydtk1oasOZ6DllTFvrwXVuAsu/f/S/DRqiZMg1+VqMKvmCdL2iQqvy+Ys?=
 =?us-ascii?Q?3B7t1UteIXqC8Xw6zBIsp7FjVWUReuos9bZRQW0eSslM+Glh3Fh+tvMaHm88?=
 =?us-ascii?Q?3gCkDzr3niDYssgPijPwl8oa0T1yDcjvu4CbIGYh5JmlVPd8rb6I4QR2/LmH?=
 =?us-ascii?Q?GWXaviUqeNIBwWljh0f/TAtnLy00hZQIU8o3optkVGVC0ntFdnHwst3bi8HP?=
 =?us-ascii?Q?/b6fEZ8H8ZQak/vZ8eyxJYmVIa9171c+ns9fZLjr/dwlEj8rMZEjGbQ1JXpb?=
 =?us-ascii?Q?SKriUJtyn8Xeiox7up8/mCr4Dg5rlaLBlbZjHg+fY7cEK1CxiwyCpVtkLIR+?=
 =?us-ascii?Q?lgEGrL0I1emmheC6zoUCLeg8jm4i9ZdRs1Ruo4vz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gXAJKIfFEmEtcO87V0+oXh6/DenfUt/yfXwud3QawPTJmQfdvWNmkzXfjABRQeljJ8QgpzOMqYfPpOr1cWdOO9VV/XFbcXMROxBh3TPtvLuXm5dm1B+W4qlcH1plxQ8ZrWbmEjV+cl4pz6i+/0u3tMe1gqvbrLDpV96CKlFrdPxcpjbLY6Y/dUlfskxMvEmtxe7AEWc3x2EgZsZ/Awf1DE/GAW5+wlvDCfWmy5GvAfNt29zbPwzWrPMLrTM4+UmoI9aPC9QFf3UZvcQFMPO3GE78ByZOlzMERtI5XOaUm6JpeFdNJJWTwIaOOZy/+9JaLBHNNZSHfAAHNsw/d1gSA9lfWKq6Tq10LrULeKMYOPAxJ0PFc10i0MJ8eYUin2JxHYuSz1fyBsTp79p1sqU8gjmpezYWUBRlUh8IjLFykL+8o+voj2W8CKbK0xgAtI8AHDA80r+5w0YTvOtpiYLTrgPMjsdcADuQYYUuH5hlLcG/vqC2KLtzi0i50A9Nj3yZ1Au7Nu1FJVYEQOCizB8bWkIZuIaYkDXMs1h/jacRNUw3MSKadVnVJhEM4y8RwkrjH8sr+UorvAgy0RCuqPhRmH6J3HVKBFrOeB5yd/kf7Q8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe07d3d9-015f-4ffd-be12-08dda2de30fc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:35:34.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xSiLSf1bFTrLkg2LgmXuXRJKdP9rKt2tvhkfuxqwhr6CdWL90SyMNqNquiP2MRpVLO7b8s0V3H/8IP8OUyP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6678
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030179
X-Proofpoint-GUID: pW0x21Euu59TAOLZW0aQgurEwdZiKF4L
X-Proofpoint-ORIG-GUID: pW0x21Euu59TAOLZW0aQgurEwdZiKF4L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE3OSBTYWx0ZWRfX88FpMsZWEqyA LmHHXBNxt7G6XKajPreiDLo5PwCtS0Qwpw6XEuKRYcs5Mv0Cix8C5rOMLP2d/sCsuJAEpHJo5lb 5vVj11fsXEjdcriHD55lt1ba3suzoBM1uGa1cvMAEGR5GaxMtJVnqU92hPn0CZaYb8q5VhMe7Yh
 ACqxGxTs3JJKCVUBXVdOYMbAeLgosqKXJZ8P23VN/Rs9l9gT9woSuJoHypp0FupzLd5fK+TGudW T9o0YnxcxrhiF/tck63vUZSKyO2bLXpAYdo0AFI9mh2BSGTENidgc1DSkLe6JITVtiOn+jPPBPj zGCnslmX1jYPp/wKCWC+xVAAto/+t+PPi28ECnWBwJ3DYE114YxnomBLPEdaAGi+8Xh/JeAdNwn
 BkAyFSYK6awtVJ1qljhT0czicPGKI0tAqQ8RoolOnGHRRmvohV0FCjLzTwRnGih9OjLhNM7m
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683f5c9b b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Y8zMsF0uXMP-igV0oV8A:9 cc=ntf awl=host:13206

From: Eugene Loh <eugene.loh@oracle.com>

What if a program has an is-enabled probe without the corresponding
parent probe?  It should at least compile, and we test that.

Add more checks to the test:
- the is-enabled branch is not taken when run without dtrace
- the parent USDT probe is listed with "dtrace -l"
- the is-enabled branch is not taken even when run with dtrace
    if the parent probe is not enabled
- the is-enabled branch is taken when run with dtrace
    and the parent probe is enabled;  however, the parent probe
    does not fire since it is not in the test trigger

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.onlyenabled.r  | 21 ++++++++++++++++++
 test/unittest/usdt/tst.onlyenabled.sh | 32 ++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/usdt/tst.onlyenabled.r

diff --git a/test/unittest/usdt/tst.onlyenabled.r b/test/unittest/usdt/tst.onlyenabled.r
new file mode 100644
index 00000000..93cb402c
--- /dev/null
+++ b/test/unittest/usdt/tst.onlyenabled.r
@@ -0,0 +1,21 @@
+run without dtrace
+USDT probe is not enabled
+
+USDT probes found:
+NNN test_provNNN test main go
+
+run with dtrace but not the USDT probe
+USDT probe is not enabled
+                   FUNCTION:NAME
+                          :BEGIN BEGIN probe fired
+
+
+
+run with dtrace and with the USDT probe
+USDT probe is enabled
+
+-- @@stderr --
+dtrace: description 'BEGIN
+                                ' matched 1 probe
+dtrace: description 'test_prov$target:::go
+                                ' matched 1 probe
diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
index d3487834..d1859bbc 100755
--- a/test/unittest/usdt/tst.onlyenabled.sh
+++ b/test/unittest/usdt/tst.onlyenabled.sh
@@ -5,6 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
+# @@nosort
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
 	exit 2
@@ -32,6 +33,7 @@ if [ $? -ne 0 ]; then
 fi
 
 cat > test.c <<EOF
+#include <stdio.h>
 #include <sys/types.h>
 #include "prov.h"
 
@@ -39,7 +41,9 @@ int
 main(int argc, char **argv)
 {
 	if (TEST_PROV_GO_ENABLED())
-		return 2;
+		printf("USDT probe is enabled\n");
+	else
+		printf("USDT probe is not enabled\n");
 
 	return 0;
 }
@@ -61,4 +65,30 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
+# Test compiled, but does it run correctly?
+echo run without dtrace
+./test
+
+echo
+echo USDT probes found:
+$dtrace $dt_flags -c ./test -lP 'test_prov$target' \
+|& awk '/test_prov/ { gsub(/[0-9]+/, "NNN"); print $1, $2, $3, $4, $5; }'
+
+echo
+echo run with dtrace but not the USDT probe
+$dtrace $dt_flags -c ./test -n 'BEGIN
+                                {
+                                    printf("BEGIN probe fired\n");
+                                    exit(0);
+                                }' -o dt.out
+cat dt.out     # report dtrace output after trigger output
+
+echo
+echo run with dtrace and with the USDT probe
+$dtrace $dt_flags -c ./test -n 'test_prov$target:::go
+                                {
+                                    printf("ERROR: USDT probe fired!\n");
+                                    exit(1);
+                                }'
+
 exit 0
-- 
2.43.5

