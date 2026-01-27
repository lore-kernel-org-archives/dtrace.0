Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193E199E94
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476729; cv=fail; b=FnPMkgvJtq9MX7dJB482JzZVVwhc0Q7pBP2oM+jg/uRO8jHISmmxgJMaBGS3gDEE5qDCzXGEHg4ZeoQIXxLvssBlIFVH7VifimV06O9r+l41aEZUeqnekizCeCl69q+MNgaBnaK6zd16t6rLuEpejrMn/Btu/amccve4rCnrCik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476729; c=relaxed/simple;
	bh=iH7FJEMCA9GfmwoTJrM5IWT7nOLOWasG3ev14s0lP74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O6207Hm+11NiB9ZYJz/nx6O2qRxsY4uTWxkuq9sI8LwXZ3Ers3P2EnTTsI0ghRoD7CirBlPCrrwn+IinSVAc6ojJSya0IyXano17IACOtIvL7Q4JZJRNfDvxu9KHFPZk+iQQ2SgYJOPoLfI05staP8CZ9bvKsv4OHOl9EyVE424=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NQcgcCJI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vws7clpg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NQcgcCJI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vws7clpg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QNH2nW4060883
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=e5rkVaB2H0Z+P5Gd9U
	O+FAqsi3qOWvD5Rv6db57Ockw=; b=NQcgcCJINBplgx05t+SHebqL0skQkV0xJL
	TU0etj2w7I3HAjXpufYifTfAdsLTmdtdEfxZAylscymJGJuPB1PDcoYYUbzTStwc
	GNEfFPWzBzjSza3oPKQhg3850/AFcfro7nem6p7KZAJgwVYAO1Y1htusoWnq+0hi
	n8MPYvdc46rcOXBwfC8XQqGHJZzhop1JCb43h5MR5KgHq7ne9sHnzV5Sp54syA6T
	bmPuy7m53ctwheMssyKh0kSdvhuM+pn2b63wDbE4OA12cOFkUrXP5siW0YCeX361
	GyIa+epjkjJIWt6GKOfdzL60FmzHmsUyXfU8MMPpirU54T5umX1w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrb7em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:18:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60R0jErs012456
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:18:46 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8qve5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 01:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBaxGPr208RFDBcxS7Z5xapvDYqHCs0eyjRU7TmHD0+jRle0ULx55HK5Dmiy8aGu2HbeU/K0+t5UzHqwGm9PZhRlksK0BishVErk8vc5aKW9scBw55QVV98XIMEu/z5ODuAvgFBjF2XJz3jbcf+yRFMw9qZ0iEIvxc/XDHsoxYOyhU/uDzldMXbbgxrpP3CyN4bGylSZBybAGWTa5h4RH/01cw0zZH3QjdRY+l8R0nu2mZev8Qb5RvT8KE4oelFOcqkCJnNm/xSoFBiBHwmcx56tFgRNYgxwXzjv2eHkLbV0JcGQdaCC6iaPYJYTRjAUHo9U/mTArnCaUxIWwqXQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5rkVaB2H0Z+P5Gd9UO+FAqsi3qOWvD5Rv6db57Ockw=;
 b=HPDD9zNw2P3a9JZMqRCD/scdr9ZZNPKiI7CbCoyWLEWS+Yq02Fjbi71dic07UpZwSMBuNH7BBZBvYBhoyAsRGsIE3RRtM8swSIawh6zCqBx3vrn2iE8WybSxN6u5TrEVS7Z26yH+YfcOkw6uJN0xCyvXRLraToFWiw52wQ7wJ0KWqfRmfrijwai2vpNw4Dn/SocITeM7wuixz0pJFlC1hI/FIPVnHkMsUtENffOT31wPcYM37Q116AHFjaLZhCTC0g7cVM4ew1+dBO03lM8yHOz2h7ZZpjsu4zuJyP39p3J1+xQOP8aJaX38FhCqcpwigUsxGvECRkloQnmnZmSmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5rkVaB2H0Z+P5Gd9UO+FAqsi3qOWvD5Rv6db57Ockw=;
 b=Vws7clpgsiH6iJqsXBFRhDkEgb0ufhI3rk+HQAP2IGrFpSHAuF2jLLjBOVpNR4M+QKsiQIvfbJJKHTXnT3h+cj8JwRqZg0N0UkYTIILrVNvb8sxEUV97k9Jig/SE1sNkJSEO7OYw0Gc1QRxOmHW7AeHF+bfgtEA75Tvmtkc2jA0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO1PR10MB4754.namprd10.prod.outlook.com (2603:10b6:303:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 01:18:43 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 01:18:43 +0000
Date: Mon, 26 Jan 2026 20:18:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Support deeper version numbers (e.g. 2.0.4.x)
Message-ID: <aXgScYsIu94O/Me3@oracle.com>
References: <20260126234150.20939-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126234150.20939-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO1PR10MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 5280b0ac-e762-408b-71ec-08de5d420332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4NSgb5+gBsZLcSy+GHg1rv+LIhPLuoPCBn7pVCrvzUcAFGsQwGzTgucxa55Q?=
 =?us-ascii?Q?gd0GSza8/PFciMtcy/lWq+xvh0me0bqKt40syX2iwseNG6s4Vl9Qs0wzo62n?=
 =?us-ascii?Q?hO2+QvzVA/aqT+nj2wmMFuZQ+scttanYrzWMjwaVWnJULhRgpBvQpEpzW6M7?=
 =?us-ascii?Q?t4e+2ZcG09a88QUT0Owg7aV9NWcsAK/ECCymcJooO+tk2GLT+WtjlefAX8gg?=
 =?us-ascii?Q?cpAw0MlK3koD673ah8OujiThD+P2qlMB5M2/z/GXRjY3KuIOKHsEI41Inv/h?=
 =?us-ascii?Q?nKVLEdbGAzVhpkLKddqYFwwxmYKjlmytO3rsX4+U/3HelQgaGy2KUVaFzP1U?=
 =?us-ascii?Q?1kVsSTucvKBcXNFKMkRBNGuI+VBTH8RDaCaMVbYaeW4iy601+TtXO6XfljcS?=
 =?us-ascii?Q?CzPB7ymQOnhOvDM2GFNd1n16jOqaZHKNtk2pUGA9mmm5lGtPkKfo/2UqpiFz?=
 =?us-ascii?Q?BZRBM03iZaaUZB4MB1G/7OHZ4UB5vFDGYvk2nxRPy3ysQ5YLKkZC1bK7Ydw4?=
 =?us-ascii?Q?xDn9i8dgF1CQVIDwvYNpzIpzRsVHbs+Bonvr4M8qKqkzEdCjHk79FgtsfQuu?=
 =?us-ascii?Q?yWJStbwPyXNBz1yd4Q2Mecdz3ORYuBmlmfu117nxrniCThU3eEWFylMtFHTe?=
 =?us-ascii?Q?lxiEyd/DO8UFVa4sR2IniqtI5mhPzXExQ6WgCpgFDPMAGgVs0ia5jfhLy8EO?=
 =?us-ascii?Q?gZwOpuIW3oMqP3mYETaTnfMPPBZen3LuRhAxn7OajQujcr2pHoI2vYBncB1y?=
 =?us-ascii?Q?r6YLtoI57BVcTL0qqKhzdO5vAbTE1e69HCbVPWYu3l8xHdo5wSop8W5iT9K7?=
 =?us-ascii?Q?7MlTI4Teaazm4gY31RDP9cpOeq6N9ie8PIVTb0E2659YmRX8CU72tVAlQIPf?=
 =?us-ascii?Q?Ohh/MobLx82Xkw2aNe0z2UuEF00k58iJA1dYaDAjhxW8zJiZS0BmWTSXy3mr?=
 =?us-ascii?Q?qlZAY/i8X7G7y0AYaLzasCkihqIbOPFlxasF6UAItkvBHYZ6w+6c5+5ASAnY?=
 =?us-ascii?Q?/JqX1euCbTQODz3ICz1c0+9tju41UyW12LO0Yg7T+4rebwK4mEXOyBaG6yBq?=
 =?us-ascii?Q?QHmZ0L8V2kGMKuzGxKl1BMpWcONGzv14WNAyGhcqFvq6wHlvKcC7RXPFwQd8?=
 =?us-ascii?Q?m7MzyXJ/HOO4kG5zHb75K5OuoW5Fn5YWBnQUtXN7Vv/zDrU5SRaAwWH/oCMb?=
 =?us-ascii?Q?6S4hRnzjKkVUCGL9YSXnLEpAIye99uSfYL6KjmWrm5j9mMqKCR+m+Y6QnbyW?=
 =?us-ascii?Q?5zKUd8HLgi7P7+AztP+FWdTR0jxt3aWeUo9fPp+LMmkjekYCudruLAjuYfx/?=
 =?us-ascii?Q?//qnaf9bfXaQTdVXjkP8c7FtXGewmLPFH0UYEU2S6pjFlsO5F9BdaAeviy9E?=
 =?us-ascii?Q?1pNHlg84iVWdr/XYQxpwGvqTQKxsUhehxQ25ZoiNyJ7F4SDWpQvFpCWuxC3y?=
 =?us-ascii?Q?QFn/GrEffuKYX3Q9cVAhQPUNu4/EyKqGoBtrtZq1esHDAdRCjUEMeuvSZg3E?=
 =?us-ascii?Q?wo73qU+gkgEVdUQzXxHxNHhXIMSWFQ+zHJxHsjwxSk+jgR6ZVsuV0sioMSg3?=
 =?us-ascii?Q?v2BCVK00dVPwapqZKwY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mt4R2TcQoIDop7m0uxXW6Ut7bScST7wB4auPmZJhPIXoxYcbdYC/8xw1pXVS?=
 =?us-ascii?Q?MRt9OZwdz/YahQ8G+60QHRdHzDoRx4iSUfTBSYx5UYqUBkHXE8109AJX+Hxk?=
 =?us-ascii?Q?vLL2hDvZbXHAFSZ32HRrKMQCEdJSjaqnFhGthLpUQ1xibynnn5VmbmhSr32N?=
 =?us-ascii?Q?K0rQM8gl7S2uC0iGcNVCQi8SKkzNL5EOPBZJr/lKyFZdFMGqqVTOXBMd78ub?=
 =?us-ascii?Q?sLCxd1h4xHQxvlORE9O/NdNCjbI86nCBzS7gaO+Zj1vCf65RMBpTKxmyy4ii?=
 =?us-ascii?Q?tuqX2sCUrkxRAaXkPw029ow1ml7vQpsgmFoObJXmUSaZmJ8r/W6Ufaky2nAR?=
 =?us-ascii?Q?9N+60C4LLxrxpk+PJ5OJ61U530qVQEqYq70TDGcmN+HVZ7ihsb0YbSrFDZhR?=
 =?us-ascii?Q?YhKWM0ICzUocrCeQ9RCDfLaJYrmmHnZOhlszaOCPqziJ4O79c4iOLQ7Lau8J?=
 =?us-ascii?Q?Ps4BzHSVnAP3Uy6DUN/OXeWXobEjsFHcmambX47r4MpIgS08M6A1g71ZHKT1?=
 =?us-ascii?Q?+z4/HQK2jno0WQkeOlQeEsmWVlaBOcfhGT4OrMUwbP1h1vQRr0g+QfyIvxjn?=
 =?us-ascii?Q?p5oWl428OeiIIyQVoOR5n2+C98aBNbsftNw+uWyQHexeVGgFUaDuMcNRHB2O?=
 =?us-ascii?Q?BdnRNGCjAYs1VUzrOMeH1NdIQs3Q37Qfm8kDvWvY9KjcS6bqb1Qv+KVp6GGS?=
 =?us-ascii?Q?k7UQvMTtS/9ToTwzIuGtIkB6ehyOa9CEVvhpo/c/530ubfPw8VfZwkot7l8R?=
 =?us-ascii?Q?r4IQaxWJEkbmXUrr6nU+JwepLoIRwhXBESNwMWfaTfAAuhnGlYCMmU4UHdJl?=
 =?us-ascii?Q?90FgkabtkzXSYkN0jhbmDBHOAOcxEn8ObkmPm8ppIfeCUNTd5k3ESQcdWIrz?=
 =?us-ascii?Q?Pr8+RGB57GMctDs1G1ETbApzU53yZlJ/Oy8R3O4bUcI8ss1GrmawJaDFgmhw?=
 =?us-ascii?Q?YfmrT63T+rkrQZp8iZc2bZd5Qu5corwstsY5manuglsZ/gMwXUON1PQUYDqJ?=
 =?us-ascii?Q?++I8HhfPeiPOhEqM8bdy9qsQnqN9bb4a9b9ZkmOcKJzM8ynjaPhchkCTX9wq?=
 =?us-ascii?Q?48w1a4V/H7X/62XU9GLp+HE5+1DBia2fcRsXjqBYKz84Xxk7nXzxHaFHsACh?=
 =?us-ascii?Q?n0HMrIW47lX5P4tTbIqtyjnahyYypWG+6sltLWIT6h9wOkZcStmiIIowdGk+?=
 =?us-ascii?Q?GAeFnLs01DVsPGRG7R3FbYzW4FzeCE9P+e7cfIvbSFoghN6QT7kHc/Pa/TlI?=
 =?us-ascii?Q?qW3OahrlODrAe3HA4955ObIHek4cMwCztbp6o8zihpDJ+qV5vBQXr+3VokKA?=
 =?us-ascii?Q?umPivrWdpNmtwelWlZNee7gazpXq42LkHw29xkKypI3nMs2oSggh0VAySbZd?=
 =?us-ascii?Q?HoYFZp0BjPkLeOodhAM4mUf/bUvawubjDkw3b5RWjRYZ/Fe6y+scKs9qGo20?=
 =?us-ascii?Q?LGCoI7J6hF9eb+8v3EOXrukZ4/d2pZpn+GyxKK1hkMHfNE9+J67wv1H3uwB2?=
 =?us-ascii?Q?hdkLrZENoIZxdta1suJ6Z1PtEaPVfdKgTAfAzCG6qPPsefnjbPE+kbIC34ht?=
 =?us-ascii?Q?msIcv6sd3Qoh2q/qj9OcMjeb91lgi+bKPo9taetR6krsJQ1IqUhCycKB/mye?=
 =?us-ascii?Q?1GSJATSB3qR94dHT0uICjj/+kO9I+F7hHBa4rENQt9sFONwoH7h84YLqy523?=
 =?us-ascii?Q?oyity7Nzm5xC9CB3lJxIgx7hZx7Gi8/3GdAA66MwiYu3DmfcSDufNpksdQII?=
 =?us-ascii?Q?YfcnNZN9YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p0fvMWme0X5XZmKxeBDEmX7WF61d7KE963WOMgzHn7hVF6jFDR403q79jNHlXuAGMJNrmWn1la3gVL7lRm+MjcJ6o3hLSTd7ze2ipvq6pmymhAJW1OpqE1siC6OOfGQLr7Lro06RTPvNGUx+d1M1gZhgJAaBY3ImnIvFSfBK849RlLnMxJP0V6pUQ3yNbcf4U2SBSngqP9S88kqFJL2+Os9SRRS3f5aTWAqUv0YOxWFWzDLobqvCZcv9G6v0hsrn2ft90SKmFhma1Tc6h6w+BtT2FAEq2qVQCqmlzmk6KYNzc3FmHwlSBbcOMxiQRbT3PJ+oGjDdb/yeibSCraXscjGQp8FfVA9Z4mVUF1FeWslwr3u0imHbscWkoenJi/jNCf1XXV37m+0wWAWfNQrVt3ACn9UP1aX+r0hEVsAm0oC3mi1dnuabogaXrfXmOm4u6iyUxw5zVZipGHDzpsZGNxTRVygrcNS/E80ylgKTY3kJMEJ/Xnp1KuFXEn4VFj6p395eJJpYzOjq0KW+5NDMNRZ49BBlEtpMlqSjD24nAXQxt19+q+le1qRGNsIdWmWbd28neQqlaEwXkLUX7KsDjl2W1NgN6h5DbaLDJfcGf/o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5280b0ac-e762-408b-71ec-08de5d420332
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 01:18:43.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bA8XWQs/V8BbDMJsC6oVDLuSpcLKtovquGFPMzuuTLkdlOLKi5DGfDX9IPfd7gTjNH8lpsbA8832qpabP6rJxbgSAeoiK+FkXSYlfe19+g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270009
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=69781277 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=3q-ABQoxR77MIz1nsosA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -yb2ClBWqUE16kr9P1RJ7MwIsdCHAv01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwOSBTYWx0ZWRfX/GHVTBLtu1g2
 NSLx0plww/2o4qYI2Gcjgnd5+aH0ZbZt6eHXfmcAroxZN9HNxoEfgvHJhfo5eXPGQ6rq/rRhzLN
 YKhpdueD4pC9TcmWJLs9kB7RvfsGwxqM+NWeQmHnsviL6nTkoYUU0t8lPJAq4SE+WPpz2Fh5ru1
 eZUtmiVcH0CfcVwpxF9YFhOT8si+KPQvu/zX4zzDcO90rox3TK72HhoP0Q+fUOvvPBQYUHdReV1
 dk1edx9gOdNNVgMNV2LKfIyrKOEN3WrNV4Z/NtYiufSVljoTQSo0mtfV2+1WVqk7Qh9airASXNn
 jACUSpcUlNXzbNhy3sFUOrNM9dSEkczuFdhaDYwBEKSeqYIoAM7Fshhj3U3TTUXWoPG5915Jivo
 ju1Okf/tYPk9WMkrdchZzoHOTpE7BMzesK2g4c1NF7IuhqkbqDIUF6/R5JsYb+/oL9lGQ1h9CZM
 ltHCAeGRQNwk3DTnRLQ==
X-Proofpoint-GUID: -yb2ClBWqUE16kr9P1RJ7MwIsdCHAv01

On Mon, Jan 26, 2026 at 06:41:49PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/mkvers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> index 6f9240320..087c09169 100755
> --- a/libdtrace/mkvers
> +++ b/libdtrace/mkvers
> @@ -10,7 +10,7 @@
>  NF == 0 { next; }
>  
>  {
> -	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,3}$/) == 0) {
>  		print "E: Invalid version string: " $1 >"/dev/stderr";
>  		exit 1
>  	}
> -- 
> 2.47.3
> 
