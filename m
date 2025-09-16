Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8E2C11E9
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758047213; cv=fail; b=Vf2hAaDp1yooYPINgR9Tuv9UWUT49z/e4xOdsCEdFZOx0i6Ph3L8gdCGlVH8CqvA3aNP+gAkPXuoyNj4JcXiIaKwMvRLp0yYKwK7hSBgG93LQmQuHlUVMtJO1cKHKlKwgBDht3GBa8WG5h5/PFLkmSlDzfx8eCZVF0OFW6/yNzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758047213; c=relaxed/simple;
	bh=eH6Lphwd2MYYeVJpQ0WJBnoJduT/y23QbbWnlB5aW+g=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Nyg9IQQFO1ng9Mc2RrCculvtLodhY9KckUfXkYJ1WGn9t2Jf1EexsHZgP9I690kOENr6H5OEeH0U/hCkQAPidY5mTHcZ+dnJv+BN4SH9CKc8ZD5COZjBShoS2fuaMAA7n5pkdzWM9qF01cj61nqFk9yiLal984TGViX38xM0Fn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=abUHz15Z; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vFrpJA0c; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="abUHz15Z";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vFrpJA0c"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GINKeI017967
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ubhzafLpKg3PSAYWHRh3z0nY9FSqB4qwfuAAzZpWaaM=; b=
	abUHz15Z8I/GXbxYhsnCcGmzIKnsF9ewRr1UyWNu3eWYbCHIEB/oVvIV2yf8UpwV
	krvhP74rFJcwGV5+bg4KIvxrCRdPflsn1BB2m01TdslheusvzswUXcrzY5o5OirJ
	8+ZD7i+WVik3bjgT66B06U2v86ZeD0K/ISuP71+ahjb1usZNPdKq9bajJG2bVhgP
	G6uyruHMvJIN6ejwaAqJq79WNLTlp3nOaXFgfvHTNsZVu7Qj7n41iMNV3ahDFU2X
	KzyemLeAkZ/o7lx1IM7PVJFy3IfX3J91u+BCm/e+ZsLfy62vlGy/JA5yV+Vp2IQQ
	hQ02BFI48Pm4A1MAY5gvNQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w5apb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:26:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GGwMaF033680
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:26:50 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2crkyr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chLb0qLnNSiW1zScXOnlO4xeaz+1xAu6I3Uap/KkIKG8wzfBwpislPOH5T1nIqlvKyHzKLNmiK3i38KfD3OD3LQoZClpE2CaOW23HLf8cs0sU/UFzGbP7MR0ZeQ6nys5/279AY2BTCdOuJak7e+8l6RVSYN2B0Bvcjsc0CyP73c4p9J+GXfhEcShcHqcby3aRrNda/yZDXu/GMdpW+CQZmRKLV4a3XgAoFe+8C84BKJmWXRS6aABEDX6m8pqOR+fntlUdk4+cJrL9vkoLN1VtPirZeCiRLFgs+pj3ithuBkIhnhooWpTm3jrMrj0aTFqaEClMq5WyqrBeeMiAj5ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubhzafLpKg3PSAYWHRh3z0nY9FSqB4qwfuAAzZpWaaM=;
 b=YDWm6tz/TQy44Tns/hT1wzHPYqgqwagdQKUTrRy86fXak+bFKJmVjTlekr+aA5zyWDqyW8kIJEsaiF3+gN40WEB29k1a5gWr4n/9fnneWggc7kDIJdsLEGovxArWod/dayTtKP9rQMsNMqtn0UzLTDlffSAiIULd6CbJmJxiOwqEWWGSIdSRjM1qDDVYfxOZaS+AbZHSapoOK2UfBF55bPyb1DWU2ZNxP4T7bRptrE69Tmm8BRTZI37oSOH902bgq0RKXvwvW/LfVR/B/38hZ8H87J8cfHnD/7uFHOo7qJ7g9nHEHlgLlXle2iPaM++zn6e8YBR6s3g1MAgdDehyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubhzafLpKg3PSAYWHRh3z0nY9FSqB4qwfuAAzZpWaaM=;
 b=vFrpJA0cLYsdoQs2M9JqZe+osoB1GyvVmkiO3YDCgjQWYNmSYu1l3KxKmAb86nUlLatNEhn1t2mpv5qcyLqUVip5j7FmbV7HbV0kUs2B5FWZCW9hDbOSeFC5Jl5wl7prj0UcruRgHeKeCPvgiku87rqFDGdFIx5/l8797a11ZCQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8682.namprd10.prod.outlook.com (2603:10b6:208:573::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 18:26:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 18:26:46 +0000
Date: Tue, 16 Sep 2025 14:26:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4] trace: print alloca pointers as actual pointer values
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c601f27-7192-4845-bf61-08ddf54e9849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5G3+egHh+da+aH6Ti66xwloqvfYjsTg1xPA+6311tmel7hJiq1NG3v1KzzBZ?=
 =?us-ascii?Q?X5ZLDJ4HTa9QPZUfsSimqi24uCsOaboVCBG3turft8emTq9PzbfcGnpQviSa?=
 =?us-ascii?Q?OOEO7FZCSBvIIBB5LXD0KpU718wN4lgmA8sa+6J/iOD7A6auYcdTFg26RKYh?=
 =?us-ascii?Q?fuX38yuaAMxZxxicSKDljbRftIaa/UUltN5B46oX6haOzxJMcnov3N9FD6Pu?=
 =?us-ascii?Q?0z+1vyTpL3MYpMH+UgSgBl7/V5cS0lcxck17mMDZjnuk4vpvAg8yIgaZOr+y?=
 =?us-ascii?Q?/OoKJEsOJ36TtF/lKVy4spUfgIrrQ44PMB9bEZf/rFfSjEaohUerLhE7Niob?=
 =?us-ascii?Q?nhuLdtTLEJ64HB2U0ueU4nFt4rwecaCFiow0rIvHDqyv8+5i/Yj90fU0M/sE?=
 =?us-ascii?Q?Kde1u0rk086NRv9KGQankx2CD+lrzSDxstOdLGMm8Fel80P/gmNdoO45ElrZ?=
 =?us-ascii?Q?cqViROAMGUZg6W88q7vHph90xSIqW1ZEcqJn/cjpC3ndNEZ4YimrHrNNBguF?=
 =?us-ascii?Q?a+75/Qibh09k/EMxqNq/fDZnzWqdc7ZcfdxosYv3dfrPcRUtarQUwL6vPF1G?=
 =?us-ascii?Q?H6ypxFl4uzElDzdByJ1K3il5GnAKRO0h/7tiArAMSy0a59yV6P0nk+CG3GSG?=
 =?us-ascii?Q?v5Df9nE6cz80KTKIk6vH9DSIS+BneW3t22hugDmNv9vHUntadKjX8KUjWfr3?=
 =?us-ascii?Q?F1O2DPFwt1TarvliPWQAMwnjo/B1Wc/H9qdgTR2n6hrARj0bVbIOsiW8rYpK?=
 =?us-ascii?Q?XO2MUlpDfmoNtusVeF9gPFh03khMAk8rF3vkkdN7K6vrL8IUj0YjaQjGqPI3?=
 =?us-ascii?Q?L6A4VSMnKebkD7ILzfP1rYwq9dzy8KvLKmV1piUF0ziIChji9cCUvmIEOtrq?=
 =?us-ascii?Q?fYWskBW7YQ/PJ2i5iapcBRWRn0UhVyA1F0ZhWzEftmnKHOVxSZJtF1VJKm4L?=
 =?us-ascii?Q?pZrZzfCbLsoZiDRzYV3BT/CQ7201RERqBYS9OAfymNiKqh4RUC5oeKlkxaT/?=
 =?us-ascii?Q?9oDQJO36Jvoq5F8rxwfUoOWGMpuEjc+Skb5tBVmQmZiYuje8ACW1eh5LWlvW?=
 =?us-ascii?Q?3j6BGxO9CLJ8ZHW/+HWLsaeVXt4KruMvUam8gjFYszoevBX1zvRaQshVxKjS?=
 =?us-ascii?Q?nmUjMMKIl6NV5Myf44XVVFbsDElHzwfRgwTn3B6EyR11VGsbY7z5H2Yg8Pfp?=
 =?us-ascii?Q?HN6z9k38cn9f5uquguA2CHghqd+nCh7Ba+vppGp4hGvHiArHG7/FcMTFNlaz?=
 =?us-ascii?Q?sC/g3BPHg30I844dHEn1QVmZ/IorQxLuOu6SC7iwAn0TmwPwoikn+F9ix52a?=
 =?us-ascii?Q?qv9ldSMRHtlJyUz1U13DpjibRGvVD/4gHsgpWcVp8nbUb6BWwN9O6vfDwSlX?=
 =?us-ascii?Q?XQRFc1FLramexu5XuCyZsm42yQeip1HPxSaBU1kBAyfMxUJoc2k24yVhZHf2?=
 =?us-ascii?Q?qEtysrVRKFI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fplddW5boFTMccsA5kH2MTxldIkhrYJBjH6AP2k5v8fPj7HICykDywqUjbYE?=
 =?us-ascii?Q?3/SM/ANmmSev0SO65wbM1BQX50Yk2B9yNx6ZoFS9WdMAIL9Z1//lklvnVRCZ?=
 =?us-ascii?Q?fY3MW6IKurR7v0Bs6SAhUBfkRtAa1CPtP1yNq904iqHWziRLfbdIm5MuFaf/?=
 =?us-ascii?Q?vkGp/3beYciFH4TldSufZxHYygDKr9dz7Nr9iVwfisVGj4QIVeRpHxgrNpDX?=
 =?us-ascii?Q?PGohh9DLIVrzFuE2GWgdwwwfeYUsgH4d38xPUtygZjbdCB6+lJRE7bdMMjxO?=
 =?us-ascii?Q?srWqqizzDzsaEi0ZXlWb1cIxjM1H5j75Q4CvLUZ+kkurWkyzAYgJvrMa67fO?=
 =?us-ascii?Q?+FZOvH5vxLs7944Qn//Rqkdprnuppl6ItkCYvFnvC0Mf19nRkM7KCgcJALHc?=
 =?us-ascii?Q?S5o2s3zk9TRo/nxGI2m4+1/RMAoElHf1uwe7+AJqn8itVFo0BzO01B4Jpu44?=
 =?us-ascii?Q?PLV++C5ozhLvTIN5LTePtJHmEGu2OSSqZRUKKS/MwO787ImJlk7GNzavsGZJ?=
 =?us-ascii?Q?D5GrWAR/bcSm8Dq8SkUqrDk1bkhMgbbyiTh1pyklYaVtI3Lz2DcPDgvGA4bP?=
 =?us-ascii?Q?6TY+FtVGLZ+zrVHljt2gS2dOCt6E3qtWEqpeARiKcUEuZRMrRlGgP9VoPYO3?=
 =?us-ascii?Q?BIM9ROaQxQboKm2eOJ+6ls69xME5A6tYwtXe69Dhox4/MH3Z5c8+SpRcGhmp?=
 =?us-ascii?Q?66sE6FqJiCbcGq+x5fLres2DC7lu8ur8+2ugblk22SAeWFtNzFsK5R6Wo1ID?=
 =?us-ascii?Q?51WqRPNWazpqAm/aLVwBGSBdFz84uNCO9WTjbTh5+LCImBXDTnFonXunUfyO?=
 =?us-ascii?Q?XI3VKNwJayRl4bdlTnCL4JhUeHRrO204ZRisSi7R1maZbBPuT/eb4PYDh+21?=
 =?us-ascii?Q?/KCRDcxulVAh6n8Dp2Cktgsc8wITEVC3h3PMAriemo2bcjyDUZhr+z4STYpx?=
 =?us-ascii?Q?TSRcW4/j2T303jhprDr4iZzhHxl+ab1gey88941Xd2W6tEkL3YVzRYg8gXQw?=
 =?us-ascii?Q?H2jFnXAujGVX3V7Q/DHv1NDLNZy2KkPwhkLcLcWjyOwBMwoWyBju7jjda6Nj?=
 =?us-ascii?Q?CosToYvwDIRPh+2QiouH/rn6v5xK55MXa1BW9BntFs1L1ZR39oQTGO7WtaR8?=
 =?us-ascii?Q?wH7DENbsdhYCEVSTaov+ZPKBIoKAOGYrhFy2poukeTvU4Dd6Lrm6DRfRC3DO?=
 =?us-ascii?Q?x5YIPDPZRF0DhTFwpbsvO4lXOgvXbxBQgkmKL3X9DJz1H/IrodbwaGffJPYb?=
 =?us-ascii?Q?+g3qrdR3mDqEKfCZxSy0dbbCmEbrCq0Z1Ux6efJ1+UAxjGaj+9Dq+s/ku6XE?=
 =?us-ascii?Q?iJRroIpTJRHMMvqiYaXPuTksFJXycUG9QnRtbVnzB34nqYNcv6q/Xk6J4onn?=
 =?us-ascii?Q?sR83w5VfarJJMTMbAdEDR01s3dP1lNrHon3MWAGQNTNjjFy8wzB7+YenbFOj?=
 =?us-ascii?Q?74WyOeGIcL6xT0f5+fE+F07jWCz7ifYkGvLOTiLU2M0gjtR0MIDd4JnhG9Ry?=
 =?us-ascii?Q?z8alAMQ52u4wVxLC2aUaUIOVaUci/5dx9XZTlJMk9yddqGjqNkZ6rtuDjM1P?=
 =?us-ascii?Q?eQjd+XwrRqnCgyPflq9h0nYG3eum9h+xwr/QMP+7H6p19X4hSwrNUU+3TJ3C?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lCcjpeCQMLUyn6hymcc5maj49ZN+2Q9CStDXTiq44mPriYQNjjgmzRj11TxFwRy2aGIzMPDW2mxJHcvYxY7ClCdLdSs5Kb5R3PqzFjMunz2CTQ1b06sMDAri5/Ruyb5kd+zlHTDV/uwpACv+6lPq83L5VpdZa7ZuTQ+MtrIG3AfwYmpeDfHPXQegUz0f5On/0oCo9/nalflkYdHuI4fr2ybtxYeaOYMapF7KMuTxO/tPY/A4h6yM/eA15j87qqAWENaDf/8GVfGHq6cu31d03zNKwnl+r4uVUBLYv73GqyaV2iV6i2lO/C6cBY1GINnT+uAEwis0ph7QeHFnuFG22MBevoBL91Ys/k1FIIGZVwsLcQG5iFkPVPf6Ew+7E+zNmGmVjQtY+zAcYkNYQbqGwE6VPjNODetq7UCN+O1WdtYTjETtN1ydH7U8cfZICwqqFMzp4hsKt0bjAxfEaVHsBQTVbN/RjR9bzZZzqgA9KSKTJEqj1x9v05hy1AbSnnxzgJHxf+caKGSaL9oq0qxMNjkgqKJBk285OTmizfklGHazXie6bqZ6iI+yVT7LzqHnqB1t3VT6/1NZ+e4Z/3s7H3s2JLL5CHTXbsxkwygIqdI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c601f27-7192-4845-bf61-08ddf54e9849
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 18:26:46.8843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jpc3Aw3TUblkg95PJcx2ct4u6FdUaIGoqqS6us4kv13SCi+qVrZBCKs4ArxyKwlCy0NQYpURz4MkGk+3ZMgW5GqfBCJ2UlhwKghG+7CbQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8682
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX/ih+t9NeWWNK
 BuOLsSYiEWvbtQcbmWVmNQgjE6VGkdnhuwKu3DNU147c3bRC8QwmSeKk2YZsm6cza5xJvK6jrgi
 NDoZkcy5B09k/fSppH5h5VrxA9XfVp6b4hcDCd18IGLBOrNUGkwggXXTVIx7FGVd0dxiiLRpcno
 1PwQqk9MHaePvlGu2pTCGjtsqUDC/MbkV5L7W9dlAVOJuAVoyDo/biizakuYLq3aLIaLbz9CLOK
 VBOW6uWxRAszQ8RQk8sQRROyfmvQCC57dKfb87rW2xYMvVJrj5khNiD+PKX1xLpM97saRvwbzv+
 Yyidf8pjNEhEqxcleZdiG8q6dsRANSRZSQMWpCsRaCPW/fDSmp4RhEkAJQNhSP+B1u+6zM9XbyS
 xMOxF265
X-Proofpoint-ORIG-GUID: uKPTov3WAxHUuwbsWJk7HjggRvIa14f9
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c9abeb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rMDKDOzzwQ21BvzFM60A:9
X-Proofpoint-GUID: uKPTov3WAxHUuwbsWJk7HjggRvIa14f9

Because alloca pointers are stored internally as offsets into the
scratchmem area, they were printed as small integers.  They are
now printed as actual pointer values into kernel space.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                          | 46 ++++++++++++++++------
 test/unittest/actions/trace/tst.alloca.d   | 24 +++++++++++
 test/unittest/actions/trace/tst.alloca.r   |  1 +
 test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++
 4 files changed, 71 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/actions/trace/tst.alloca.d
 create mode 100644 test/unittest/actions/trace/tst.alloca.r
 create mode 100755 test/unittest/actions/trace/tst.alloca.r.p

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 7d542521..1f120e1d 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1687,18 +1687,42 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		align = vtype.dtdt_align;
 
 		/*
-		 * A DEREF of a REF node does not get resolved in dt_cg_node()
-		 * because the ref node already holds the pointer.  But for
-		 * alloca pointers, that will be the offset into scratchmem so
-		 * we still need to turn it into a real pointer here.
+		 * Alloca pointers are stored as an offset into scratchmem, so
+		 * they need to be converted into real pointers before we go on.
+		 * An alloca pointer value either has the ALLOCA flag set, or
+		 * the value node is a DEREF of an alloca pointer child.
+		 * If the alloca pointer is a REF or ref-by-value is requested,
+		 * we need to do bounds checking before turning the alloca
+		 * pointer into a real pointer.
+		 * If not, we should scalarize it so that the BPF verifier does
+		 * not complain.
 		 */
-		if (dnp->dn_kind == DT_NODE_OP1 &&
-		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
-		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
-			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
-						  DT_ISIMM, size);
-			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
-			not_null = 1;
+		if ((dnp->dn_flags & DT_NF_ALLOCA) ||
+		    (dnp->dn_kind == DT_NODE_OP1 &&
+		     dnp->dn_op == DT_TOK_DEREF &&
+		     (dnp->dn_flags & DT_NF_REF) &&
+		     (dnp->dn_child->dn_flags & DT_NF_ALLOCA))) {
+			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
+				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
+							  DT_ISIMM, size);
+
+				dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
+				not_null = 1;
+			} else {
+				int	reg;
+
+				dt_regset_xalloc(drp, BPF_REG_0);
+				emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_STK_DCTX));
+				if ((reg = dt_regset_alloc(drp)) == -1)
+					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DCTX_SCRATCHMEM));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_0, DMST_SCALARIZER, reg));
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DMST_SCALARIZER));
+				dt_regset_free(drp, BPF_REG_0);
+				emit(dlp,  BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, reg));
+				dt_regset_free(drp, reg);
+			}
 		}
 	}
 
diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
new file mode 100644
index 00000000..d2ff5152
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.d
@@ -0,0 +1,24 @@
+#pragma D option quiet
+
+BEGIN
+{
+	arr = (int *)alloca(5 * sizeof(int));
+	idx = 4;
+	arr[0] = 1;
+	arr[1] = 22;
+	arr[2] = 333;
+	arr[3] = 4444;
+	arr[4] = 55555;
+	trace(arr);
+	trace(" ");
+	trace(*arr);
+	trace(" ");
+	trace(arr + 2);
+	trace(" ");
+	trace(*(arr + 2));
+	trace(" ");
+	trace(arr + idx);
+	trace(" ");
+	trace(*(arr + idx));
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
new file mode 100644
index 00000000..e9bbf2f5
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r
@@ -0,0 +1 @@
+OK 1 OK 333 OK 55555
diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
new file mode 100755
index 00000000..8515861a
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r.p
@@ -0,0 +1,11 @@
+#!/usr/bin/gawk -f
+
+{
+	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
+	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
+	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
+}
+
+{
+	print;
+}
-- 
2.43.5

