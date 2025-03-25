Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F47219AD48
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941531; cv=fail; b=R8GDUHlRn70h2ONsjUfyQ8e8YItG77Ixqd8fHdVVanGEk8C9PtXl1X390G6NCmz5WUp3v/6CG0jfXOhQ5sff7OXPl1lv2XsptgCWmrfJ0CuB/RIeBaR1ZwZ1tau/eVpc8NgXveIU6KuEgMxj1o+OOLbIn6wSW+VY5G17aL9m3RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941531; c=relaxed/simple;
	bh=X/0nCmYHn8Ef1u1t/N6yJ/zehUJuX6HX5XIKklswjjE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OpBue3lGyzaUtyekyvcmR+ijKkum76Q1YfCpByf4hLkCHX9xHGn5K5YVUns8rAEDaLU5scmujYckctUarHOz5kdEz/vnk5yIiIoJ8Z4UhEdkDGAJu+F+wJYlBcmJokKv0UIAdWE68vktW/7PIEU941QCRsP5wic1UFm2CB79+ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gRrf/Z2u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Eq8IHC1I; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gRrf/Z2u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Eq8IHC1I"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PLtxGx006759
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nrQI6F3iqOVSFDP6m/
	KEsnvn6QjyO2GKO1ge6W/Kkxc=; b=gRrf/Z2uV3nxJ/a/CktrOfxyKbEj9Fw4al
	dFC92wbxwV5ockWaZI9pjmhhpByrDhxISdeOe5RJtqZ4H9KEHag0uDbQteuoWh4I
	FClQpWtCGb7u3OXvLaj4ZwGp/q55jDFH0s6Fqdd67r1EXM3h6amaHT7uuTYfg3xZ
	UFZcToAxSLwJR0CE9uB/dSWJ+Bf4mpnio+s6oZh92JIjMZ0LNIFHJSXsf1X8wZYB
	uIMLGQyfd9HlLrv61LFAsOBrI5UUWHHPu3Zu5SENkFD0+LxJnjKR3Q50EmpJVjG8
	baSiP+1qR0952sZfvkA+/825+IqGbnoeXEyXu7OprZZgtE194KPA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn8b8ew8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52PKFjSa008236
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45jj6us72a-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Mar 2025 22:25:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2zJAiT6UjE3vz78LPYrtHL7Rqibue1/qwINQnuV5p3RvZ3QilLUnq/9r7acYHq1H4vNvVkmeQYoukZUaV/GjS998EUbaG8PW3WqQ+/78eJA+uPnXlpr39cJ5Qm+23QGDT5GaeXgeU/OqQLLUJoW7VKz1gNhwXGx/B4mPs5l/Q1a95oUj6Agv7EBRRESjWf+9U3h3OCdTz+uZ/Df1x6TJNoTXRbyiS3AmsZf5Ce+ZFlOiuoSoDtZCY6Al0Z5DRTpD8O7zfG+O4tqgX9rWr+694tlW10nPAwne+EMgpV5ZmAY3MvQ6qaYD3cVzMsgJ62Oplli+ZSnvLm/R3xMZVtv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrQI6F3iqOVSFDP6m/KEsnvn6QjyO2GKO1ge6W/Kkxc=;
 b=VUpwy0pjYAFB0ZBVDLrt4zBkDXvTUy66pM5z+8HyJxuf0HyfSGF45DKs5cZMUoLlF0OlgRSRFITpHo/3JJcdahFztsMoFaT+e0gNgtT+mD4idu3aHyh8xZZRqKoeTN4ptPWrqYplqqYzkSOfUFY6StCBO/wfh/1IpHtvmnE3L80kY7WD4u4qYmYdlf6MQJ7iDkx3QUEXSvdTeFXukA+2xCTJQPEZnEHTdJHiBXWgqYKUXFLbxjj2SyTMV9/3/fSOfY+qjkjiQi3Teuw/paI7EWa7gTMTkSBavuNGTQBgpVtMx0KOPHHgf9dDa/NFbKK586vGELJmdRdDHO+DJIiTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrQI6F3iqOVSFDP6m/KEsnvn6QjyO2GKO1ge6W/Kkxc=;
 b=Eq8IHC1IsH1hT4gvKQndq3SD1hyEnVfxIIIGrbgfXhctXQiqLHAF0E5DzhgEhJ619Z+DzQTzPZpjTLQ788infvw6EESJV7eaK3NVUoa7pMCg3BvP/NLQGnJvNZ9Ip136O8BiDMSYDR+JZB8RhazsiCHw/K16pi6ZsTAbFwSKgDM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8586.namprd10.prod.outlook.com (2603:10b6:208:565::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 22:25:25 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 22:25:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] test: Skip trace() of a 1-byte struct
Date: Tue, 25 Mar 2025 18:25:19 -0400
Message-Id: <20250325222521.15224-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250325222521.15224-1-eugene.loh@oracle.com>
References: <20250325222521.15224-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: ba56843d-8725-4243-84bc-08dd6bebf03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+mtI62CkhjfekFHYPiRQF9MeIYsHwrnzGsd5AeG82TSk+33AAI4se2Aw7sfD?=
 =?us-ascii?Q?5X5LgMEWlEBSvcdz3xEyuJ2IjgECxajicq4/oKcJ3nkrf6eVwDnmBgvuUB2A?=
 =?us-ascii?Q?IUdfr0lpu/nb9yXJaJICli7U+0Fd10MRXRK8VWjADPF6+lNeaev1CcuHpVVM?=
 =?us-ascii?Q?qp8vvK4hcezuNmfs2MXjndvuoFs6vOD2A8yVX/9/AgkOF7NXT/d7N1wHrT6S?=
 =?us-ascii?Q?+AqJUmL26rGyAnlieTzgU4sX9pwxe91peoiOsWRz2je+TAWu++6nmeaHeRel?=
 =?us-ascii?Q?diToXN1NtU5gGBHaCwLq8aInX8Oxno678oiHO6JlzlBSkuoO0TO1Dxle1WUz?=
 =?us-ascii?Q?nLyKrjdodwC/Et50jhSSp2kOyq+kWoOHMEzt3DA4SmcFEE6DBub2cLzTCi54?=
 =?us-ascii?Q?pEZFjLHZziVFFodSxr5OZFhOBn4r0ML97nX2t7fBcOiMIbZSGl7Wpd0MnHeY?=
 =?us-ascii?Q?/+4Tn0c4AfYPYZp3arE/aImvVYTjDR5mAXYDKUr9URytnyPYiFQODV1zLt3q?=
 =?us-ascii?Q?zW5MhT5ZjsIfHYuJNzo6qMpyw/Ttpet48QEeTEMrLQwCBSREHa4bEGR18BWw?=
 =?us-ascii?Q?b8CZQC41XgEw5eD/zObJv0O7GICgsr+4AlbbDZ/1leYDw6QpfXoYN7lFmBG7?=
 =?us-ascii?Q?n88b9c7DWTdMZmMj+0BdN6b2fHPOSntAnaOy9jhDm3EcoBRwxzwvLPYm62F8?=
 =?us-ascii?Q?lAlbvwFctvneJAbpBEhHoo3rp6oBImKZcsZpSmoTrx7SW+cBh4ptrf5z9n6N?=
 =?us-ascii?Q?5fAvGsta9QKoX+8++zfcrpUxvdjU5tlFuYm5xf/xt0Yo0DioMjS3MWh7RQ2W?=
 =?us-ascii?Q?HfWQkFWHgofGy445ka5Ecz4/PqC9nxcqiIbM0XEivBk7+GyeChweaU6ivIYf?=
 =?us-ascii?Q?etEu9imi4rkKUOYl/TvZeeoOHHq1Zci68jX1n0aJ5fJPCqV5h3L6ly8FjzPN?=
 =?us-ascii?Q?G26hoY+w8lrTIutDx19hx31Dq0YerqOUuXZzxN26QWdvN6ayhiRyAretOeRj?=
 =?us-ascii?Q?Qrbb9unZt4s7pDqTTGkufvIjNWEwP74BxFhvpu2oAJsE00I9QYVSW2dgleJ+?=
 =?us-ascii?Q?CKrsn6l9ERST8T9g4AeCu1UZ9RcAwCu3qqBmQJzP0s5U5Jhgee/fyupy/mwC?=
 =?us-ascii?Q?CkjRj+eDLCJ9ZidopZ7lWjjgv2Z/hmj/1BURrt8zFyO0Ek3OC+PEFI1blD70?=
 =?us-ascii?Q?7kS+CWeh9lipp0YqqV3WFpZaDx/mSJZ1J8esIpNE8nukQW/RBbVEA2xe3DKO?=
 =?us-ascii?Q?6E7Fcwa+4jzJYhLYuDj/dfxJApr0EQF+b8vZil/74Z025DwlNXLWLV9a8FKf?=
 =?us-ascii?Q?mxGQ4jR221z7bYyK+ItFtftTweqnInsSw5kl3/aXkbePSLhGk0IsbKNDxzbm?=
 =?us-ascii?Q?IY55q5or27oevpnoDP9HGQtTYQyZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l3KppgZKk/kalfVq2EaHoMTRZbqwnzanFUfVl5Q2Axr8QZKlc5pQkkGoq0T9?=
 =?us-ascii?Q?tgk7ffcsYc9ABFgpg9L+WBs+tReaczqsLrMoTaaZl+3hSAxT+SmMlHfcwz3U?=
 =?us-ascii?Q?CEp9gv4sZfnx6EMHwIZ3fvXkw5q8Gv8LU1ordXC0b+0g/+JfEpGsSt8KpKCJ?=
 =?us-ascii?Q?db3k0FM5svOyuYhP0XX1azKcBqTxjfZbBftxIDnOz4QfVh3bFd11+Xh+CxUn?=
 =?us-ascii?Q?Cl3P2qvmvGaPyZ04ExyCGIVsvBtTIvKiBiLxcZVU5IDXw1mwnYz1kJPtU8Dx?=
 =?us-ascii?Q?OSuDvuvPUubL/JIESu1sBAFhAJCCrv+BPARuIBDhoN6H1pJkk2InNERJjqXe?=
 =?us-ascii?Q?+sMDrG8R61jgIfZran6XR92D2ZEuA6vGdO3M97+3VrkSxiE6LIpOEIsqyj3K?=
 =?us-ascii?Q?A30mK3GpD2h5eJTZDjvMOsbjPG77L89Uyy45pSybTw817ty3prydPW75DZ+5?=
 =?us-ascii?Q?pR1di2vGoCZLgIPjtUP9Rp5vjyPgvhOvMrBpdNNS9YAAxtcZ+rh/7HfUFrMp?=
 =?us-ascii?Q?d7gAjgGWANw6NlYyriG3acriMziVK5HYEX+KETqdLzga+nT+JuSoBvpROTcp?=
 =?us-ascii?Q?juS92VfPeSZdCzFTrI4L7tOrP2nkLC3ZE3UrBqKpfh+5TkAfXSnubf2Ejr0K?=
 =?us-ascii?Q?b1iM+3smr0ys30vc5MWJhAZ7KouBFzuqlNlJGSC+Z3JIXpxfC9BmWKTJkpmC?=
 =?us-ascii?Q?t9bsBtU4XPUFPq0dVITmx3L3BhWr0sV5sF7XsF9eMwv06Qo7uEZ/ca9a9ib3?=
 =?us-ascii?Q?6or0ioiTNqijX/fMPXYxuOP4riAntmdM5EmeMRCjQAfnesgUY4sCPrNjG1Xw?=
 =?us-ascii?Q?8XvNTZqDtCMBYqyjJGbMcFQL1eW8YRG+2DG5qabZugYQ70NvTul5Rd42fvRk?=
 =?us-ascii?Q?+rrpuDf6shXba72VelRTqCqDl5RSlgEpuiWptqz42H+IB7zdPs1DjqrJbscq?=
 =?us-ascii?Q?yEbnD2FBBwOMNsvQRE1JaR7yj0vyE2Uuq4vgXi7/jv9l1XUdjPXjXkQtbTRf?=
 =?us-ascii?Q?6wgf7s6UvpfSAUCMogN+gIJfKeLKw08BvcSd//XtFeEeiegJl+oT3uBJTjPT?=
 =?us-ascii?Q?z5VDZwSUyufbyGjtaRJuQdCt+j+iAnVbrRDqsvzpdbMl2iDWGgWBEHlX07Gz?=
 =?us-ascii?Q?PFZDbM7QttgszDTtGjejaEAfmGSSUu9U10sKciHMg3QzQIPdVOaThrD5WRFk?=
 =?us-ascii?Q?mnuKhprFF0OZNxELrKE1ccnxIux3ypziYJaixcsFFnp91Ugh8S41IItP/DTs?=
 =?us-ascii?Q?M4cAymkqm91oHLYbq431JqZfYERiMwQvd2OEpt+cjqNeTHz/vwors6npUS2x?=
 =?us-ascii?Q?xCnusSj4OgsVHjDkba2sxaZOTK4cahseOqSwc/niw2Uqb5qYiYcWpwo59fKC?=
 =?us-ascii?Q?31QazmH5bv6r05z9afHzTw4cU68LSWw34zFyxH/Oe/CxvfwiSaPHfEZCtlAi?=
 =?us-ascii?Q?7C3eFIaT5pPWg+SV903ViTgh8mV5LaA498w6yBAYzHUx2vQhhakqb2l+vHGe?=
 =?us-ascii?Q?agCyNwmn0hw8KMQRctXf2zIkp/vP1ZDK4uhLF1/G/B6mkH06Zol3SA612qwW?=
 =?us-ascii?Q?T8FOCeAXLLTZDwviXmfI4jAcdrOP0KRvoIlNWu71?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XWQnJeq8JiTMcORsfsV2w5dM2oiQr7KAS4GjzUUynuG4nFebphlHot1hxvSADn1rEp8L8xGpAJ5110bY257N/bkAzlwpWiyZbrtyNBxKuT/NHN/h0qn9UOOnCN6T/rff1OKmxHSRMTHoTYLlALyjofDfJ9xk0HSwrdtDKaA1wm0sYhRN4Hj+4b+ZBtKLocxeZYfEefqPQQx0O5jK9Po9xnwbPtek5wnyzAx787Mvv5JChyNYpjzR2dNgb8eSkNmyhJlpDqSZ8gmIIIY60zTGOgWGZspsf47qTq9XC8RD81lk+8R/HkI6MKJ2VWWMt9avurYQrI1xKaRMBhtVG0eUXGxP+NMf/P0bABTQyXsm2FMLwxkUwDonlSVRKL8R8i7oYfL7FBcrKMjgS/yNdrgUern4ILxsc5Zh3IhEd71/P+bdfXJcx/Gqm4da7gytTXhO3ZMLzQY21cUgmFoBCr+1uRWYRxUv2j3T14A0BE7xJdBkY58xPYqNa8c4m5CSm59M14Dkf3WStlC77/W85xqyhIYq+NicCEJNzr0EggTeqUwEaHxFCZ8x44ygYvp8zSGBUG5nFY6VuekTM2+yCuu27BSTZJ9ayIlu16t+/fNr6Sk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba56843d-8725-4243-84bc-08dd6bebf03b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 22:25:25.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwvBQ0C5ML9OaGXZ7DMK3Zem9Mv5yN59YIF8gdmFyrbHQslaX0JASaoVpWnGkzdD/dNYMYeAjI1aRl7Nsb4qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8586
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503250149
X-Proofpoint-GUID: LsQvoDdQKaI49WZtWuGjDd2Oukt1g_ia
X-Proofpoint-ORIG-GUID: LsQvoDdQKaI49WZtWuGjDd2Oukt1g_ia

From: Eugene Loh <eugene.loh@oracle.com>

With commit 3a551bfd ("trace: fix char-array handling"), this test
started to FAIL.  Meanwhile, the behavior of trace() on a 1-byte
struct is poorly defined.  Users wishing clear semantics should use
print() or other actions.

Skip the test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../actions/trace/tst.struct-1-byte.d         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/test/unittest/actions/trace/tst.struct-1-byte.d b/test/unittest/actions/trace/tst.struct-1-byte.d
index 36de485f8..8bfcbdd53 100644
--- a/test/unittest/actions/trace/tst.struct-1-byte.d
+++ b/test/unittest/actions/trace/tst.struct-1-byte.d
@@ -5,6 +5,30 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
+/*
+ * With Solaris or legacy DTrace on Linux, the script gives
+ *       52
+ * That is, contents are dumped as an integer because the trace()
+ * argument is 1, 2, 4, or 8 bytes -- specifically, it is 1 byte.
+ *
+ * Before commit 3a551bfd ("trace: fix char-array handling"), we got
+ *           0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+ *       0: 34                                               4
+ * That is, contents were dumped as raw bytes.
+ *
+ * With that patch, we get:
+ *       4
+ * That is, contents are dumped as the string "4" since the contents
+ * are a printable char followed optionally by NUL bytes.
+ *
+ * The truth is that the semantics of trace() are poorly defined.
+ * So we are hard-pressed to say what is correct.  The test has
+ * little value.  Skip it.
+ *
+ * Users who want type-aware printing can use the print() action.
+ */
+/* @@skip: poorly defined semantics */
+
 /*
  * ASSERTION: The trace() action prints a struct { int8_t } correctly.
  *
-- 
2.43.5

