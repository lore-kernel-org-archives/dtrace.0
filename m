Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34852F7ADB
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758125306; cv=fail; b=QhTs4nJzI1vgAdAmyK6QG6F+0mQ9dkSjC8Z+9U7YDgK/oLWVCFUv0qRyp8G8fhwVIX/fgkkfYF22+0gF5mgm7/kgHxw1c2bu7WXxlkzCJo4wkEqkecC+uwonn3O9kuFxdNl8C7F0SZtNOYcSv8SUvYAGHe8Y+3sjgbAVLb9l2kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758125306; c=relaxed/simple;
	bh=IPFvLeX6OM+0i1I2EvaW2UE1rtIdcdSKGwoua9MyXiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NFCeupbESRu6erlDsjn0vuMrcuf5LNkXIXoJt6gRUWUoyKbqcFZg9Vl2myuR+LnUvVVPtnrLmW26S3EwUCqqfC2tHIfy27M2lTSDClwRYdjxzCsXVMKwPiJybQoxiRTV8WBh2daRELapb6nfhsqkwlcfWGA4zmYQj42ev/mrr48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=km3m5Z5G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J9Jgbqe6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="km3m5Z5G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J9Jgbqe6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HEITRr008281
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 16:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=g7fHV5WKDfNa73egCo
	bBEH4pg9W8M8XscYr98b6pinc=; b=km3m5Z5GCWLpLgtt2sRMetJAzxvKr8Q3y7
	gPBPmWGNctlnfsqbkyA2R7UNm1aKW7zDBEIvO/TZH8Zl8dISPMFvjZxvyKbpwMR3
	B9B6BemhrCp6MiSIUhp3y+toHV7qKJD7w7U3YasG6bAVtVvFfY0cG2xgqD9K1K99
	AWpMcbA2GdnKn+t2DODP4DBVHMZhGFM4aWemFUt/0OQtT+kvGHvGCJN9QlQuaVL8
	IaaIGmxNu80bnh0mgvWC99nITirawwFYGETpXl1zppBL/k25uAhD6yD8NX012kjP
	TQaW46JEAcaKtY8iUX1MQrnDewEW7FETmIkfgP/fcGLo1vTq9PEw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8hk4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 16:08:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58HF69ZJ028754
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 16:08:22 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2dy0gn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 16:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6IYMihB4Pxonb8wjnRE+xRX8uYuXU7tYL/8zqPdGrQ1vAeFAtUzGW3kJgWb3tgl07HfGEBwGP8XoBEQotZUVVHs7YMXJgQIRGm6ZUYv1MyzgLVPKLMZ9tybP8VGgAkAFWDfd/2XwR/PqjsKNX6P4epHQ3dPzX+nMcJuJtA8esaNAc1FFfu8D6mF3p+VorQz/5+KnVQfed5BjQYGMMQQwX74tSaOauYuWi7w1HrXvSjAfs2XCtGV6DnRbTSTIh+E7JPJVzFY4+A1gFUrIihPFtwH7G5bSLMAXao9dmg/1vy890lup2l3ZYzKlHxlxjvLoZGJsue3LS5kd2GZW8NJ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7fHV5WKDfNa73egCobBEH4pg9W8M8XscYr98b6pinc=;
 b=GWmxp/HAVss9OvKrfLYLYZPx8AyWTB21McSQ4wvrZZbwzGO3LLOZNiz119YcnKTyET6KlV83dRYzJXBDTLVsAhMgZcZ1qcenpRQBb2BFqZk8OkJSiVRYSCeEcSJHAsYw+5dHBonIBX4lNwFSeWtECpcYKW4+9/XgrSMvJD7rKIXQMcqg6Ex1ggelP2Qg9kxbchNbR5GoQcVdxGA+wuMZt3K0Lh+QEyXUULZpB0mH1dXDspx/ayLKxnbQR8Dqjn1nudblaDCSbRlnPoGlC0CeN9eDhjETLfdXML6ZcmPv4Zd2VasEec0ZSZky4AqqkELDidcGyvS+9YYR4MtWh9ggxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7fHV5WKDfNa73egCobBEH4pg9W8M8XscYr98b6pinc=;
 b=J9Jgbqe6tin/hD5NP6nxRNM+vfS9iC3S/OMnInSthitZwAfOvLVR2cVFb09bofZUORzGS+uNErvwPpwiwIa9ggtutOUosLOM7uB0vXScFvqDwik+YdpLOj4pUw6VHRcaxgDWbWO3apFenoDZzrEX38Ldu+kYQW1fWRpssiTur8E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB7315.namprd10.prod.outlook.com (2603:10b6:930:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:08:19 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 16:08:18 +0000
Date: Wed, 17 Sep 2025 12:08:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] enum: support declarations with a trailing comma
Message-ID: <aMrc7rrk7jxfyRr+@oracle.com>
References: <20250903145104.856314-1-alan.maguire@oracle.com>
 <aMnMgPzLHyRtDS7l@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMnMgPzLHyRtDS7l@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9fd9e5-5ee5-496f-d5d0-08ddf6046a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Wke93uCUuJSRMCcZ21VqZzWtWqVMmhyzw2k3l4yl355tDiaVVGJmxS3Ev96?=
 =?us-ascii?Q?gKQfHHhtsko1c7giE1A60isz2qAZ2QvVex1Xf4HSrziG7YqrxikOZgfKi84F?=
 =?us-ascii?Q?nNiKokStBfnw9fHWvGpUN6IzZO84R3wFwThswpafXSQiwUjvczTcYdkVWqSX?=
 =?us-ascii?Q?XrfgmONLsgAPllb9G3BX4d6DDo8MwBiRQN5dgUXC1xSGOX7CC66YFQRiXsKO?=
 =?us-ascii?Q?prF7+4CP8pgXCwh6HLIVVieddzzvNNVvFG6dV3/DE9OHk7ymkEwYYD9BS0Zq?=
 =?us-ascii?Q?GXq4OtLej9Eog/QPtkI6r7of3Ngl2iPQ0Qf4LAXAUbE/fgelbKgB5KaAiAvA?=
 =?us-ascii?Q?Jl4jc5Xwt8QWqgVMxZPQg0BklP1Tc33DAFYOZhCMts+4XRhcI9oZgViAvQJy?=
 =?us-ascii?Q?KCHqSo6D4GFh42NZ7Y+rkLDCiaUXk26OiyPHl4cf/JJf4qhkdPuDveTsbD9M?=
 =?us-ascii?Q?zWnbSVBFjkzRgkylC7ks4bqxcQGxFSVOP+hWF29uB2Wl6sAS+iymY30ObLOD?=
 =?us-ascii?Q?sBXkdYO7JSO1MxKA7Ahe1gJZA8gQveR9VSvx5S3CBV3WWMdCasWCywGvCFHq?=
 =?us-ascii?Q?whOtpftfxzb/6OMFSl76Z7Ea28Mvk2YOLeKiIr1IGHN3mxpSHOACULwSmyvh?=
 =?us-ascii?Q?S/nOQk8iWjsThFMwEIjQ6oZ4+SFPvwhcbM6lCJFvoNyPOcotL35WYYjhIWAz?=
 =?us-ascii?Q?mtJ+1dDoLNG6ArOsTZUk+h04LvjnQMvsLpHdEOvJHzzCvREU9afx7FSaS+tt?=
 =?us-ascii?Q?jz5O+r5mQRP3upkjWm3eeTLQA9+RP3abUVAS3GHtw++Gty0kIbfa7XLsfwiy?=
 =?us-ascii?Q?qAv53rrO6aQXcZFbH5Vdb9KywdGPOyO5QOAmMeGk7ScvcBp5FYAOHNTrAbP9?=
 =?us-ascii?Q?Bl1zx8uan7TNXzN5a/h6Jyx9TfE1OBnyCJWHYr5pccblCDjhQVVhJXhv8NOy?=
 =?us-ascii?Q?oFhJYSneoGiUQriWSnw/1e+UTooQb/9rNed3KjC0691ANN5a5P3q+cQ7ZEwL?=
 =?us-ascii?Q?qcYO23WxSet8RlnEYNqUmkyjlmZKdbPUInu06MfKNXYwCYwlqyYYpPP3ZAOj?=
 =?us-ascii?Q?YeroFoMvKxu8sgNDm+NQZDb6YLJPz4z2RfV7i/cPm2Rj0xTOem88CmL+n07T?=
 =?us-ascii?Q?eSmZYzL27Mqgdp3evQU++l/5PEugfH92YaF2g4vn5fxZudMPdxff3niXPmjR?=
 =?us-ascii?Q?AB3Ws9hICkHiQEPYWYFdOYthwJlvL+NJLmgS2G4n0H86DaE7ikrG+X6V7gnT?=
 =?us-ascii?Q?nL/FXqkrSDOVj4LUVaKXloVu9MZHlduuvnrfijPxw5tVtFfUzaPYQyg2W2gM?=
 =?us-ascii?Q?ZiiZGarleyPIZlJFyUJ5qSopLnZFfIW1gmG7CoKTmGuRDj5Rgwp+TfBEtWdy?=
 =?us-ascii?Q?PGH5AJ/13WolIUI5FqS+T0Pr41gfTDLLnuiQ4fF90ltIu8/nbkGV5mP5dARa?=
 =?us-ascii?Q?+mz0DKJsYqA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w9KhftyClVCGfMkQ/8zT0r1dz0yteOMnJrXu3kBAQxQIn+GmoRdoq66rDXtB?=
 =?us-ascii?Q?PEiQvX/6YL8bLjAPK+tDBnffUHR/SFqkyFnqNHD6LU0C/pMHRRMnwDa672WR?=
 =?us-ascii?Q?tWHsAB0QDgtZs0GJa3fOVeLPpsoZvvAyqhBmMdUHvmtgMdPdh+tfgFGLnYh6?=
 =?us-ascii?Q?EP0LWjSc+pNFWU4nKN1NWGx8es1PLJQtUqZieApCFzRc1f+FgzxU97C/R9eM?=
 =?us-ascii?Q?T/Q3ulxUGwKBjJuq//vb1f15gCahoJL+vcWjF4pckkEgwX20Qj0Qu/0i9BNl?=
 =?us-ascii?Q?lOesWRugNN5HkLPVGn+LJc0flbKj6uu9gOJZnU00IUjV731tmIps0jrEL4ZI?=
 =?us-ascii?Q?m/P0NLL68nDAe3JNKxJQHZEtRQrOwu56T4Z2kaNlNOKFZ2pi9LsR1S18+Chb?=
 =?us-ascii?Q?ysHDs1n60wVP0fuSNvTOyXQikHfcLP/M+KcWmuVlgWJh1UAQyjGUPYJp9DtF?=
 =?us-ascii?Q?JWX2Wh0gsT312nK129QSqYCiwJuYuX+JbM9oZA3wFkRKtemFQlFiQp/960RQ?=
 =?us-ascii?Q?zsLiMvSorA6QGUWau1pc4GDPBHqIISXDsfonOdMUM7sLRzQyHMi6G2T3CspW?=
 =?us-ascii?Q?6ij0D1HHxrw5CE1yhDULx8szu6W8XKGJKFnNz+8C7DdE+jeWaoOJxsBWs4Zu?=
 =?us-ascii?Q?RfcO1NVMXRRwxYxfLFrCgv2KJloZ0s08wW1hSZou67MFZj8Tkk6VYZa3k7+8?=
 =?us-ascii?Q?Ph6YGPxt7c1Y/PaeE0Ls+DkgaL2FZwxWS8UfjdvGO9k845CShUgtkg/4O3Q7?=
 =?us-ascii?Q?0SgYaDFM7OWFzGxEp9Ax9HA/kzi8PfH5mYAl2LjMjWvGuhIqNyVTXm77XMgS?=
 =?us-ascii?Q?g7pZOn7ok+JCPiewVKx6mKG5yeBjk0H/galFz23ifIjzSfwXE923K/vHbGJO?=
 =?us-ascii?Q?h1WSxi8HeH++gLv7bm1gv7WbggQCOSxUNpqTUK7QUHNmUze2jI21TEGxg65T?=
 =?us-ascii?Q?tQtssFP4BISHDdFqklQ/9R+KQzYFAjPuZyxxLjzoIb9KmePEULJmV/hgyEJq?=
 =?us-ascii?Q?S4u4P040jUAjHH14GGos3WjgDZ/2QMVS0D99jhVlWF89mj5CehdmpxIxkRE+?=
 =?us-ascii?Q?6DWbwU9WadJ7PGJg7w3w8I9T1/niD9RAdMFNGaBDkHdaNl6fghNT9QHKksuh?=
 =?us-ascii?Q?+lDPm/rWazGE2Q8Qz1axNnZheeQ+d1JYhU2mCLM0/uQd+jg67tz1VOXBpiHE?=
 =?us-ascii?Q?kBjU9c8eWj6CWGG/5GAveDF3aHcfTffsUqkcSUsOD/oa/rz2XR/dXr4x6Tuy?=
 =?us-ascii?Q?otwbRccXZM6KdhvrndPJ4pjR40VPTtEtGT05PLwkir0lWWYxz7onl7m8aHl3?=
 =?us-ascii?Q?/GQY4jWqLRssd/E/31iKyb9Xjn61+3cHBcsk/WFW/qdudwGMy2cfih1XQuxg?=
 =?us-ascii?Q?E1tSJtEVcsZyjp2NhHLvM8n4n5SDhi7yiXHV+1pemtXuIqX1IZDoPI/qdpzh?=
 =?us-ascii?Q?lwg5XUpzckGaL+VKkUWN6f/yyrcoIAk+j2khnuoMgRP4WNeYkDkAhWTYZfpB?=
 =?us-ascii?Q?UlB2X8of6h73oUCkacSwNRcCXmW1MHksXQlrTiUfFc5ZolW3Cku9mq0mqlto?=
 =?us-ascii?Q?SLiswmWGZ/aqozRDh/lO7L1miUj2FzX/fJ0j36670H7OZVMB1yG+0XEKS2Lk?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mbBcANayL11F6J6A8QTPC8ck80T1rtuI2+RhbjGY6SXeu/UQ/ZRKfzfvF+rPBG+589B2GfrnwlACnp/spMRVia1DYIB631buzuGDt6RRyx0w29XwjeoUrNzg+sRzeYvKJOxYji6l/ezygBWmAjPTbfbvOwRbCmqkyxCZS1OznRI1eBiVcsrWSBRQrbtwPrFxeOgk1UGTxupNUn0O64lezFyRxM9KarWZZGaHc4h5OiuP319rAaRI5/9So4mL3LqLu3bhtwCRy2NHgmfoOze8qfu4ei9mdx3NCn8j6ltGiufijOyzkbVIhc38TD4C4z+iIn9YJTEwOMSTwTwa2mVn8WZb8Zas9YLWTasXe/7MGwHPV7WdqOS/05RHI38S0vXbM4AoVnzI/sff6fJqj/Y0tsTXXsI6gDZ3+2aukC9KxSYVnUlpo9TxCLgaXygt7DPTuTF2OHWpproNBiVRMK4hfvwXcqsGPSK/7x7KIRWRzCdTCpxLWT1JbCzNVu8YcQ4AVlfH+79j8XkbbjyQlZpswCLDVaaNHVXR+6RYkE/00UswEr6BJMWmPBpYAZufwBMxUmqWk7Y+2C1Y0wTU9tGMXnqAzJG5/spt+tns+kxtFUg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9fd9e5-5ee5-496f-d5d0-08ddf6046a51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:08:18.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LbFdAXRVox2j/j4pWQn/yufC07jvfvH7Yi9p4C7W9nIsZeuxkJ2LJ+McIJMQuhw8sr4PSMIDH93q9T0GFACNmtmep0H1vk4+Zf3hUoecKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7315
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509170157
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68cadcf7 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=L3HB46Kc1pPzPmWEsNcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: RvVLRX2EW6Tps5fpDj33wDwHacaGqXSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2e+EBxiuRMuY
 fqh6FmAcbW7t3eQkG/U2jNQ6pMyNaipe+kJqbpQMBsnO8KFRiST0UVpaC6CG9SE/2qgtY9RUYCx
 aViakFYRTAylptYKisTZIW7FbmD2r6LqfDwdAm7CsOAy0w4nBboeqEurR9yX7ynINyva3ydoljb
 8L6aELX+np6E/Wu/L/BiCfJTCW7607Q+st02l7Q3+dOrrEZrWC53qbFoYFS3pxJgUAY1CSoILiz
 EmjgocMmYcgyzutwNEy7icZDnEE6iXvKoTBV+QuqiPgJbEixKjKs7hjDQdvSzAZcvZKIquP8TuG
 pmmq6PTfY9zuiyqVw8pV6C6WQSTMQobeynSA+dSoApnoUhvn02HrQJ9Id2bCCAoswf5lwlMngtR
 +Bc4iiCa
X-Proofpoint-GUID: RvVLRX2EW6Tps5fpDj33wDwHacaGqXSM

On Tue, Sep 16, 2025 at 04:45:52PM -0400, Kris Van Hees wrote:
> Nice patch.  But I think it should also have an error test that verifies that
> having a missing enumerator (i.e. have ,, in the enumeration list) is indeed
> still an error.

Also, it seems to be triggering a failure on OL10.  We suspect it may be a
bison bug, but it needs further investigation (Nick will take a look).

> On Wed, Sep 03, 2025 at 03:51:04PM +0100, Alan Maguire wrote:
> > When doing python tracing, it was recently observed that #include'ing
> > a file with enum declarations with trailing commas fails; this is
> > due to the D grammar being strict about the last enumerator value
> > not having a trailing comma.  So
> > 
> > typedef enum foo {
> > 	BAR,
> > 	BAZ
> > };
> > 
> > is permitted, but
> > 
> > typdef enum foo {
> > 	BAR,
> > 	BAZ,
> > };
> > 
> > is not.  The latter pattern is used quite frequently in #include
> > files, especially where conditional compilation of some enum
> > values is done.
> > 
> > Relax this constraint and add a test to validate that D compilation
> > succeeds with the trailing comma in an enum declaration.
> > 
> > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > ---
> >  libdtrace/dt_grammar.y                     |  3 +-
> >  test/unittest/enum/tst.EnumTrailingComma.d | 36 ++++++++++++++++++++++
> >  2 files changed, 38 insertions(+), 1 deletion(-)
> >  create mode 100644 test/unittest/enum/tst.EnumTrailingComma.d
> > 
> > diff --git a/libdtrace/dt_grammar.y b/libdtrace/dt_grammar.y
> > index 677cd869..7984b85d 100644
> > --- a/libdtrace/dt_grammar.y
> > +++ b/libdtrace/dt_grammar.y
> > @@ -702,7 +702,8 @@ enum_definition:
> >  
> >  enumerator_list:
> >  		enumerator
> > -	|	enumerator_list DT_TOK_COMMA enumerator
> > +	|	enumerator DT_TOK_COMMA enumerator_list
> > +	|	enumerator DT_TOK_COMMA
> >  	;
> >  
> >  enumerator:	DT_TOK_IDENT { dt_decl_enumerator($1, NULL); }
> > diff --git a/test/unittest/enum/tst.EnumTrailingComma.d b/test/unittest/enum/tst.EnumTrailingComma.d
> > new file mode 100644
> > index 00000000..0414498b
> > --- /dev/null
> > +++ b/test/unittest/enum/tst.EnumTrailingComma.d
> > @@ -0,0 +1,36 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION:
> > + * Enumerations should support declaration with a trailing comma for
> > + * the last enumeration value.
> > + *
> > + * SECTION: Type and Constant Definitions/Enumerations
> > + *
> > + * NOTES:
> > + *
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +enum colors {
> > +	RED = 1,
> > +	GREEN = 2,
> > +	BLUE = 3, 
> > +};
> > +
> > +enum shapes {
> > +	CIRCLE,
> > +	SQUARE,
> > +	TRIANGLE,
> > +};
> > +
> > +BEGIN
> > +{
> > +	exit(0);
> > +}
> > -- 
> > 2.43.5
> > 
