Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC4148838
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908967; cv=fail; b=VYKCOZqKMpMGq3eg2PsyjgwbQA3LLkXLs3PggiISFRYyuhZyKeTFIzVNOkC+lPIg99z2Dcip4JZQ9smOETn0V8S0wSUb+AM0sXb+B4JpwbhOL/I1L2j5iWcnQVtWicFuPlp//G3OicyIYbZo15sMTmUW9XEOUKq5uCjswmIt5YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908967; c=relaxed/simple;
	bh=GvGrtMYfttbqEn4hOwAexRjZV1i12RZ/Co2XZq+uEy8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aFSo7+Z28xW5CaT5YoG4AhKqRRRXTJcBFWadyMlG527sUkRWnQX9YFXgzsPyXKbfJJ9Ol1qHUa/T8AjOF7tTESMpmXcW/d9ko/tIiYROib5WkfdoFXs4VwRG+NKLLHs3Jy1m7fJMFKCWBRzRaSxZHooDV1srVLH++FZ3k74Rc9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gLmTee45; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iCzvLnon; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gLmTee45";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iCzvLnon"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fXEH032616
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=/RwiZ4mHTbFvR9
	qgfVoQ8GV/YCkw/Ft616oEJ1nIFT4=; b=gLmTee45KlzRl1n/WzPVm8KVFM2Vvv
	a9epFMMkc31lqVdKkO9Jh8Z05Y3BNovjjIYWEBkV1Ny15tdd8fz0c3MCCZjHD7zM
	QSd9H5yWGqq4hYqEc+XExUs7nJBs8Dn7sWqjAT19vV3poWjx5QMKjGqxzLhDR8Hr
	eU928c6Pbs+D4zFgzku+A+KjYZKZX3dl7q+W/5qfmjplQ0Tk6axacrFD4BSOMOV5
	WdR7GS6ApzRS+ebyCmcDG1DbU6lb+YWJszykfogmbMEBXZ/VNekFIWxF7TGAw8Dm
	pboYJ7U1E15xR/8BlPFSTT3mrm2nCaVeiFhjYVrbEtLl75/AnNpr8Rew==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4W33g036604
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrp9b-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2IIj/HO5qi05XW6A2Mg8G3j9OMeRjmTxFR124Dhr4m+BsK6z4woNNYpDknIJKsEck17WaJKjT6uERhirRY3437Q2WCHnt2Qz7Tz9wtN6psK4dtJGfMpmYYWcWrlHeMMcknx0V31Ze/f/B94s6ajibUSmkVZNP06EEFj+JriM0JjLDZ4kxWz+fIGMmn3jkS2sXb/TzJYfFP9ul8Yy3LY9AClTU0onkFz4R4WN+2D2J5cCglfHEUfoGazAeqWfaKNM8+OIUURYcjh877wXgQ+y3tsNKt/KaxtPGFs+IU/BrnvdNjODQNpx5+IN1zx956Gqyh/9GhGxy7RQHNH6ldCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RwiZ4mHTbFvR9qgfVoQ8GV/YCkw/Ft616oEJ1nIFT4=;
 b=d+p9mBDOQNsiYJgT0LJlF1/cOGC+oVma0yKiVgI77oTbdXnXtAARqhB8oFAh96NDu6K4hu4kUUeTFCUF+Adyonj7od1cUcCKjTUjdqfZs64WZqbw7t1rjakaH/lV43gW5Gxqbw4R7+LKWW68xIdCylx/kLjzX75Ewpl0/gddocnat3kMEu2HcX6QzuQnc4YcOWHtQ5d8d1TScavA6RUYoi44+KPyf6dkR698jTGnz2n8CiGNM9R82BDdSL0rRDgerZkNnM7OKtoW5BPD8yVoimSr6AwTNiraqX5TSI30qLiDrx5XeL2BTtH5Cac4lrs5fy7Ky8F0Lbf9ytnQI1bleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RwiZ4mHTbFvR9qgfVoQ8GV/YCkw/Ft616oEJ1nIFT4=;
 b=iCzvLnon7eG5ML45AS0A1fcgqcnKsIDjtL1nzl0szhgvfDJvFiLFxO3+Gi1zmNFdwL8e6Vw96eE0oL+sCL02vxc9mPgqhzvCUIi5mnHpd4/JY+hWt9GhK0hHcw/AClWMAExl5wGVaNtScfdf7NyDNJ29mVfU6hDgUYcUfzO771c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/22] DTPPT_POST_OFFSETS is unused
Date: Thu, 29 Aug 2024 01:22:08 -0400
Message-Id: <20240829052219.3234-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:208:15e::43) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3267ac-6efa-4481-3590-08dcc7ea9a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GYVKSMvZwD5Rwwx2QXXp+AIrsOAMCGraI7XGynxCkKPRqocxDdNz7EV6G9xY?=
 =?us-ascii?Q?Im9n6PAB863oC+/p/l4i61qyexKUbbE3JtEhRBW2RU7MkEb7p1tZGA0co+5v?=
 =?us-ascii?Q?7up3XHANLQxiGpPFHwU0t/KDfjTnetGF3B8Gyff9IRdnrfNDTJIWw6rOaY9t?=
 =?us-ascii?Q?aknEYT3EbBXQPuR87r4UJ+9+0DU9OD+mcW4CKeiVFLdBiLxSWOZcMHj0Ua/4?=
 =?us-ascii?Q?/UpWAeKrrUqDvs0dbPM4WJEZ13Em8vrqa+I8pbi0glxp2W1QK+s5ge5jfZYA?=
 =?us-ascii?Q?CVIxTMRCrV7Ui7XFgzAaPxHiRHXU4Wv73Ho0jBEq3XELjf9ivxInKFqZWBEm?=
 =?us-ascii?Q?gUe+nrZdSoMgPAMdkee+xVHdTY6J2wxrQZ0gLc/IYy2NGW3om81tkKT/16C3?=
 =?us-ascii?Q?vjduaKfOd7x61IxggoAoA72ntmKn4ZoGsNJF+wHtW6TaybUo9t6cJ31J8UtQ?=
 =?us-ascii?Q?14fy4e5UN2LB1elSQ5uEy0oEsORpPn1PL72WXFtZq8fTVHQtjDfS/4GUK9r7?=
 =?us-ascii?Q?j3ZickWND03ADlDJraqJPIQ2iJXvqrOIBSg8KACEZjyZG6Is4wh+mvAxY/W0?=
 =?us-ascii?Q?f+1b5OvY/1sXv2AUsJzDtfrOhJcqcuDp4W3y5tCU/LwC2sFB20itmZVoKrRn?=
 =?us-ascii?Q?UXtBKyD+PW6jDvQxITSN+5zdBGAzsn0t5EfRJM5TlNMWf30wdjJK+dHxQUIQ?=
 =?us-ascii?Q?SxG64po1XTfCI+crD3izf2vfFCco493GM3AdCjh+Sa46dkbN3QNOtg0NtHdQ?=
 =?us-ascii?Q?vpP34TWtKRcNNTjc2lIJ37Iq+W4alp5CQWD7CZdn8tEa32/hxTyYqfCmUiR3?=
 =?us-ascii?Q?TSJF1KU61IT4OU6c5BJHbLkg2VyX2Cqkp5Jc/dnOp1R9fU5ZQOffaVUUJ+ov?=
 =?us-ascii?Q?z9XskmhW/ULVAou0dIaLEwc3EHWA+rOgqMKh0U4zXFVQ4PP/UYH3Q+TB9vQR?=
 =?us-ascii?Q?rXA3+2uNqvXx4Z2nL01zR30Sn//xKETqBGu2A19lXxmIz8d5s+Yq0nqecT/X?=
 =?us-ascii?Q?yvZjjJvDW3W7+rUP0cOOUPM26yFAqqG1YjU2GbyOiaCaB5Q79aGxa+uBTWdo?=
 =?us-ascii?Q?hmzT1LdExdtlyYJFpx72gW9GqvfW9PNitRE90zMsNMlLxuuuD4AquA532kPY?=
 =?us-ascii?Q?zqhDB1uXeFPxCb13k6ka1y2hBx4IC2UI2us9hzwbTpe27gTMLyPtgqCcaJpc?=
 =?us-ascii?Q?Jc+Jn5JzFAWYyQn6d7+HFk1dNOlibvfWEEu75tZXGlt9zkUZigTiyjb6MhJ8?=
 =?us-ascii?Q?8ctAPazygSbonEvsBjXY8AHUx4MswLp+d6+/j/M0HxJGIXy1zTXOjzE/RcSg?=
 =?us-ascii?Q?S34BFy6On4O0rCRrzJZ2sp3oapC3gvichEK8PYv/PugRLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fim/S+0lQ7YvZWwgQokTyhKQ3AsDGEInlFukYkxhN4tmeSnvKunTZf9wo6Ye?=
 =?us-ascii?Q?HmoMzK00ORyZTwTG09Zd+A9MT6S2hNn+A3m8Y4YGUkZInxZV9F5DblIjpwtu?=
 =?us-ascii?Q?ST4s0MU6Z+MhMTQ0wlAK7ihppWMU6Uruk2aPtUv3/1buuh1inwfrX3321Lje?=
 =?us-ascii?Q?0lFHDDLy39cBzYCls8nTpqdkarj38kil45NYYESG0ZoJqnpQLociSWRfAGIu?=
 =?us-ascii?Q?Ma0p5ZPwwEP/Iavp4U4zlorRBhW5ZUYyOuPk9XR/r6qTmpOmxPmUBjO7d5Az?=
 =?us-ascii?Q?/ipCKBxXZ0Q27tIWRfr+IVJojITR/LFver+t++wnx0sfKqJPk/irBDFj0+VK?=
 =?us-ascii?Q?d6l8iaRVBasrzBdzEnlglnFXLci3jfozxo4L6f1tEaPjlhxAh7ftWjeBMK/Z?=
 =?us-ascii?Q?4NIdobOMMH250GJG9DguJvoxcmM5sWjhu0bzYL2ZmVU0+dG3f4XcxjBXf/QA?=
 =?us-ascii?Q?IAfr9G4n+YxODkAdnemxeM9rpXx4MEdqNIQhgtCBk1OHQP4BziqsGAuTFyeh?=
 =?us-ascii?Q?mIt7du+xjWC9hqYB5Naqunwb0UwLKADJXmto4LRX0kSpRTVUJmCPTOKhCWJf?=
 =?us-ascii?Q?6fEMR1CfqUDX4gkTjaZdpUWB/YzOiz4hSbB+c4e8VixFaZogdKnkrhEvwvQQ?=
 =?us-ascii?Q?J51HZfeUBlsu0xwSg9oPHZaOxUvPhmrdTbWVtcGX0BuUUBDoPK9V/tDl4rbz?=
 =?us-ascii?Q?v97yMIc4p9JvdkcwjZTM0VF4u+3hZ6qfdAHoJPS2IRsrA1MSiF6aqHJQ7v1P?=
 =?us-ascii?Q?q4/ZfTIZOO7NX5nIC0+qjwkPU+Qdh7J8x9d2RsVQR+5sP2pshxPg5jyrXbHb?=
 =?us-ascii?Q?eeJY22bbbzlb6oWqfS9xfu8mC7XgRLX7YFOLR56ursrP+KZNFE2KmMlfabhf?=
 =?us-ascii?Q?pPksnd7ylR+o55tn7vEKzslxuiXElYuVGC4XOyTEGVX4wSA5NZ7PVk8wPJ17?=
 =?us-ascii?Q?xfMHif7vCaE0tDYQlrBQ9jROy6gqq/aGdFz6gZ78UkgcEjP9cLVcU4uPrBEm?=
 =?us-ascii?Q?DG0AtKRvVbBQRheIeOD3FyAVcCyVNmADHFnyrF9/6RNd+TEjVaYPr1Qbc07f?=
 =?us-ascii?Q?Y3nbBrWCWoRUDyhsxD81wwMc2/h9AFip1KcLNVcDa3IKeQ1KdJrNZqYAWLru?=
 =?us-ascii?Q?qFGsWyEQh7e6z/LorHiimGddA307VzE+QlGvJ1wq6tmcwurZmH3yU0EvcDds?=
 =?us-ascii?Q?NWolr8nT8zaHrC9kBinAYfyTkYsxCC4Bz7q2AOhs8Cxdgmip5JPcKvIjQo6j?=
 =?us-ascii?Q?w1+rCmGe+aksBlIF8OFOAxEQEBKs5OEGob4g7gSLHrNG12CNS9edoLNIMYoU?=
 =?us-ascii?Q?pSRAo/nNbJwE7efzLyJE8YVv3ljGXRZi83XqUklTReTN7CHHltChGz0JSMLS?=
 =?us-ascii?Q?PKGfJuvvxSykd7xdofcoO7krdg3x+XKQI832qBpz7gDzG3/1p0M/Ccl7xpCG?=
 =?us-ascii?Q?xId5Hg9iw42FdaCXnp6ZlezNuvpx09PJioPEq5tJ9cTkN+UYP8xfkdTyPM1O?=
 =?us-ascii?Q?NAr2V5V/XvkfnRQ2RBXA+/9mQgbAcpAlHtjDYMbH0v18Lr+XMtHPNmXLI6b3?=
 =?us-ascii?Q?OUWLmaZdA3EvtqfpIFT+kjm1tKwMoJuwV07rIcMS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kMaUt84pbuEp0Kv+4GQfzZkcHLkBUTpwNaQofk1Njjg8Hn8I2jyn13GCgZ4++lBCXoP3Ra7GY/pugaSbj74E0GnHUu0LPfGOEeTCxVkIyfZZHNyjP3K7bFUltlUe+l/+Y4I8YdNoPdOhboBlea6aygLnjwvt1OHGL4OFhB5eu4iinufWkpH13KYQT6JJ85jiYL0QD72cDyogix5OxMeUMMY5ZV/oRRY6rjx1TKR/RReF+MXEPjR5Vtk70Mul+wo5eSFyoN1f0t1wQliwLw798B1NSTwv/mu3RotndyGUztFKAtV/uAwmL2lhKZMfnePVRzs48PLy3t2KYNjlTxGllivUZNAR4Q8vToeoE/h5j8LeVh7FLxh50pMzOQMIW8chnDLeU3DR7QlpkdpnNoUgAVo3UFH5LEwa1T/qA+eRUGgsu7ECGaW+8co9lMoXZK+GHwyUPd8+hXSNaSJwDVaK19LxDsx4DPorBiydrHu3cZKD+yA8RwkqZeKhtAmtMRz7i0G0NaYQr1PvkdxkEiO150oi10lJ1VjwSIclyC7b5hue9zuPL/2rkVTLjQIgECjWj1nVWHGD7Y57o8BApweUdNR/ypyJ8Q4fbeHWaOt256s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3267ac-6efa-4481-3590-08dcc7ea9a3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:40.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SdMmhDywUuJ4tWj75vEJKH/L12x3yXRHpYKx8nSkIZennNsw91CkFZT9XXesnaI/AduhZgxILpaD46RSZH/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 7jIuYG80ZdNkDFOtX1sb4H0dazvVfQka
X-Proofpoint-GUID: 7jIuYG80ZdNkDFOtX1sb4H0dazvVfQka

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 1fd594b6..0129674a 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -22,7 +22,6 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
-	DTPPT_POST_OFFSETS,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
-- 
2.43.5

